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
    return { id, email, role: role ?? "user" };
  } catch (error) {
    console.error("[resolveSessionUser] error:", error);
    return null;
  }
}
