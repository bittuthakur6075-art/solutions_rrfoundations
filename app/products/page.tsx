"use client";

import React, { useState, useMemo } from "react";
import Image from "next/image";
import Link from "next/link";
import { Search, MessageSquare } from "lucide-react";
import { PRODUCTS } from "@/lib/data/products";
import { CATEGORIES } from "@/lib/data/categories";
import { Button } from "@/components/ui/Button";
import { EnquiryModal } from "@/components/ui/EnquiryModal";

export default function ProductsPage() {
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedCategory, setSelectedCategory] = useState("all");
  const [selectedProduct, setSelectedProduct] = useState<{
    name: string;
    category: string;
  } | null>(null);

  const filteredProducts = useMemo(() => {
    const term = searchTerm.trim().toLowerCase();
    return PRODUCTS.filter((p) => {
      const matchesCat = selectedCategory === "all" || p.category === selectedCategory;
      if (!matchesCat) return false;
      if (!term) return true;
      return (
        p.title.toLowerCase().includes(term) ||
        p.shortDescription.toLowerCase().includes(term) ||
        p.tags.some((t) => t.toLowerCase().includes(term)) ||
        Boolean(p.aliases?.some((a) => a.toLowerCase().includes(term)))
      );
    });
  }, [searchTerm, selectedCategory]);

  return (
    <div className="min-h-screen bg-[#F7F4EE] text-[#182A25]">
      {/* 1. DARK EDITORIAL INTRO BANNER */}
      <section className="bg-[#102A25] text-white py-14 sm:py-20 border-b border-white/10 relative overflow-hidden">
        <div className="absolute top-0 right-1/4 w-[500px] h-[500px] bg-gold/5 rounded-full blur-[140px] pointer-events-none" />

        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          <div className="flex items-center gap-2 text-xs text-white/60 mb-3 font-heading">
            <Link href="/" className="hover:text-gold transition">Home</Link>
            <span>/</span>
            <span className="text-gold font-semibold">Product Catalogue</span>
          </div>

          <div className="max-w-3xl">
            <div className="flex items-center gap-2 mb-2">
              <span className="w-5 h-[1.5px] bg-gold" />
              <span className="text-gold font-heading font-bold text-xs uppercase tracking-[0.2em]">
                VERIFIED FACTORY INVENTORY
              </span>
            </div>
            <h1 className="font-serif text-4xl sm:text-5xl lg:text-6xl text-white tracking-tight leading-tight">
              Physical Merchandise &amp;{" "}
              <span className="italic text-gold font-normal">
                Precision Badges.
              </span>
            </h1>
            <p className="text-white/75 text-base sm:text-lg mt-3 leading-relaxed font-light">
              Explore our complete collection of verified in-house manufactured items. Every product is produced to exact specifications with certified materials in our New Delhi workshop.
            </p>
          </div>
        </div>
      </section>

      {/* 2. LIGHT BROWSING SURFACE */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 sm:py-16">
        {/* Filter & Search Bar */}
        <div className="bg-white p-4 sm:p-5 rounded-2xl border border-[#E8E2D7] shadow-card mb-10 flex flex-col md:flex-row gap-4 items-stretch md:items-center justify-between">
          {/* Category Tabs */}
          <div className="flex items-center gap-2 overflow-x-auto pb-2 md:pb-0 scrollbar-none">
            <button
              onClick={() => setSelectedCategory("all")}
              className={`px-4 py-2 rounded-xl text-xs font-heading font-bold transition whitespace-nowrap ${
                selectedCategory === "all"
                  ? "bg-[#102A25] text-white shadow-sm"
                  : "bg-[#F7F4EE] text-[#5C6E66] hover:bg-[#102A25]/5 hover:text-[#182A25]"
              }`}
            >
              All Items ({PRODUCTS.length})
            </button>
            {CATEGORIES.map((c) => (
              <button
                key={c.id}
                onClick={() => setSelectedCategory(c.slug)}
                className={`px-4 py-2 rounded-xl text-xs font-heading font-bold transition whitespace-nowrap ${
                  selectedCategory === c.slug
                    ? "bg-[#102A25] text-white shadow-sm"
                    : "bg-[#F7F4EE] text-[#5C6E66] hover:bg-[#102A25]/5 hover:text-[#182A25]"
                }`}
              >
                {c.name}
              </button>
            ))}
          </div>

          {/* Search Input */}
          <div className="relative min-w-[260px]">
            <Search className="w-4 h-4 text-[#5C6E66] absolute left-3.5 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              placeholder="Search by name, metal, tag..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="w-full pl-9 pr-4 py-2 text-xs rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/50 transition outline-none"
            />
          </div>
        </div>

        {/* Products Grid */}
        {filteredProducts.length === 0 ? (
          <div className="text-center py-16 bg-white rounded-2xl border border-[#E8E2D7] p-8 shadow-card">
            <p className="text-[#5C6E66] text-base">
              No products found matching &ldquo;{searchTerm}&rdquo;. Try another search or filter.
            </p>
            <Button
              variant="outline"
              size="sm"
              onClick={() => {
                setSearchTerm("");
                setSelectedCategory("all");
              }}
              className="mt-4 text-[#182A25] border-[#E8E2D7]"
            >
              Reset Filters
            </Button>
          </div>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            {filteredProducts.map((prod) => (
              <div
                key={prod.id}
                id={prod.slug}
                className="group bg-white rounded-2xl overflow-hidden border border-[#E8E2D7] hover:border-[#D9B878] transition-all duration-300 flex flex-col justify-between hover:shadow-luxury relative"
              >
                {prod.aliases?.map((alias) => (
                  <span key={alias} id={alias} className="sr-only absolute" />
                ))}
                <div>
                  <div className="relative aspect-[4/3] bg-[#F7F4EE]/50 p-6 border-b border-[#E8E2D7] overflow-hidden">
                    <Image
                      src={prod.thumbnail}
                      alt={prod.title}
                      fill
                      className="object-contain p-4 group-hover:scale-105 transition-transform duration-500"
                    />
                    <div className="absolute top-3.5 left-3.5 bg-[#102A25] text-white text-[10px] font-heading font-bold px-2.5 py-0.5 rounded-full tracking-wider uppercase">
                      {prod.categoryName}
                    </div>
                    {prod.materials?.[0] && (
                      <div className="absolute bottom-3.5 right-3.5 bg-white/95 backdrop-blur-sm border border-[#E8E2D7] text-[#182A25] text-[11px] font-medium px-2 py-0.5 rounded shadow-sm">
                        {prod.materials[0]}
                      </div>
                    )}
                  </div>

                  <div className="p-6">
                    <h3 className="font-heading font-bold text-base sm:text-lg text-[#182A25] group-hover:text-[#B89650] transition line-clamp-1">
                      {prod.title}
                    </h3>
                    <p className="text-xs sm:text-sm text-[#5C6E66] mt-2 line-clamp-2 leading-relaxed">
                      {prod.shortDescription}
                    </p>

                    <div className="mt-4 pt-3 border-t border-[#E8E2D7] space-y-1.5 text-xs text-[#5C6E66]">
                      {Object.entries(prod.specifications).slice(0, 3).map(([k, v]) => (
                        <div key={k} className="flex justify-between">
                          <span className="font-medium">{k}:</span>
                          <span className="text-[#182A25] font-semibold truncate max-w-[170px]">{v}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>

                <div className="p-6 pt-0">
                  <Button
                    variant="gold"
                    size="sm"
                    className="w-full text-xs font-bold"
                    onClick={() =>
                      setSelectedProduct({
                        name: prod.title,
                        category: prod.categoryName,
                      })
                    }
                  >
                    <MessageSquare className="w-3.5 h-3.5 mr-1.5 text-forest-950" />
                    <span>Request Quote for This Item</span>
                  </Button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {selectedProduct && (
        <EnquiryModal
          isOpen={!!selectedProduct}
          onClose={() => setSelectedProduct(null)}
          productName={selectedProduct.name}
          categoryName={selectedProduct.category}
        />
      )}
    </div>
  );
}
