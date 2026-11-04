# RR FOUNDATIONS

# Complete Website Redesign & Development PRD

**Document type:** Product Requirements Document (PRD), UI/UX
specification and development brief\
**Version:** 1.0\
**Date:** 03 November 2026\
**Brand:** RR Foundations\
**Existing website:** https://solutions.rrfoundations.org/\
**Business objective:** Product showcase + B2B bulk enquiries\
**Recommended stack:** Next.js, React, TypeScript, Tailwind CSS, Sanity
CMS\
**Implementation environment:** Google Antigravity

------------------------------------------------------------------------

## 1. Project overview

### 1.1 Vision

Redesign and rebuild the RR Foundations website as a premium, modern
manufacturing and product showcase platform. The website must
communicate the company's verified products, capabilities and business
offering, while making it easy for prospective customers to discover
products and submit bulk or custom-manufacturing enquiries.

This is a complete website transformation, not a simple theme
replacement.

### 1.2 Business goals

-   Present the complete, verified product range in a well-organised
    catalogue.
-   Establish a credible and professional manufacturing brand.
-   Showcase products through high-quality photography.
-   Attract corporate buyers, procurement teams, institutions,
    distributors and other relevant buyers.
-   Generate qualified product and bulk enquiries.
-   Explain verified manufacturing capabilities and processes.
-   Allow authorised staff to manage products and website content
    without code changes.
-   Improve search visibility, accessibility, mobile usability and
    performance.

### 1.3 Primary audiences

-   Corporate procurement, HR and administration teams.
-   Marketing and promotional merchandise buyers.
-   Educational institutions.
-   Distributors, wholesalers and resellers.
-   Event and hospitality businesses where relevant.
-   Retail and business owners.
-   Customers seeking customised or bulk-manufactured products.

### 1.4 Positioning

Present RR Foundations as a professional manufacturing and product
solutions business. Use factual, concise copy. Do not invent founding
dates, certifications, client names, production capacity, factory size,
testimonials, prices, minimum order quantities or manufacturing
capabilities.

### 1.5 Success measures

Instrument the website to measure:

-   Product and category page visits.
-   Product search and filter usage.
-   Product enquiry CTA clicks.
-   Quote form starts and successful submissions.
-   WhatsApp enquiry clicks.
-   Catalogue downloads, if a verified catalogue is published.
-   Mobile and desktop conversion performance.
-   Organic search landing-page performance.

Set numeric targets only after baseline analytics and business
priorities are agreed.

------------------------------------------------------------------------

## 2. Discovery and existing-site audit

Before implementation:

1.  Inspect the existing website and all accessible pages.
2.  Inspect the repository, framework, dependencies and deployment
    configuration.
3.  Review the existing logo, brand assets, product data and supplied
    documents.
4.  Inventory existing URLs and identify pages that need redirects.
5.  Review navigation, page hierarchy, forms, content, imagery and
    responsive behaviour.
6.  Identify missing or unverified business information.
7.  Record technical risks and integration dependencies.

Create and maintain:

-   `docs/website-audit.md`
-   `docs/sitemap.md`
-   `docs/product-catalogue.md`
-   `docs/design-system.md`
-   `docs/technical-architecture.md`
-   `docs/content-and-assets-checklist.md`
-   `docs/implementation-plan.md`

If the existing site cannot be accessed, state that limitation and
continue using the repository and supplied assets. Do not claim to have
audited pages that were not accessible.

------------------------------------------------------------------------

## 3. Brand and creative direction

### 3.1 Selected direction

**Forest Editorial Luxury + Modern Industrial Minimalism**

The visual language should combine:

-   Premium editorial composition.
-   Contemporary industrial character.
-   Minimal, image-led product presentation.
-   Strong typography and clear hierarchy.
-   Generous whitespace.
-   Real product and manufacturing photography.
-   Restrained motion and refined interactions.
-   Clear, conversion-focused user journeys.

Use references for quality and interaction patterns, not as templates to
copy:

