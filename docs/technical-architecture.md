# RR Foundations — Technical Architecture

## 1. Technology Stack

- **Framework**: Next.js 14 / 15 (React 18 / 19, TypeScript) with App Router.
- **Styling**: Tailwind CSS v3 with custom theme tokens (`forest`, `champagne`, `ivory`, `surface`).
- **Icons**: Lucide React.
- **Typography**: Next/Font with Google Fonts (`Manrope`, `Inter`, `DM Serif Display`).
- **Form Management**: React Hook Form + Zod validation.
- **Data Layer**:
  - Local verified catalogue dataset (`/lib/data/products.ts`) reflecting the verified 16 store products.
  - Sanity CMS integration readiness (`/sanity` client, schemas, and queries) for live production CMS capability.
- **Enquiry Dispatch**: Next.js Server Actions & API Routes (`/api/enquiry`) with JSON storage / logging fallback.

---

## 2. Directory Structure

```
rr-foundations/
├── app/
│   ├── layout.tsx             # Root layout with fonts, header, footer, toast provider
│   ├── page.tsx               # High-fidelity Forest Editorial Luxury Homepage
│   ├── products/
│   │   ├── page.tsx           # Product catalog with category, material, tag filtering
│   │   └── [category]/
│   │       └── [slug]/
│   │           └── page.tsx   # Product Detail Page with quotation trigger
│   ├── about/page.tsx         # Brand story, craftsmanship, Delhi facility
│   ├── manufacturing/page.tsx # Laser cutting, UV print, CNC, Sublimation capabilities
│   ├── industries/page.tsx    # Corporate, Defense, Education, Events, Retail solutions
│   ├── gallery/page.tsx       # Production gallery with interactive modal
│   ├── contact/page.tsx       # Verified Delhi address, direct WhatsApp, contact form
│   ├── request-quote/page.tsx # Comprehensive B2B RFQ quotation builder
│   ├── privacy-policy/page.tsx# Legal terms
│   ├── terms-and-conditions/page.tsx
│   ├── sitemap.ts             # Dynamic XML sitemap
│   └── robots.ts              # SEO crawl directive
├── components/
│   ├── layout/                # Header, MegaMenu, Footer, MobileNav
│   ├── homepage/              # Hero, Intro, CategoryGrid, Featured, Capabilities, WhyUs, Industries, CTA, Gallery
│   ├── products/              # ProductCard, ProductGrid, FilterBar, SpecsTable, GalleryView
│   ├── ui/                    # Button, Badge, Modal, Input, Textarea, Toast
│   └── forms/                 # QuoteForm, QuickEnquiryModal, ContactForm
├── lib/
│   ├── data/                  # Verified products, categories, capabilities data
│   ├── validation/            # Zod schemas for enquiries & quotes
│   └── utils.ts               # Classnames, formatting, slugify helpers
├── public/
│   ├── assets/                # Logos, badges, products, banners
│   └── favicon.ico
└── sanity/                    # Schemas for products, categories, capabilities
```
