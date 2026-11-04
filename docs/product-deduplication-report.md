# RR Foundations — Product Catalogue Deduplication & Cleanup Report

**Document Version:** 1.0.0  
**Date of Audit & Execution:** 2026-11-04  
**Author:** Senior E-commerce Data Architect & Product Catalogue Manager  
**Status:** Audit Complete, Verified Cleanup Executed, Production Build Validated  

---

## 1. Executive Summary

This report documents the exhaustive audit, deduplication, and catalogue restructuring conducted across the complete RR Foundations product database. 

The primary objective was to eliminate confirmed duplicate records, duplicate imagery, redundant category assignments, and repeated homepage featured products while rigorously preserving distinct product variants (different dimensions, materials, colorways, finishes, and models), existing SEO authority, and customer enquiry routing.

### Key Metrics Summary Table

| Metric | Count | Details & Notes |
| :--- | :--- | :--- |
| **Total Products Before Cleanup** | **268** | Initial baseline product records across 8 factory categories |
| **Confirmed Duplicate Groups** | **4** | Identical image byte-level MD5 hashes & specs |
| **Products Merged / Aliased** | **5** | Merged aliases into primary canonical records |
| **Products Archived** | **5** | Preserved in `lib/data/archived-products.ts` & backup store |
| **Products Retained as Variants** | **263** | Unique materials, dimensions, finishes, and models |
| **Products Requiring Manual Review** | **0** | All 4 duplicate groups verified with zero ambiguities |
| **Total Unique Products After Cleanup** | **263** | Canonical catalogue active on storefront & admin |

---

## 2. Audit Methodology & Discovery Pipeline

The catalogue audit inspected all 268 catalogue records across the following vectors:

1. **Exact Media Hash Inspection (MD5 Verification):**
   - Each asset in `public/assets/products/` was fingerprinted using MD5 checksums.
   - Identified 4 clusters of bit-for-bit identical media files resulting from WhatsApp image re-downloads (`(1)`, `(2)`) and duplicate source scans (`2.jpeg`, `3.jpeg`, `4.jpeg`).
2. **Perceptual Image Analysis (Visual Hash):**
   - Executed perceptual image hashing via `sharp` to detect re-compressed or resized copies across the collection. Verified that pen models and badge models are distinct items with different barrel finishes, clips, and silhouettes.
3. **Specification & Description Comparison:**
   - Evaluated specification structures, materials composition, and category mappings.
4. **Featured Product Surface Audit:**
   - Audited the homepage `FeaturedProducts` showcase. Discovered that the duplicated frame (`FR-02`) and duplicated badge pin (`BD-02`) were both actively featured on the public homepage next to their identical counterparts.

---

## 3. Confirmed Duplicate Groups & Canonical Resolutions

### Group 1: Traditional Divine & Corporate Photo Frame (Model FR-01)
- **Category:** `photo-frames-awards` (Photo Frames & Awards)
- **Media Asset Hash:** `ae4bf3fd2dbf2a9e73bd5933275eb0bf` (170,736 bytes)
- **Source Assets:** `2.jpeg`, `3.jpeg`, `4.jpeg`
- **Involved Records:**
  - `prod_photo-frames-awards_01` (FR-01) — Featured: `true` (Canonical)
  - `prod_photo-frames-awards_02` (FR-02) — Featured: `true` (Duplicate)
  - `prod_photo-frames-awards_03` (FR-03) — Featured: `false` (Duplicate)
- **Canonical Product:** `prod_photo-frames-awards_01`
  - Slug: `traditional-divine-corporate-photo-frame-model-fr-01`
  - Image: `/assets/products/frame-001.jpeg`
- **Resolution Action:**
  - Merged aliases `traditional-divine-corporate-photo-frame-model-fr-02` and `traditional-divine-corporate-photo-frame-model-fr-03` into FR-01.
  - Promoted unique product `prod_photo-frames-awards_04` (FR-04) to featured status, restoring diverse featured representation.
  - Archived `prod_photo-frames-awards_02` and `prod_photo-frames-awards_03`.

---

### Group 2: Balaji Embossed Divine Photo Frame (Model FR-08)
- **Category:** `photo-frames-awards` (Photo Frames & Awards)
- **Media Asset Hash:** `f33f2f321d31e5418e1bcec626f9d62b` (76,819 bytes)
- **Source Assets:** `WhatsApp Image 2026-01-07 at 22.17.34 (1).jpeg`, `WhatsApp Image 2026-01-07 at 22.17.34 (2).jpeg`
- **Involved Records:**
  - `prod_photo-frames-awards_08` (FR-08) — Canonical
  - `prod_photo-frames-awards_09` (FR-09) — Duplicate
- **Canonical Product:** `prod_photo-frames-awards_08`
  - Slug: `traditional-divine-corporate-photo-frame-model-fr-08`
  - Image: `/assets/products/frame-008.jpeg`
