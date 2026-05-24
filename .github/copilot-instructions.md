# GitHub Copilot Instructions

These instructions dictate how GitHub Copilot should autocomplete and generate code in the Caliber repository.

## Core Stack
- TanStack Start (React SSR), TanStack Query, Vite
- Cloudflare Workers, D1 (SQLite), Drizzle ORM
- Tailwind CSS v4, shadcn/ui

## Imports
- Always import reusable components from `@caliber/ui-kit` (e.g., `import { Button, Card, Body } from '@caliber/ui-kit';`).
- Do not build raw HTML components if a UI kit component exists.
- Import shared config styles as `@import "@caliber/shared-config/styles";`.

## Styling Rules
- **Tailwind v4:** Use CSS-first theming (`@theme` in CSS). Do not use `tailwind.config.ts`.
- **No Dark Mode:** Never suggest or use `dark:` Tailwind classes.
- **Typography:** Use `<Hero>`, `<Display>`, `<Headline>`, `<Title>`, `<Subtitle>`, `<Body>`, `<Caption>`, `<Label>`, `<Overline>`. Do not style raw `<p>` or `<h1>` tags manually for layout text.
- **Colors:** Use semantic colors (`primary-500`, `success-500`, `warning-500`, `error-500`, `info-500`, `slate-900`). No raw hex codes.

## Backend
- Workers interact directly with D1 using Drizzle.
- Throttle all external API calls using `@tanstack/pacer` (`asyncThrottle`).
- Use strong TypeScript typing. Avoid `any`.