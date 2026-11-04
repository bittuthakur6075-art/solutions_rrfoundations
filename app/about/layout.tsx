import type { Metadata } from "next";
import { COMPANY_INFO } from "@/lib/utils";

export const metadata: Metadata = {
  title: "About Us | Factory Heritage & B2B Manufacturing",
  description:
    "Direct manufacturer of precision metal badges, corporate merchandise, and institutional accessories based in New Delhi, India.",
  alternates: {
    canonical: "/about",
  },
  openGraph: {
    title: "About RR Foundations | Direct Physical Manufacturer",
    description:
      "Direct manufacturer of precision metal badges, corporate merchandise, and institutional accessories based in New Delhi, India.",
    url: `${COMPANY_INFO.website}/about`,
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
      "name": "About Us",
      "item": `${COMPANY_INFO.website}/about`,
    },
  ],
};

export default function AboutLayout({
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
