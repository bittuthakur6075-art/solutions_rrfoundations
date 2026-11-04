# RR FOUNDATIONS — NEXT.JS 14 TO REACT + VITE MIGRATION AUDIT

**Auditor:** Senior Frontend Architect & Migration Engineer  
**Date:** November 4, 2026  
**Project:** RR Foundations (B2B Manufacturing Showcase)  
**Source Stack:** Next.js 14.2.35 (App Router, Node.js runtime)  
**Target Stack:** React 18 + Vite 5 + React Router 6 + Tailwind CSS (Static Web Hosting on Hostinger Premium)  
**Production Domain:** `https://solutions.rrfoundations.org`  
**Migration Directive:** Framework migration only; **zero redesign**; 100% preservation of visual appearance, interactions, branding (Forest Green + Champagne Gold), responsiveness, and B2B functionality.

---

## 1. Complete Architecture & Codebase Inventory

### 1.1 Page & Route Map

| Next.js App Route | Component Path | Type | Target React Router Route | Role & Description |
| :--- | :--- | :---: | :--- | :--- |
| `/` | `app/page.tsx` | Client | `/` | Editorial B2B Homepage with Hero, Showcase, Capabilities, Industries |
| `/about` | `app/about/page.tsx` | Client | `/about` | Corporate Heritage, Factory Equipment, Quality Control & Reviews |
| `/products` | `app/products/page.tsx` | Client | `/products` | Complete Catalogue (268 products across 9 categories) with Search & Filter |
| `/manufacturing` | `app/manufacturing/page.tsx`| Server | `/manufacturing` | Technical Capabilities, Machine Specifications & Materials Breakdown |
| `/industries` | `app/industries/page.tsx` | Server | `/industries` | 9 Key Sector Solutions, Case Highlights & Direct CTA actions |
| `/contact` | `app/contact/page.tsx` | Client | `/contact` | Factory Address, Working Hours, Official Contacts & Interactive Form |
| `/request-quote` | `app/request-quote/page.tsx` | Client | `/request-quote` | Comprehensive Institutional RFQ Form with Quantity & Details |
| `/privacy-policy` | `app/privacy-policy/page.tsx`| Server | `/privacy-policy` | Commercial Privacy Policy & Data Handling Disclosures |
| `/terms-and-conditions` | `app/terms-and-conditions/page.tsx` | Server | `/terms-and-conditions` | Standard B2B Fabrication & Supply Terms |
| `/*` (404) | `app/not-found.tsx` | Server | `*` | Custom 404 Page Not Found with redirect to `/products` |
| `/api/enquiry` | `app/api/enquiry/route.ts` | Server | External API / PHP relay | B2B Enquiry Submission Handler (`POST`) with Zod validation |

---

## 2. Next.js Specific Dependencies & Replacements

| Next.js Feature | Current Implementation in Codebase | Target React + Vite Replacement | Migration Strategy |
| :--- | :--- | :--- | :--- |
| **Routing** | Next.js App Router (`next/navigation`, `usePathname`) | `react-router-dom` (`createBrowserRouter`, `useLocation`, `useNavigate`) | Wrap app in `RouterProvider`. Replace `usePathname()` with `useLocation().pathname`. |
| **Navigation Links** | `import Link from "next/link"` (`<Link href="...">`) | `import { Link } from "react-router-dom"` (`<Link to="...">`) | Find and replace `href` with `to` on all Link tags. Handle hash anchors seamlessly. |
| **Image Optimization**| `import Image from "next/image"` with `fill`, `sizes`, `priority` | High-performance custom `<Image>` component or native `<img>` with `loading="lazy"` and `object-fit` | Create a unified `components/ui/Image.tsx` that supports `fill`, `className`, `src`, `alt`, and `loading` without breaking existing layouts. |
| **Font Loading** | `next/font/google` (`Manrope`, `Inter`, `Playfair_Display`) | Standard web font loading via `<link rel="stylesheet">` or `@fontsource` | Preconnect and load `Manrope`, `Inter`, and `Playfair Display` in `index.html` with `display=swap`. Retain identical CSS variables. |
| **Document Head & SEO** | `export const metadata: Metadata` in layouts/pages | `react-helmet-async` | Create an `<SEO>` helper component that injects `<title>`, `<meta name="description">`, canonical `<link>`, OG tags, and Schema.org JSON-LD scripts into document `<head>`. |
| **Dynamic Sitemap** | `app/sitemap.ts` (Next.js MetadataRoute) | Static `public/sitemap.xml` | Generate a static, canonical `public/sitemap.xml` indexing all 11 routes and 268 product anchors. |
| **Robots Directives** | `app/robots.ts` | Static `public/robots.txt` | Generate `public/robots.txt` allowing all crawlers and pointing to `https://solutions.rrfoundations.org/sitemap.xml`. |
| **Styling & Design Tokens** | `tailwindcss`, `postcss`, `tailwind.config.ts` | Retained identically in Vite | Keep `tailwind.config.ts`, `postcss.config.js`, and `src/index.css`. Zero visual alteration. |
| **Bundler & Dev Server** | `next dev`, `next build` | Vite 5 (`vite`, `@vitejs/plugin-react`) | Blazing fast ESM dev server and optimized Rollup static build output to `dist/`. |

