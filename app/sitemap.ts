import { MetadataRoute } from "next";
import { PRODUCTS } from "@/lib/data/products";
import { CATEGORIES } from "@/lib/data/categories";

export default function sitemap(): MetadataRoute.Sitemap {
  const baseUrl = "https://solutions.rrfoundations.org";

  const staticRoutes = [
    "",
    "/about",
    "/products",
    "/manufacturing",
    "/industries",
    "/contact",
    "/request-quote",
    "/privacy-policy",
    "/terms-and-conditions",
  ].map((route) => ({
    url: `${baseUrl}${route}`,
    lastModified: new Date(),
    changeFrequency: "weekly" as const,
    priority: route === "" ? 1.0 : 0.8,
  }));

  const productRoutes = PRODUCTS.map((prod) => ({
    url: `${baseUrl}/products#${prod.slug}`,
    lastModified: new Date(),
    changeFrequency: "weekly" as const,
    priority: 0.7,
  }));

  return [...staticRoutes, ...productRoutes];
}
