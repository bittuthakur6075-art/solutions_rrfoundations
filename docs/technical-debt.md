# RR Foundations — Technical Debt & Architectural Roadmap

**Report Date:** November 4, 2026  
**Status:** Monitored & Documented  
**Auditor:** Senior Software Architect

---

## 1. Overview

While the code cleanup addressed high-priority structural issues (missing ESLint, unused components/imports, unmemoized large arrays, loose typing, and the admin 404), certain architectural items represent future opportunities that fall outside the non-breaking directive or require external infrastructure (e.g. database migrations, CDN setup).

This document serves as an engineering backlog to track these items responsibly.

---

## 2. Technical Debt Inventory

### 2.1 Storage Layer: File-Based JSON vs. Database (Severity: Medium)
- **Current State:** `app/api/enquiry/route.ts` records incoming RFQs to a local JSON file (`docs/enquiry_submissions.json`) using synchronous `fs.readFileSync` and `fs.writeFileSync`.
- **Limitation:** In serverless deployments (such as Vercel or AWS Lambda), local filesystem writes are ephemeral and will reset upon cold starts or container recycling. Concurrent write contention could also cause race conditions under high traffic.
- **Recommended Future Evolution:**
  - Transition persistence to an external managed database (e.g., PostgreSQL with Prisma/Drizzle, Supabase, or MongoDB).
  - Add transactional webhooks or direct notification dispatch (e.g., email notification via Resend/SendGrid and WhatsApp webhook via Twilio) when a B2B enquiry is submitted.

### 2.2 Admin Authentication (Severity: Medium)
- **Current State:** `/admin` provides operational metrics and inquiry lists without authentication gates (as specified in current client prototype phase).
- **Recommended Future Evolution:**
  - Introduce NextAuth.js or Iron Session with role-based access control (RBAC).
  - Restrict the `/admin` route and `/api/enquiry` GET method to verified factory staff sessions.

### 2.3 Product Data File Size & Pagination (Severity: Low-Medium)
- **Current State:** `lib/data/products.ts` contains all product metadata (~425 KB) loaded as a static in-memory array.
- **Impact:** While fast for static generation and instant client-side filtering, as the catalog scales past 500+ items, the client-side JavaScript chunk size will grow.
- **Recommended Future Evolution:**
  - Introduce server-side pagination with search parameters (`/products?page=1&limit=24`).
  - Move full product descriptions and high-resolution specifications into an API database, serving only lightweight summary objects on the grid view.

### 2.4 Test Suite Infrastructure (Severity: Low)
- **Current State:** The repository does not include unit or end-to-end testing frameworks (Jest, Vitest, Playwright, or Cypress). Quality verification relies on TypeScript strict compilation, ESLint, production Next.js build validation, and headless browser visual regression checks.
- **Recommended Future Evolution:**
  - Set up Vitest for testing data models, validation schemas, and utility functions.
  - Set up Playwright for automated continuous integration smoke tests on forms, navigation, and visual regression.

---

## 3. Maintenance Matrix

| Item | Impact | Complexity | Priority | Action Trigger |
|---|---|---|---|---|
| PostgreSQL / Supabase Integration | High | Moderate | Phase 2 | When deploying to read-only serverless hosting |
| Admin Session Authentication | High | Low | Phase 2 | Prior to public domain domain launch |
| Automated E2E CI Pipeline | Medium | Moderate | Phase 3 | When multiple developers contribute concurrently |
| Product Server-Side Pagination | Low | Low | Phase 3 | When catalogue exceeds 500 SKUs |
