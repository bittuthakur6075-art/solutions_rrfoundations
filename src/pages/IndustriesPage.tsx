import React from "react";
import IndustriesPageContent from "@/app/industries/page";
import SEO from "@/components/ui/SEO";

export default function IndustriesPage() {
  return (
    <>
      <SEO
        title="Industries We Serve"
        description="Products that fit your industry. Solutions that fit your needs. Customised corporate merchandise, institutional accessories, event kits, and bulk manufacturing across 9 key sectors."
        canonical="/industries"
      />
      <IndustriesPageContent />
    </>
  );
}
