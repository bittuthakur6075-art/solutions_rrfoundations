import React from "react";
import HomePageContent from "@/app/page";
import SEO from "@/components/ui/SEO";
import { COMPANY_INFO } from "@/lib/utils";

const organizationSchema = {
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  name: COMPANY_INFO.name,
  legalName: COMPANY_INFO.legalName,
  url: COMPANY_INFO.website,
  telephone: COMPANY_INFO.phone,
  email: COMPANY_INFO.email,
  address: {
    "@type": "PostalAddress",
    streetAddress: "Shop No. 12, Om Vihar, Opposite Metro Pillar No. 702",
    addressLocality: "New Delhi",
    addressRegion: "Delhi",
    postalCode: "110059",
    addressCountry: "IN",
  },
  geo: {
    "@type": "GeoCoordinates",
    latitude: 28.6219,
    longitude: 77.0583,
  },
  openingHours: "Mo-Fr 09:00-18:00",
  priceRange: "₹₹",
  sameAs: ["https://wa.me/917428045813"],
};

export default function HomePage() {
  return (
    <>
      <SEO
        title="Premium B2B Manufacturing & Custom Products"
        canonical="/"
        schema={organizationSchema}
      />
      <HomePageContent />
    </>
  );
}