-   https://stripe.com/
-   https://vercel.com/
-   https://linear.app/
-   https://www.moo.com/
-   https://www.vistaprint.in/

The final design must be original to RR Foundations.

### 3.2 Initial colour tokens

These are proposed website tokens. Check the actual company logo and
brand assets before final sign-off.

  -----------------------------------------------------------------------
  Token                   Hex                     Usage
  ----------------------- ----------------------- -----------------------
  Primary forest          `#172B27`               Brand surfaces, primary
                                                  CTA, dark sections

  Secondary green         `#304B43`               Secondary surfaces and
                                                  accents

  Champagne accent        `#D5B783`               Small highlights and
                                                  editorial accents

  Main canvas             `#F8F5EF`               Warm page background

  White surface           `#FFFFFF`               Cards and product
                                                  surfaces

  Primary text            `#202824`               Headings and body text

  Secondary text          `#747D76`               Supporting text and
                                                  metadata

  Border                  `#E7E8E2`               Dividers and component
                                                  borders

  Success                 `#287A52`               Success feedback

  Warning                 `#B88632`               Warning feedback

  Danger                  `#C74B45`               Error feedback
  -----------------------------------------------------------------------

Guidance: use warm ivory and white as the main surfaces, forest green
for brand emphasis and champagne sparingly. Maintain accessible
contrast. Do not use gold for long text.

### 3.3 Typography

-   **Manrope:** headings, navigation, buttons, product titles and UI
    labels.
-   **Inter:** paragraphs, descriptions, forms, specifications and
    metadata.
-   **DM Serif Display:** selective editorial highlights only.

Suggested weights:

-   Manrope: 400, 500, 600, 700.
-   Inter: 400, 500, 600.
-   DM Serif Display: 400.

Suggested desktop scale:

  Style                Size
  -------------- ----------
  Hero display     64--76px
  H1               52--60px
  H2               40--48px
  H3               28--32px
  H4               21--24px
  Body large           18px
  Body                 16px
  Body small           14px
  Caption              12px

Use responsive `clamp()` sizing where appropriate. Prevent text overflow
and maintain comfortable line lengths.

### 3.4 Spacing and layout

Use an 8px spacing foundation:

`4, 8, 16, 24, 32, 48, 64, 80, 112px`

Suggested section spacing:

-   Desktop: 88--120px.
-   Tablet: 64--80px.
-   Mobile: 48--64px.

Layout guidance:

-   Maximum content width: approximately 1440px.
-   Typical content width: 1200--1320px.
-   Desktop: 12-column grid.
-   Tablet: 8-column grid.
-   Mobile: 4-column grid.
-   Mobile horizontal padding: 16--20px.

### 3.5 Component styling

-   Buttons: forest green primary, outlined secondary, text-link
    tertiary.
-   Cards: 8--14px radius, subtle border, restrained shadow.
-   Inputs: approximately 48--54px high, visible labels and focus
    states.
-   Icons: Lucide, consistent stroke and sizing.
-   Motion: subtle transitions, image reveals and hover states only
    where useful.
-   Respect `prefers-reduced-motion`.

Avoid excessive gradients, glassmorphism, heavy shadows, decorative
shapes, oversized pill controls and generic SaaS styling.

------------------------------------------------------------------------

## 4. Information architecture and sitemap

### Main navigation

-   Home
-   About Us
-   Products
-   Manufacturing
-   Industries
-   Gallery
-   Contact Us
-   Primary CTA: Request a Quote

Use a clear desktop mega menu for product discovery. Mobile navigation
must be compact, accessible and easy to operate.

### Required routes

  Page                   Suggested route
  ---------------------- -------------------------------
  Home                   `/`
  About Us               `/about`
  All Products           `/products`
  Product Category       `/products/[category]`
  Product Detail         `/products/[category]/[slug]`
  Manufacturing          `/manufacturing`
  Industries             `/industries`
  Gallery                `/gallery`
  Contact                `/contact`
  Request a Quote        `/request-quote`
  Privacy Policy         `/privacy-policy`
  Terms and Conditions   `/terms-and-conditions`

