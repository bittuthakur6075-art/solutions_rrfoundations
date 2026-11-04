import React from "react";
import { COMPANY_INFO } from "@/lib/utils";

export const metadata = {
  title: "Privacy Policy | RR Foundations",
  description: "Privacy policy and client data handling commitments for RR Foundations.",
};

export default function PrivacyPolicyPage() {
  return (
    <div className="py-14 sm:py-20 bg-ivory min-h-screen">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 bg-white p-8 sm:p-14 rounded-3xl border border-line-border shadow-card">
        <h1 className="font-heading font-extrabold text-3xl sm:text-4xl text-forest-900 mb-6">
          Privacy Policy
        </h1>
        <p className="text-xs text-text-muted mb-8">
          Last Updated: November 2026 • RR Foundations Manufacturing Solutions
        </p>

        <div className="space-y-6 text-sm text-text-secondary leading-relaxed">
          <p>
            At RR Foundations, accessible from {COMPANY_INFO.website}, one of our primary priorities is the privacy of our visitors and corporate clients. This Privacy Policy outlines the types of information recorded and collected by RR Foundations and how we use it.
          </p>

          <h2 className="font-heading font-bold text-lg text-forest-900 mt-6 mb-2">
            1. Information We Collect
          </h2>
          <p>
            When you request a quotation, contact us via email, or submit an inquiry through our digital channels, we collect standard corporate contact information including your full name, work email address, company name, phone/WhatsApp number, and product specifications.
          </p>

          <h2 className="font-heading font-bold text-lg text-forest-900 mt-6 mb-2">
            2. Proprietary Client Artwork & Designs
          </h2>
          <p>
            Any CAD files, vector graphics, institutional insignias, trademarked logos, or proprietary product blueprints shared with RR Foundations for prototyping or manufacturing purposes are treated as strictly confidential. We do not sell, license, or transfer client artwork to third parties.
          </p>

          <h2 className="font-heading font-bold text-lg text-forest-900 mt-6 mb-2">
            3. Direct Communications
          </h2>
          <p>
            We use your contact details solely to generate commercial proposals, provide production updates, coordinate sample approvals, and facilitate freight delivery. We do not engage in spam marketing.
          </p>

          <h2 className="font-heading font-bold text-lg text-forest-900 mt-6 mb-2">
            4. Contact Us
          </h2>
          <p>
            For questions or requests regarding your data, contact our office at:
            <br />
            <strong>Email:</strong> {COMPANY_INFO.email}
            <br />
            <strong>Address:</strong> {COMPANY_INFO.address}
          </p>
        </div>
      </div>
    </div>
  );
}
