import React from "react";
import Image from "next/image";
import Link from "next/link";
import { ArrowRight } from "lucide-react";
import { CATEGORIES } from "@/lib/data/categories";

export function CategoryShowcase() {
  return (
    <section className="py-20 sm:py-28 bg-[#F7F4EE] text-[#182A25] border-b border-[#E8E2D7]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Centered Editorial Divider from Reference: —— OUR PRODUCT CATEGORIES —— */}
        <div className="flex items-center justify-center gap-4 mb-4">
          <span className="w-12 sm:w-20 h-[1px] bg-[#D9B878]" />
          <span className="text-[#182A25] font-heading font-bold text-xs sm:text-sm tracking-[0.25em] uppercase">
            OUR PRODUCT CATEGORIES
          </span>
          <span className="w-12 sm:w-20 h-[1px] bg-[#D9B878]" />
        </div>

        {/* Section Heading & Subtitle */}
        <div className="text-center max-w-2xl mx-auto mb-16">
          <h2 className="font-serif text-3xl sm:text-4xl lg:text-5xl text-[#182A25] tracking-tight">
            Curated Collections Engineered for Scale
          </h2>
          <p className="text-[#5C6E66] text-sm sm:text-base mt-3 leading-relaxed">
            From precision stamped metal insignias to executive drinkware and conference credential kits.
          </p>
        </div>

        {/* Category Cards Grid (Editorial luxury) */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {CATEGORIES.map((cat, idx) => (
            <Link
              key={cat.id}
              href={`/products#${cat.slug}`}
              className="group bg-white rounded-2xl overflow-hidden border border-[#E8E2D7] hover:border-[#D9B878] shadow-card hover:shadow-luxury transition-all duration-300 flex flex-col justify-between"
            >
              <div>
                {/* Image Frame */}
                <div className="relative aspect-[4/3] bg-[#F7F4EE]/60 overflow-hidden border-b border-[#E8E2D7]">
                  <Image
                    src={cat.image}
                    alt={cat.name}
                    fill
                    className="object-contain p-6 group-hover:scale-105 transition-transform duration-500"
                  />
                  <div className="absolute top-3.5 right-3.5 bg-white/95 backdrop-blur-sm px-2.5 py-1 rounded-full text-[11px] font-heading font-bold text-[#182A25] border border-[#E8E2D7]">
                    Collection 0{idx + 1}
                  </div>
                </div>

                {/* Content */}
                <div className="p-6">
                  <h3 className="font-heading font-bold text-lg text-[#182A25] group-hover:text-[#B89650] transition">
                    {cat.name}
                  </h3>
                  <p className="text-xs sm:text-sm text-[#5C6E66] mt-2 line-clamp-2 leading-relaxed">
                    {cat.description}
                  </p>

                  {/* Highlights list */}
                  <div className="flex flex-wrap gap-1.5 mt-4">
                    {cat.highlights.map((h, i) => (
                      <span
                        key={i}
                        className="text-[11px] px-2 py-0.5 rounded-md bg-[#F7F4EE] text-[#5C6E66] border border-[#E8E2D7] font-medium"
                      >
                        {h}
                      </span>
                    ))}
                  </div>
                </div>
              </div>

              {/* Bottom Card Footer */}
              <div className="px-6 py-4 bg-[#F7F4EE]/50 border-t border-[#E8E2D7] flex items-center justify-between text-xs font-heading font-bold text-[#182A25] group-hover:text-[#B89650] transition">
                <span>View Full Line Specifications</span>
                <ArrowRight className="w-4 h-4 text-[#D9B878] group-hover:translate-x-1 transition-transform" />
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
}
