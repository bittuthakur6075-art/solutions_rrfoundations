import React from "react";
import TermsContent from "@/app/terms-and-conditions/page";
import SEO from "@/components/ui/SEO";

export default function TermsPage() {
  return (
    <>
      <SEO
        title="Terms and Conditions"
        description="Commercial and manufacturing terms and conditions for RR Foundations."
        canonical="/terms-and-conditions"
      />
      <TermsContent />
    </>
  );
}
