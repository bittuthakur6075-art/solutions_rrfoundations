import type { Metadata } from "next";
import { COMPANY_INFO } from "@/lib/utils";

export const metadata: Metadata = {
  title: "Product Catalogue | Verified Factory Inventory",
  description:
    "Explore 260+ physical products manufactured in New Delhi: precision metal badges, conference ID card kits, custom acrylic & MDF products, corporate drinkware, and writing instruments.",
  alternates: {
    canonical: "/products",
  },
  openGraph: {
    title: "Product Catalogue | RR Foundations Manufacturing",
    description:
      "Direct factory supply of precision metal badges, lanyards, clocks, acrylic craft, and executive corporate gifts.",
    url: `${COMPANY_INFO.website}/products`,
    images: [
      {
        url: "/assets/hero_composition.jpg",
        width: 1200,
        height: 630,
        alt: "RR Foundations Verified Product Catalogue",
      },
    ],
  },
};

const breadcrumbSchema = {
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": COMPANY_INFO.website,
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Product Catalogue",
      "item": `${COMPANY_INFO.website}/products`,
    },
  ],
};

const collectionSchema = {
  "@context": "https://schema.org",
  "@type": "CollectionPage",
  "name": "RR Foundations B2B Product Catalogue",
  "description": "Full catalogue of verified in-house manufactured physical products and custom promotional items.",
  "url": `${COMPANY_INFO.website}/products`,
  "provider": {
    "@type": "Organization",
    "name": COMPANY_INFO.name,
    "telephone": COMPANY_INFO.phone,
    "email": COMPANY_INFO.email,
    "address": COMPANY_INFO.address,
  },
};

export default function ProductsLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionSchema) }}
      />
      {children}
    </>
  );
}
