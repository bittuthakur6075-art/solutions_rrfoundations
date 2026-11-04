import React from "react";
import RequestQuotePageContent from "@/app/request-quote/page";
import SEO from "@/components/ui/SEO";
import { COMPANY_INFO } from "@/lib/utils";

const quoteSchema = {
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
      name: "Request a Quote",
      item: `${COMPANY_INFO.website}/request-quote`,
    },
  ],
};

export default function RequestQuotePage() {
  return (
    <>
      <SEO
        title="Request a Bulk Quote | Custom B2B Manufacturing RFQ"
        description="Submit custom product specifications and request direct factory pricing for precision metal badges, conference ID kits, acrylic awards, and corporate gifting."
        canonical="/request-quote"
        schema={quoteSchema}
      />
      <RequestQuotePageContent />
    </>
  );
}
