import type { SessionUser } from "./cloudflare";

export function canAccessLinkedInSearch(user?: SessionUser | null): boolean {
  return !!user;
}
