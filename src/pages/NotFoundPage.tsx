import React from "react";
import NotFoundContent from "@/app/not-found";
import SEO from "@/components/ui/SEO";

export default function NotFoundPage() {
  return (
    <>
      <SEO
        title="Page Not Found (404)"
        description="The requested page could not be found. Explore our complete catalogue of precision physical products."
      />
      <NotFoundContent />
    </>
  );
}
