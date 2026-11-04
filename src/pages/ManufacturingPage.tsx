import React from "react";
import ManufacturingPageContent from "@/app/manufacturing/page";
import SEO from "@/components/ui/SEO";

export default function ManufacturingPage() {
  return (
    <>
      <SEO
        title="Manufacturing Capabilities"
        description="Cinematic overview of our in-house laser cutting, UV printing, CNC routing, and hydraulic metal die-stamping lines in New Delhi."
        canonical="/manufacturing"
      />
      <ManufacturingPageContent />
    </>
  );
}
