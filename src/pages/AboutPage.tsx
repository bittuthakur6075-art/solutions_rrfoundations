import React from "react";
import AboutPageContent from "@/app/about/page";
import SEO from "@/components/ui/SEO";
import { COMPANY_INFO } from "@/lib/utils";

const breadcrumbSchema = {
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
      name: "About Us",
      item: `${COMPANY_INFO.website}/about`,
    },
  ],
};

export default function AboutPage() {
  return (
    <>
      <SEO
        title="About Us | Factory Heritage & B2B Manufacturing"
        description="Direct manufacturer of precision metal badges, corporate merchandise, and institutional accessories based in New Delhi, India."
        canonical="/about"
        schema={breadcrumbSchema}
      />
      <AboutPageContent />
    </>
  );
}
