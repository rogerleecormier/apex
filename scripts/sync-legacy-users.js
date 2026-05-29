#!/usr/bin/env node

import { execFileSync } from "node:child_process";
import crypto from "node:crypto";

const args = process.argv.slice(2);
const isRemote = args.includes("--remote");
const dbName = "caliber-db";

console.log(`Syncing legacy users to better-auth tables (${isRemote ? "REMOTE" : "LOCAL"})...`);

function runWrangler(wranglerArgs) {
  try {
    const output = execFileSync("npx", ["wrangler", ...wranglerArgs, "--json"], {
      encoding: "utf8",
    });
    return JSON.parse(output);
  } catch (error) {
    console.error("Wrangler execution failed:", error.stderr || error.message);
    throw error;
  }
}

function queryDb(sql) {
  const wranglerArgs = ["d1", "execute", dbName, "--command", sql];
  if (isRemote) {
    wranglerArgs.push("--remote");
  } else {
    wranglerArgs.push("--local");
  }
  const result = runWrangler(wranglerArgs);
  return Array.isArray(result) ? result.flatMap(r => r.results || []) : (result.results || []);
}

try {
  // 1. Fetch all legacy users
  console.log("Fetching legacy users...");
  const legacyUsers = queryDb("SELECT id, email, password_hash, role, created_at FROM users;");
  console.log(`Found ${legacyUsers.length} legacy users.`);

  // 2. Fetch all better-auth users
  console.log("Fetching better-auth users...");
  const authUsers = queryDb("SELECT id, email FROM user;");
  const authEmails = new Set(authUsers.map(u => u.email.toLowerCase()));

  // 3. Sync missing users
  let syncCount = 0;
  for (const legacyUser of legacyUsers) {
    const email = legacyUser.email.toLowerCase();
    if (authEmails.has(email)) {
      console.log(`User ${email} already synced in better-auth.`);
      continue;
    }

    console.log(`Syncing user: ${email}...`);
    const name = email.split("@")[0];
    const userId = legacyUser.id;
    const passwordHash = legacyUser.password_hash;
    const role = legacyUser.role || "user";
    const createdAtMs = legacyUser.created_at * 1000; // unix timestamp to ms

    // Insert into 'user' table
    queryDb(
      `INSERT INTO user (id, name, email, email_verified, created_at, updated_at, role) VALUES ('${userId}', '${name}', '${email}', 1, ${createdAtMs}, ${createdAtMs}, '${role}');`
    );

    // Insert into 'account' table if there is a password hash
    if (passwordHash) {
      const accountId = crypto.randomUUID();
      queryDb(
        `INSERT INTO account (id, account_id, provider_id, user_id, password, created_at, updated_at) VALUES ('${accountId}', '${email}', 'credential', '${userId}', '${passwordHash}', ${createdAtMs}, ${createdAtMs});`
      );
    }

    syncCount++;
  }

  console.log(`\nSynchronization complete! Synced ${syncCount} users.`);
} catch (e) {
  console.error("Synchronization failed:", e.message);
  process.exit(1);
}