Create additional industry or manufacturing subpages only where there is
sufficient verified content. Avoid thin, duplicate pages.

------------------------------------------------------------------------

## 5. Product catalogue

The product catalogue is a core business requirement. It must support a
growing inventory without requiring code changes for each new product.

### 5.1 Candidate categories for discovery

Investigate the supplied catalogue for products in areas such as:

-   Lanyards and ID accessories.
-   Acrylic keychains.
-   MDF keychains.
-   Metal keychains.
-   Key holders.
-   Acrylic magnets.
-   MDF fridge magnets.
-   Bottles and drinkware.
-   Corporate pens.
-   Exam boards.
-   Writing boards.
-   Corporate gifting.
-   Diaries and stationery.
-   MDF products.
-   Acrylic products.
-   Wooden products.
-   Promotional merchandise.
-   Festival and decorative products.
-   Custom manufactured products.

These are discovery candidates, not a confirmed inventory. Create final
categories only after reviewing actual company catalogue data.

### 5.2 Category fields

Each category should support:

-   Name and slug.
-   Category image.
-   Short and detailed description.
-   SEO title and description.
-   Featured products.
-   Sort order.
-   Draft/published status.

### 5.3 Product fields

Each product should support:

  Field               Type / notes
  ------------------- -----------------------------
  Product ID          Unique identifier
  Name                Required text
  Slug                Unique URL slug
  Category            Reference to category
  Short description   Listing copy
  Full description    Rich text
  Featured image      Main image
  Gallery             Multiple images
  Materials           Verified values
  Sizes               Optional variants
  Colours             Optional variants
  Branding options    Verified options
  Specifications      Structured attributes
  Minimum quantity    Optional, only if confirmed
  Tags                Search and filtering
  Featured            Boolean
  SEO title           Optional override
  SEO description     Optional override
  Status              Draft/published

Do not populate unknown fields with invented values. Support optional
fields gracefully.

### 5.4 Product listing UX

The `/products` page should include:

1.  Breadcrumbs.
2.  Clear page title and introduction.
3.  Product search.
4.  Category navigation.
5.  Filters for available category, material, product type and tags.
6.  Product grid.
7.  Pagination or accessible load-more behaviour.
8.  Bulk enquiry CTA.

Only show filter options that exist in published product data.

Product cards should show:

-   Product image.
-   Product name.
-   Category.
-   Short description.
-   One or two relevant verified attributes.
-   View Product link.
-   Enquire CTA.

Avoid clutter and inconsistent image crops.

### 5.5 Product detail UX

Route: `/products/[category]/[slug]`

Include:

-   Breadcrumbs.
-   Large image gallery.
-   Product title and description.
-   Materials and variants, where known.
-   Specifications, where known.
-   Customisation options, where confirmed.
-   Product-specific enquiry CTA.
-   WhatsApp enquiry option.
-   Related products.

Prefill the selected product in the enquiry flow.

------------------------------------------------------------------------

## 6. Homepage requirements

Build the homepage in this order.

### Section 1: Navigation

Premium sticky header with logo, navigation, product mega menu and
Request a Quote CTA. Use the supplied logo asset; do not redraw or
approximate it.

### Section 2: Hero

Suggested headline:

**"Manufacturing Ideas Into Products That Matter."**

Supporting copy:

"Explore thoughtfully manufactured products, customised solutions and
product possibilities for businesses and institutions."

CTAs:

-   Explore Products.
-   Discuss Your Requirement.

Use authentic product or manufacturing photography, strong composition
and negative space. Ensure text remains readable over imagery.

### Section 3: Company introduction

Suggested heading: **"Built Around Products. Driven by Possibilities."**

Use concise verified company copy and a real company or manufacturing
image.

### Section 4: Product categories

Suggested heading: **"Explore Our Product Range."**