- **Resolution Action:**
  - Merged alias `traditional-divine-corporate-photo-frame-model-fr-09` into FR-08.
  - Archived `prod_photo-frames-awards_09`.

---

### Group 3: Custom Precision Badge Pin (Model BD-01)
- **Category:** `badges-lapel-pins` (Badges & Lapel Pins)
- **Media Asset Hash:** `4b5cc4606529e56319a40bf0192af7c7` (2,485,056 bytes)
- **Source Assets:** `21.png`, `22.png`
- **Involved Records:**
  - `prod_badges-lapel-pins_01` (BD-01) — Featured: `true` (Canonical)
  - `prod_badges-lapel-pins_02` (BD-02) — Featured: `true` (Duplicate on homepage)
- **Canonical Product:** `prod_badges-lapel-pins_01`
  - Slug: `custom-precision-badge-pin-model-bd-01`
  - Image: `/assets/products/badge-001.png`
- **Resolution Action:**
  - Merged alias `custom-precision-badge-pin-model-bd-02` into BD-01.
  - Promoted unique product `prod_badges-lapel-pins_03` (BD-03) to featured status, preventing duplicate badge cards on the homepage.
  - Archived `prod_badges-lapel-pins_02`.

---

### Group 4: Custom Die-Struck Metal & Acrylic Keychain (Model KC-15)
- **Category:** `keychains-acrylic-crafts` (Keychains & Acrylic Crafts)
- **Media Asset Hash:** `d9bbae3a83086c70075c5033d6ad7995` (100,912 bytes)
- **Source Assets:** `WhatsApp Image 2026-06-03 at 12.27.55 PM (1).jpeg`, `WhatsApp Image 2026-06-03 at 12.27.55 PM.jpeg`
- **Involved Records:**
  - `prod_keychains-acrylic-crafts_15` (KC-15) — Canonical
  - `prod_keychains-acrylic-crafts_17` (KC-17) — Duplicate
- **Canonical Product:** `prod_keychains-acrylic-crafts_15`
  - Slug: `custom-die-struck-metal-acrylic-keychain-model-kc-15`
  - Image: `/assets/products/craft-015.jpeg`
- **Resolution Action:**
  - Merged alias `custom-die-struck-metal-acrylic-keychain-model-kc-17` into KC-15.
  - Archived `prod_keychains-acrylic-crafts_17`.

---

## 4. Variant Preservation Policy & Retained Models

In strict adherence to catalogue management standards, products sharing common category nomenclature but possessing genuine physical distinctions were **retained as separate products/variants**:

1. **Executive Pens & Writing (50 Unique SKUs):**
   - Models `PN-01` through `PN-50` exhibit distinct barrel finishes (matte black, brushed gunmetal, mirror chrome, rose gold), clip silhouettes, twist vs. click deployment mechanisms, and stylus tips. All 50 are retained.
