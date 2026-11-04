import React from "react";
import { Helmet } from "react-helmet-async";
import { COMPANY_INFO } from "@/lib/utils";

export interface SEOProps {
  title?: string;
  description?: string;
  canonical?: string;
  ogImage?: string;
  ogType?: "website" | "article";
  schema?: Record<string, unknown> | Array<Record<string, unknown>>;
}

export const SEO: React.FC<SEOProps> = ({
  title,
  description = "Direct physical manufacturing of precision metal badges, conference ID card kits, custom acrylic & MDF products, corporate drinkware, and executive gift hampers in New Delhi.",
  canonical,
  ogImage = "/assets/hero_composition.jpg",
  ogType = "website",
  schema,
}) => {
  const siteTitle = "RR Foundations";
  const fullTitle = title
    ? `${title} | ${siteTitle}`
    : "RR Foundations | Premium B2B Manufacturing & Custom Products";

  const canonicalUrl = canonical
    ? (canonical.startsWith("http") ? canonical : `${COMPANY_INFO.website}${canonical.startsWith("/") ? "" : "/"}${canonical}`)
    : COMPANY_INFO.website;

  const fullOgImage = ogImage.startsWith("http") ? ogImage : `${COMPANY_INFO.website}${ogImage}`;

  return (
    <Helmet>
      {/* Primary Meta Tags */}
      <title>{fullTitle}</title>
      <meta name="title" content={fullTitle} />
      <meta name="description" content={description} />
      <link rel="canonical" href={canonicalUrl} />

      {/* Open Graph / Facebook */}
      <meta property="og:type" content={ogType} />
      <meta property="og:url" content={canonicalUrl} />
      <meta property="og:title" content={fullTitle} />
      <meta property="og:description" content={description} />
      <meta property="og:image" content={fullOgImage} />
      <meta property="og:site_name" content={siteTitle} />
      <meta property="og:locale" content="en_IN" />

      {/* Twitter */}
      <meta name="twitter:card" content="summary_large_image" />
      <meta name="twitter:url" content={canonicalUrl} />
      <meta name="twitter:title" content={fullTitle} />
      <meta name="twitter:description" content={description} />
      <meta name="twitter:image" content={fullOgImage} />

      {/* Structured Data (JSON-LD) */}
      {schema && (
        <script type="application/ld+json">
          {JSON.stringify(schema)}
        </script>
      )}
    </Helmet>
  );
};

export default SEO;
