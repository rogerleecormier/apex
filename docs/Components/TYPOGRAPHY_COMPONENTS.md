# Typography Components Library# Typography Component Library

A comprehensive collection of **9 semantic typography components** built with React, TypeScript, and Tailwind CSS. Provides a complete typographic scale from Hero (72px) down to Overline (12px).A comprehensive, reusable typography system built with React and Tailwind CSS. This library provides semantic, composable text components that handle font sizing, weight, spacing, and color management automatically.

## Table of Contents## Table of Contents

1. [Overview](#overview)- [Quick Start](#quick-start)

2. [Installation & Import](#installation--import)- [Components](#components)

3. [Typography Scale](#typography-scale)- [Font Sizes](#font-sizes)

4. [Components Reference](#components-reference)- [Colors](#colors)

5. [Color System](#color-system)- [Usage Examples](#usage-examples)

6. [Best Practices](#best-practices)- [Best Practices](#best-practices)

7. [Usage Examples](#usage-examples)- [Component Reference](#component-reference)

---## Quick Start

## Overview### Import Components

### Typography Hierarchy```tsx

import {

All typography components are semantically named and sized for clear visual hierarchy: Hero,

Display,

````Headline,

Hero (72px)      — Page-level brand statements  Title,

  ↓  Subtitle,

Display (60px)   — Major section headings  Body,

  ↓  Caption,

Headline (36px)  — Section titles  Label,

  ↓  Overline,

Title (24px)     — Card/component titles} from '@/components/Typography';

  ↓```

Subtitle (20px)  — Supporting headings

  ↓### Basic Usage

Body (16px)      — Main content text

  ↓```tsx

Caption (14px)   — Supporting text// Headings

  ↓<Hero>Large Display Heading</Hero>

Label (12px)     — Form labels, tags<Display>Prominent Heading</Display>

  ↓<Headline>Section Heading</Headline>

Overline (12px)  — Section overlines, metadata<Title>Card Title</Title>

```<Subtitle>Supporting Heading</Subtitle>



### Design System Integration// Body Text

<Body>Standard paragraph text</Body>

All typography components support:<Body size="lg">Large body text</Body>

- ✅ **Color System**: Primary Red (#ef4444), Secondary Indigo (#6366f1), Accent Emerald (#22c55e), Info Blue (#3b82f6), Status Colors, Neutrals<Body size="sm">Small body text</Body>

- ✅ **Font Weights**: Thin to Black (100-900)

- ✅ **Variants**: Bold, Semibold, Regular (component-specific)// Metadata

- ✅ **Responsive**: Scales on different screen sizes<Caption>Supporting text</Caption>

- ✅ **Dark Mode**: Automatic with OKLch color space<Label>UPPERCASE LABEL</Label>

- ✅ **Accessibility**: Proper semantic HTML (h1-h6, p, span)<Overline>SECTION MARKER</Overline>

````

---

## Components

## Installation & Import

All typography components are built using pure **Tailwind CSS utility classes**, making them fully composable and easy to customize.

### Import All Typography Components

### Hero

````tsx**Purpose**: Large display heading for main page titles and hero sections.

import {

  Hero,**Default Size**: `text-7xl` (56px)

  Display,**Line Height**: `tight` (1.25)

  Headline,**Letter Spacing**: `-tracking-wider` (-0.05em)

  Title,

  Subtitle,```tsx

  Body,<Hero>Main Heading</Hero>

  Caption,<Hero variant="semibold">Semibold Variant</Hero>

  Label,<Hero className="text-red-500">Colored Hero</Hero>

  Overline,```

} from "@/components/Typography";

```**Props:**

- `variant?: "bold" | "semibold"` — Font weight (default: "bold")

### Import Individual Components- `as?: React.ElementType` — HTML element (default: "h1")

- `className?: string` — Additional Tailwind classes

```tsx

import { Hero, Display, Body } from "@/components/Typography";---

````

### Display

---**Purpose**: Prominent heading for major sections and feature titles.

## Typography Scale**Default Size**: `text-5xl` (48px)

**Line Height**: `snug` (1.375)

### Complete Size Reference**Letter Spacing**: `tracking-tight` (-0.025em)

| Component | Size | Line Height | Letter Spacing | Weight | Use Case |```tsx

|-----------|------|-------------|-----------------|--------|----------|<Display>Display Heading</Display>

| **Hero** | 72px | 1 | -0.1em | Bold/Semibold | Brand statements, hero sections |<Display variant="semibold">Semibold Display</Display>

| **Display** | 60px | 1 | -0.05em | Bold/Semibold | Major section headings |<Display className="text-primary">Primary Color</Display>

| **Headline** | 36px | 1.2 | -0.025em | Bold | Section titles, card headers |```

| **Title** | 24px | 1.2 | -0.025em | Bold/Semibold | Component titles |

| **Subtitle** | 20px | 1.35 | 0 | Semibold/Regular | Supporting headings |**Props:**

| **Body** | 16px | 1.5 | 0 | Regular/Medium/Semibold | Main content text |- `variant?: "bold" | "semibold"` — Font weight (default: "bold")

| **Caption** | 14px | 1.5 | 0 | Regular/Semibold | Supporting text |- `as?: React.ElementType` — HTML element (default: "h2")

| **Label** | 12px | 1.5 | 0.025em | Regular/Semibold | Form labels, tags |- `className?: string` — Additional Tailwind classes

| **Overline** | 12px | 1 | 0.1em | Semibold | Section overlines |

---

---

### Headline

## Components Reference**Purpose**: Medium heading for section titles and subsections.

### 1. Hero**Default Size**: `text-4xl` (36px)

**Line Height**: `snug` (1.375)

The largest and most prominent typography component. Use for brand statements and page-level headlines.**Letter Spacing**: `tracking-tight` (-0.025em)

`tsx`tsx

<Hero>Welcome to Caliber</Hero><Headline>Section Heading</Headline>

<Hero variant="semibold">Precision Project Management</Hero><Headline variant="semibold">Semibold Section</Headline>

```<Headline as="h2">Override HTML Element</Headline>

```

**Props:**

````typescript**Props:**

interface HeroProps {- `variant?: "bold" | "semibold"` — Font weight (default: "bold")

  children: React.ReactNode;- `as?: React.ElementType` — HTML element (default: "h3")

  variant?: "bold" | "semibold";- `className?: string` — Additional Tailwind classes

  className?: string;

  as?: "h1" | "span";---

}

```### Title

**Purpose**: Standard heading size for card titles and component headers.

**Use for:** Page titles, brand statements, hero sections

**Default Size**: `text-2xl` (24px)

---**Line Height**: `tight` (1.25)



### 2. Display```tsx

<Title>Card Title</Title>

Major section headings. Use for prominent section titles and key messaging.<Title variant="semibold">Semibold Title</Title>

<Title className="text-slate-900">Dark Text</Title>

```tsx```

<Display>Our Services</Display>

<Display variant="semibold">Why Choose Us</Display>**Props:**

```- `variant?: "bold" | "semibold"` — Font weight (default: "bold")

- `as?: React.ElementType` — HTML element (default: "h4")

**Size:** 60px | **Weight:** 700/600 | **Spacing:** -0.05em- `className?: string` — Additional Tailwind classes



**Use for:** Main section titles, key features heading---



---### Subtitle

**Purpose**: Smaller heading for supporting titles and subsections.

### 3. Headline

**Default Size**: `text-lg` (18px)

Section titles and card headers. Highly versatile component for content organization.**Line Height**: `snug` (1.375)



```tsx```tsx

<Headline>Features</Headline><Subtitle>Subtitle Text</Subtitle>

<Headline>Our Team</Headline><Subtitle variant="regular">Regular Subtitle</Subtitle>

````

**Size:** 36px | **Weight:** 700 | **Spacing:** -0.025em**Props:**

- `variant?: "semibold" | "regular"` — Font weight (default: "semibold")

**Use for:** Section titles, component headers, category names- `as?: React.ElementType` — HTML element (default: "h5")

- `className?: string` — Additional Tailwind classes

---

---

### 4. Title

### Body

Component and card titles. Perfect for headers within cards and containers.**Purpose**: Main body text with flexible sizing and weight options.

````tsx**Sizes**:

<Title>Feature Title</Title>- `lg` — `text-xl` (20px), `leading-relaxed` (1.65)

<Title variant="semibold">Card Heading</Title>- `base` — `text-base` (16px), `leading-relaxed` (1.65) — Default

```- `sm` — `text-sm` (14px), `leading-relaxed` (1.65)



**Props:****Weights**: `normal` | `medium` | `semibold`

```typescript

interface TitleProps {```tsx

  children: React.ReactNode;<Body>Standard body text</Body>

  variant?: "bold" | "semibold";<Body size="lg">Large body text</Body>

  className?: string;<Body size="sm">Small body text</Body>

  as?: "h4" | "span";<Body weight="semibold">Bold body text</Body>

  weight?: "bold" | "semibold";<Body size="lg" weight="medium">Large medium weight</Body>

}<Body className="text-neutral">Custom color</Body>

````

**Size:** 24px | **Weight:** 700/600**Props:**

- `size?: "lg" | "base" | "sm"` — Text size (default: "base")

**Use for:** Card titles, subsection headings- `weight?: "normal" | "medium" | "semibold"` — Font weight (default: "normal")

- `as?: React.ElementType` — HTML element (default: "p")

---- `className?: string` — Additional Tailwind classes

### 5. Subtitle---

Supporting headings and descriptive text. Use for secondary hierarchy below titles.### Caption

**Purpose**: Small supporting text for metadata, descriptions, and notes.

```tsx

<Subtitle>Precision Project Management</Subtitle>**Default Size**: `text-sm` (14px)

<Subtitle variant="regular">Supporting Text</Subtitle>**Line Height**: `snug` (1.375)

```

````tsx

**Props:**<Caption>Supporting text</Caption>

```typescript<Caption variant="semibold">Bold caption</Caption>

interface SubtitleProps {<Caption className="text-neutral-light">Subtle text</Caption>

  children: React.ReactNode;```

  variant?: "semibold" | "regular";

  className?: string;**Props:**

  as?: "h5" | "p" | "span";- `variant?: "normal" | "semibold"` — Font weight (default: "normal")

}- `as?: React.ElementType` — HTML element (default: "span")

```- `className?: string` — Additional Tailwind classes



**Size:** 20px | **Weight:** 600/400---



**Use for:** Taglines, supporting headings, descriptive text### Label

**Purpose**: Uppercase labels for form fields, tags, and metadata.

---

**Default Size**: `text-xs` (12px)

### 6. Body**Line Height**: N/A (implicit)

**Text Transform**: `uppercase`

Main content text. Most frequently used component with multiple size variants.**Letter Spacing**: `tracking-wider` (0.05em)



```tsx```tsx

<Body>Standard body text</Body><Label>Field Label</Label>

<Body size="lg">Large body text</Body><Label variant="semibold">Bold Label</Label>

<Body size="sm">Small body text</Body><Label className="text-red-500">Error Label</Label>

<Body weight="semibold">Bold body text</Body>```

````

**Props:**

**Props:**- `variant?: "medium" | "semibold"` — Font weight (default: "medium")

```typescript- `as?: React.ElementType` — HTML element (default: "label")

interface BodyProps {- `className?: string` — Additional Tailwind classes

children: React.ReactNode;

size?: "sm" | "base" | "lg";---

weight?: "normal" | "medium" | "semibold";

className?: string;### Overline

as?: "p" | "span" | "div";**Purpose**: Small uppercase text for section markers and category labels.

}

```**Default Size**: `text-xs` (12px)

**Text Transform**: `uppercase`

**Sizes:\*\***Letter Spacing\*\*: `tracking-widest` (0.1em)

- `sm` - 14px (supporting text)**Font Weight**: `semibold` (600)

- `base` - 16px (main content, default)

- `lg` - 18px (large/emphasis)```tsx

<Overline>Section Marker</Overline>

**Use for:** Paragraphs, descriptions, main content<Overline className="text-red-500">Category</Overline>

````

---

**Props:**

### 7. Caption- `as?: React.ElementType` — HTML element (default: "span")

- `className?: string` — Additional Tailwind classes

Supporting and secondary text. Use for descriptions, metadata, and secondary information.

---

```tsx

<Caption>Supporting caption text</Caption>## Font Sizes

<Caption variant="semibold">Bold caption</Caption>

```The typography system uses Tailwind's default font scale:



**Props:**| Component | Size | Pixels | HTML Element |

```typescript|-----------|------|--------|--------------|

interface CaptionProps {| **Hero** | `text-7xl` | 56px | h1 |

  children: React.ReactNode;| **Display** | `text-5xl` | 48px | h2 |

  variant?: "regular" | "semibold";| **Headline** | `text-4xl` | 36px | h3 |

  className?: string;| **Title** | `text-2xl` | 24px | h4 |

  as?: "p" | "span";| **Subtitle** | `text-lg` | 18px | h5 |

}| **Body Large** | `text-xl` | 20px | p |

```| **Body** | `text-base` | 16px | p |

| **Body Small** | `text-sm` | 14px | p |

**Size:** 14px | **Weight:** 400/600| **Caption** | `text-sm` | 14px | span |

| **Label** | `text-xs` | 12px | label |

**Use for:** Descriptions, metadata, secondary labels| **Overline** | `text-xs` | 12px | span |



---## Colors



### 8. LabelAll typography components accept Tailwind color classes. Use semantic color utilities for consistent theming:



Form labels and tags. Use for form inputs, tags, and small labels.```tsx

<Body className="text-slate-900">Primary text</Body>

```tsx<Body className="text-slate-600">Secondary text</Body>

<Label>Email Address</Label><Body className="text-slate-500">Tertiary text</Body>

<Label variant="semibold">Required Field</Label>

```<Display className="text-red-500">Brand color</Display>

<Title className="text-emerald-600">Success color</Title>

**Props:**<Caption className="text-orange-500">Warning color</Caption>

```typescript```

interface LabelProps {

  children: React.ReactNode;### Semantic Colors (Custom CSS Classes)

  variant?: "regular" | "semibold";

  className?: string;The following custom color classes are available in the component library:

  as?: "label" | "span";

  htmlFor?: string;```tsx

}<Body className="text-primary">Primary brand color</Body>

```<Body className="text-primary-light">Primary light variant</Body>

<Body className="text-primary-muted">Primary muted variant</Body>

**Size:** 12px | **Weight:** 400/600

<Body className="text-accent">Accent color</Body>

**Use for:** Form labels, tags, metadata<Body className="text-accent-light">Accent light variant</Body>

<Body className="text-accent-muted">Accent muted variant</Body>

---

<Body className="text-neutral-dark">Dark neutral</Body>

### 9. Overline<Body className="text-neutral">Medium neutral</Body>

<Body className="text-neutral-light">Light neutral</Body>

Section overlines and metadata text. Use for category labels and section markers.<Body className="text-neutral-lighter">Lighter neutral</Body>

````

````tsx

<Overline>Section Marker</Overline>## Usage Examples

<Overline className="text-red-500">Component Library</Overline>

```### Page Header



**Props:**```tsx

```typescript<section className="py-16">

interface OverlineProps {  <Overline className="text-red-500 mb-4">Documentation</Overline>

  children: React.ReactNode;  <Display className="mb-4">Getting Started</Display>

  className?: string;  <Body size="lg" className="text-neutral max-w-2xl">

  as?: "span" | "div";    Learn how to use the component library in your projects.

}  </Body>

```</section>

````

**Size:** 12px | **Weight:** 600 | **Spacing:** 0.1em (wide)

### Card Header

**Use for:** Section overlines, metadata, category labels

````tsx

---<div className="bg-white rounded-lg p-6 border border-slate-200">

  <Overline className="text-slate-500 mb-2">Feature</Overline>

## Color System  <Title className="mb-2">Beautiful Components</Title>

  <Body className="text-neutral mb-6">

### Brand Color Palette    Pre-styled components that work out of the box.

  </Body>

| Color | Hex | Use Case |  <Label className="text-slate-600">LEARN MORE</Label>

|-------|-----|----------|</div>

| **Primary Red** | #ef4444 | Headlines, main text, CTAs |```

| **Secondary Indigo** | #6366f1 | Professional headers, emphasis |

| **Accent Emerald** | #22c55e | Success messages, positive text |### Form Field

| **Info Blue** | #3b82f6 | Information, secondary messaging |

| **Success Teal** | #14b8a6 | Success states, confirmations |```tsx

| **Warning Amber** | #f59e0b | Warnings, cautions |<div className="mb-4">

| **Error Rose** | #ff6b85 | Errors, critical messages |  <Label htmlFor="email">Email Address</Label>

  <input

### Using Colors    id="email"

    type="email"

```tsx    placeholder="Enter your email"

// Primary red    className="mt-2 w-full px-3 py-2 border border-slate-300 rounded"

<Headline className="text-red-500">Primary Heading</Headline>  />

  <Caption className="text-slate-500 mt-1">

// Secondary indigo    We'll never share your email address.

<Title className="text-indigo-500">Secondary Title</Title>  </Caption>

</div>

// Accent emerald```

<Body className="text-emerald-600">Success message</Body>

### Text Hierarchy

// Status colors

<Body className="text-blue-500">Information</Body>```tsx

<Body className="text-amber-500">Warning</Body><article>

<Body className="text-rose-500">Error</Body>  <Headline className="mb-4">Article Title</Headline>

```  <Body className="text-neutral mb-6">

    Introduction paragraph with standard body text size.

### Gradient Text  </Body>



Use gradient text for visual impact:  <Subtitle className="mb-3 mt-8">Section Heading</Subtitle>

  <Body className="text-neutral mb-6">

```tsx    Content paragraph describing the section in detail.

// Primary gradient  </Body>

<Hero className="text-gradient-primary">Gradient Text</Hero>

  <div className="bg-slate-50 p-4 rounded-lg mt-8">

// Secondary gradient    <Caption className="text-slate-600">

<Display className="text-gradient-secondary">Professional Gradient</Display>      💡 Pro Tip: Use Caption for callouts and side notes.

    </Caption>

// Accent gradient  </div>

<Headline className="text-gradient-accent">Growth Gradient</Headline>

```  <Body size="sm" className="text-slate-500 mt-8">

    Footer note with smaller text size.

---  </Body>

</article>

## Best Practices```



### 1. Use Semantic Hierarchy## Best Practices



```tsx### 1. Maintain Visual Hierarchy

// ✅ Good - Clear hierarchy

<Hero>Page Title</Hero>Use components in their intended order: Hero → Display → Headline → Title → Subtitle → Body

<Display>Section Title</Display>

<Headline>Subsection</Headline>```tsx

<Title>Card Title</Title>// ✅ Good

<Body>Main content</Body><Hero>Main Page Title</Hero>

<Caption>Supporting info</Caption><Display>Feature Section</Display>

<Headline>Subsection</Headline>

// ❌ Avoid - Inconsistent hierarchy<Body>Description</Body>

<Body weight="semibold" className="text-2xl">Section Title</Body>

```// ❌ Avoid skipping levels

<Hero>Main Page Title</Hero>

### 2. Color for Meaning<Body>This jumps hierarchy</Body>

````

````tsx

// ✅ Good - Colors have meaning### 2. Combine Components Meaningfully

<Body className="text-red-500">Error: Something went wrong</Body>

<Body className="text-emerald-600">Success: Changes saved</Body>```tsx

// ✅ Good - Clear hierarchy

// ❌ Avoid - Arbitrary colors<Title>Settings</Title>

<Body className="text-purple-500">This is body text</Body><Body className="text-neutral">Manage your account preferences</Body>

````

// ❌ Avoid redundancy

### 3. Responsive Text<Title>Settings</Title>

<Title>Manage your account preferences</Title>

`tsx`

// ✅ Good - Adapts to screen size

<Hero className="text-5xl md:text-6xl lg:text-7xl">### 3. Use Size and Weight Variants

Responsive Hero

</Hero>```tsx

````// ✅ Good - Appropriate size for context

<Body size="lg">Important announcement</Body>

### 4. Sufficient Contrast<Body size="sm">Metadata and timestamps</Body>



```tsx// ❌ Avoid overusing variants

// ✅ Good - High contrast (WCAG AA)<Body weight="semibold">

<Body className="text-neutral-dark bg-white">Maximum contrast</Body>  <Body weight="semibold">Too much bold text</Body>

</Body>

// ❌ Avoid - Low contrast```

<Body className="text-neutral-lighter bg-white">Poor contrast</Body>

```### 4. Apply Colors Consistently



### 5. Proper Spacing```tsx

// ✅ Good - Semantic color usage

```tsx<Body className="text-neutral">Default text</Body>

// ✅ Good - Space between elements<Caption className="text-neutral-light">Supporting text</Caption>

<div className="space-y-4"><Body className="text-red-500">Error message</Body>

  <Headline>Title</Headline>

  <Body>Content here</Body>// ❌ Avoid random colors

  <Caption>Meta info</Caption><Body className="text-purple-700">Random color</Body>

</div><Body className="text-yellow-200">Poor contrast</Body>

````

---### 5. Leverage Custom Classes

## Usage Examples```tsx

// ✅ Good - Reusable component combinations

### Example 1: Page Headerconst SectionHeader = ({ title, description }) => (

<>

````tsx <Overline className="text-red-500 mb-2">Section</Overline>

<div className="text-center py-12">    <Headline className="mb-3">{title}</Headline>

  <Overline className="text-red-500">Welcome</Overline>    <Body className="text-neutral">{description}</Body>

  <Hero className="my-4">Caliber</Hero>  </>

  <Subtitle className="text-slate-600">);

    Precision Project Management

  </Subtitle>// Then use it anywhere

</div><SectionHeader

```  title="Getting Started"

  description="Learn how to implement our components"

### Example 2: Feature Showcase/>

````

````tsx

<div className="grid grid-cols-1 md:grid-cols-3 gap-8 mt-8">### 6. Compose for Specific Use Cases

  <div>

    <Headline className="text-red-500">Crystal Clear</Headline>```tsx

    <Body size="sm" className="mt-2 text-neutral">// Form label

      Complete transparency in every action<Label htmlFor="name">Full Name</Label>

    </Body>

  </div>// Card metadata

  <Caption className="text-neutral-light">Published 2 days ago</Caption>

  <div>

    <Headline className="text-indigo-500">Professional</Headline>// Status indicator

    <Body size="sm" className="mt-2 text-neutral"><Overline className="text-emerald-600">Active</Overline>

      Enterprise-grade tools and support

    </Body>// Feature callout

  </div><Subtitle className="text-red-500">Premium Feature</Subtitle>

````

  <div>

    <Headline className="text-emerald-600">Innovative</Headline>## Component Reference

    <Body size="sm" className="mt-2 text-neutral">

      Cutting-edge features and design### Import All Components

    </Body>

  </div>```tsx

</div>import {

````Hero,

  Display,

### Example 3: Card Section  Headline,

  Title,

```tsx  Subtitle,

<div>  Body,

  <Overline className="text-indigo-500">Specialized Cards</Overline>  Caption,

  <Title className="mt-3">Primary & Secondary Cards</Title>  Label,

  <Body size="sm" className="mt-2 text-neutral">  Overline,

    Use these cards for organized content display} from '@/components/Typography';

  </Body>```

</div>

```### TypeScript Props



---```tsx

interface CommonProps {

## Related Documentation  children: ReactNode;

  className?: string;

- **Full Design System**: See `DESIGN_TOKENS.md` for complete specifications  as?: React.ElementType;

- **Card Components**: See `CARDS_COMPONENTS.md` for card styling}

- **Live Showcase**: Visit `/typography` for interactive demo

interface HeroProps extends CommonProps {

---  variant?: "bold" | "semibold";

}

**Version**: v2.0 (November 2025)

**Last Updated**: November 8, 2025interface DisplayProps extends CommonProps {

  variant?: "bold" | "semibold";
}

interface HeadlineProps extends CommonProps {
  variant?: "bold" | "semibold";
}

interface TitleProps extends CommonProps {
  variant?: "bold" | "semibold";
}

interface SubtitleProps extends CommonProps {
  variant?: "semibold" | "regular";
}

interface BodyProps extends CommonProps {
  size?: "lg" | "base" | "sm";
  weight?: "normal" | "medium" | "semibold";
}

interface CaptionProps extends CommonProps {
  variant?: "normal" | "semibold";
}

interface LabelProps extends CommonProps {
  variant?: "medium" | "semibold";
}

interface OverlineProps extends CommonProps {
  // No variants
}
````

## File Structure

```
src/
├── components/
│   └── Typography/
│       ├── Hero.tsx
│       ├── Display.tsx
│       ├── Headline.tsx
│       ├── Title.tsx
│       ├── Subtitle.tsx
│       ├── Body.tsx
│       ├── Caption.tsx
│       ├── Label.tsx
│       ├── Overline.tsx
│       └── index.ts
└── styles.css (Tailwind configuration)
```

## View the Showcase

Visit `/typography` route to see all typography components in action with interactive examples and comprehensive documentation.

## Troubleshooting

### Text not displaying correct size?

- Ensure you're using the component, not a plain `<p>` or `<h*>` tag
- Check that Tailwind CSS is properly imported and compiled
- Verify no conflicting CSS classes are overriding the typography styles

### Colors not applying?

- Use valid Tailwind color classes (e.g., `text-red-500`, `text-slate-700`)
- For custom colors, ensure they're defined in `tailwind.config.ts`
- Check CSS specificity if colors aren't overriding

### Component not found?

- Verify the import path matches your project structure
- Ensure components are exported from `index.ts`
- Check that TypeScript paths are configured correctly in `tsconfig.json`

---

For more examples, visit the [Typography Showcase](/typography) or check the [Component Library Overview](README.md).