Use image-led category cards linking to category pages.

### Section 5: Featured products

Suggested heading: **"Products Designed to Make an Impression."**

Load actual featured products from the CMS.

### Section 6: Manufacturing capabilities

Suggested heading: **"From Concept to Finished Product."**

Show only confirmed processes, equipment and capabilities. Potential
processes to verify include CNC routing, laser engraving, UV printing,
dye sublimation, assembly and packaging.

### Section 7: Why RR Foundations

Communicate verified business strengths. Do not invent statistics,
certifications or client logos.

### Section 8: Industries served

Show only industries relevant to the actual product range and company
offering.

### Section 9: Custom manufacturing

Suggested heading: **"Have a Unique Requirement? Let's Create It."**

CTA: Request a Quote.

### Section 10: Gallery

Show actual products and completed work.

### Section 11: Final CTA

Suggested heading: **"Let's Turn Your Product Ideas Into Reality."**

CTA: Request a Bulk Quote.

### Section 12: Footer

Include logo, company summary, product links, navigation, verified
contact information, social links and legal pages.

------------------------------------------------------------------------

## 7. Supporting pages

### 7.1 About Us

Route: `/about`

Sections:

-   Hero.
-   Company introduction.
-   Brand story.
-   Business focus.
-   Manufacturing approach.
-   Quality philosophy.
-   Team or facility, if supplied.
-   CTA.

Do not invent founding year, employee count, factory size or milestones.

### 7.2 Manufacturing

Route: `/manufacturing`

Sections:

-   Hero.
-   Manufacturing overview.
-   Verified production processes.
-   Machinery and equipment, if confirmed.
-   Custom manufacturing.
-   Quality control, if documented.
-   Production gallery.
-   Enquiry CTA.

### 7.3 Industries

Route: `/industries`

Create useful industry landing content only for audiences the business
genuinely serves. Do not create empty or duplicate SEO pages.

### 7.4 Gallery

Route: `/gallery`

Features:

-   Product and manufacturing imagery.
-   Category filters where useful.
-   Responsive image grid.
-   Accessible lightbox.
-   Optional project descriptions.

All entries should be manageable through the CMS.

### 7.5 Contact

Route: `/contact`

Include verified address, email, phone, business hours and map only when
supplied and confirmed. Add a contact form and clear enquiry CTA.

------------------------------------------------------------------------

## 8. Enquiry and lead-generation system

### 8.1 Product enquiry

Every product detail page must provide a clear enquiry action. The form
should preselect the product and collect the customer's requirements.

### 8.2 Request a Quote

Route: `/request-quote`

Fields:

-   Full name.
-   Company name.
-   Email address.
-   Phone number.
-   Product or category.
-   Required quantity.
-   Material preference, if applicable.
-   Customisation requirements.
-   Additional message.
-   Optional reference file.

### 8.3 Functional requirements

-   Client-side and server-side validation.
-   Clear required-field indicators.
-   Email and phone validation.
-   File type and size restrictions.
-   Loading, error and success states.
-   Spam protection and rate limiting.
-   Secure persistence or delivery.
-   Accessible confirmation message.

Do not show a success message unless the enquiry has actually been
accepted by the backend.

### 8.4 Enquiry storage

Use a secure backend or database for enquiry records. If PostgreSQL is
selected, define a suitable schema and access controls.

Suggested fields:

-   Enquiry ID.
-   Customer details.
-   Company name.
-   Product/category.
-   Quantity.
-   Requirements.
-   Attachment reference.
-   Submission timestamp.
-   Status.

Suggested statuses:

-   New.
-   Contacted.
-   Quotation Sent.
-   In Discussion.
-   Converted.
-   Closed.

### 8.5 WhatsApp

Use a verified company WhatsApp number from configuration. Prefill a
message with the product name and relevant product URL. Do not invent or
hardcode an unverified number.

------------------------------------------------------------------------

## 9. CMS and admin requirements

### 9.1 Recommended CMS

