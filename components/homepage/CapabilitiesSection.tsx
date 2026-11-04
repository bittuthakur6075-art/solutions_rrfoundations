import React from "react";
import Link from "next/link";
import { Check, ArrowRight } from "lucide-react";
import { MANUFACTURING_PROCESSES } from "@/lib/data/manufacturing";

export function CapabilitiesSection() {
  return (
    <section className="py-20 sm:py-28 bg-[#102A25] text-white relative overflow-hidden border-b border-white/10">
      {/* Background glow */}
      <div className="absolute top-1/2 left-0 -translate-y-1/2 -translate-x-1/2 w-[600px] h-[600px] bg-gold/5 rounded-full blur-[140px] pointer-events-none" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        {/* Section Header */}
        <div className="max-w-3xl mb-14">
          <div className="flex items-center gap-2 mb-2">
            <span className="w-5 h-[1.5px] bg-gold" />
            <span className="text-gold font-heading font-bold text-xs uppercase tracking-[0.2em]">
              IN-HOUSE PRODUCTION ARCHITECTURE
            </span>
          </div>
          <h2 className="font-serif text-3xl sm:text-4xl lg:text-5xl text-white tracking-tight leading-[1.12]">
            From Concept to{" "}
            <span className="italic text-gold font-normal">
              Finished Product.
            </span>
          </h2>
          <p className="text-white/75 text-base sm:text-lg mt-3 leading-relaxed font-light">
            Our Delhi manufacturing unit operates modern laser cutting, hydraulic die-stamping, UV flatbed printing, and textile sublimation lines.
          </p>
        </div>

        {/* Process Cards Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {MANUFACTURING_PROCESSES.map((proc, idx) => (
            <div
              key={proc.id}
              className="bg-[#203A33]/70 border border-white/15 rounded-3xl p-6 sm:p-8 hover:border-gold/50 transition-all duration-300 flex flex-col justify-between shadow-luxury"
            >
              <div>
                <div className="flex items-center justify-between mb-4">
                  <span className="text-gold font-heading font-bold text-xs uppercase tracking-widest">
                    Process 0{idx + 1}
                  </span>
                  <span className="text-xs px-3 py-1 rounded-full bg-forest-900 text-white/80 font-medium border border-white/10">
                    Precision Engineered
                  </span>
                </div>

                <h3 className="font-serif text-2xl text-white mb-1">
                  {proc.name}
                </h3>
                <p className="text-xs sm:text-sm text-gold font-medium mb-4">
                  {proc.tagline}
                </p>

                <p className="text-white/75 text-sm leading-relaxed mb-6 font-light">
                  {proc.description}
                </p>

                {/* Capabilities check-list */}
                <div className="space-y-2 mb-6 border-t border-white/10 pt-4">
                  {proc.capabilities.map((cap, i) => (
                    <div key={i} className="flex items-start gap-2.5 text-xs sm:text-sm text-white/85">
                      <div className="w-4 h-4 rounded-full bg-gold/20 text-gold flex items-center justify-center flex-shrink-0 mt-0.5">
                        <Check className="w-2.5 h-2.5" />
                      </div>
                      <span>{cap}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Supported Materials footer */}
              <div className="pt-4 border-t border-white/10 flex flex-wrap items-center gap-1.5">
                <span className="text-xs text-white/50 font-heading font-semibold mr-1">
                  Materials:
                </span>
                {proc.materials.map((mat, i) => (
                  <span
                    key={i}
                    className="text-[11px] px-2.5 py-0.5 rounded-full bg-[#102A25] text-white/85 border border-white/10"
                  >
                    {mat}
                  </span>
                ))}
              </div>
            </div>
          ))}
        </div>

        {/* Section Bottom Action */}
        <div className="mt-12 text-center">
          <Link
            href="/manufacturing"
            className="inline-flex items-center gap-2 px-6 py-3.5 rounded-xl bg-gold text-forest-950 font-heading font-bold text-sm hover:bg-gold-hover transition shadow-gold"
          >
            <span>Explore Complete Machinery &amp; Technical Standards</span>
            <ArrowRight className="w-4 h-4" />
          </Link>
        </div>
      </div>
    </section>
  );
}
