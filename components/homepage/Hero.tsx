"use client";

import React from "react";
import Image from "next/image";
import Link from "next/link";
import {
  ArrowRight,
  Package,
  SlidersHorizontal,
  Factory,
  Palette,
  Boxes,
  Truck,
} from "lucide-react";

interface HeroProps {
  onOpenQuote: () => void;
}

export function Hero({ onOpenQuote }: HeroProps) {
  const capabilities = [
    {
      icon: Factory,
      line1: "In-house",
      line2: "Manufacturing",
    },
    {
      icon: Palette,
      line1: "Custom",
      line2: "Branding",
    },
    {
      icon: Boxes,
      line1: "Bulk",
      line2: "Production",
    },
    {
      icon: Truck,
      line1: "Pan-India",
      line2: "Delivery",
    },
  ];

  return (
    <section className="relative overflow-hidden bg-[#102A25] text-white">
      {/* Background ambient lighting */}
      <div className="absolute top-1/3 left-1/4 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] bg-[#163830]/40 rounded-full blur-[160px] pointer-events-none" />

      {/* Main Container */}
      <div className="max-w-[1440px] mx-auto px-4 sm:px-6 lg:px-12 relative z-10 pt-8 pb-12 lg:pt-12 lg:pb-16">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-4 items-center">
          
          {/* LEFT COLUMN: Editorial Text, Headline, CTAs, Capability Indicators */}
          <div className="lg:col-span-6 xl:col-span-5 space-y-6 z-20">
            
            {/* Small uppercase editorial kicker with Champagne line */}
            <div className="flex items-center gap-3">
              <span className="w-8 h-[2px] bg-[#D9B878]" />
              <span className="text-[#D9B878] text-xs sm:text-[13px] font-heading font-bold uppercase tracking-[0.22em]">
                DIRECT FACTORY &amp; CUSTOM PRODUCT SOLUTIONS
              </span>
            </div>

            {/* Display Headline: "Manufacturing Ideas Into Products That Matter." */}
            <h1 className="font-serif text-3xl sm:text-4xl md:text-5xl lg:text-[50px] xl:text-[58px] text-white tracking-tight leading-[1.12] font-normal">
              <span className="whitespace-normal sm:whitespace-nowrap">Manufacturing Ideas</span>
              <br />
              <span>Into Products </span>
              <br className="hidden sm:inline" />
              <span className="font-serif italic font-normal text-[#D9B878] whitespace-nowrap">
                That Matter.
              </span>
            </h1>

            {/* Supporting Copy / Sub-lead */}
            <p className="text-white/85 text-base sm:text-lg leading-relaxed max-w-lg font-sans font-light">
              Direct factory manufacturing for bespoke corporate merchandise, identity products, and institutional stationery — engineered in-house with calibrated precision and delivered Pan-India.
            </p>

            {/* Two Action Buttons side-by-side */}
            <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-3.5 pt-2">
              {/* Primary Gold CTA */}
              <Link
                href="/products"
                className="inline-flex items-center justify-center gap-2.5 px-6 py-3.5 rounded-xl bg-[#D9B878] hover:bg-[#E8CB8D] text-[#102A25] font-heading font-bold text-sm sm:text-base transition-all duration-200 shadow-gold group active:translate-y-0.5"
              >
                <Package className="w-4 h-4 text-[#102A25]" strokeWidth={1.75} />
                <span>Explore Products</span>
                <ArrowRight className="w-4 h-4 text-[#102A25] group-hover:translate-x-1 transition-transform" strokeWidth={1.75} />
              </Link>

              {/* Secondary Outlined CTA */}
              <button
                onClick={onOpenQuote}
                className="inline-flex items-center justify-center gap-2.5 px-6 py-3.5 rounded-xl border border-white/25 hover:border-[#D9B878] text-white hover:text-[#D9B878] bg-white/5 hover:bg-white/10 transition-all duration-200 font-heading font-semibold text-sm sm:text-base active:translate-y-0.5 backdrop-blur-sm"
              >
                <SlidersHorizontal className="w-4 h-4" strokeWidth={1.75} />
                <span>Discuss Your Requirement</span>
              </button>
            </div>

            {/* Four Manufacturing Capability Indicators */}
            <div className="pt-8 border-t border-white/15 grid grid-cols-2 sm:grid-cols-4 gap-5 sm:gap-6">
              {capabilities.map((item, idx) => {
                const Icon = item.icon;
                return (
                  <div key={idx} className="flex flex-col items-start group">
                    <div className="w-9 h-9 rounded-lg bg-white/5 border border-white/15 flex items-center justify-center mb-2.5 text-[#D9B878] group-hover:border-[#D9B878] transition">
                      <Icon className="w-5 h-5 stroke-[1.75]" />
                    </div>
                    <span className="text-white text-xs sm:text-sm font-heading font-bold leading-tight">
                      {item.line1}
                    </span>
                    <span className="text-white/70 text-xs font-sans leading-tight mt-0.5">
                      {item.line2}
                    </span>
                  </div>
                );
              })}
            </div>
          </div>

          {/* RIGHT COLUMN: Seamless Photorealistic Merchandise Staging */}
          {/* Note: Zero card borders, zero cut-off text, zero nested mini-mockups */}
          <div className="lg:col-span-6 xl:col-span-7 relative z-10 flex items-center justify-center lg:justify-end">
            <div className="relative w-full aspect-[904/700] max-w-[680px] lg:max-w-none">
              <Image
                src="/assets/hero_stage_clean.png"
                alt="RR Foundations Branded Corporate Merchandise - Green Water Bottle, Executive Journal, Custom Lanyard, Wooden Keychain, Desk Nameplate, Gift Box"
                fill
                priority
                className="object-contain lg:object-cover object-right"
                sizes="(max-width: 1024px) 100vw, 58vw"
              />
            </div>
          </div>

        </div>
      </div>
    </section>
  );
}
