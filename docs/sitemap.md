# RR Foundations — Sitemap & Information Architecture

## 1. Information Architecture Overview

```
RR Foundations Web Architecture
├── / (Home)
│   ├── Navigation (Header with Product Mega Menu & CTA)
│   ├── Editorial Hero ("Manufacturing Ideas Into Products That Matter")
│   ├── Company Introduction ("Built Around Products. Driven by Possibilities")
│   ├── Product Category Showcase (Badges, Lanyards, MDF/Acrylic, Corporate Gifting)
│   ├── Featured Products Grid (Dynamic from catalog)
│   ├── Manufacturing Capabilities (Laser engraving, UV printing, CNC, Sublimation)
│   ├── Why RR Foundations (Verified value pillars)
│   ├── Industries Served (Corporate, Education, Events, Government/Defense, Retail)
│   ├── Custom Manufacturing CTA ("Have a Unique Requirement?")
│   ├── Gallery Preview (Real manufacturing & finished deliverables)
│   └── Editorial Footer (Verified contact, address, legal, social links)
│
├── /about (About Us)
│   ├── Heritage & Mission
│   ├── Manufacturing Approach & Standards
│   └── Facility Highlights
│
├── /products (Complete Product Catalogue)
│   ├── Filter & Search bar (Materials, Category, Tags)
│   ├── Category Selector
│   ├── Product Grid with Quote CTA
│   └── Custom Bulk Order Callout
│
├── /products/[category] (Category Listing)
├── /products/[category]/[slug] (Product Detail Page)
│   ├── High-res Gallery & Zoom
│   ├── Material, Dimensions, Backing Options & Specs
│   ├── Direct Enquiry Modal / Pre-filled Form
│   └── WhatsApp Direct Consultation
│
├── /manufacturing (Capabilities & Machinery)
├── /industries (Sectors & Custom Solutions)
├── /gallery (High-Resolution Production Showcase & Lightbox)
├── /contact (Verified Delhi Address, Direct Phone, Email, Map)
├── /request-quote (Full B2B RFQ Funnel with File Attachment)
├── /privacy-policy (Legal & Data Safeguards)
└── /terms-and-conditions (Commercial & Order Terms)
```

## 2. Dynamic Routing & Canonical URL Strategy

- Standard URL Structure: `https://solutions.rrfoundations.org/products/{category-slug}/{product-slug}`
- SEO friendly, human readable, hyphen-separated kebab case.
- Automatically generated XML sitemap at `/sitemap.xml` and `/robots.txt`.
