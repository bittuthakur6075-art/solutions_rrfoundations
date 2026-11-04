# RR Foundations — Design System Specification

## 1. Aesthetic Direction: Forest Editorial Luxury

The visual design language fuses **high-end editorial sophistication** with **contemporary industrial precision**.
It evokes heritage craftsmanship, architectural restraint, and modern production excellence.

---

## 2. Colour Tokens

| Token Name | Hex Code | Purpose & Application |
|---|---|---|
| `primary-forest` | `#172B27` | Dominant brand color, dark showcase panels, headers, primary CTAs |
| `forest-secondary` | `#304B43` | Secondary hero surfaces, hover states, card backdrops |
| `champagne` | `#D5B783` | Subtle luxury accent, badge highlights, kicker labels, active indicators |
| `champagne-light` | `#F1E6D2` | Soft champagne tint for pills, tag backgrounds, borders |
| `canvas-ivory` | `#F8F5EF` | Page background (warm, editorial cream rather than sterile white) |
| `surface-white` | `#FFFFFF` | Product cards, modular containers, modal sheets |
| `text-primary` | `#202824` | Primary high-contrast typography, headings, labels |
| `text-secondary` | `#747D76` | Supporting body copy, metadata, captions |
| `border-subtle` | `#E7E8E2` | Refined 1px hair-line dividers and card perimeters |
| `status-success` | `#287A52` | Positive confirmation, in-stock / active signals |
| `status-warning` | `#B88632` | Attention, custom production lead times |
| `status-danger` | `#C74B45` | Error states, validation alerts |

---

## 3. Typography System

### Font Pairings
- **Headings & Display**: `Manrope` (Google Fonts: 400, 500, 600, 700, 800)
- **Editorial Accents & Pull Quotes**: `DM Serif Display` (Google Fonts: 400, italic)
- **Body & Technical Specs**: `Inter` (Google Fonts: 400, 500, 600)

### Typographic Scale
- `display-hero`: `clamp(2.75rem, 5vw + 1rem, 4.75rem)` (44px - 76px), Line-height 1.08, tracking -0.03em
- `h1`: `clamp(2.25rem, 4vw + 0.5rem, 3.5rem)` (36px - 56px), Line-height 1.15, tracking -0.025em
- `h2`: `clamp(1.75rem, 3vw + 0.5rem, 2.75rem)` (28px - 44px), Line-height 1.2, tracking -0.02em
- `h3`: `clamp(1.35rem, 2vw + 0.25rem, 1.85rem)` (22px - 30px), Line-height 1.25, tracking -0.015em
- `h4`: `1.25rem` (20px), Line-height 1.35
- `body-large`: `1.125rem` (18px), Line-height 1.6
- `body-default`: `1rem` (16px), Line-height 1.55
- `body-small`: `0.875rem` (14px), Line-height 1.5
- `caption`: `0.75rem` (12px), Line-height 1.4, tracking 0.05em, uppercase

---

## 4. Spacing, Elevation & Radii

- **Grid System**: 8px baseline (`4, 8, 12, 16, 24, 32, 48, 64, 80, 112px`)
- **Containers**:
  - Max page width: `1440px`
  - Standard content container: `1280px` (`max-w-7xl mx-auto px-4 sm:px-6 lg:px-8`)
  - Narrow reading container: `840px` (`max-w-3xl`)
- **Corner Radii**:
  - Small pills / badges: `9999px` (fully rounded)
  - Cards & containers: `12px` - `16px` (`rounded-xl` or `rounded-2xl`)
  - Inputs & Buttons: `8px` (`rounded-lg`)
- **Shadows**:
  - Subtle cards: `0 1px 3px 0 rgba(23, 43, 39, 0.04), 0 1px 2px -1px rgba(23, 43, 39, 0.04)`
  - Elevated hover: `0 12px 24px -4px rgba(23, 43, 39, 0.08), 0 4px 6px -2px rgba(23, 43, 39, 0.03)`
  - Luxury deep: `0 24px 48px -12px rgba(23, 43, 39, 0.16)`

---

## 5. Reusable Component Guidelines

### Buttons
1. **Primary Luxury Forest**:
   - Background `#172B27`, Text `#F8F5EF`, Accent hover shimmer `#D5B783` border.
   - Font: Manrope 600, 14px, tracking 0.02em.
2. **Champagne Glow Button**:
   - Background `#D5B783`, Text `#172B27`, hover background `#C7A56E`.
3. **Outlined Secondary**:
   - Transparent, 1.5px border `#E7E8E2` or `#172B27`, text `#172B27`, hover background `#F8F5EF`.
4. **Ghost / Tertiary Link**:
   - Text `#172B27` with animated underline reveal and right arrow icon (`Lucide.ArrowRight`).

### Product & Category Cards
- White surface (`#FFFFFF`) with 1px border `#E7E8E2`.
- 4:5 or 1:1 aspect ratio studio frame with neutral soft-lit gradient backdrop.
- Subtle image scale on hover (`scale-105 duration-500 ease-out`).
- Clean metadata badge (e.g. "Pure Copper", "Custom Laser", "Bulk Ready").
