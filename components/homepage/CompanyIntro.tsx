import React from "react";
import Image from "next/image";
import Link from "next/link";
import { CheckCircle2, ArrowRight } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function CompanyIntro() {
  const pillars = [
    {
      title: "Direct Physical Manufacturing",
      desc: "Complete in-house mechanical control over metal stamping, laser annealing, and substrate printing without third-party broker markups.",
    },
    {
      title: "Institutional Quality Consistency",
      desc: "Strict mechanical tolerance checks on every badge clasp, lanyard hook, and UV flatbed print run before packaging.",
    },
    {
      title: "Prototyping & Custom Engineering",
      desc: "Rapid turnaround on client custom dies, vector CAD sizing, and pre-production proofing for enterprise procurement.",
    },
  ];

  return (
    <section className="py-20 sm:py-28 bg-[#172B27] text-white border-b border-white/10 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center">
          {/* Left Column: Visual Showcase */}
          <div className="lg:col-span-5 order-2 lg:order-1">
            <div className="relative rounded-3xl overflow-hidden bg-[#203A33] p-3 border border-white/15 shadow-luxury">
              <div className="relative aspect-[4/3] rounded-2xl overflow-hidden">
                <Image
                  src="/assets/lanyards_showcase.jpg"
                  alt="RR Foundations Production & Conference Solutions"
                  fill
                  className="object-cover"
                />
              </div>
              <div className="p-4 bg-[#102A25] mt-3 rounded-xl border border-white/10">
                <span className="text-[11px] font-heading font-bold text-gold uppercase tracking-widest block">
                  VERIFIED PRODUCTION FACILITY
                </span>
                <p className="text-xs text-white/70 mt-1">
                  Om Vihar, New Delhi — Equipped for large batch runs, precision stamping & continuous sublimation.
                </p>
              </div>
            </div>
          </div>

          {/* Right Column: Editorial Intro */}
          <div className="lg:col-span-7 order-1 lg:order-2 space-y-6">
            <div className="flex items-center gap-2">
              <span className="w-5 h-[1.5px] bg-gold" />
              <span className="text-gold text-xs font-heading font-bold uppercase tracking-[0.2em]">
                ABOUT RR FOUNDATIONS
              </span>
            </div>

            <h2 className="font-serif text-3xl sm:text-4xl lg:text-5xl text-white tracking-tight leading-[1.15]">
              Built Around Products.{" "}
              <span className="italic text-gold font-normal">
                Driven by Possibilities.
              </span>
            </h2>

            <p className="text-white/80 text-base leading-relaxed font-light">
              RR Foundations is an established manufacturing partner specializing in identity solutions, customized corporate merchandise, and bespoke institutional fabrication. We take concept briefs from procurement teams, event organizers, and civic institutions and translate them into precision tangible products.
            </p>

            <div className="space-y-4 pt-2">
              {pillars.map((pillar, idx) => (
                <div key={idx} className="flex items-start gap-3.5">
                  <div className="w-5 h-5 rounded-full bg-gold/20 text-gold flex items-center justify-center flex-shrink-0 mt-0.5">
                    <CheckCircle2 className="w-3.5 h-3.5" />
                  </div>
                  <div>
                    <h4 className="font-heading font-bold text-sm text-white">
                      {pillar.title}
                    </h4>
                    <p className="text-xs sm:text-sm text-white/70 leading-relaxed mt-0.5 font-light">
                      {pillar.desc}
                    </p>
                  </div>
                </div>
              ))}
            </div>

            <div className="pt-4 flex flex-wrap items-center gap-4">
              <Button variant="gold" href="/about">
                <span>Learn More About Us</span>
                <ArrowRight className="w-4 h-4 ml-1.5" />
              </Button>
              <Button variant="outline" href="/manufacturing">
                <span>Explore Capabilities →</span>
              </Button>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