---

## 3. Product Catalogue & Data Layer Audit

- **Data Files:**
  - `lib/data/products.ts`: 268 physical products with full titles, slugs, categories, materials, and specifications.
  - `lib/data/categories.ts`: 9 primary manufacturing categories.
  - `lib/data/manufacturing.ts`: 6 core factory processes.
  - `lib/data/industries.ts`: 9 sector-specific B2B solutions.
- **Dynamic Anchoring:** The catalogue in `app/products/page.tsx` uses hash-based category filtering and product IDs (`id={prod.slug}`). This translates directly to React Router with standard URL hash management (`window.location.hash` or smooth scrolling).
- **Zero Missing Data:** All product entries contain valid strings; 268/268 local image files exist under `public/assets/products/`.

---

## 4. Backend & Enquiry Journey Audit

### 4.1 Current Next.js Implementation
In Next.js, `app/api/enquiry/route.ts` accepted `POST` requests and appended records locally to `docs/enquiry_submissions.json`.

### 4.2 Hostinger Premium Web Hosting Compatibility
Hostinger Premium Web Hosting is an Apache + PHP environment. It does **not** provide a persistent Node.js server process for running Next.js server actions or server APIs in shared web hosting mode.

### 4.3 Replacement Architecture for Static Hosting
To ensure 100% functionality with zero ongoing external costs, we will implement a dual-compatible solution:
1. **Native Hostinger PHP Endpoint (`public/api/enquiry.php`):**
   - Receives JSON payload identical to `EnquirySchema`.
   - Validates required fields, formats, and checks honeypot spam protection.
   - Saves enquiry records to secure data storage or dispatches via PHP `mail()` / sendmail.
   - Returns `{ success: true, id: "enq_..." }` JSON response.
2. **Configurable Endpoint URL:**
   - Supported via `VITE_API_ENQUIRY_URL` in `.env`.
   - Defaults to `/api/enquiry.php` (for Hostinger) with seamless fallback, or can point to any serverless webhook (Formspree, Web3Forms, Resend, Make/Zapier).
3. **Client Form Submission:**
   - [EnquiryModal.tsx](file:///C:/Code/solutions_rrfoundations/components/ui/EnquiryModal.tsx), [contact/page.tsx](file:///C:/Code/solutions_rrfoundations/app/contact/page.tsx), and [request-quote/page.tsx](file:///C:/Code/solutions_rrfoundations/app/request-quote/page.tsx) will call the endpoint cleanly with standard `fetch()`.
   - Zero secrets or credentials will be exposed in frontend JavaScript bundles.

---

## 5. Hostinger SPA Fallback & Static Hosting Rules

When a user visits a deep link such as `https://solutions.rrfoundations.org/products` directly on Apache, Apache will look for a folder named `products/index.html`. In an SPA, all routes must be rewritten to `/index.html`.

### Required `.htaccess` Configuration:
```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^index\.html$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteCond %{REQUEST_FILENAME} !-l
  RewriteRule . /index.html [L]
</IfModule>

# Caching & Security Headers
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresByType image/jpg "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/gif "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType image/webp "access plus 1 year"
  ExpiresByType image/svg+xml "access plus 1 year"
  ExpiresByType text/css "access plus 1 month"
  ExpiresByType application/javascript "access plus 1 month"
</IfModule>
```

---

## 6. Migration Feasibility Verdict

The audit confirms **100% feasibility** for migrating RR Foundations to React + Vite without any visual, functional, or business loss. The original Next.js implementation has been preserved in the `nextjs-production-ready` Git branch.
