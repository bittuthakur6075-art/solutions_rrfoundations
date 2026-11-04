"use client";

import React, { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import {
  ArrowRight,
  Factory,
  Palette,
  Layers,
  Boxes,
  Building2,
  Truck,
  Search,
  FileCheck,
  Settings,
  PackageCheck,
  Package,
} from "lucide-react";
import { EnquiryModal } from "@/components/ui/EnquiryModal";

export default function AboutPage() {
  const [isQuoteOpen, setIsQuoteOpen] = useState(false);

  const productExpertise = [
    {
      title: "Metal Badges & Insignia",
      description: "Magnetic badges, pin badges, name badges and customised insignia.",
      image: "/assets/about/about_exp_badges.png",
      href: "/products?category=badges-lapel-pins",
    },
    {
      title: "Acrylic Products",
      description: "Acrylic keychains, magnets, accessories and customised merchandise.",
      image: "/assets/about/about_exp_acrylic.png",
      href: "/products?category=keychains-acrylic-crafts",
    },
    {
      title: "MDF Products",
      description: "MDF clipboards, keychains, magnets and customised products.",
      image: "/assets/about/about_exp_mdf.png",
      href: "/products?category=examboards-stationery",
    },
    {
      title: "Corporate Merchandise",
      description: "Lanyards, bottles, pens, stationery and branded accessories.",
      image: "/assets/about/about_exp_merch.png",
      href: "/products?category=executive-pens",
    },
    {
      title: "Conference & Event Kits",
      description: "Delegate kits, event merchandise and institutional products.",
      image: "/assets/about/about_exp_events.png",
      href: "/products?category=lanyards-credentials",
    },
    {
      title: "Corporate Gifting",
      description: "Customised gift hampers and curated business gifting products.",
      image: "/assets/about/about_exp_gifting.png",
      href: "/products?category=photo-frames-awards",
    },
  ];

  const differences = [
    {
      icon: Factory,
      title: "Direct Manufacturing & Product Coordination",
    },
    {
      icon: Palette,
      title: "Custom Branding & Product Personalisation",
    },
    {
      icon: Layers,
      title: "Multiple Product Categories Under One Partner",
    },
    {
      icon: Boxes,
      title: "Bulk & Institutional Order Support",
    },
    {
      icon: Building2,
      title: "New Delhi-based Business Operations",
    },
    {
      icon: Truck,
      title: "Pan-India Order Coordination & Supply",
    },
  ];

  const processSteps = [
    {
      number: "01",
      name: "Understand",
      icon: Search,
      description: "We understand your product requirement, quantity and intended application.",
    },
    {
      number: "02",
      name: "Plan",
      icon: FileCheck,
      description: "We identify suitable product options, materials and customisation possibilities.",
    },
    {
      number: "03",
      name: "Produce",
      icon: Settings,
      description: "The approved product brief moves into the relevant production workflow.",
    },
    {
      number: "04",
      name: "Deliver",
      icon: PackageCheck,
      description: "Completed orders are coordinated for delivery to the required destination.",
    },
  ];

  return (
    <div className="min-h-screen bg-[#F7F4EE] text-[#182A25]">
      {/* 1. DARK EDITORIAL HERO */}
      <section className="bg-[#102A25] text-white pt-8 pb-14 sm:pt-10 sm:pb-20 border-b border-white/10 relative overflow-hidden">
        {/* Ambient glow */}
        <div className="absolute top-1/4 right-1/4 w-[600px] h-[600px] bg-[#163830]/40 rounded-full blur-[160px] pointer-events-none" />

        <div className="max-w-[1440px] mx-auto px-4 sm:px-6 lg:px-12 relative z-10">
          {/* Breadcrumbs */}
          <div className="flex items-center gap-2 text-xs text-white/60 mb-6 font-heading">
            <Link href="/" className="hover:text-[#D9B878] transition">
              Home
            </Link>
            <span>/</span>
            <span className="text-[#D9B878] font-semibold">About Us</span>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-8 items-center">
            {/* Left Content */}
            <div className="lg:col-span-6 xl:col-span-6 space-y-5">
              <div className="flex items-center gap-2.5">
                <span className="w-8 h-[2px] bg-[#D9B878]" />
                <span className="text-[#D9B878] font-heading font-bold text-xs uppercase tracking-[0.22em]">
                  WHO WE ARE &bull; RR FOUNDATIONS
                </span>
              </div>

              <h1 className="font-serif text-3xl sm:text-4xl lg:text-[46px] xl:text-[52px] text-white tracking-tight leading-[1.24] sm:leading-[1.22] font-normal">
                <span className="block">We Turn Ideas Into Products.</span>
                <span className="block mt-1.5 sm:mt-2">
                  Built for Businesses,{" "}
                  <span className="italic font-serif text-[#D9B878]">
                    Made to Last.
                  </span>
                </span>
              </h1>

              <p className="text-white/85 text-base sm:text-lg leading-relaxed font-sans font-light max-w-xl">
                RR Foundations is a New Delhi-based manufacturing and product solutions company specialising in customised products for businesses, institutions and organisations. From precision metal badges and corporate merchandise to MDF products, conference kits and customised gifting, we bring diverse product requirements together under one manufacturing partner.
              </p>
            </div>

            {/* Right Merchandise Staging */}
            <div className="lg:col-span-6 xl:col-span-6 flex justify-center lg:justify-end">
              <div className="relative w-full aspect-[519/320] max-w-[620px]">
                <Image
                  src="/assets/about/about_hero_stage.png"
                  alt="RR Foundations Branded Corporate Merchandise - Bottle, Journal, Lanyard, Pin, Nameplate, Gift Box"
                  fill
                  priority
                  className="object-contain object-right"
                  sizes="(max-width: 1024px) 100vw, 50vw"
                />
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* 2. OUR APPROACH (Warm Ivory) */}
      <section className="py-16 sm:py-24 bg-[#F7F4EE] border-b border-[#E8E2D7]">
        <div className="max-w-[1440px] mx-auto px-4 sm:px-6 lg:px-12">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-10 lg:gap-14 items-center">
            {/* Left Photo: Craftsman laser engraving */}
            <div className="lg:col-span-5">
              <div className="relative rounded-2xl sm:rounded-3xl overflow-hidden shadow-card border border-[#E8E2D7] aspect-[400/236]">
                <Image
                  src="/assets/about/about_laser_craft.jpg"
                  alt="Precision laser manufacturing and medal finishing at RR Foundations"
                  fill
                  className="object-cover"
                />
              </div>
            </div>

            {/* Right Story */}
            <div className="lg:col-span-7 space-y-5">
              <div className="flex items-center gap-2.5">
                <span className="w-8 h-[2px] bg-[#D9B878]" />
                <span className="text-[#B89650] font-heading font-bold text-xs uppercase tracking-[0.22em]">
                  OUR APPROACH
                </span>
              </div>

              <h2 className="font-serif text-3xl sm:text-4xl lg:text-[42px] text-[#182A25] tracking-tight leading-[1.15] font-normal">
                More Than Products. A Manufacturing Partner{" "}
                <span className="italic font-serif text-[#B89650]">
                  You Can Rely On.
                </span>
              </h2>

              <p className="text-[#5C6E66] text-base sm:text-lg leading-relaxed font-sans">
                We work with businesses and institutions to create products that represent their identity, serve their requirements and make a lasting impression.
              </p>

              <p className="text-[#5C6E66] text-base leading-relaxed font-sans">
                Whether it is a customised badge, an institutional accessory, a branded merchandise collection or a bulk corporate gifting requirement, our focus is on understanding the brief, selecting suitable materials and delivering products that meet the intended purpose.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* 3. OUR PRODUCT EXPERTISE (Dark Forest Green) */}
      <section className="py-16 sm:py-24 bg-[#102A25] text-white border-b border-white/10">
        <div className="max-w-[1440px] mx-auto px-4 sm:px-6 lg:px-12">
          {/* Section Header */}
          <div className="mb-12">
            <div className="flex items-center gap-2.5 mb-2.5">
              <span className="w-8 h-[2px] bg-[#D9B878]" />
              <span className="text-[#D9B878] font-heading font-bold text-xs uppercase tracking-[0.22em]">
                OUR PRODUCT EXPERTISE
              </span>
            </div>
            <h2 className="font-serif text-3xl sm:text-4xl lg:text-[46px] text-white tracking-tight font-normal">
              Diverse Products.{" "}
              <span className="italic font-serif text-[#D9B878]">
                One Manufacturing Partner.
              </span>
            </h2>
          </div>

          {/* 6-Card Grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {productExpertise.map((cat, idx) => (
              <Link
                key={idx}
                href={cat.href}
                className="group bg-white rounded-2xl p-4 sm:p-5 flex items-center gap-4 transition-all duration-300 hover:shadow-luxury hover:-translate-y-0.5 border border-[#E8E2D7]"
              >
                {/* Product Thumbnail Frame */}
                <div className="relative w-28 h-20 sm:w-32 sm:h-22 rounded-xl bg-[#F7F4EE] flex-shrink-0 overflow-hidden border border-[#E8E2D7]">
                  <Image
                    src={cat.image}
                    alt={cat.title}
                    fill
                    className="object-contain p-2 group-hover:scale-105 transition-transform duration-300"
                  />
                </div>

                {/* Content */}
                <div className="flex-1 min-w-0">
                  <h3 className="font-heading font-bold text-sm sm:text-base text-[#182A25] group-hover:text-[#B89650] transition truncate">
                    {cat.title}
                  </h3>
                  <p className="text-xs text-[#5C6E66] line-clamp-2 mt-1 leading-relaxed">
                    {cat.description}
                  </p>
                  <div className="flex items-center gap-1 text-xs font-heading font-bold text-[#182A25] group-hover:text-[#B89650] transition mt-2">
                    <span className="opacity-0 group-hover:opacity-100 transition-opacity">Explore</span>
                    <ArrowRight className="w-3.5 h-3.5 text-[#D9B878] group-hover:translate-x-1 transition-transform" strokeWidth={1.75} />
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* 4. THE RR FOUNDATIONS DIFFERENCE (Warm Ivory) */}
      <section className="py-16 sm:py-24 bg-[#F7F4EE] border-b border-[#E8E2D7]">
        <div className="max-w-[1440px] mx-auto px-4 sm:px-6 lg:px-12">
          {/* Section Header */}
          <div className="mb-12">
            <div className="flex items-center gap-2.5 mb-2.5">
              <span className="w-8 h-[2px] bg-[#D9B878]" />
              <span className="text-[#B89650] font-heading font-bold text-xs uppercase tracking-[0.22em]">
                THE RR FOUNDATIONS DIFFERENCE
              </span>
            </div>
            <h2 className="font-serif text-3xl sm:text-4xl lg:text-[42px] text-[#182A25] tracking-tight font-normal">
              Built Around Your Requirements. Focused on the{" "}
              <span className="italic font-serif text-[#B89650]">
                Finished Product.
              </span>
            </h2>
          </div>

          {/* 6 Capability Points */}
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-6 sm:gap-8">
            {differences.map((diff, idx) => {
              const Icon = diff.icon;
              return (
                <div key={idx} className="flex flex-col items-start group">
                  <div className="w-12 h-12 rounded-xl bg-white border border-[#E8E2D7] shadow-sm flex items-center justify-center mb-3 text-[#B89650] group-hover:border-[#D9B878] transition">
                    <Icon className="w-6 h-6 stroke-[1.75]" />
                  </div>
                  <h4 className="font-heading font-bold text-xs sm:text-sm text-[#182A25] leading-snug">
                    {diff.title}
                  </h4>
                </div>
              );
            })}
          </div>
        </div>
      </section>

      {/* 5. OUR PRODUCT PROCESS (Dark Forest Green) */}
      <section className="py-16 sm:py-24 bg-[#102A25] text-white border-b border-white/10">
        <div className="max-w-[1440px] mx-auto px-4 sm:px-6 lg:px-12">
          {/* Section Header */}
          <div className="mb-12">
            <div className="flex items-center gap-2.5 mb-2.5">
              <span className="w-8 h-[2px] bg-[#D9B878]" />
              <span className="text-[#D9B878] font-heading font-bold text-xs uppercase tracking-[0.22em]">
                OUR PRODUCT PROCESS
              </span>
            </div>
            <h2 className="font-serif text-3xl sm:text-4xl lg:text-[46px] text-white tracking-tight font-normal">
              From Your Requirement to the{" "}
              <span className="italic font-serif text-[#D9B878]">
                Finished Product.
              </span>
            </h2>
          </div>

          {/* 4 Step Cards */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {processSteps.map((step) => {
              const Icon = step.icon;
              return (
                <div
                  key={step.number}
                  className="bg-[#172B27] border border-white/15 rounded-2xl p-6 flex flex-col justify-between group hover:border-[#D9B878] transition-all duration-300"
                >
                  <div>
                    {/* Circle Icon */}
                    <div className="w-11 h-11 rounded-full bg-white/5 border border-white/20 flex items-center justify-center mb-4 text-[#D9B878] group-hover:bg-[#D9B878] group-hover:text-[#102A25] transition-colors">
                      <Icon className="w-5 h-5 stroke-[1.75]" />
                    </div>

                    {/* Step Number & Title */}
                    <h3 className="font-heading font-bold text-base text-white mb-2">
                      <span className="text-[#D9B878] mr-2">{step.number}</span>
                      {step.name}
                    </h3>

                    {/* Description */}
                    <p className="text-white/75 text-xs sm:text-sm leading-relaxed font-sans font-light">
                      {step.description}
                    </p>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </section>

      {/* 6. BOTTOM CTA BANNER (Card on Warm Ivory) */}
      <section className="py-16 sm:py-24 bg-[#F7F4EE]">
        <div className="max-w-[1440px] mx-auto px-4 sm:px-6 lg:px-12">
          <div className="bg-[#102A25] text-white rounded-3xl border border-white/15 p-8 sm:p-12 lg:p-14 shadow-luxury">
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-center">
              {/* Left Badge Preview */}
              <div className="lg:col-span-3 flex justify-center lg:justify-start">
                <div className="relative w-44 h-28 sm:w-52 sm:h-32">
                  <Image
                    src="/assets/about/about_cta_badge.png"
                    alt="Indian Tricolor metallic pin badges manufactured by RR Foundations"
                    fill
                    className="object-contain"
                  />
                </div>
              </div>

              {/* Center Copy */}
              <div className="lg:col-span-6 space-y-3">
                <h3 className="font-serif text-2xl sm:text-3xl lg:text-4xl text-white tracking-tight leading-[1.25] font-normal">
                  <span className="block">Have a Product Requirement?</span>
                  <span className="block mt-1 italic font-serif text-[#D9B878]">
                    Let&apos;s Build It Together.
                  </span>
                </h3>
                <p className="text-white/80 text-sm sm:text-base leading-relaxed font-sans font-light max-w-xl">
                  From a single customised product concept to large institutional and corporate batches, tell us what you need. Our team will help you explore the right product and manufacturing solution.
                </p>
              </div>

              {/* Right Action Buttons */}
              <div className="lg:col-span-3 flex flex-col gap-3 justify-center">
                <button
                  onClick={() => setIsQuoteOpen(true)}
                  className="w-full inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-xl bg-[#D9B878] hover:bg-[#E8CB8D] text-[#102A25] font-heading font-bold text-sm transition-all duration-200 shadow-gold active:translate-y-0.5"
                >
                  <span>Discuss Your Requirement</span>
                  <ArrowRight className="w-4 h-4 text-[#102A25]" strokeWidth={1.75} />
                </button>

                <Link
                  href="/products"
                  className="w-full inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-xl border border-white/20 hover:border-[#D9B878] text-white hover:text-[#D9B878] bg-white/5 hover:bg-white/10 transition-all duration-200 font-heading font-semibold text-sm active:translate-y-0.5"
                >
                  <Package className="w-4 h-4" strokeWidth={1.75} />
                  <span>Explore Our Products</span>
                </Link>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Quote Modal */}
      <EnquiryModal
        isOpen={isQuoteOpen}
        onClose={() => setIsQuoteOpen(false)}
      />
    </div>
  );
}
