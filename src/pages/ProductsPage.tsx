import React, { useEffect } from "react";
import { useParams } from "react-router-dom";
import ProductsPageContent from "@/app/products/page";
import SEO from "@/components/ui/SEO";
import { PRODUCTS } from "@/lib/data/products";
import { COMPANY_INFO } from "@/lib/utils";

const defaultCollectionSchema = [
  {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: [
      {
        "@type": "ListItem",
        position: 1,
        name: "Home",
        item: COMPANY_INFO.website,
      },
      {
        "@type": "ListItem",
        position: 2,
        name: "Product Catalogue",
        item: `${COMPANY_INFO.website}/products`,
      },
    ],
  },
  {
    "@context": "https://schema.org",
    "@type": "CollectionPage",
    name: "RR Foundations B2B Product Catalogue",
    description: "Full catalogue of verified in-house manufactured physical products and custom promotional items.",
    url: `${COMPANY_INFO.website}/products`,
    provider: {
      "@type": "Organization",
      name: COMPANY_INFO.name,
      telephone: COMPANY_INFO.phone,
      email: COMPANY_INFO.email,
      address: COMPANY_INFO.address,
    },
  },
];

export default function ProductsPage() {
  const { slug } = useParams<{ slug?: string }>();
  const product = slug ? PRODUCTS.find((p) => p.slug === slug || p.aliases?.includes(slug)) : null;

  useEffect(() => {
    if (product) {
      const timer = setTimeout(() => {
        const el = document.getElementById(product.slug);
        if (el) {
          el.scrollIntoView({ behavior: "smooth", block: "center" });
        }
      }, 150);
      return () => clearTimeout(timer);
    }
  }, [product]);

  if (product) {
    const productSchema = {
      "@context": "https://schema.org",
      "@type": "Product",
      name: product.title,
      image: `${COMPANY_INFO.website}${product.thumbnail}`,
      description: product.shortDescription,
      category: product.categoryName,
      brand: {
        "@type": "Brand",
        name: "RR Foundations",
      },
      manufacturer: {
        "@type": "Organization",
        name: COMPANY_INFO.name,
        telephone: COMPANY_INFO.phone,
        address: COMPANY_INFO.address,
      },
      offers: {
        "@type": "Offer",
        priceCurrency: "INR",
        price: "0",
        priceValidUntil: "2027-12-31",
        availability: "https://schema.org/InStock",
        url: `${COMPANY_INFO.website}/products/${product.slug}`,
      },
    };

    return (
      <>
        <SEO
          title={`${product.title} | Direct Manufacturer RR Foundations`}
          description={product.seoDescription || `${product.shortDescription} Manufactured in New Delhi by RR Foundations.`}
          canonical={`/products/${product.slug}`}
          ogImage={product.thumbnail}
          schema={productSchema}
        />
        <ProductsPageContent />
      </>
    );
  }

  return (
    <>
      <SEO
        title="Product Catalogue | Verified Factory Inventory"
        description="Explore 260+ physical products manufactured in New Delhi: precision metal badges, conference ID card kits, custom acrylic & MDF products, corporate drinkware, and writing instruments."
        canonical="/products"
        schema={defaultCollectionSchema}
      />
      <ProductsPageContent />
    </>
  );
}
