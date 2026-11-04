"use client";

import React, { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { ArrowRight, MessageSquare } from "lucide-react";
import { PRODUCTS } from "@/lib/data/products";
import { Button } from "@/components/ui/Button";
import { EnquiryModal } from "@/components/ui/EnquiryModal";

export function FeaturedProducts() {
  const featured = PRODUCTS.filter((p) => p.featured);
  const [selectedProduct, setSelectedProduct] = useState<{
    name: string;
    category: string;
  } | null>(null);

  return (
    <section className="py-20 sm:py-28 bg-white text-[#182A25] border-b border-[#E8E2D7]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-14 gap-6">
          <div className="max-w-2xl">
            <div className="flex items-center gap-2 mb-2">
              <span className="w-5 h-[1.5px] bg-[#D9B878]" />
              <span className="text-[#B89650] font-heading font-bold text-xs uppercase tracking-[0.2em]">
                VERIFIED FACTORY PORTFOLIO
              </span>
            </div>
            <h2 className="font-serif text-3xl sm:text-4xl lg:text-5xl text-[#182A25] tracking-tight">
              Products Designed to{" "}
              <span className="italic text-[#B89650] font-normal">
                Make an Impression.
              </span>
            </h2>
            <p className="text-[#5C6E66] text-base mt-2.5">
              Precision stainless steel magnetic badges, antique copper lapel pins, UV-printed MDF clipboards, and turnkey conference credential sets.
            </p>
          </div>
          <Link
            href="/products"
            className="text-sm font-heading font-bold text-[#182A25] hover:text-[#B89650] flex items-center gap-1.5 self-start md:self-end group"
          >
            <span>See Complete Catalogue ({PRODUCTS.length} Products)</span>
            <ArrowRight className="w-4 h-4 text-[#D9B878] group-hover:translate-x-1 transition-transform" />
          </Link>
        </div>

        {/* Product Cards Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
          {featured.map((prod) => (
            <div
              key={prod.id}
              className="group bg-[#F7F4EE]/50 rounded-2xl overflow-hidden border border-[#E8E2D7] hover:border-[#D9B878] transition-all duration-300 flex flex-col justify-between hover:shadow-luxury"
            >
              <div>
                {/* Image Container */}
                <div className="relative aspect-[4/3] bg-white p-6 border-b border-[#E8E2D7] overflow-hidden">
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

                {/* Details */}
                <div className="p-6">
                  <h3 className="font-heading font-bold text-base sm:text-lg text-[#182A25] group-hover:text-[#B89650] transition line-clamp-1">
                    {prod.title}
                  </h3>
                  <p className="text-xs sm:text-sm text-[#5C6E66] mt-2 line-clamp-2 leading-relaxed">
                    {prod.shortDescription}
                  </p>

                  {/* Specifications snippet */}
                  <div className="mt-4 pt-3 border-t border-[#E8E2D7] space-y-1.5 text-xs text-[#5C6E66]">
                    {Object.entries(prod.specifications).slice(0, 2).map(([key, val]) => (
                      <div key={key} className="flex items-center justify-between">
                        <span className="font-medium">{key}:</span>
                        <span className="text-[#182A25] font-semibold truncate max-w-[170px]">
                          {val}
                        </span>
                      </div>
                    ))}
                  </div>
                </div>
              </div>

              {/* Action Buttons */}
              <div className="p-6 pt-0 grid grid-cols-2 gap-2.5">
                <Button
                  variant="outline"
                  size="sm"
                  href={`/products#${prod.slug}`}
                  className="w-full text-xs text-[#182A25] border-[#E8E2D7] hover:border-[#182A25]"
                >
                  View Details
                </Button>
                <Button
                  variant="gold"
                  size="sm"
                  onClick={() =>
                    setSelectedProduct({
                      name: prod.title,
                      category: prod.categoryName,
                    })
                  }
                  className="w-full text-xs"
                >
                  <MessageSquare className="w-3.5 h-3.5 mr-1" />
                  Quote
                </Button>
              </div>
            </div>
          ))}
        </div>
      </div>

      {selectedProduct && (
        <EnquiryModal
          isOpen={!!selectedProduct}
          onClose={() => setSelectedProduct(null)}
          productName={selectedProduct.name}
          categoryName={selectedProduct.category}
        />
      )}
    </section>
  );
}