2. **Designer Wall Clocks (60 Unique SKUs):**
   - Models `WC-01` through `WC-60` exhibit unique laser-cut geometric MDF patterns, exposed gear mechanisms, dial diameters (12", 16", 20"), and Roman vs. Arabic numeral layouts. All 60 are retained.
3. **Custom Fridge Magnets & Souvenirs (42 Unique SKUs):**
   - Models `MG-01` through `MG-42` have distinct contour die-cut shapes, regional souvenir artwork, and acrylic vs. molded rubber substrates. All 42 are retained.
4. **Exam Boards & Desk Stationery (21 Unique SKUs):**
   - Models `EB-01` through `EB-21` feature distinct substrates (high-impact clear acrylic vs. waterproof printed MDF), corner radiuses, and spring clip tension ratings. All 21 are retained.
5. **Lanyards & Identification (12 Unique SKUs):**
   - Models `LN-01` through `LN-12` feature distinct ribbon widths (16mm, 20mm, 25mm), safety breakaway mechanisms, swivel lobster clasps, and acrylic vs. PVC credential badges. All 12 are retained.
6. **Keychains & Acrylic Crafts (16 Unique SKUs):**
   - Models `KC-01` through `KC-14`, `KC-16` feature distinct metal stamping, silicone wristlets, and edge-polished acrylic geometries. All 16 are retained.
7. **Badges & Lapel Pins (45 Unique SKUs):**
   - Models `BD-01`, `BD-03` through `BD-46` feature distinct metal plating (antique copper, brass, stainless steel), magnetic bar vs. butterfly clutch vs. safety pin fasteners, and patriotic/institutional themes. All 45 are retained.
8. **Photo Frames & Awards (17 Unique SKUs):**
   - Models `FR-01`, `FR-04` through `FR-07`, `FR-08`, `FR-10` through `FR-20` feature distinct gold foil embossing, teak/gold frame profiles, and desktop easel vs. wall hook mountings. All 17 are retained.

---

## 5. Category Taxonomy & Post-Cleanup SKU Breakdown

| Category ID | Category Name | Before Cleanup | Archived Duplicates | Active Unique SKUs |
| :--- | :--- | :---: | :---: | :---: |
| `designer-wall-clocks` | Designer Wall Clocks | 60 | 0 | **60** |
| `executive-pens` | Executive Pens & Writing | 50 | 0 | **50** |
| `badges-lapel-pins` | Badges & Lapel Pins | 46 | 1 (`BD-02`) | **45** |
| `magnets-souvenirs` | Custom Fridge Magnets & Souvenirs | 42 | 0 | **42** |
| `examboards-stationery` | Exam Boards & Desk Stationery | 21 | 0 | **21** |
| `photo-frames-awards` | Photo Frames & Awards | 20 | 3 (`FR-02`, `FR-03`, `FR-09`) | **17** |
| `keychains-acrylic-crafts` | Keychains & Acrylic Crafts | 17 | 1 (`KC-17`) | **16** |
| `lanyards-credentials` | Lanyards & Identification | 12 | 0 | **12** |
| **TOTAL** | | **268** | **5** | **263** |

---

## 6. Website Functionality, SEO & Route Preservation

To guarantee that no customer links, bookmarks, search engine citations, or external RFQ references break:

1. **Server-Level 301 Permanent Redirects (`next.config.mjs`):**
   Configured permanent redirects from archived product URLs directly to the canonical product hash anchor:
   - `/products/traditional-divine-corporate-photo-frame-model-fr-02` ➔ `/products#traditional-divine-corporate-photo-frame-model-fr-01`
   - `/products/traditional-divine-corporate-photo-frame-model-fr-03` ➔ `/products#traditional-divine-corporate-photo-frame-model-fr-01`
   - `/products/traditional-divine-corporate-photo-frame-model-fr-09` ➔ `/products#traditional-divine-corporate-photo-frame-model-fr-08`
   - `/products/custom-precision-badge-pin-model-bd-02` ➔ `/products#custom-precision-badge-pin-model-bd-01`
   - `/products/custom-die-struck-metal-acrylic-keychain-model-kc-17` ➔ `/products#custom-die-struck-metal-acrylic-keychain-model-kc-15`
   - Legacy Hostinger store slugs (`copper-badge-pin-circular-with-clasp`, `customized-metal-name-badges`, etc.) redirect cleanly to the respective canonical product categories.
2. **In-Page Anchor Aliasing (`app/products/page.tsx`):**
   - Canonical product cards maintain hidden anchor tags for all archived alias slugs. When an incoming visitor arrives with `#traditional-divine-corporate-photo-frame-model-fr-02`, the browser smoothly navigates directly to the canonical FR-01 card.
3. **Search & Filter Enhancement:**
   - Client search in `app/products/page.tsx` recognizes both canonical and alias names/slugs, ensuring customers searching for legacy model numbers find the canonical product.
4. **Homepage Featured Products Curation:**
   - The featured products section dynamically showcases 16 completely distinct products (2 per category) with zero duplicate images or redundant titles.
5. **Admin Operations Portal (`/admin`):**
   - The Catalogue Management tab and Operations Overview dynamically update to reflect the verified 263 active SKUs across all 8 verified categories with synchronized SKU metrics.
6. **Sitemap Synchronization (`app/sitemap.ts`):**
   - The dynamic XML sitemap automatically generates clean canonical URLs for all 263 verified products without duplicate or archived paths.

---

## 7. Data Safety & Backup Verification

Before executing any data changes, full safety snapshots were persisted:
- **Pre-Cleanup Catalogue Snapshot:** `lib/data/backup/products.before-cleanup.ts`
- **Pre-Cleanup Category Snapshot:** `lib/data/backup/categories.before-cleanup.ts`
- **Pre-Cleanup Asset Manifest Snapshot:** `lib/data/backup/products_manifest.before-cleanup.json`
- **Timestamped Documentation Archive:** `docs/backups/products-backup-*.ts`
- **Archived Products Registry:** `lib/data/archived-products.ts` (records full metadata, audit reason, and canonical pointers)
- **Asset Preservation:** No original image files were deleted from `public/assets/products/`, ensuring zero asset link breakage.

---

## 8. Verification & Test Suite Results

1. **Automated Catalogue Integrity Test:**
   - 0 duplicate image hashes.
   - 0 duplicate slugs.
   - 0 duplicate product IDs.
   - Exact category count synchronization across all 8 categories.
2. **TypeScript & Compilation Verification:**
   - Type definitions extended with optional backwards-compatible `aliases?: string[]` and `archivedDuplicateIds?: string[]`.
   - Clean production build verified via Next.js compiler.
