import React from "react";
import PrivacyPolicyContent from "@/app/privacy-policy/page";
import SEO from "@/components/ui/SEO";

export default function PrivacyPolicyPage() {
  return (
    <>
      <SEO
        title="Privacy Policy"
        description="Privacy policy and client data handling commitments for RR Foundations."
        canonical="/privacy-policy"
      />
      <PrivacyPolicyContent />
    </>
  );
}
