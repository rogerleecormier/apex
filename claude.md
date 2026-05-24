# Claude Custom Instructions for Caliber

You are an expert software engineer tasked with assisting on the Caliber monorepo. Before providing code, take a deep breath and "think" about how the request aligns with the following architectural guardrails.

## System Architecture & Stack
- **Framework:** TanStack Start (React SSR) + Vite.
- **Data Fetching:** TanStack Query.
- **Backend:** Cloudflare Workers + Cloudflare D1 (SQLite).
- **ORM:** Drizzle ORM (Workers connect *directly* to D1).
- **Monorepo Tooling:** Turborepo + npm workspaces.

## Tailwind CSS v4 & Styling Rules
- **CRITICAL:** We use Tailwind v4 in a **CSS-first architecture**. 
- Do **NOT** instruct me to modify `tailwind.config.ts` unless it is strictly for a legacy tool compatibility shim.
- All theme extensions go in `packages/shared-config/styles.css` using the `@theme` directive.
- **NO Dark Mode:** Do not generate `dark:` classes. The application is strictly light-mode.
- **Semantic Colors:** Never use hex codes in markup. Use the design system tokens (e.g., `primary-500`, `success-500`, `slate-900`).
- **Typography:** Do not use raw `h1`-`h6` tags for styled text. Always use `@caliber/ui-kit/Typography` components (`<Hero>`, `<Headline>`, `<Body>`, etc.).

## Component & Code Generation Guidelines
1. **UI Kit Priority:** If a UI element is needed (Buttons, Cards, Badges, Modals), import it from `@caliber/ui-kit`. The kit uses shadcn/ui internally.
2. **Card Variants:** We have 21 specific card variants in `packages/ui-kit/src/Cards/`. Use the appropriate semantic card (e.g., `StatCard`, `CTACard`) instead of building custom ones.
3. **Page Primitives:** Use `<AppHeader>`, `<PageHero>`, `<PageSection>`, and `<PageActionBar>` for page-level layouts.
4. **Rate Limiting:** Any code interacting with third-party APIs (Greenhouse, Lever, etc.) must be throttled using `@tanstack/pacer`.

## Types & Accessibility
- Write strict TypeScript.
- Ensure keyboard navigability and use ARIA attributes where applicable (WCAG 2.1 AA standard).

When asked to create a new component or route:
1. Briefly outline the components you will import from `@caliber/ui-kit`.
2. Provide the implementation using TanStack Start routing and data loading patterns.
3. Ensure direct D1 interaction using Drizzle if writing a Worker/backend function.