Use Sanity for content management, subject to account and project
configuration.

### 9.2 Content schemas

Create schemas for:

-   Products.
-   Categories.
-   Product variants.
-   Product images.
-   Manufacturing capabilities.
-   Industries.
-   Gallery projects.
-   Homepage sections.
-   Company information.
-   SEO metadata.

### 9.3 Admin capabilities

Authorised staff must be able to:

-   Create, edit and archive products.
-   Upload and reorder images.
-   Create and manage categories.
-   Update descriptions and specifications.
-   Feature or unfeature products.
-   Publish and unpublish content.
-   Manage gallery entries.
-   Update homepage content.
-   Manage SEO metadata.

Connect the admin interface to the real CMS. Do not create a static mock
admin panel and describe it as functional.

Use role-based access where needed.

------------------------------------------------------------------------

## 10. Technical architecture

### 10.1 Preferred stack

-   Next.js with App Router.
-   React.
-   TypeScript.
-   Tailwind CSS.
-   Sanity CMS.
-   React Hook Form.
-   Zod.
-   Lucide icons.
-   Next.js Image.
-   Vercel deployment.
-   PostgreSQL only if required for enquiry persistence or additional
    application data.

Use the existing repository's stable stack if it already meets the
requirements. Inspect before replacing frameworks or backends. Do not
add unnecessary dependencies.

### 10.2 Architecture principles

-   Component-driven architecture.
-   Strong TypeScript types.
-   Reusable layouts and UI components.
-   Centralised design tokens.
-   Separation of presentation and business logic.
-   CMS-driven product pages.
-   Server-side validation.
-   Secure environment configuration.
-   Maintainable and documented data access.

### 10.3 Suggested folder structure

``` text
rr-foundations/
├── app/
│   ├── page.tsx
│   ├── about/
│   ├── products/
│   │   ├── page.tsx
│   │   └── [category]/
│   │       └── [slug]/
│   ├── manufacturing/
│   ├── industries/
│   ├── gallery/
│   ├── contact/
│   ├── request-quote/
│   ├── privacy-policy/
│   ├── terms-and-conditions/
│   ├── sitemap.ts
│   ├── robots.ts
│   └── layout.tsx
├── components/
│   ├── layout/
│   ├── navigation/
│   ├── homepage/
│   ├── products/
│   ├── manufacturing/
│   ├── gallery/
│   ├── forms/
│   └── shared/
├── sanity/
│   ├── schemas/
│   ├── queries/
│   └── lib/
├── lib/
│   ├── validation/
│   ├── utilities/
│   ├── seo/
│   └── database/
├── public/
│   ├── images/
│   ├── logos/
│   └── icons/
├── styles/
├── types/
├── docs/
└── README.md
```

Adapt the structure to the existing project where appropriate.

------------------------------------------------------------------------

## 11. Responsive design

Design and test at these viewport widths:

  Device            Width
  ----------------- --------------
  Small mobile      320--374px
  Standard mobile   375--430px
  Large mobile      431--767px
  Tablet            768--1023px
  Laptop            1024--1439px
  Desktop           1440--1919px
  Large desktop     1920px+

Requirements:

-   Responsive navigation and menus.
-   Appropriate product grid columns.
-   Fluid typography.
-   Correct image crops.
-   No horizontal overflow.
-   Touch-friendly controls.
-   Responsive forms.
-   Consistent spacing.

Mobile must be intentionally designed, not merely compressed desktop UI.

------------------------------------------------------------------------

## 12. Image and photography guidelines

Use actual RR Foundations product photographs wherever possible.

Visual treatment:

-   Clean studio product photography.
-   Accurate product proportions and branding.
-   Natural material textures.
-   Soft directional lighting.
-   Premium but realistic colour grading.
-   Neutral backgrounds where suitable.
-   Natural shadows.
-   Consistent presentation.

Suggested ratios:

