# Card Components Library# Card Components Library

A comprehensive collection of **21 reusable card components** built with React, TypeScript, and Tailwind CSS. Includes both classic and modern specialized card types designed for various use cases.A comprehensive collection of **21 reusable card components** built with React, TypeScript, and Tailwind CSS. Includes both classic and modern specialized card types designed for various use cases.

## Table of Contents## Table of Contents

1. [Overview](#overview)1. [Installation](#installation)

2. [Installation & Import](#installation--import)2. [Basic Usage](#basic-usage)

3. [Card Catalog](#card-catalog)3. [Card Types](#card-types)
   - [Core Components](#core-components)4. [Best Practices](#best-practices)

   - [Specialized Cards](#specialized-cards)5. [Patterns & Examples](#patterns--examples)

4. [Color System](#color-system)

5. [Best Practices](#best-practices)---

6. [Component Reference](#component-reference)

## Installation

---

All card components are located in `src/components/Cards/` and can be imported from the index:

## Overview

````tsx

### What's Includedimport {

  BasicCard,

| Category | Count | Components |  FeaturedCard,

|----------|-------|------------|  StatCard,

| **Core Cards** | 15 | BasicCard, FeaturedCard, StatCard, TestimonialCard, ImageCard, CTACard, PricingCard, AlertCard, ColorVariantCard, ProductCard, ProfileCard, ProgressCard, TimelineCard, SkeletonCard, EmptyStateCard |  TestimonialCard,

| **Specialized Cards** | 6 | PrimaryCard, SecondaryCard, ToolCard, ComingSoonCard, StatsCard, InteractiveCard |  ImageCard,

| **Total** | **21** | Fully typed and production-ready |  CTACard,

  PricingCard,

### Design System Integration  AlertCard,

  ColorVariantCard,

All cards support:  ProductCard,

- ✅ **Color System**: Primary Red (#ef4444), Secondary Indigo (#6366f1), Accent Emerald (#22c55e), Info Blue (#3b82f6), Status Colors  ProfileCard,

- ✅ **Micro-interactions**: Hover effects, glow, glass morphism  ProgressCard,

- ✅ **Responsive Design**: Mobile-first, works on all screen sizes  TimelineCard,

- ✅ **Dark Mode**: Automatic with OKLch color space  SkeletonCard,

- ✅ **Accessibility**: WCAG AA compliant with proper contrast and semantic HTML  EmptyStateCard,

} from "@/components/Cards";

---```



## Installation & Import---



### Import All Cards## Basic Usage



```tsx```tsx

import {import { BasicCard } from "@/components/Cards";

  // Core Components

  BasicCard,export function MyComponent() {

  FeaturedCard,  return (

  StatCard,    <BasicCard title="Hello World" description="This is a basic card example" />

  TestimonialCard,  );

  ImageCard,}

  CTACard,```

  PricingCard,

  AlertCard,---

  ColorVariantCard,

  ProductCard,## Card Types

  ProfileCard,

  ProgressCard,### 1. BasicCard

  TimelineCard,

  SkeletonCard,The simplest card component. Perfect for displaying basic information with title and description.

  EmptyStateCard,

  // Specialized Cards**When to use:**

  PrimaryCard,

  SecondaryCard,- Displaying simple information blocks

  ToolCard,- Feature lists

  ComingSoonCard,- Quick informational cards

  StatsCard,- Default card container

  InteractiveCard,

} from "@/components/Cards";**Props:**

````

````typescript

### Import Individual Cardsinterface BasicCardProps {

  title: string;

```tsx  description?: string;

import { BasicCard, FeaturedCard } from "@/components/Cards";  className?: string;

```  children?: React.ReactNode;

}

---```



## Card Catalog**Examples:**



### Core Components (15 Types)```tsx

// Simple card

#### 1. BasicCard<BasicCard

The foundational card component. Perfect for simple information display.  title="Welcome"

  description="Get started with our platform"

#### 2. FeaturedCard/>

Eye-catching card with colored left border and optional icon.

// With custom content

#### 3. StatCard<BasicCard

Display metrics with trend indicators.  title="Features"

  description="Check out what we offer"

#### 4. TestimonialCard>

Showcase customer feedback with ratings and avatars.  <ul className="list-disc list-inside space-y-2">

    <li>Feature one</li>

#### 5. ImageCard    <li>Feature two</li>

Cards with featured images and optional overlay effects.    <li>Feature three</li>

  </ul>

#### 6. CTACard</BasicCard>

Call-to-action cards with action buttons.```



#### 7. PricingCard---

Tiered pricing display with features and CTA.

### 2. FeaturedCard

#### 8. AlertCard

Contextual alerts for messages and notifications (success, info, warning, error).A card with a colored left border accent. Great for highlighting important information.



#### 9. ColorVariantCard**When to use:**

Cards with 9 color theme options for organization.

- Highlighting important content

#### 10. ProductCard- Categorizing items by color

E-commerce product display with ratings and cart functionality.- Featured items in lists

- Visual hierarchy emphasis

#### 11. ProfileCard

User profile display in vertical or horizontal layout.**Props:**



#### 12. ProgressCard```typescript

Progress indicators in multiple formats (linear, circular, steps).interface FeaturedCardProps {

  title: string;

#### 13. TimelineCard  description?: string;

Activity feeds and event timelines.  accentColor?: "primary" | "accent" | "slate";

  className?: string;

#### 14. SkeletonCard  children?: React.ReactNode;

Loading placeholders to maintain layout stability.}

````

#### 15. EmptyStateCard

Display when no content is available with action guidance.**Examples:**

---```tsx

// Red accent (primary)

### Specialized Cards (6 NEW Types)<FeaturedCard

title="Critical Update"

#### 16. PrimaryCard **NEW** description="Important changes to our service"

accentColor="primary"

Emphasizes primary actions with red accent and professional design./>

```tsx// Green accent (accent)

<PrimaryCard<FeaturedCard

  title="Primary Action"  title="New Feature"

  description="Main call-to-action content"  description="We just launched something new"

  icon="⚡"  accentColor="accent"

/>/>

```

// Gray accent (slate)

**Features:**<FeaturedCard

- Red left border accent (#ef4444) title="General Info"

- Primary color title styling description="Standard information"

- Icon support for visual hierarchy accentColor="slate"

- Professional appearance/>

````

**Use for:** Main actions, primary features, hero content

---

---

### 3. StatCard

#### 17. SecondaryCard **NEW**

Display key metrics with trend indicators and icons.

Professional secondary actions with indigo accent for visual hierarchy.

**When to use:**

```tsx

<SecondaryCard- Dashboard metrics

  title="Secondary Action"- KPIs and analytics

  description="Supporting action content"- Statistics display

  icon="💡"- Numerical data highlighting

/>

```**Props:**



**Features:**```typescript

- Indigo left border accent (#6366f1)interface StatCardProps {

- Secondary color styling  title: string;

- Perfect for supporting actions  value: string | number;

- Maintains visual hierarchy  icon?: React.ReactNode;

  trend?: {

**Use for:** Supporting actions, secondary hierarchy, alternative CTAs    direction: "up" | "down";

    value: number | string;

---  };

  className?: string;

#### 18. ToolCard **NEW**}

````

Feature showcase with dynamic status indicators.

**Examples:**

````tsx

<ToolCard```tsx

  title="RACI Chart Generator"import { TrendingUp } from 'lucide-react'

  description="Define roles and responsibilities"

  icon="📊"// Simple stat

  status="coming-soon"<StatCard

/>  title="Total Users"

```  value="12,345"

/>

**Status Options:**

- `available` - Green badge, available now// With trend

- `coming-soon` - Orange badge, upcoming feature<StatCard

- `beta` - Blue badge, beta testing  title="Monthly Revenue"

  value="$45,678"

**Use for:** Feature/tool showcase, product features, coming soon items  icon={<DollarSign className="w-6 h-6" />}

  trend={{

---    direction: 'up',

    value: '12%'

#### 19. ComingSoonCard **NEW**  }}

/>

Elevated card for announcing upcoming features with premium styling.

// Negative trend

```tsx<StatCard

<ComingSoonCard  title="Churn Rate"

  title="Advanced Analytics"  value="2.3%"

  subtitle="Game-changing insights"  trend={{

  description="Deep analytics and reporting"    direction: 'down',

  icon="📈"    value: '0.5%'

  eta="Q2 2026"  }}

/>/>

````

**Features:**---

- Dashed border design

- Gradient background### 4. TestimonialCard

- ETA timeline display

- Premium appearanceDisplay customer testimonials with ratings and avatars.

- Eye-catching presentation

**When to use:**

**Use for:** Feature announcements, beta signup, roadmap showcase

- Customer testimonials

---- User reviews

- Social proof

#### 20. StatsCard **NEW**- Rating displays

Metrics display with trend indicators and color-coded accents.**Props:**

`tsx`typescript

<StatsCardinterface TestimonialCardProps {

label="Active Projects" quote: string;

value="24" authorName: string;

icon="📊" authorRole?: string;

accentColor="primary" rating?: number;

trend="up" avatarImage?: string;

trendValue="+12% from last month" className?: string;

/>}

````



**Accent Colors:****Examples:**

- `primary` - Primary red (#ef4444)

- `secondary` - Secondary indigo (#6366f1)```tsx

- `accent` - Accent emerald (#22c55e)<TestimonialCard

- `success` - Success teal (#14b8a6)  quote="This product transformed the way we work. Highly recommended!"

- `warning` - Warning amber (#f59e0b)  authorName="Sarah Johnson"

  authorRole="CEO at TechCorp"

**Trend Options:** `up` | `down` | `neutral`  rating={5}

  avatarImage="https://api.dicebear.com/7.x/avataaars/svg?seed=Sarah"

**Use for:** KPIs, metrics, dashboard stats, analytics/>



---<TestimonialCard

  quote="Great service and excellent support team."

#### 21. InteractiveCard **NEW**  authorName="Mike Chen"

  authorRole="Product Manager"

Card with hover animations and micro-interactions for engagement.  rating={4.5}

  avatarImage="https://api.dicebear.com/7.x/avataaars/svg?seed=Mike"

```tsx/>

<InteractiveCard```

  title="Explore Features"

  description="Hover to see effects"---

  icon="✨"

  accentColor="secondary"### 5. ImageCard

/>

```Display images with flexible layouts and overlay options.



**Features:****When to use:**

- Hover lift effect (2px elevation)

- Glow effect on hover- Image galleries

- Icon animation- Portfolio displays

- Smooth transitions- Product images

- Professional polish- Featured images with text overlay



**Use for:** Interactive features, engagement CTAs, feature highlights**Props:**



---```typescript

interface ImageCardProps {

## Color System  image: string;

  imageAlt?: string;

### Brand Color Palette  title: string;

  description?: string;

| Color | Hex | Use Case | Example |  overlay?: boolean;

|-------|-----|----------|---------|  className?: string;

| **Primary Red** | #ef4444 | Main actions, brand elements, attention-grabbing | PrimaryCard, FeaturedCard (primary) |}

| **Secondary Indigo** | #6366f1 | Professional hierarchy, secondary actions | SecondaryCard, StatsCard, InteractiveCard |```

| **Accent Emerald** | #22c55e | Success, growth, positive indicators | FeaturedCard (accent), StatsCard (accent) |

| **Info Blue** | #3b82f6 | Information, secondary communication | AlertCard (info), ToolCard (beta) |**Examples:**

| **Success Teal** | #14b8a6 | Successful operations | AlertCard (success), StatsCard (success) |

| **Warning Amber** | #f59e0b | Cautions, warnings | AlertCard (warning), ToolCard (coming-soon) |```tsx

| **Error Rose** | #ff6b85 | Errors, critical alerts | AlertCard (error) |// Standard layout

<ImageCard

### Using Colors in Cards  image="https://images.unsplash.com/photo-1506905925346-21bda4d32df4"

  imageAlt="Mountain landscape"

```tsx  title="Mountain Landscape"

// Primary Red - Main actions  description="Beautiful alpine scenery"

<PrimaryCard icon="⚡" />/>

<FeaturedCard accentColor="primary" />

// With overlay effect

// Secondary Indigo - Professional hierarchy<ImageCard

<SecondaryCard icon="💡" />  image="https://images.unsplash.com/photo-1506905925346-21bda4d32df4"

<StatsCard accentColor="secondary" />  imageAlt="Mountain landscape"

<InteractiveCard accentColor="secondary" />  title="Mountain Adventure"

  description="Explore the peaks"

// Accent Emerald - Success & growth  overlay={true}

<FeaturedCard accentColor="accent" />/>

<StatsCard accentColor="accent" />```



// Status Colors - Contextual information---

<AlertCard variant="success" />    // Teal

<AlertCard variant="info" />       // Blue### 6. CTACard

<AlertCard variant="warning" />    // Amber

<AlertCard variant="error" />      // RoseCall-to-action cards with primary and secondary buttons.

```

**When to use:**

### Micro-Interaction Utilities

- Sign up prompts

Cards support advanced styling utilities:- Feature promotions

- Action-oriented content

```tsx- Conversion-focused sections

// Hover Effects

className="hover-lift"      // Elevates 2px on hover**Props:**

className="hover-glow"      // Soft glow on hover

```typescript

// Glass Morphisminterface CTACardProps {

className="glass-effect"    // Frosted glass effect  title: string;

  description?: string;

// Glow Effects  primaryButtonText?: string;

className="primary-glow"    // Red glow  secondaryButtonText?: string;

className="secondary-glow"  // Indigo glow  onPrimaryClick?: () => void;

className="accent-glow"     // Emerald glow  onSecondaryClick?: () => void;

  primaryButtonVariant?: "default" | "secondary" | "outline" | "ghost";

// Gradient Text  secondaryButtonVariant?: "default" | "secondary" | "outline" | "ghost";

className="text-gradient-primary"    // Red gradient  className?: string;

className="text-gradient-secondary"  // Indigo gradient}

className="text-gradient-accent"     // Emerald gradient```

```

**Examples:**

---

```tsx

## Best Practices<CTACard

  title="Ready to get started?"

### 1. Choose the Right Card  description="Join thousands of users who are already using our platform"

  primaryButtonText="Sign Up Free"

| Need | Card Type | Reasoning |  secondaryButtonText="Learn More"

|------|-----------|-----------|  onPrimaryClick={() => navigate('/signup')}

| Simple information | BasicCard | Lightweight, no extra features |  onSecondaryClick={() => navigate('/features')}

| Highlight feature | FeaturedCard | Visual emphasis with border |/>

| Show metrics | StatCard | Built for numerical data |

| Social proof | TestimonialCard | Includes ratings & avatars |<CTACard

| Call-to-action | CTACard | Button-focused design |  title="Upgrade Your Plan"

| Pricing plans | PricingCard | Feature lists & CTA |  description="Unlock premium features and get priority support"

| Alerts/Messages | AlertCard | Status-based styling |  primaryButtonText="Upgrade Now"

| Main actions | PrimaryCard | Red accent, professional |  primaryButtonVariant="default"

| Feature showcase | ToolCard | Status indicators |  secondaryButtonText="View Plans"

| Upcoming features | ComingSoonCard | Premium, announcement-focused |  secondaryButtonVariant="outline"

| Metrics display | StatsCard | Trends & color accents |/>

```

### 2. Responsive Grids

---

```tsx

// 1 column mobile, 2 on tablet, 3 on desktop### 7. PricingCard

<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

  <Card />Display pricing tiers with features and CTA buttons.

  <Card />

  <Card />**When to use:**

</div>

- Pricing pages

// 2 columns mobile, 4 on desktop- Plan selection

<div className="grid grid-cols-2 md:grid-cols-4 gap-4">- Subscription options

  <Card />- Feature comparison

  <Card />

  <Card />**Props:**

  <Card />

</div>```typescript

```interface PricingCardProps {

  name: string;

### 3. Loading States  price: string | number;

  description?: string;

```tsx  features: string[];

{isLoading ? (  buttonText?: string;

  <>  buttonVariant?: "default" | "secondary" | "outline" | "ghost";

    <SkeletonCard variant="product" />  onButtonClick?: () => void;

    <SkeletonCard variant="product" />  featured?: boolean;

    <SkeletonCard variant="product" />  currency?: string;

  </>  billingPeriod?: string;

) : (  className?: string;

  <CardGrid />}

)}```

```

**Examples:**

### 4. Empty States

```tsx

```tsx// Basic plan

{items.length === 0 ? (<PricingCard

  <EmptyStateCard  name="Starter"

    icon={<Inbox />}  price="29"

    title="No items"  description="Perfect for getting started"

    description="Create your first item"  features={[

    actionButton={{ label: "Create", onClick: () => {} }}    'Up to 5 projects',

  />    '2 GB storage',

) : (    'Basic support',

  <CardGrid items={items} />    'Community access',

)}  ]}

```  buttonText="Choose Plan"

  buttonVariant="outline"

### 5. Consistent Spacing  onButtonClick={() => selectPlan('starter')}

/>

```tsx

// Vertical spacing// Featured plan

<div className="space-y-4"><PricingCard

  <Card />  name="Professional"

  <Card />  price="79"

</div>  description="Most popular for teams"

  featured={true}

// Grid spacing  features={[

<div className="grid gap-6">    'Unlimited projects',

  <Card />    '100 GB storage',

  <Card />    'Priority support',

</div>    'Advanced analytics',

```    'API access',

    'Team collaboration',

---  ]}

  buttonText="Start Trial"

## Component Reference  onButtonClick={() => selectPlan('professional')}

/>

### Common Props Pattern

// Enterprise plan

Most cards share these base props:<PricingCard

  name="Enterprise"

```typescript  price="Custom"

interface CardBaseProps {  description="For large organizations"

  className?: string;  features={[

  children?: React.ReactNode;    'Everything in Pro',

}    'Unlimited storage',

```    '24/7 support',

    'Custom integrations',

### AlertCard Variants    'Dedicated manager',

  ]}

```typescript  buttonText="Contact Sales"

type AlertVariant = "success" | "info" | "warning" | "error";  buttonVariant="secondary"

  currency=""

interface AlertCardProps extends CardBaseProps {  billingPeriod=""

  variant: AlertVariant;/>

  title: string;```

  description?: string;

  dismissible?: boolean;---

  onDismiss?: () => void;

}### 8. AlertCard

```

Display alerts, notifications, and status messages.

### StatCard Color Options

**When to use:**

```typescript

type AccentColor = "primary" | "secondary" | "accent" | "success" | "warning";- Error messages

type TrendDirection = "up" | "down" | "neutral";- Warning notifications

- Success confirmations

interface StatsCardProps {- Informational messages

  label: string;

  value: string;**Props:**

  icon?: string | React.ReactNode;

  accentColor?: AccentColor;```typescript

  trend?: TrendDirection;interface AlertCardProps {

  trendValue?: string;  title?: string;

}  description?: string;

```  variant?: "success" | "warning" | "error" | "info";

  dismissible?: boolean;

### ToolCard Status Options  onDismiss?: () => void;

  children?: React.ReactNode;

```typescript  className?: string;

type ToolStatus = "available" | "coming-soon" | "beta";}

```

interface ToolCardProps {

  title: string;**Examples:**

  description: string;

  icon?: string | React.ReactNode;```tsx

  status?: ToolStatus;// Success alert

}<AlertCard

```  variant="success"

  title="Success!"

---  description="Your changes have been saved successfully."

/>

## Quick Examples

// Warning alert

### Example 1: Tool Showcase<AlertCard

  variant="warning"

```tsx  title="Warning"

<div className="grid grid-cols-1 md:grid-cols-3 gap-6">  description="This action will affect 3 team members."

  <ToolCard  dismissible={true}

    title="RACI Chart"  onDismiss={() => closeAlert()}

    description="Define roles"/>

    icon="📊"

    status="available"// Error alert

  /><AlertCard

  <ToolCard  variant="error"

    title="Project Charter"  title="Error Occurred"

    description="Establish foundation"  description="Unable to process your request. Please try again later."

    icon="📋"/>

    status="coming-soon"

  />// Info alert with content

  <ToolCard<AlertCard

    title="Risk Analysis"  variant="info"

    description="Identify risks"  title="System Maintenance"

    icon="⚠️"  description="We'll be performing scheduled maintenance."

    status="beta"  dismissible={true}

  />>

</div>  <ul className="list-disc list-inside space-y-1 mt-3">

```    <li>Maintenance window: 2:00 AM - 4:00 AM UTC</li>

    <li>Expected downtime: 30 minutes</li>

### Example 2: Feature Highlights  </ul>

</AlertCard>

```tsx```

<div className="grid grid-cols-1 md:grid-cols-3 gap-6">

  <PrimaryCard---

    title="Crystal Clear"

    description="Complete transparency"### 9. ColorVariantCard

    icon="✓"

  />Cards with 9 different color themes for organization and categorization.

  <SecondaryCard

    title="Professional"**When to use:**

    description="Enterprise-grade"

    icon="💼"- Color-coded content categories

  />- Organizing information visually

  <InteractiveCard- Highlighting different content types

    title="Innovative"- Visual organization system

    description="Cutting-edge features"

    icon="✨"**Props:**

    accentColor="secondary"

  />```typescript

</div>interface ColorVariantCardProps {

```  title: string;

  description?: string;

### Example 3: Dashboard Stats  color?:

    | "red"

```tsx    | "orange"

<div className="grid grid-cols-1 md:grid-cols-4 gap-6">    | "yellow"

  <StatsCard    | "green"

    label="Active"    | "blue"

    value="24"    | "indigo"

    accentColor="primary"    | "purple"

    trend="up"    | "pink"

    trendValue="+12%"    | "slate";

  />  className?: string;

  <StatsCard  children?: React.ReactNode;

    label="Completed"}

    value="156"```

    accentColor="accent"

    trend="up"**Available Colors:**

    trendValue="+34"

  />- `red` — Critical, alerts, errors

  <StatsCard- `orange` — Warnings, caution

    label="In Progress"- `yellow` — Highlights, tips

    value="8"- `green` — Success, positive actions

    accentColor="info"- `blue` — Information, neutral (default)

    trend="neutral"- `indigo` — Premium, professional

    trendValue="Steady"- `purple` — Creative, innovative

  />- `pink` — Friendly, approachable

  <StatsCard- `slate` — Neutral, secondary

    label="Team Size"

    value="12"**Examples:**

    accentColor="secondary"

    trend="up"```tsx

    trendValue="+2"// Red for critical

  /><ColorVariantCard

</div>  color="red"

```  title="System Alert"

  description="Important system notification"

### Example 4: Coming Soon Section>

  This requires immediate attention

```tsx</ColorVariantCard>

<div className="space-y-6">

  <ComingSoonCard// Green for success

    title="Advanced Analytics"<ColorVariantCard

    subtitle="Powerful Insights"  color="green"

    description="Deep-dive analytics"  title="Deployment Complete"

    icon="📈"  description="Your application is live"

    eta="Q2 2026">

  />  All systems operational

  <ComingSoonCard</ColorVariantCard>

    title="Team Collaboration"

    subtitle="Work Together"// Purple for features

    description="Real-time features"<ColorVariantCard

    icon="👥"  color="purple"

    eta="Q3 2026"  title="New Feature"

  />  description="Check out what's new"

</div>>

```  Exciting updates available

</ColorVariantCard>

---```



## Related Documentation---



- **Full Design System**: See `DESIGN_TOKENS.md` for complete specifications### 10. ProductCard

- **Typography Components**: See `TYPOGRAPHY_COMPONENTS.md` for text styling

- **Live Showcases**: Visit `/cards` for interactive demoE-commerce product display with images, pricing, ratings, and cart functionality.

- **Real-world Usage**: Visit `/` for practical examples

**When to use:**

---

- Product grids and catalogs

## Version History- E-commerce listings

- Product showcases

**v2.0** (November 2025)- Item displays with pricing

- ✨ Added 6 new specialized card components

- 🎨 Integrated secondary indigo color system**Props:**

- ✨ Added micro-interaction utilities

- 📱 Enhanced responsive design```typescript

- ♿ Improved accessibility complianceinterface ProductCardProps {

  image: string;

**v1.0** (Initial Release)  imageAlt?: string;

- 15 core card components  title: string;

- Basic color system  price: number;

- TypeScript support  originalPrice?: number;

  rating?: number;

---  reviewCount?: number;

  description?: string;

**Last Updated**: November 8, 2025  badge?: string;

  badgeVariant?: "sale" | "new" | "featured";
  onAddToCart?: () => void;
  onFavorite?: () => void;
  isFavorited?: boolean;
  className?: string;
}
```

**Examples:**

```tsx
// Basic product
<ProductCard
  image="https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
  title="Wireless Headphones"
  price={129.99}
  rating={4.5}
  reviewCount={248}
  description="Premium sound quality"
  onAddToCart={() => addToCart(productId)}
/>

// On sale
<ProductCard
  image="https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
  title="Wireless Headphones"
  price={99.99}
  originalPrice={199.99}
  rating={4.5}
  reviewCount={248}
  description="Premium sound quality"
  badge="Sale"
  badgeVariant="sale"
  onAddToCart={() => addToCart(productId)}
/>

// Featured product
<ProductCard
  image="https://images.unsplash.com/photo-1523275335684-37898b6baf30"
  title="Smart Watch"
  price={299.99}
  rating={5}
  reviewCount={512}
  description="Latest features with health tracking"
  badge="Featured"
  badgeVariant="featured"
  isFavorited={true}
  onAddToCart={() => addToCart(productId)}
  onFavorite={() => toggleFavorite(productId)}
/>
```

---

### 11. ProfileCard

Display user profiles with avatars, roles, and action buttons.

**When to use:**

- Team member directories
- User profiles
- Member listings
- Contact cards
- Social profiles

**Props:**

```typescript
interface ProfileCardProps {
  avatar: string;
  avatarAlt?: string;
  name: string;
  title: string;
  description?: string;
  socialLinks?: Array<{
    label: string;
    icon: React.ReactNode;
    href?: string;
    onClick?: () => void;
  }>;
  actionButton?: {
    label: string;
    onClick: () => void;
    variant?: "default" | "secondary" | "outline" | "ghost";
  };
  className?: string;
  layout?: "vertical" | "horizontal";
}
```

**Examples:**

```tsx
// Vertical layout
<ProfileCard
  avatar="https://api.dicebear.com/7.x/avataaars/svg?seed=Sarah"
  name="Sarah Johnson"
  title="Product Designer"
  description="Passionate about creating beautiful user experiences"
  actionButton={{
    label: 'View Profile',
    onClick: () => navigate(`/profile/sarah`)
  }}
/>

// Horizontal layout
<ProfileCard
  layout="horizontal"
  avatar="https://api.dicebear.com/7.x/avataaars/svg?seed=Alex"
  name="Alex Chen"
  title="Full Stack Developer"
  description="Building scalable web applications"
  actionButton={{
    label: 'Connect',
    onClick: () => sendConnection('alex'),
    variant: 'outline'
  }}
/>

// With social links
<ProfileCard
  avatar="https://api.dicebear.com/7.x/avataaars/svg?seed=Jordan"
  name="Jordan Davis"
  title="Project Manager"
  socialLinks={[
    { label: 'Twitter', icon: <Twitter />, href: 'https://twitter.com' },
    { label: 'LinkedIn', icon: <Linkedin />, href: 'https://linkedin.com' },
    { label: 'GitHub', icon: <Github />, href: 'https://github.com' }
  ]}
  actionButton={{
    label: 'Message',
    onClick: () => openChat('jordan')
  }}
/>
```

---

### 12. ProgressCard

Display progress in multiple formats: linear bars, circular indicators, and step-based tracking.

**When to use:**

- Project progress tracking
- Skill levels
- Task completion
- Onboarding steps
- File uploads
- Installation progress

**Props:**

```typescript
interface ProgressCardProps {
  title: string;
  description?: string;
  progress: number;
  progressColor?: "red" | "orange" | "yellow" | "green" | "blue" | "purple";
  variant?: "linear" | "circular" | "steps";
  steps?: Array<{
    label: string;
    completed: boolean;
  }>;
  showPercentage?: boolean;
  className?: string;
}
```

**Examples:**

```tsx
// Linear progress
<ProgressCard
  title="Project Completion"
  description="Overall progress on current project"
  progress={65}
  progressColor="blue"
  variant="linear"
  showPercentage={true}
/>

// Circular progress
<ProgressCard
  title="Download Progress"
  progress={45}
  progressColor="green"
  variant="circular"
/>

// Steps progress
<ProgressCard
  title="Onboarding Steps"
  description="Complete your profile setup"
  progress={60}
  variant="steps"
  steps={[
    { label: 'Create Account', completed: true },
    { label: 'Verify Email', completed: true },
    { label: 'Add Profile Photo', completed: true },
    { label: 'Choose Preferences', completed: false },
    { label: 'Get Started', completed: false },
  ]}
  progressColor="green"
/>
```

---

### 13. TimelineCard

Display activity feeds, project history, and event timelines.

**When to use:**

- Activity feeds
- Project history
- Event timelines
- Release notes
- Changelog
- Workflow status

**Props:**

```typescript
interface TimelineEvent {
  date: string;
  title: string;
  description: string;
  icon?: React.ReactNode;
  status?: "completed" | "current" | "upcoming";
}

interface TimelineCardProps {
  events: TimelineEvent[];
  className?: string;
}
```

**Examples:**

```tsx
<TimelineCard
  events={[
    {
      date: "Today at 2:30 PM",
      title: "Project Launched",
      description: "Your new product is now live",
      status: "completed",
    },
    {
      date: "Yesterday at 10:15 AM",
      title: "Design Review Complete",
      description: "All design assets approved",
      status: "completed",
    },
    {
      date: "Tomorrow at 3:00 PM",
      title: "Team Meeting",
      description: "Q&A session with stakeholders",
      status: "current",
    },
    {
      date: "Next Week",
      title: "Beta Testing Phase",
      description: "Open beta for early adopters",
      status: "upcoming",
    },
  ]}
/>
```

---

### 14. SkeletonCard

Loading placeholder cards that maintain layout stability during data fetching.

**When to use:**

- Loading states
- Data fetching
- Streaming content
- Layout stability
- Perceived performance

**Props:**

```typescript
interface SkeletonCardProps {
  variant?: "product" | "profile" | "basic" | "feature";
  className?: string;
}
```

**Available Variants:**

- `product` — Product card skeleton
- `profile` — Profile card skeleton
- `basic` — Basic card skeleton
- `feature` — Feature card skeleton

**Examples:**

```tsx
// Product loading state
{
  isLoading ? (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
      <SkeletonCard variant="product" />
      <SkeletonCard variant="product" />
      <SkeletonCard variant="product" />
    </div>
  ) : (
    <ProductGrid products={products} />
  );
}

// Profile loading state
{
  isLoadingProfile ? (
    <SkeletonCard variant="profile" />
  ) : (
    <ProfileCard {...profileData} />
  );
}

// Feature list loading
{
  isLoadingFeatures ? (
    <div className="space-y-4">
      <SkeletonCard variant="feature" />
      <SkeletonCard variant="feature" />
      <SkeletonCard variant="feature" />
    </div>
  ) : (
    <FeatureList features={features} />
  );
}
```

---

### 15. EmptyStateCard

Display when there's no content to show with guidance and action options.

**When to use:**

- Empty content states
- First-time user experience
- No search results
- No items in list
- Call-to-action for empty sections

**Props:**

```typescript
interface EmptyStateCardProps {
  icon: React.ReactNode;
  title: string;
  description: string;
  actionButton?: {
    label: string;
    onClick: () => void;
    variant?: "default" | "secondary" | "outline" | "ghost";
  };
  className?: string;
}
```

**Examples:**

```tsx
import { Inbox, Package, Grid } from 'lucide-react'

// No messages
<EmptyStateCard
  icon={<Inbox className="w-12 h-12" />}
  title="No Messages"
  description="You don't have any messages yet. Start a conversation."
  actionButton={{
    label: 'Send a Message',
    onClick: () => openComposer()
  }}
/>

// No orders
<EmptyStateCard
  icon={<Package className="w-12 h-12" />}
  title="No Orders"
  description="You haven't placed any orders yet."
  actionButton={{
    label: 'Start Shopping',
    onClick: () => navigate('/shop'),
    variant: 'secondary'
  }}
/>

// No projects
<EmptyStateCard
  icon={<Grid className="w-12 h-12" />}
  title="No Projects"
  description="Create your first project to get started."
  actionButton={{
    label: 'Create Project',
    onClick: () => showCreateProjectModal()
  }}
/>
```

---

## Best Practices

### 1. Consistency

Use the same card type for similar information across your app:

```tsx
// ✅ Good - Consistent patterns
<ProductCard {...product1} />
<ProductCard {...product2} />
<ProductCard {...product3} />

// ❌ Avoid - Mixing card types for same data
<ProductCard {...product1} />
<BasicCard title={product2.name} />
<ImageCard image={product3.image} />
```

### 2. Prop Validation

Always validate required props before rendering:

```tsx
// ✅ Good
function ProductGrid({ products }: { products: Product[] }) {
  if (!products || products.length === 0) {
    return <EmptyStateCard icon={<Box />} title="No Products" />;
  }
  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
      {products.map((p) => (
        <ProductCard key={p.id} {...p} />
      ))}
    </div>
  );
}
```

### 3. Loading States

Use SkeletonCard while data is loading:

```tsx
// ✅ Good
function ProductListing() {
  const { data, isLoading } = useProducts();

  if (isLoading) {
    return (
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {[1, 2, 3].map((i) => (
          <SkeletonCard key={i} variant="product" />
        ))}
      </div>
    );
  }

  return <ProductGrid products={data} />;
}
```

### 4. Color Semantics

Use ColorVariantCard colors meaningfully:

```tsx
// ✅ Good - Colors convey meaning
<ColorVariantCard color="red" title="Critical Issue" />    // Red = urgent
<ColorVariantCard color="green" title="Deployment OK" />   // Green = success
<ColorVariantCard color="yellow" title="Warning" />        // Yellow = caution
<ColorVariantCard color="blue" title="Information" />      // Blue = info
```

### 5. Responsive Grids

Use responsive grid layouts:

```tsx
// ✅ Good - Responsive
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  {items.map(item => <Card key={item.id} {...item} />)}
</div>

// ✅ Also good - 2 columns on mobile, 4 on desktop
<div className="grid grid-cols-2 md:grid-cols-4 gap-4">
  {items.map(item => <Card key={item.id} {...item} />)}
</div>
```

### 6. Error Handling

Handle errors gracefully with AlertCard:

```tsx
// ✅ Good
function DataDisplay() {
  const { data, error, isLoading } = useData();

  if (error) {
    return (
      <AlertCard
        variant="error"
        title="Error Loading Data"
        description={error.message}
        dismissible
      />
    );
  }

  if (isLoading) return <SkeletonCard />;

  return <DisplayData data={data} />;
}
```

### 7. Accessibility

Add proper ARIA labels and keyboard support:

```tsx
// ✅ Good - Accessible
<ProductCard
  {...product}
  onAddToCart={() => addToCart(product.id)}
  role="article"
  aria-label={`Product: ${product.title}`}
/>

// Include alt text for images
<ProductCard
  image={product.image}
  imageAlt={`${product.title} product image`}
  {...product}
/>
```

### 8. Performance

Lazy load images and optimize for performance:

```tsx
// ✅ Good - Lazy loading images
<ProductCard image={product.image} {...product} />;

// For large grids, consider virtual scrolling
import { FixedSizeList } from "react-window";

<FixedSizeList
  height={600}
  itemCount={products.length}
  itemSize={350}
  width="100%"
>
  {({ index, style }) => (
    <div style={style}>
      <ProductCard {...products[index]} />
    </div>
  )}
</FixedSizeList>;
```

---

## Patterns & Examples

### Pattern 1: Product Grid with Filters

```tsx
function ProductCatalog() {
  const [filter, setFilter] = useState("all");
  const [sort, setSort] = useState("newest");
  const products = useProducts(filter, sort);

  if (!products.length) {
    return (
      <EmptyStateCard
        icon={<ShoppingBag />}
        title="No Products Found"
        description="Try adjusting your filters"
        actionButton={{
          label: "Clear Filters",
          onClick: () => setFilter("all"),
        }}
      />
    );
  }

  return (
    <div>
      <div className="flex gap-4 mb-8">
        <select onChange={(e) => setFilter(e.target.value)}>
          <option value="all">All Products</option>
          <option value="new">New</option>
          <option value="sale">On Sale</option>
        </select>
        <select onChange={(e) => setSort(e.target.value)}>
          <option value="newest">Newest</option>
          <option value="price-asc">Price: Low to High</option>
          <option value="price-desc">Price: High to Low</option>
        </select>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-6">
        {products.map((product) => (
          <ProductCard
            key={product.id}
            {...product}
            onAddToCart={() => addToCart(product)}
            onFavorite={() => toggleFavorite(product.id)}
          />
        ))}
      </div>
    </div>
  );
}
```

### Pattern 2: Team Directory with Search

```tsx
function TeamDirectory() {
  const [search, setSearch] = useState("");
  const [department, setDepartment] = useState("all");
  const members = useTeamMembers(search, department);

  return (
    <div>
      <div className="mb-8 flex gap-4">
        <input
          type="search"
          placeholder="Search team members..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="flex-1 px-4 py-2 border rounded-lg"
        />
        <select onChange={(e) => setDepartment(e.target.value)}>
          <option value="all">All Departments</option>
          <option value="engineering">Engineering</option>
          <option value="design">Design</option>
          <option value="product">Product</option>
        </select>
      </div>

      {!members.length ? (
        <EmptyStateCard
          icon={<Users />}
          title="No Team Members Found"
          description="Try adjusting your search"
        />
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {members.map((member) => (
            <ProfileCard
              key={member.id}
              avatar={member.avatar}
              name={member.name}
              title={member.title}
              description={member.bio}
              actionButton={{
                label: "View Profile",
                onClick: () => navigate(`/team/${member.id}`),
              }}
            />
          ))}
        </div>
      )}
    </div>
  );
}
```

### Pattern 3: Dashboard with Multiple Card Types

```tsx
function Dashboard() {
  const { stats, progress, timeline, isLoading } = useDashboard();

  if (isLoading) {
    return (
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        {[1, 2, 3, 4].map((i) => (
          <SkeletonCard key={i} variant="feature" />
        ))}
      </div>
    );
  }

  return (
    <div className="space-y-8">
      {/* KPI Stats */}
      <div>
        <h2 className="text-2xl font-bold mb-4">Key Metrics</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {stats.map((stat) => (
            <StatCard
              key={stat.id}
              title={stat.title}
              value={stat.value}
              icon={stat.icon}
              trend={stat.trend}
            />
          ))}
        </div>
      </div>

      {/* Progress Trackers */}
      <div>
        <h2 className="text-2xl font-bold mb-4">Progress</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {progress.map((item) => (
            <ProgressCard
              key={item.id}
              title={item.title}
              progress={item.value}
              progressColor={item.color}
              variant="circular"
            />
          ))}
        </div>
      </div>

      {/* Timeline */}
      <div>
        <h2 className="text-2xl font-bold mb-4">Recent Activity</h2>
        <TimelineCard events={timeline} />
      </div>
    </div>
  );
}
```

### Pattern 4: Pricing Page

```tsx
function PricingPage() {
  const [billingPeriod, setBillingPeriod] = useState("monthly");
  const plans = getPricingPlans(billingPeriod);

  return (
    <div className="space-y-12">
      <div className="text-center">
        <h1 className="text-4xl font-bold mb-4">Simple, Transparent Pricing</h1>
        <div className="flex justify-center gap-4">
          <button
            onClick={() => setBillingPeriod("monthly")}
            className={billingPeriod === "monthly" ? "font-bold" : ""}
          >
            Monthly
          </button>
          <button
            onClick={() => setBillingPeriod("annual")}
            className={billingPeriod === "annual" ? "font-bold" : ""}
          >
            Annual (Save 20%)
          </button>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {plans.map((plan, idx) => (
          <PricingCard
            key={plan.id}
            {...plan}
            featured={idx === 1}
            onButtonClick={() => selectPlan(plan.id)}
          />
        ))}
      </div>
    </div>
  );
}
```

### Pattern 5: Form with Validation States

```tsx
function UserForm() {
  const [formState, setFormState] = useState({});
  const [errors, setErrors] = useState({});
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = async () => {
    const newErrors = validate(formState);

    if (Object.keys(newErrors).length === 0) {
      setSubmitted(true);
      return (
        <AlertCard
          variant="success"
          title="Success!"
          description="Your form has been submitted."
        />
      );
    }

    setErrors(newErrors);
  };

  return (
    <div className="space-y-6">
      {Object.keys(errors).map((field) => (
        <AlertCard
          key={field}
          variant="error"
          title="Validation Error"
          description={errors[field]}
          dismissible
          onDismiss={() => setErrors((e) => ({ ...e, [field]: undefined }))}
        />
      ))}

      {/* Form fields here */}

      <button onClick={handleSubmit}>Submit</button>
    </div>
  );
}
```

---

## Color Reference

### Alert/Info Card Colors

- **Success** (Green) — Confirmations, positive feedback
- **Info** (Blue) — Informational messages
- **Warning** (Yellow) — Cautions, warnings
- **Error** (Red) — Errors, critical issues

### ColorVariantCard Colors

| Color  | Use Case                       | Icon/Status      |
| ------ | ------------------------------ | ---------------- |
| Red    | Critical, alerts, errors       | High priority    |
| Orange | Warnings, caution              | Medium priority  |
| Yellow | Highlights, tips               | Attention needed |
| Green  | Success, positive actions      | Complete         |
| Blue   | Information, neutral (default) | Standard         |
| Indigo | Premium, professional          | Exclusive        |
| Purple | Creative, innovative           | New feature      |
| Pink   | Friendly, approachable         | Community        |
| Slate  | Neutral, secondary             | Background       |

---

## Browser Support

All card components are built with:

- React 19+
- TypeScript
- Tailwind CSS 4.0+

Supported browsers:

- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile browsers

---

## Performance Tips

1. **Use memoization for card lists:**

   ```tsx
   const MemoizedProductCard = React.memo(ProductCard);
   ```

2. **Lazy load images:**

   ```tsx
   <img src={image} loading="lazy" alt={alt} />
   ```

3. **Virtual scrolling for large lists:**

   ```tsx
   import { FixedSizeList } from "react-window";
   ```

4. **Code splitting for card components:**
   ```tsx
   const ProductCard = React.lazy(() => import("./ProductCard"));
   ```

---

## Contributing

To add new card types or improve existing ones:

1. Create component in `src/components/Cards/`
2. Export from `src/components/Cards/index.ts`
3. Add showcase section to `src/routes/cards.tsx`
4. Update this documentation
5. Ensure TypeScript types are complete
6. Add accessibility features (ARIA labels, keyboard support)

---

## License

These card components are part of the Caliber project.

---

## Quick Links

- [Component Showcase](/cards)
- [TypeScript Definitions](/src/components/Cards)
- [Tailwind CSS](https://tailwindcss.com)
- [shadcn/ui](https://ui.shadcn.com)
- [Lucide Icons](https://lucide.dev)
````
