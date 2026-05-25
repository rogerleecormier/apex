import { getCloudflareEnv } from "@/lib/cloudflare";
import type { SessionUser } from "@/lib/cloudflare";
import { getAuthInstance } from "@/server/auth";
import { getRequest } from "@tanstack/react-start/server";

export type { SessionUser };

/**
 * Resolves the authenticated user from the better-auth session in the current request.
 * Call this from within a TanStack Start server function handler.
 * Returns null if not authenticated or if bindings are unavailable.
 */
export async function resolveSessionUser(): Promise<SessionUser | null> {
  try {
    const env = getCloudflareEnv();
    const auth = getAuthInstance(env);
    const request = getRequest();

    const session = await auth.api.getSession({
      headers: request.headers,
    });

    if (!session?.user) return null;

    const { id, email, role } = session.user as { id: string; email: string; role?: string };

    // Compatibility bridge for legacy databases where user-linked app tables
    // still reference numeric `users.id` values rather than better-auth IDs.
    if (env.DB && email) {
      try {
        const legacy = await env.DB
          .prepare("SELECT id, role FROM users WHERE lower(email) = lower(?) LIMIT 1")
          .bind(email)
          .first<{ id: number | string; role?: string | null }>();

        if (legacy?.id !== undefined && legacy.id !== null) {
          return {
            id: String(legacy.id),
            email,
            role: legacy.role ?? role ?? "user",
          };
        }
      } catch (legacyLookupError) {
        console.warn("[resolveSessionUser] legacy users lookup failed; using better-auth id", legacyLookupError);
      }
    }

    return { id, email, role: role ?? "user" };
  } catch (error) {
    console.error("[resolveSessionUser] error:", error);
    return null;
  }
}
