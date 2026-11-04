import React from "react";
import ProductsPageContent from "@/app/products/page";
import SEO from "@/components/ui/SEO";
import { COMPANY_INFO } from "@/lib/utils";

const productPageSchema = [
  {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: [
      {
        "@type": "ListItem",
        position: 1,
        name: "Home",
        item: COMPANY_INFO.website,
      },
      {
        "@type": "ListItem",
        position: 2,
        name: "Product Catalogue",
        item: `${COMPANY_INFO.website}/products`,
      },
    ],
  },
  {
    "@context": "https://schema.org",
    "@type": "CollectionPage",
    name: "RR Foundations B2B Product Catalogue",
    description: "Full catalogue of verified in-house manufactured physical products and custom promotional items.",
    url: `${COMPANY_INFO.website}/products`,
    provider: {
      "@type": "Organization",
      name: COMPANY_INFO.name,
      telephone: COMPANY_INFO.phone,
      email: COMPANY_INFO.email,
      address: COMPANY_INFO.address,
    },
  },
];

export default function ProductsPage() {
  return (
    <>
      <SEO
        title="Product Catalogue | Verified Factory Inventory"
        description="Explore 260+ physical products manufactured in New Delhi: precision metal badges, conference ID card kits, custom acrylic & MDF products, corporate drinkware, and writing instruments."
        canonical="/products"
        schema={productPageSchema}
      />
      <ProductsPageContent />
    </>
  );
}
