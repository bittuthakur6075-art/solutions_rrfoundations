import React from "react";
import ContactPageContent from "@/app/contact/page";
import SEO from "@/components/ui/SEO";
import { COMPANY_INFO } from "@/lib/utils";

const contactSchema = {
  "@context": "https://schema.org",
  "@type": "ContactPage",
  name: "Contact RR Foundations",
  url: `${COMPANY_INFO.website}/contact`,
  mainEntity: {
    "@type": "LocalBusiness",
    name: COMPANY_INFO.name,
    telephone: COMPANY_INFO.phone,
    email: COMPANY_INFO.email,
    address: {
      "@type": "PostalAddress",
      streetAddress: "Shop No. 12, Om Vihar, Opposite Metro Pillar No. 702",
      addressLocality: "New Delhi",
      postalCode: "110059",
      addressCountry: "IN",
    },
    openingHours: "Mo-Fr 09:00-18:00",
  },
};

export default function ContactPage() {
  return (
    <>
      <SEO
        title="Contact Us | Factory Workshop & Office"
        description={`Connect directly with our engineering and manufacturing desk in New Delhi. Phone: ${COMPANY_INFO.phone}, Email: ${COMPANY_INFO.email}. ${COMPANY_INFO.address}.`}
        canonical="/contact"
        schema={contactSchema}
      />
      <ContactPageContent />
    </>
  );
}