-   Hero: 16:9 or wide editorial crop.
-   Product card: 4:5 or 1:1.
-   Product gallery: 4:5.
-   Category card: 4:5.
-   Gallery: 1:1, 4:5 or 3:2 depending on the image.

Do not alter product designs, logos or printed text. Do not fabricate
product images that could be mistaken for actual inventory. Use clearly
labelled placeholders until real images are provided. Optimise image
formats and provide meaningful alt text.

------------------------------------------------------------------------

## 13. SEO requirements

Implement:

-   Unique page titles and meta descriptions.
-   Canonical URLs.
-   Descriptive product slugs.
-   Semantic heading hierarchy.
-   Image alt text.
-   XML sitemap.
-   Robots.txt.
-   Open Graph metadata.
-   Social sharing images.
-   Internal linking.
-   Breadcrumbs.
-   Organisation structured data.
-   Product structured data where applicable.

Generate metadata dynamically for products and categories. Avoid
duplicate metadata. Preserve important existing URLs with appropriate
redirects after auditing the old site.

------------------------------------------------------------------------

## 14. Performance and accessibility

### Performance

-   Optimise image delivery.
-   Use responsive image sizes.
-   Minimise layout shifts.
-   Avoid unnecessary JavaScript.
-   Server-render content where appropriate.
-   Lazy-load below-the-fold imagery.
-   Optimise font loading.
-   Monitor Core Web Vitals.

### Accessibility

Follow WCAG 2.2 AA principles where practical:

-   Keyboard navigation.
-   Visible focus states.
-   Semantic HTML.
-   Proper form labels.
-   Accessible menus and dialogs.
-   Sufficient colour contrast.
-   Useful image alt text.
-   Reduced-motion support.

------------------------------------------------------------------------

## 15. Content integrity and assumptions

The supplied company catalogue, logo, product photographs and verified
company information are the source of truth.

Until assets are supplied:

-   Do not invent products or categories as confirmed inventory.
-   Do not invent prices, dimensions, materials or minimum quantities.
-   Do not invent manufacturing capabilities.
-   Do not invent certifications, testimonials or client names.
-   Do not invent company statistics or contact details.
-   Use clearly labelled placeholders.
-   Record missing information in
    `docs/content-and-assets-checklist.md`.

If a feature depends on credentials or third-party configuration,
implement the parts that can be completed, document the dependency and
do not claim the integration is live until tested.

------------------------------------------------------------------------

## 16. Development phases and deliverables

### Phase 1 --- Discovery

-   Inspect repository and existing website.
-   Review assets and product information.
-   Audit current URLs and content.
-   Document risks and unknowns.

**Deliverables:** audit, sitemap, product taxonomy and implementation
plan.

### Phase 2 --- Design system

-   Implement colour and typography tokens.
-   Define spacing and grid.
-   Build buttons, navigation, cards and forms.
-   Establish reusable components.

**Deliverable:** implemented design system and component library.

### Phase 3 --- Homepage

-   Build all homepage sections.
-   Connect available content.
-   Implement responsive layouts.
-   Test actual rendering on desktop and mobile.

**Deliverable:** complete responsive homepage.

### Phase 4 --- Product catalogue

-   Product and category data models.
-   Listing and category pages.
-   Search and filters.
-   Product detail templates.
-   Related products.

**Deliverable:** functional product catalogue.

### Phase 5 --- Corporate pages

-   About.
-   Manufacturing.
-   Industries.
-   Gallery.
-   Contact.

**Deliverable:** complete supporting pages.

### Phase 6 --- CMS

-   Configure Sanity.
-   Create schemas.
-   Connect product and category queries.
-   Enable content and image management.
-   Add SEO fields.

**Deliverable:** working CMS.

### Phase 7 --- Enquiry system

-   Product enquiries.
-   Quote request.
-   Validation.
-   Secure persistence or delivery.
-   Notifications.
-   WhatsApp integration.

**Deliverable:** tested lead-generation workflow.

### Phase 8 --- Quality assurance

