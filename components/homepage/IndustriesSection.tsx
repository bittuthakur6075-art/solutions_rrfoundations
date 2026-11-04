import React from "react";
import Image from "next/image";
import Link from "next/link";
import { ArrowRight } from "lucide-react";
import { INDUSTRIES } from "@/lib/data/industries";

export function IndustriesSection() {
  return (
    <section className="py-20 sm:py-28 bg-white text-[#182A25] border-b border-[#E8E2D7]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-14 gap-6">
          <div className="max-w-2xl">
            <div className="flex items-center gap-2 mb-2">
              <span className="w-5 h-[1.5px] bg-[#D9B878]" />
              <span className="text-[#B89650] font-heading font-bold text-xs uppercase tracking-[0.2em]">
                TAILORED SECTOR SOLUTIONS
              </span>
            </div>
            <h2 className="font-serif text-3xl sm:text-4xl lg:text-5xl text-[#182A25] tracking-tight">
              Industries We Serve.
            </h2>
            <p className="text-[#5C6E66] text-base mt-2.5">
              Purpose-built product configurations adapted to the regulatory, durability, and aesthetic requirements of specific sectors.
            </p>
          </div>
          <Link
            href="/industries"
            className="text-sm font-heading font-bold text-[#182A25] hover:text-[#B89650] flex items-center gap-1.5 self-start md:self-end group"
          >
            <span>Explore All Sector Specs</span>
            <ArrowRight className="w-4 h-4 text-[#D9B878] group-hover:translate-x-1 transition-transform" strokeWidth={1.75} />
          </Link>
        </div>

        {/* Industries Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {INDUSTRIES.map((ind) => (
            <div
              key={ind.id}
              className="group bg-[#F7F4EE]/60 rounded-2xl overflow-hidden border border-[#E8E2D7] hover:border-[#D9B878] transition-all duration-300 flex flex-col justify-between hover:shadow-luxury"
            >
              <div>
                <div className="relative aspect-[16/9] bg-white overflow-hidden border-b border-[#E8E2D7] p-4">
                  <Image
                    src={ind.image}
                    alt={ind.name}
                    fill
                    className="object-contain p-4 group-hover:scale-105 transition-transform duration-500"
                  />
                </div>

                <div className="p-6">
                  <h3 className="font-heading font-bold text-lg text-[#182A25] mb-1">
                    {ind.name}
                  </h3>
                  <p className="text-xs text-[#B89650] font-semibold font-heading mb-3">
                    {ind.tagline}
                  </p>
                  <p className="text-xs sm:text-sm text-[#5C6E66] leading-relaxed">
                    {ind.description}
                  </p>

                  <div className="mt-4 pt-3 border-t border-[#E8E2D7]">
                    <span className="text-[11px] font-heading font-bold text-[#5C6E66] uppercase tracking-wider block mb-2">
                      Key Manufactured Items:
                    </span>
                    <ul className="space-y-1">
                      {ind.recommendedProducts.map((p, i) => (
                        <li key={i} className="text-xs text-[#182A25] font-medium flex items-center gap-1.5">
                          <span className="w-1.5 h-1.5 rounded-full bg-[#D9B878] flex-shrink-0" />
                          <span>{p}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                </div>
              </div>

              <div className="px-6 py-4 bg-[#F7F4EE] border-t border-[#E8E2D7]">
                <Link
                  href={`/request-quote?industry=${ind.id}`}
                  className="text-xs font-heading font-bold text-[#182A25] hover:text-[#B89650] flex items-center justify-between"
                >
                  <span>Request Sector Proposal</span>
                  <ArrowRight className="w-3.5 h-3.5 text-[#D9B878]" strokeWidth={1.75} />
                </Link>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
