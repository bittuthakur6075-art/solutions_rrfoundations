export interface Product {
  id: string;
  title: string;
  slug: string;
  category: string;
  categoryName: string;
  shortDescription: string;
  fullDescription: string;
  thumbnail: string;
  images: string[];
  materials: string[];
  specifications: Record<string, string>;
  featured?: boolean;
  minQuantity?: number;
  tags: string[];
  seoTitle?: string;
  seoDescription?: string;
}

export interface Category {
  id: string;
  name: string;
  slug: string;
  description: string;
  image: string;
  featuredProductCount: number;
  highlights: string[];
}

export interface ManufacturingProcess {
  id: string;
  name: string;
  tagline: string;
  description: string;
  capabilities: string[];
  materials: string[];
  icon: string;
  image?: string;
}

export interface IndustrySolution {
  id: string;
  num?: string;
  name: string;
  tagline: string;
  description: string;
  recommendedProducts: string[];
  image: string;
  tags?: string[];
  actionText?: string;
  actionHref?: string;
  theme?: "dark" | "light";
}