-   Responsive and browser testing.
-   Route and link testing.
-   Form testing.
-   Accessibility checks.
-   SEO validation.
-   Performance and security review.

**Deliverable:** QA report and resolved critical issues.

### Phase 9 --- Deployment

-   Configure production environment.
-   Set environment variables securely.
-   Configure domain and SSL.
-   Configure analytics where approved.
-   Deploy and verify production.
-   Document maintenance and deployment.

**Deliverable:** production deployment and handover documentation.

------------------------------------------------------------------------

## 17. Quality assurance checklist

### Design

-   [ ] Approved colour tokens implemented.
-   [ ] Typography is consistent.
-   [ ] Spacing and grid are consistent.
-   [ ] Product imagery is correctly presented.
-   [ ] No broken or overflowing layouts.
-   [ ] Visual quality is consistent across pages.

### Navigation

-   [ ] All navigation links work.
-   [ ] Mega menu works.
-   [ ] Mobile menu works.
-   [ ] Breadcrumbs work.

### Products

-   [ ] Products load dynamically.
-   [ ] Categories work.
-   [ ] Search works.
-   [ ] Filters work.
-   [ ] Product images load.
-   [ ] Related products work.

### Enquiries

-   [ ] Forms validate.
-   [ ] Server-side validation works.
-   [ ] Product is preselected where appropriate.
-   [ ] Enquiries are persisted or delivered.
-   [ ] Notifications work when configured.
-   [ ] WhatsApp links use the verified number.

### Technical

-   [ ] No TypeScript errors.
-   [ ] Production build succeeds.
-   [ ] No critical console errors.
-   [ ] No broken links.
-   [ ] No horizontal overflow.
-   [ ] Metadata is present.
-   [ ] Sitemap and robots files work.
-   [ ] Responsive testing is complete.

### Security

-   [ ] API keys are not exposed.
-   [ ] Server-side validation is active.
-   [ ] File uploads are restricted.
-   [ ] Admin access is protected.
-   [ ] Database credentials are secure.

------------------------------------------------------------------------

## 18. Acceptance criteria

The project is ready for handover only when:

1.  The website has been redesigned according to the approved design
    system.
2.  Homepage and all agreed supporting pages are implemented.
3.  Product categories and product detail pages work dynamically.
4.  Product catalogue content is CMS-driven.
5.  Authorised staff can manage products and content.
6.  Enquiry functionality works end-to-end.
7.  WhatsApp integration works with verified business details.
8.  SEO foundations are implemented.
9.  Responsive layouts are tested.
10. Performance, accessibility and security checks are completed.
11. No fabricated company or product claims remain.
12. Deployment and maintenance documentation is provided.

A static visual mockup is not a completed project. A functional website
with generic, unrefined UI is also not acceptable. Design quality and
functional completeness are both mandatory.

------------------------------------------------------------------------

## 19. Antigravity master execution instructions

You are authorised to inspect, plan, design, implement, test and refine
this project.

Follow this sequence:

1.  Inspect the existing repository, website and available assets.
2.  Document the current state and unknowns.
3.  Create the design system before building all pages.
4.  Build the homepage as the first major visual deliverable.
5.  Run the site and inspect actual rendered desktop and mobile layouts.
6.  Refine typography, spacing, imagery and composition.
7.  Continue with catalogue and supporting pages.
8.  Connect the real CMS and enquiry workflow.
9.  Test all important interactions and routes.
10. Prepare deployment and handover documentation.

Do not stop after writing a plan or generating a static prototype.
Continue through implementation phase by phase.

Do not overwrite working code without understanding it. Do not fabricate
credentials or business information. When assets or credentials are
missing, continue with clearly labelled placeholders and document what
is needed.

**Final instruction:** Build an internationally competitive, premium
manufacturing website for RR Foundations. Prioritise visual quality,
product discovery, content accuracy, usability, scalability, performance
and production readiness equally.

**Begin with Phase 1: Discovery and Project Audit. Then execute the
remaining phases systematically.**
