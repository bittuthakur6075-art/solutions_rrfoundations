import React from "react";

export const metadata = {
  title: "Terms and Conditions | RR Foundations",
  description: "Commercial and manufacturing terms and conditions for RR Foundations.",
};

export default function TermsPage() {
  return (
    <div className="py-14 sm:py-20 bg-ivory min-h-screen">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 bg-white p-8 sm:p-14 rounded-3xl border border-line-border shadow-card">
        <h1 className="font-heading font-extrabold text-3xl sm:text-4xl text-forest-900 mb-6">
          Terms & Conditions
        </h1>
        <p className="text-xs text-text-muted mb-8">
          Last Updated: November 2026 • RR Foundations Manufacturing Solutions
        </p>

        <div className="space-y-6 text-sm text-text-secondary leading-relaxed">
          <p>
            Welcome to RR Foundations. These terms and conditions outline the rules and regulations for custom manufacturing agreements, bulk orders, and use of the RR Foundations website.
          </p>

          <h2 className="font-heading font-bold text-lg text-forest-900 mt-6 mb-2">
            1. Quotations and Commercial Invoices
          </h2>
          <p>
            All price estimates generated via our RFQ forms or sales representatives are based on estimated batch volumes, raw material indices, and finishing processes. Formal commitments are established upon issuance of a formal Commercial Proforma Invoice and pre-production sample sign-off.
          </p>

          <h2 className="font-heading font-bold text-lg text-forest-900 mt-6 mb-2">
            2. Tooling and Pre-Production Proofs
          </h2>
          <p>
            For custom die-stamped badges or specialized dimensions, client sign-off on digital CAD blueprints or physical prototype units is required prior to mass stamping. Production timelines commence from formal sample sign-off.
          </p>

          <h2 className="font-heading font-bold text-lg text-forest-900 mt-6 mb-2">
            3. Quality Inspection and Tolerances
          </h2>
          <p>
            Our manufacturing facility adheres to industrial mechanical tolerances (±0.2mm on stamping, standard CMYK gamut tolerances on UV printing). Defective goods exceeding agreed batch tolerance thresholds will be rectified or replaced under our direct manufacturer warranty.
          </p>

          <h2 className="font-heading font-bold text-lg text-forest-900 mt-6 mb-2">
            4. Freight and Logistics
          </h2>
          <p>
            We coordinate insured logistics across all major Indian commercial hubs. Damage sustained during freight must be noted upon bill of lading receipt and communicated within 48 hours.
          </p>
        </div>
      </div>
    </div>
  );
}
