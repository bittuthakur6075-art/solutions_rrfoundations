"use client";

import React, { useState, useEffect } from "react";
import Link from "next/link";
import Image from "next/image";
import { usePathname } from "next/navigation";
import {
  Menu,
  X,
  ChevronDown,
  ArrowRight,
  Phone,
  Mail,
  Search,
  Factory,
  Boxes,
  Truck,
  Palette,
} from "lucide-react";
import { Button } from "@/components/ui/Button";
import { WhatsAppIcon } from "@/components/ui/Icon";
import { CATEGORIES } from "@/lib/data/categories";
import { COMPANY_INFO, getWhatsAppUrl } from "@/lib/utils";
import { EnquiryModal } from "@/components/ui/EnquiryModal";

export function Header() {
  const [isScrolled, setIsScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [megaMenuOpen, setMegaMenuOpen] = useState(false);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [searchOpen, setSearchOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const pathname = usePathname();

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 15);
    };
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  useEffect(() => {
    setMobileMenuOpen(false);
    setMegaMenuOpen(false);
    setSearchOpen(false);
  }, [pathname]);

  const navLinks = [
    { label: "Home", href: "/" },
    { label: "About Us", href: "/about", hasDropdown: true },
    { label: "Products", href: "/products", hasMegaMenu: true },
    { label: "Manufacturing", href: "/manufacturing", hasDropdown: true },
    { label: "Industries", href: "/industries", hasDropdown: true },
    { label: "Contact Us", href: "/contact" },
  ];

  return (
    <>
      {/* 1. TOP INFORMATION BAR (Exact reference match) */}
      <div className="bg-[#0B1D19] text-white/80 border-b border-white/10 text-[11px] sm:text-xs py-2 px-4 sm:px-6 lg:px-12 font-sans">
        <div className="max-w-[1440px] mx-auto flex flex-col md:flex-row items-center justify-between gap-2">
          {/* Left: Manufacturing Indicators */}
          <div className="flex flex-wrap items-center justify-center md:justify-start gap-3 sm:gap-4 text-white/85">
            <span className="flex items-center gap-1.5 hover:text-gold transition">
              <Factory className="w-3.5 h-3.5 text-[#D9B878]" strokeWidth={1.75} />
              <span>Direct Manufacturer</span>
            </span>
            <span className="text-white/20">|</span>
            <span className="flex items-center gap-1.5 hover:text-gold transition">
              <Palette className="w-3.5 h-3.5 text-[#D9B878]" strokeWidth={1.75} />
              <span>Custom Branding</span>
            </span>
            <span className="hidden sm:inline text-white/20">|</span>
            <span className="hidden sm:flex items-center gap-1.5 hover:text-gold transition">
              <Boxes className="w-3.5 h-3.5 text-[#D9B878]" strokeWidth={1.75} />
              <span>Bulk Production</span>
            </span>
            <span className="hidden md:inline text-white/20">|</span>
            <span className="hidden md:flex items-center gap-1.5 hover:text-gold transition">
              <Truck className="w-3.5 h-3.5 text-[#D9B878]" strokeWidth={1.75} />
              <span>Pan-India Supply</span>
            </span>
          </div>

          {/* Right: Direct Contacts */}
          <div className="flex items-center gap-4 text-white/85">
            <a
              href={`tel:${COMPANY_INFO.phone}`}
              className="flex items-center gap-1.5 hover:text-gold transition font-medium"
            >
              <Phone className="w-3.5 h-3.5 text-[#D9B878]" strokeWidth={1.75} />
              <span>{COMPANY_INFO.phone}</span>
            </a>
            <span className="text-white/20">|</span>
            <a
              href={`mailto:${COMPANY_INFO.email}`}
              className="flex items-center gap-1.5 hover:text-gold transition font-medium"
            >
              <Mail className="w-3.5 h-3.5 text-[#D9B878]" strokeWidth={1.75} />
              <span>sales@rrfoundations.in</span>
            </a>
          </div>
        </div>
      </div>

      {/* 2. MAIN NAVIGATION */}
      <header
        className={`sticky top-0 z-40 transition-all duration-300 ${
          isScrolled
            ? "bg-[#102A25]/95 backdrop-blur-md shadow-luxury border-b border-white/15 py-3"
            : "bg-[#102A25] border-b border-white/10 py-3.5"
        }`}
      >
        <div className="max-w-[1440px] mx-auto px-4 sm:px-6 lg:px-12">
          <div className="flex items-center justify-between">
            {/* Logo */}
            <Link href="/" className="flex items-center gap-2 group">
              <div className="relative h-8 sm:h-9 md:h-10 w-44 sm:w-48 md:w-56">
                <Image
                  src="/assets/rr_logo_white.png"
                  alt="RR FOUNDATIONS®"
                  fill
                  className="object-contain object-left"
                  priority
                />
              </div>
            </Link>

            {/* Desktop Navigation Links */}
            <nav className="hidden lg:flex items-center gap-1 xl:gap-2">
              {navLinks.map((link) => {
                const isActive = pathname === link.href;

                if (link.hasMegaMenu) {
                  return (
                    <div
                      key={link.label}
                      className="relative"
                      onMouseEnter={() => setMegaMenuOpen(true)}
                      onMouseLeave={() => setMegaMenuOpen(false)}
                    >
                      <Link
                        href={link.href}
                        className={`flex items-center gap-1 px-3.5 py-2 text-sm font-heading font-medium transition-colors ${
                          isActive || megaMenuOpen
                            ? "text-[#D9B878] font-semibold"
                            : "text-white/90 hover:text-[#D9B878]"
                        }`}
                      >
                        <span>{link.label}</span>
                        <ChevronDown
                          className={`w-3.5 h-3.5 transition-transform duration-200 ${
                            megaMenuOpen ? "rotate-180 text-[#D9B878]" : "text-white/60"
                          }`}
                        />
                      </Link>

                      {/* Mega Menu Dropdown */}
                      {megaMenuOpen && (
                        <div className="absolute top-full left-1/2 -translate-x-1/2 w-[760px] bg-[#172B27] rounded-2xl shadow-luxury border border-white/15 p-6 mt-1 text-white animate-in fade-in slide-in-from-top-2 duration-200">
                          <div className="flex items-center justify-between pb-3 mb-4 border-b border-white/10">
                            <div>
                              <h4 className="font-heading font-bold text-xs text-[#D9B878] uppercase tracking-widest">
                                Manufacturing Catalogue &amp; Product Lines
                              </h4>
                              <p className="text-xs text-white/70 mt-0.5">
                                Fabricated directly at our New Delhi workshop
                              </p>
                            </div>
                            <Link
                              href="/products"
                              className="text-xs font-heading font-bold text-[#D9B878] hover:underline flex items-center gap-1"
                            >
                              <span>Explore All 260+ Products</span>
                              <ArrowRight className="w-3.5 h-3.5" />
                            </Link>
                          </div>

                          <div className="grid grid-cols-2 gap-3.5">
                            {CATEGORIES.map((cat) => (
                              <Link
                                key={cat.id}
                                href={`/products#${cat.slug}`}
                                className="group flex items-start gap-3 p-3 rounded-xl bg-forest-900/60 hover:bg-forest-800 transition border border-white/5 hover:border-gold/40"
                              >
                                <div className="relative w-12 h-12 rounded-lg overflow-hidden bg-white/5 border border-white/10 flex-shrink-0">
                                  <Image
                                    src={cat.image}
                                    alt={cat.name}
                                    fill
                                    className="object-contain p-1 group-hover:scale-110 transition duration-300"
                                  />
                                </div>
                                <div className="flex-1 min-w-0">
                                  <h5 className="font-heading font-bold text-xs text-white group-hover:text-[#D9B878] transition truncate">
                                    {cat.name}
                                  </h5>
                                  <p className="text-[11px] text-white/70 line-clamp-2 mt-0.5 leading-relaxed">
                                    {cat.description}
                                  </p>
                                </div>
                              </Link>
                            ))}
                          </div>

                          <div className="mt-4 pt-3 border-t border-white/10 flex items-center justify-between bg-forest-900 -mx-6 -mb-6 px-6 py-3 rounded-b-2xl">
                            <span className="text-xs text-white/70">
                              Need custom die-stamping, specialized brass or CAD design?
                            </span>
                            <button
                              onClick={() => {
                                setMegaMenuOpen(false);
                                setIsModalOpen(true);
                              }}
                              className="text-xs font-heading font-bold text-[#D9B878] hover:underline inline-flex items-center gap-1.5"
                            >
                              <span>Request Custom Spec Prototype</span>
                              <ArrowRight className="w-3.5 h-3.5" strokeWidth={1.75} />
                            </button>
                          </div>
                        </div>
                      )}
                    </div>
                  );
                }

                return (
                  <Link
                    key={link.label}
                    href={link.href}
                    className={`relative px-3.5 py-2 text-sm font-heading font-medium transition-colors ${
                      isActive
                        ? "text-white font-semibold"
                        : "text-white/90 hover:text-[#D9B878]"
                    }`}
                  >
                    <span>{link.label}</span>
                    {link.hasDropdown && (
                      <ChevronDown className="w-3 h-3 inline-block ml-1 text-white/50" />
                    )}
                    {isActive && (
                      <span className="absolute bottom-0 left-3.5 right-3.5 h-[2px] bg-[#D9B878] rounded-full" />
                    )}
                  </Link>
                );
              })}
            </nav>

            {/* Right Action Bar: Search Icon + Request a Quote */}
            <div className="hidden lg:flex items-center gap-3">
              {/* Search Toggle */}
              <div className="relative">
                <button
                  onClick={() => setSearchOpen(!searchOpen)}
                  aria-label="Search Catalog"
                  className="w-10 h-10 rounded-xl border border-white/20 hover:border-[#D9B878] flex items-center justify-center text-white/80 hover:text-[#D9B878] transition bg-white/5"
                >
                  <Search className="w-4 h-4" />
                </button>

                {searchOpen && (
                  <div className="absolute right-0 top-full mt-2 w-72 bg-[#172B27] p-2.5 rounded-xl border border-white/20 shadow-luxury animate-in fade-in duration-200">
                    <form
                      onSubmit={(e) => {
                        e.preventDefault();
                        if (searchQuery.trim()) {
                          window.location.href = `/products?search=${encodeURIComponent(searchQuery)}`;
                        }
                      }}
                      className="flex items-center gap-2"
                    >
                      <input
                        type="text"
                        placeholder="Search products, materials..."
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        className="w-full px-3 py-1.5 text-xs rounded-lg bg-forest-900 text-white border border-white/20 focus:border-gold outline-none"
                        autoFocus
                      />
                      <button
                        type="submit"
                        className="px-2.5 py-1.5 bg-[#D9B878] text-[#102A25] rounded-lg text-xs font-bold"
                      >
                        Go
                      </button>
                    </form>
                  </div>
                )}
              </div>

              {/* Primary Gold CTA Button */}
              <button
                onClick={() => setIsModalOpen(true)}
                className="inline-flex items-center justify-center gap-1.5 px-5 py-2.5 rounded-xl bg-[#D9B878] hover:bg-[#E8CB8D] text-[#102A25] font-heading font-bold text-sm transition-all duration-200 shadow-gold active:translate-y-0.5"
              >
                <span>Request a Quote</span>
                <ArrowRight className="w-4 h-4 text-[#102A25]" />
              </button>
            </div>

            {/* Mobile Actions */}
            <div className="flex items-center gap-2 lg:hidden">
              <button
                onClick={() => setIsModalOpen(true)}
                className="px-3.5 py-1.5 rounded-lg bg-[#D9B878] text-[#102A25] font-heading font-bold text-xs inline-flex items-center gap-1"
              >
                <span>Quote</span>
                <ArrowRight className="w-3 h-3" strokeWidth={1.75} />
              </button>
              <button
                onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
                className="p-2 text-white hover:bg-white/10 rounded-lg transition"
                aria-label="Toggle navigation menu"
              >
                {mobileMenuOpen ? (
                  <X className="w-6 h-6 text-[#D9B878]" strokeWidth={1.75} />
                ) : (
                  <Menu className="w-6 h-6" strokeWidth={1.75} />
                )}
              </button>
            </div>
          </div>
        </div>

        {/* Mobile Navigation Drawer */}
        {mobileMenuOpen && (
          <div className="lg:hidden fixed inset-x-0 top-[100px] bottom-0 bg-[#102A25] z-40 border-t border-white/15 flex flex-col justify-between overflow-y-auto animate-in slide-in-from-top-4 duration-300 p-6">
            <div className="space-y-2">
              <div className="mb-4 pb-3 border-b border-white/10">
                <div className="relative h-8 w-44">
                  <Image
                    src="/assets/rr_logo_white.png"
                    alt="RR FOUNDATIONS®"
                    fill
                    className="object-contain object-left"
                  />
                </div>
              </div>
              <span className="text-xs font-heading font-bold text-[#D9B878] uppercase tracking-widest block mb-3">
                Navigation
              </span>
              {navLinks.map((link) => {
                const isActive = pathname === link.href;
                return (
                  <Link
                    key={link.label}
                    href={link.href}
                    onClick={() => setMobileMenuOpen(false)}
                    className={`block px-4 py-3 rounded-xl text-base font-heading font-semibold transition ${
                      isActive
                        ? "bg-[#D9B878] text-[#102A25] font-bold"
                        : "text-white hover:bg-white/5"
                    }`}
                  >
                    {link.label}
                  </Link>
                );
              })}

              <div className="pt-4 border-t border-white/10">
                <span className="text-xs font-heading font-bold text-[#D9B878] uppercase tracking-widest block mb-3">
                  Product Categories
                </span>
                <div className="grid grid-cols-1 gap-2">
                  {CATEGORIES.slice(0, 4).map((c) => (
                    <Link
                      key={c.id}
                      href={`/products#${c.slug}`}
                      onClick={() => setMobileMenuOpen(false)}
                      className="flex items-center justify-between p-2.5 rounded-lg bg-forest-800 text-xs font-heading font-semibold text-white/90 hover:text-gold"
                    >
                      <span>{c.name}</span>
                      <ArrowRight className="w-3.5 h-3.5 text-[#D9B878]" />
                    </Link>
                  ))}
                </div>
              </div>
            </div>

            {/* Mobile Footer & Direct Contact */}
            <div className="pt-6 border-t border-white/10 space-y-3">
              <button
                onClick={() => {
                  setMobileMenuOpen(false);
                  setIsModalOpen(true);
                }}
                className="w-full py-3.5 bg-[#D9B878] text-[#102A25] rounded-xl font-heading font-bold text-sm inline-flex items-center justify-center gap-2"
              >
                <span>Request a Bulk Quote</span>
                <ArrowRight className="w-4 h-4" strokeWidth={1.75} />
              </button>
              <Button
                variant="outline"
                size="md"
                className="w-full border-white/20 gap-2"
                href={getWhatsAppUrl()}
                external
              >
                <WhatsAppIcon className="w-4 h-4 text-[#25D366]" />
                <span>Chat on WhatsApp (+91 74280 45813)</span>
              </Button>
              <p className="text-center text-xs text-white/60">
                {COMPANY_INFO.address}
              </p>
            </div>
          </div>
        )}
      </header>

      {/* Global RFQ Quote Modal */}
      <EnquiryModal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
      />
    </>
  );
}
