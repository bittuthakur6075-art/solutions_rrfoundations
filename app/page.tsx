"use client";

import React, { useState } from "react";
import { Hero } from "@/components/homepage/Hero";
import { CategoryShowcase } from "@/components/homepage/CategoryShowcase";
import { FeaturedProducts } from "@/components/homepage/FeaturedProducts";
import { CapabilitiesSection } from "@/components/homepage/CapabilitiesSection";
import { WhyChooseUs } from "@/components/homepage/WhyChooseUs";
import { IndustriesSection } from "@/components/homepage/IndustriesSection";
import { CustomManufacturingCta } from "@/components/homepage/CustomManufacturingCta";
import { EnquiryModal } from "@/components/ui/EnquiryModal";

export default function HomePage() {
  const [isQuoteOpen, setIsQuoteOpen] = useState(false);

  return (
    <>
      {/* 1. Editorial Hero */}
      <Hero onOpenQuote={() => setIsQuoteOpen(true)} />

      {/* 2. Product Category Showcase */}
      <CategoryShowcase />

      {/* 4. Featured Products (with direct RFQ action) */}
      <FeaturedProducts />

      {/* 5. Manufacturing Capabilities */}
      <CapabilitiesSection />

      {/* 6. Why RR Foundations */}
      <WhyChooseUs />

      {/* 7. Industries Served */}
      <IndustriesSection />

      {/* 8. Custom Manufacturing CTA */}
      <CustomManufacturingCta onOpenQuote={() => setIsQuoteOpen(true)} />

      {/* Global Interactive Quote / RFQ Modal */}
      <EnquiryModal
        isOpen={isQuoteOpen}
        onClose={() => setIsQuoteOpen(false)}
      />
    </>
  );
}
