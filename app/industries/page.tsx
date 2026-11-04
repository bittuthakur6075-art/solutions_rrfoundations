import React from "react";
import Link from "next/link";
import Image from "next/image";
import {
  ArrowRight,
  Factory,
  Palette,
  Layers,
  FileCheck,
  Boxes,
  Truck,
  Package,
} from "lucide-react";
import { INDUSTRIES } from "@/lib/data/industries";

export const metadata = {
  title: "Industries We Serve | RR Foundations",
  description:
    "Products that fit your industry. Solutions that fit your needs. Customised corporate merchandise, institutional accessories, event kits, and bulk manufacturing across 9 key sectors.",
};

const DIFFERENCE_FEATURES = [
  {
    icon: Factory,
    title: "Diverse Product Manufacturing",
    description: "Access multiple product categories and customised product options.",
  },
  {
    icon: Palette,
    title: "Custom Branding & Personalisation",
    description: "Bring your brand identity to life with suitable branding options.",
  },
  {
    icon: Layers,
    title: "Multiple Categories Under One Partner",
    description: "Coordinate different product requirements together, with ease.",
  },
  {
    icon: FileCheck,
    title: "Design & Artwork Coordination",
    description: "Share your artwork and requirements for a smooth production process.",
  },
  {
    icon: Boxes,
    title: "Bulk Order Support",
    description: "Get product recommendations and quotations for bulk requirements.",
  },
  {
    icon: Truck,
    title: "Pan-India Supply",
    description: "Based in New Delhi, we support order coordination and supply across India.",
  },
];

