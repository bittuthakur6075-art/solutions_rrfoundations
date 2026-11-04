import type { Metadata } from "next";
import { COMPANY_INFO } from "@/lib/utils";

export const metadata: Metadata = {
  title: "Request a Bulk Quote | Custom B2B Manufacturing RFQ",
  description:
    "Submit custom product specifications and request direct factory pricing for precision metal badges, conference ID kits, acrylic awards, and corporate gifting.",
  alternates: {
    canonical: "/request-quote",
  },
  openGraph: {
    title: "Request a Bulk Quote | RR Foundations Manufacturing",
    description: "Direct factory pricing and custom prototype fabrication for B2B procurement.",
    url: `${COMPANY_INFO.website}/request-quote`,
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
      "name": "Request a Quote",
      "item": `${COMPANY_INFO.website}/request-quote`,
    },
  ],
};

export default function RequestQuoteLayout({
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
      {children}
    </>
  );
}
