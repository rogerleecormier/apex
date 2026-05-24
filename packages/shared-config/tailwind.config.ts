import type { Config } from "tailwindcss";

/**
 * Tailwind v4 compatibility stub.
 *
 * The Caliber design system is now CSS-first:
 * - tokens live in `packages/shared-config/styles.css` via `@theme`
 * - plugins are loaded in CSS via `@plugin`
 * - shared package sources are registered in CSS via `@source`
 *
 * Keep this file only for tooling that still expects a Tailwind config path.
 */
const config: Config = {};

export default config;