export default function IndustriesPage() {
  return (
    <div className="min-h-screen bg-[#F7F4EE] text-[#182A25] font-sans selection:bg-[#C5A262] selection:text-[#0D2A22]">
      {/* 1. HERO SECTION */}
      <section className="bg-[#0D2820] text-white border-b border-white/10 relative overflow-hidden pt-8 pb-12 sm:pb-16 lg:pb-20">
        {/* Ambient subtle glow */}
        <div className="absolute top-0 right-1/4 w-[500px] h-[500px] bg-[#C5A262]/5 rounded-full blur-[140px] pointer-events-none" />

        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          {/* Breadcrumb */}
          <div className="flex items-center gap-2 text-xs text-white/60 mb-8 font-heading">
            <Link href="/" className="hover:text-[#C5A262] transition">
              Home
            </Link>
            <span>/</span>
            <span className="text-[#C5A262] font-semibold">Industries</span>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-12 items-center">
            {/* Left Column: Typography */}
            <div className="lg:col-span-7">
              <div className="flex items-center gap-2 mb-3">
                <span className="text-[#C5A262] font-heading font-bold text-xs uppercase tracking-[0.2em]">
                  — CUSTOM PRODUCTS FOR EVERY INDUSTRY
                </span>
              </div>

              <h1 className="font-serif text-4xl sm:text-5xl lg:text-[54px] text-white tracking-tight leading-[1.12] font-bold">
                Products That Fit<br />
                Your Industry.<br />
                Solutions That Fit<br />
                Your Needs.
              </h1>

              <p className="text-white/80 text-sm sm:text-base mt-6 leading-relaxed font-light max-w-xl">
                From corporate merchandise and employee identity products to
                institutional accessories, event merchandise and customised
                gifting, RR Foundations helps businesses and organisations
                bring their product requirements to life.
              </p>
            </div>

            {/* Right Column: Hero Products Showcase Image */}
            <div className="lg:col-span-5 relative flex justify-center lg:justify-end">
              <div className="relative w-full max-w-[500px] aspect-[564/361] rounded-2xl overflow-hidden shadow-2xl border border-white/10 bg-[#0A1F19]">
                <Image
                  src="/assets/industries/hero_products.png"
                  alt="RR Foundations Sector Product Solutions"
                  fill
                  priority
                  className="object-cover object-right"
                  sizes="(max-width: 768px) 100vw, 500px"
                />
                <div className="absolute inset-0 pointer-events-none bg-gradient-to-r from-[#0D2820]/40 via-transparent to-transparent" />
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* 2. WHO WE SERVE: 9 SECTOR CARDS */}
      <section className="py-16 sm:py-24 bg-[#F7F4EE]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          {/* Header */}
          <div className="text-center max-w-3xl mx-auto mb-12 sm:mb-16">
            <span className="text-xs font-heading font-bold text-[#B89650] uppercase tracking-[0.25em] block mb-2">
              — WHO WE SERVE —
            </span>
            <h2 className="font-serif text-3xl sm:text-4xl lg:text-5xl text-[#182A25] tracking-tight font-bold">
              Sectors We{" "}
              <span className="italic font-normal text-[#B89650]">
                Specialize In
              </span>
            </h2>
            <p className="text-xs sm:text-sm text-[#5C6E66] mt-3 font-light leading-relaxed">
              Every sector has different requirements. We build to the standard
              yours works to.
            </p>
          </div>

          {/* 3x3 Grid of Sector Cards */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5 sm:gap-6">
            {INDUSTRIES.map((ind) => {
              const isDark = ind.theme === "dark";
              return (
                <div
                  key={ind.id}
                  className={`rounded-2xl overflow-hidden border transition-all duration-300 flex flex-row hover:shadow-lg ${
                    isDark
                      ? "bg-[#0D2821] border-[#18392F] text-white hover:border-[#C5A262]/50"
                      : "bg-[#F5EDE1] border-[#E5DACB] text-[#182A25] hover:border-[#B89650]/50"
                  }`}
                >
                  {/* Left Column: Product Thumbnail Photo */}
                  <div
                    className={`relative w-[110px] sm:w-[125px] flex-shrink-0 m-3 rounded-xl overflow-hidden shadow-inner ${
                      isDark ? "bg-[#071914]" : "bg-[#EAE0D2]"
                    }`}
                  >
                    <Image
                      src={ind.image}
                      alt={ind.name}
                      fill
                      className="object-cover object-center"
                      sizes="125px"
                    />
                  </div>

                  {/* Right Column: Card Content */}
                  <div className="py-3.5 pr-3.5 pl-1 flex flex-col justify-between flex-1 min-w-0">
                    <div>
                      {/* Sector Number */}
                      <span
                        className={`text-xs font-heading font-extrabold tracking-wider block ${
                          isDark ? "text-[#C5A262]" : "text-[#B89650]"
                        }`}
                      >
                        {ind.num}
                      </span>

                      {/* Sector Title */}
                      <h3
                        className={`font-serif text-base sm:text-[17px] font-bold leading-tight mt-0.5 truncate ${
                          isDark ? "text-white" : "text-[#182A25]"
                        }`}
                        title={ind.name}
                      >
                        {ind.name}
                      </h3>

                      {/* Sector Description */}
                      <p
                        className={`text-[11px] sm:text-xs leading-relaxed font-light mt-1.5 line-clamp-2 ${
                          isDark ? "text-white/70" : "text-[#5C6E66]"
                        }`}
                      >
                        {ind.description}
                      </p>

                      {/* Tag Pills */}
                      <div className="flex flex-wrap gap-1.5 mt-3">
                        {ind.tags?.map((tag, idx) => (
                          <span
                            key={idx}
                            className={`text-[10px] px-2 py-0.5 rounded-full font-medium tracking-tight ${
                              isDark
                                ? "bg-white/10 text-white/90 border border-white/10"
                                : "bg-white text-[#182A25] border border-[#DDD4C6]"
                            }`}
                          >
                            {tag}
                          </span>
                        ))}
                      </div>
                    </div>

                    {/* Bottom Action Link */}
                    <div className="mt-3.5 pt-2 border-t border-transparent">
                      <Link
                        href={ind.actionHref || `/request-quote?industry=${ind.id}`}
                        className={`inline-flex items-center gap-1.5 text-xs font-semibold group transition ${
                          isDark
                            ? "text-[#C5A262] hover:text-white"
                            : "text-[#182A25] hover:text-[#B89650]"
                        }`}
                      >
                        <span>{ind.actionText || "Explore Solutions"}</span>
                        <ArrowRight className="w-3.5 h-3.5 transition-transform duration-300 group-hover:translate-x-1" strokeWidth={1.75} />
                      </Link>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </section>

      {/* 3. THE RR FOUNDATIONS DIFFERENCE: EVERYTHING UNDER ONE ROOF */}
      <section className="py-16 sm:py-20 bg-[#F7F4EE] border-t border-[#EAE3D6]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center max-w-2xl mx-auto mb-14">
            <span className="text-xs font-heading font-bold text-[#B89650] uppercase tracking-[0.25em] block mb-2">
              — THE RR FOUNDATIONS DIFFERENCE —
            </span>
            <h2 className="font-serif text-3xl sm:text-4xl text-[#182A25] tracking-tight font-bold">
              Everything Under One Roof
            </h2>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-6 sm:gap-8">
            {DIFFERENCE_FEATURES.map((item, idx) => {
              const Icon = item.icon;
              return (
                <div key={idx} className="flex flex-col items-start text-left">
                  <div className="w-9 h-9 rounded-lg bg-[#EFE8DC] flex items-center justify-center text-[#B89650] mb-3.5">
                    <Icon className="w-5 h-5 stroke-[1.75]" />
                  </div>
                  <h4 className="font-heading font-bold text-xs sm:text-[13px] text-[#182A25] leading-snug">
                    {item.title}
                  </h4>
                  <p className="text-[11px] text-[#5C6E66] font-light leading-relaxed mt-1.5">
                    {item.description}
                  </p>
                </div>
              );
            })}
          </div>
        </div>
      </section>

      {/* 4. BOTTOM CTA BANNER: LET'S BUILD IT TOGETHER */}
      <section className="py-12 sm:py-16 bg-[#F7F4EE]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="bg-[#0D2820] rounded-3xl p-8 sm:p-12 lg:p-14 text-white relative overflow-hidden border border-white/10 shadow-2xl">
            {/* Ambient decorative glow */}
            <div className="absolute top-0 right-0 w-[400px] h-[400px] bg-[#C5A262]/10 rounded-full blur-[100px] pointer-events-none" />

            <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-center relative z-10">
              {/* Left Column: Heading & Description */}
              <div className="lg:col-span-6">
                <h2 className="font-serif text-3xl sm:text-4xl lg:text-5xl text-white font-bold tracking-tight leading-tight">
                  Have a Product Requirement?<br />
                  <span className="italic font-normal text-[#C5A262]">
                    Let&apos;s Build It Together.
                  </span>
                </h2>
                <p className="text-white/80 text-xs sm:text-sm leading-relaxed mt-4 font-light max-w-lg">
                  From a single customised product concept to large institutional
                  and corporate batches, tell us what you need. Our team will
                  help you explore the right product and manufacturing solution.
                </p>
              </div>

              {/* Middle Column: Buttons */}
              <div className="lg:col-span-3 flex flex-col sm:flex-row lg:flex-col gap-3 justify-center">
                <Link
                  href="/request-quote"
                  className="inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-lg bg-[#C5A262] text-[#0D2820] font-heading font-bold text-xs sm:text-sm hover:bg-[#D4AF37] transition shadow-md whitespace-nowrap"
                >
                  <span>Discuss Your Requirement</span>
                  <ArrowRight className="w-4 h-4" strokeWidth={1.75} />
                </Link>

                <Link
                  href="/products"
                  className="inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-lg border border-white/25 text-white font-heading font-semibold text-xs sm:text-sm hover:bg-white/10 transition whitespace-nowrap"
                >
                  <Package className="w-4 h-4 text-[#C5A262]" strokeWidth={1.75} />
                  <span>Explore Our Products</span>
                </Link>
              </div>

              {/* Right Column: Luxury Gift Box Image */}
              <div className="lg:col-span-3 flex justify-center lg:justify-end">
                <div className="relative w-[215px] h-[145px] drop-shadow-2xl">
                  <Image
                    src="/assets/industries/cta_gift_box.png"
                    alt="RR Foundations Corporate Hamper Gift Box"
                    fill
                    className="object-contain"
                    sizes="215px"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
