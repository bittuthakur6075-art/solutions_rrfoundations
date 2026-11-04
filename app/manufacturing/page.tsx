import React from "react";
import Link from "next/link";
import { Check, ShieldCheck } from "lucide-react";
import { MANUFACTURING_PROCESSES } from "@/lib/data/manufacturing";
import { Button } from "@/components/ui/Button";

export const metadata = {
  title: "Manufacturing Capabilities | RR Foundations",
  description: "Cinematic overview of our in-house laser cutting, UV printing, CNC routing, and hydraulic metal die-stamping lines in New Delhi.",
};

export default function ManufacturingPage() {
  return (
    <div className="min-h-screen bg-[#F7F4EE] text-[#182A25]">
      {/* 1. DARK CINEMATIC INDUSTRIAL HERO */}
      <section className="bg-[#102A25] text-white py-16 sm:py-24 border-b border-white/10 relative overflow-hidden">
        <div className="absolute top-0 right-1/4 w-[600px] h-[600px] bg-gold/5 rounded-full blur-[140px] pointer-events-none" />

        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          <div className="flex items-center gap-2 text-xs text-white/60 mb-3 font-heading">
            <Link href="/" className="hover:text-gold transition">Home</Link>
            <span>/</span>
            <span className="text-gold font-semibold">Manufacturing</span>
          </div>

          <div className="max-w-3xl">
            <div className="flex items-center gap-2 mb-2">
              <span className="w-5 h-[1.5px] bg-gold" />
              <span className="text-gold font-heading font-bold text-xs uppercase tracking-[0.2em]">
                CINEMATIC INDUSTRIAL PRESENTATION
              </span>
            </div>
            <h1 className="font-serif text-4xl sm:text-5xl lg:text-6xl text-white tracking-tight leading-tight">
              Verified Manufacturing &amp;{" "}
              <span className="italic text-gold font-normal">
                Machinery Standards.
              </span>
            </h1>
            <p className="text-white/80 text-base sm:text-lg mt-4 leading-relaxed font-light">
              Every badge pin, lanyard hook, and UV printed board is engineered on calibrated production equipment at our New Delhi workshop. We maintain strict control over mechanical tolerances, material grades, and finishing treatments.
            </p>
          </div>
        </div>
      </section>

      {/* 2. PRODUCTION PROCESSES */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 sm:py-24">
        <div className="space-y-12">
          {MANUFACTURING_PROCESSES.map((proc, idx) => (
            <div
              key={proc.id}
              className="bg-white rounded-3xl p-8 sm:p-12 border border-[#E8E2D7] shadow-luxury grid grid-cols-1 lg:grid-cols-12 gap-8 items-center"
            >
              <div className="lg:col-span-8 space-y-4">
                <span className="text-xs font-heading font-bold text-[#B89650] uppercase tracking-widest block">
                  PROCESS 0{idx + 1}
                </span>
                <h2 className="font-serif text-3xl sm:text-4xl text-[#182A25]">
                  {proc.name}
                </h2>
                <p className="text-sm font-heading font-semibold text-[#102A25]">
                  {proc.tagline}
                </p>
                <p className="text-[#5C6E66] text-sm sm:text-base leading-relaxed">
                  {proc.description}
                </p>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5 pt-3 border-t border-[#E8E2D7]">
                  {proc.capabilities.map((c, i) => (
                    <div key={i} className="flex items-start gap-2 text-xs sm:text-sm text-[#182A25]">
                      <div className="w-4 h-4 rounded-full bg-[#102A25] text-gold flex items-center justify-center flex-shrink-0 mt-0.5">
                        <Check className="w-2.5 h-2.5" />
                      </div>
                      <span>{c}</span>
                    </div>
                  ))}
                </div>

                <div className="pt-2 flex flex-wrap items-center gap-1.5">
                  <span className="text-xs text-[#5C6E66] font-heading font-semibold mr-1">
                    Verified Materials:
                  </span>
                  {proc.materials.map((m, i) => (
                    <span
                      key={i}
                      className="text-xs px-2.5 py-0.5 rounded-full bg-[#F7F4EE] text-[#182A25] border border-[#E8E2D7] font-medium"
                    >
                      {m}
                    </span>
                  ))}
                </div>
              </div>

              <div className="lg:col-span-4 bg-[#102A25] text-white rounded-2xl p-6 sm:p-8 text-center space-y-4 shadow-card">
                <ShieldCheck className="w-10 h-10 text-gold mx-auto" />
                <h4 className="font-serif text-xl text-white">
                  Custom Batch Sizing
                </h4>
                <p className="text-xs text-white/70 leading-relaxed font-light">
                  Have a non-standard alloy, custom die stamping, or specialized shape? We create vector tooling in-house.
                </p>
                <Button variant="gold" size="sm" href="/request-quote" className="w-full text-xs font-bold">
                  Request Feasibility Review
                </Button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
