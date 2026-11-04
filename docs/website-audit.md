# RR Foundations — Website & Asset Audit

## Executive Summary
This audit reviews the existing digital presence of RR Foundations (currently hosted at `https://solutions.rrfoundations.org/`), existing assets, code dependencies, and business offerings prior to the rebuild.

---

## 1. Existing Website Audit (`https://solutions.rrfoundations.org/`)

- **Hosting & Infrastructure**: Hosted on Hostinger Horizons / Hostinger eCommerce platform.
- **Frontend Framework**: Single Page Application (Vite + React 18.3 + Tailwind CSS + Lucide Icons + Framer Motion).
- **Backend / Store API**: `https://api-ecommerce.hostinger.com/store/store_01KW1TKW4A32TT2V56VWMXAHD0/products`
- **Current URL Routes Discovered**:
  - `/` (Home)
  - `/about` (About Us)
  - `/products` (Products overview)
  - `/campaigns` (Campaign merchandise)
  - `/store` (eCommerce store catalog)
  - `/why-us` (Why choose RR Foundations)
  - `/contact` (Contact page)
  - `/product/:id` (Single product view)
- **Key Limitations of Old Site**:
  - Generic SaaS template feel, lacking bespoke luxury editorial craftsmanship.
  - Lack of cohesive B2B quotation workflow (was partially hooked to a consumer cart API rather than a dedicated high-volume procurement inquiry funnel).
  - Heavy reliance on external stock photos (Unsplash) alongside real product photographs without clear distinction.
  - Typography was default sans-serif lacking brand hierarchy.
  - Performance bottlenecks due to unoptimized 3MB+ client assets loaded without Next.js Image optimizations or modern formats (WebP/AVIF).

---

## 2. Verified Business Details & Identity

From direct extraction of the production bundle and store database:
- **Company Name**: RR Foundations
- **Tagline / Headline**: Manufacturing Ideas Into Products That Matter
- **Official Contact Email**: `help@rrfoundation.org`
- **Official Phone / WhatsApp**: `+91 74280 45813` (`https://wa.me/917428045813`)
- **Operational Hours**: Monday to Friday, 9:00 AM – 6:00 PM IST
- **Physical Address**: Shop No. 12, Om Vihar, Opposite Metro Pillar No. 702, New Delhi – 110059, India
- **Core Offerings**:
  1. Metal, brass, stainless steel, and copper badges & pins (safety pin badges, magnetic badges, clasp pins, Ashoka Chakra/flag badges).
  2. Lanyards, badge reels, ID card holders & event conference delegate kits.
  3. Executive & corporate merchandise (customized pens, notebooks, diaries, hampers).
  4. MDF & Acrylic products (clipboards, exam boards, trophies, keychains, fridge magnets).
  5. Custom UV printing, laser engraving, sublimation, and bulk fabrication.

---

## 3. Discovered Assets & Media Inventory

| Asset Name | Source | Description / Notes |
|---|---|---|
| `asset_logo.png` | Horizons CDN (`b52e62fd...png`) | Official RR Foundations emblem / logo mark |
| `asset_badges.png` | Horizons CDN (`21333e09...png`) | Hero badge cluster showcase image |
| `asset_lanyards.jpg` | Horizons CDN (`4f1d148b...jpg`) | Event lanyards & ID kit photography |
| 16 Catalog Products | Hostinger Store API | High-resolution PNGs of badges, pins, gift hampers, clipboards, ID kits |

---

## 4. Technical Risks & Redirection Strategy

1. **Old Store URLs (`/store`, `/why-us`, `/campaigns`)**:
   - Redirect `/store` -> `/products` (301 Permanent).
   - Redirect `/why-us` -> `/about#why-us` (301 Permanent).
   - Redirect `/campaigns` -> `/industries#campaigns` (301 Permanent).
   - Redirect `/product/:id` -> `/products/[category]/[slug]` (dynamic 301 mapping).
2. **Assets & CDN**:
   - Download, optimize, and store core logos and product imagery locally in `/public/assets` with Next.js Image caching to avoid third-party CDN downtime.
3. **Form Submissions**:
   - Old site relied on Hostinger form hooks; modern solution requires server-side validation (Zod) and robust enquiry dispatch/logging with fallback.
