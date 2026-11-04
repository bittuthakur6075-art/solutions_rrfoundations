import React from "react";
import Link from "next/link";
import Image from "next/image";
import { Mail, Phone, MapPin, Clock, ArrowRight } from "lucide-react";
import { WhatsAppIcon } from "@/components/ui/Icon";
import { COMPANY_INFO, getWhatsAppUrl } from "@/lib/utils";
import { CATEGORIES } from "@/lib/data/categories";

export function Footer() {
  const currentYear = 2026;

  return (
    <footer className="bg-[#0B1D19] text-white border-t border-white/10 font-sans">
      {/* Upper Pre-footer Banner */}
      <div className="border-b border-white/10 bg-[#102A25]/50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 sm:py-12 flex flex-col md:flex-row items-start md:items-center justify-between gap-6">
          <div>
            <span className="text-gold font-heading font-semibold text-xs uppercase tracking-widest block mb-1">
              Procurement &amp; Turnkey Fabrication
            </span>
            <h3 className="font-serif text-2xl sm:text-3xl text-white">
              Ready to manufacture your custom physical products?
            </h3>
            <p className="text-white/70 text-sm mt-1 max-w-xl font-light">
              Connect directly with our engineering and production desk in New Delhi for custom prototypes, material samples, and institutional bulk discounts.
            </p>
          </div>
          <div className="flex flex-wrap items-center gap-3">
            <Link
              href="/request-quote"
              className="px-6 py-3 bg-gold text-forest-950 rounded-xl font-heading font-bold text-sm hover:bg-gold-hover transition shadow-gold"
            >
              Request a Bulk Quote
            </Link>
            <a
              href={getWhatsAppUrl()}
              target="_blank"
              rel="noopener noreferrer"
              className="px-6 py-3 bg-white/5 hover:bg-white/10 text-white border border-white/15 rounded-xl font-heading font-semibold text-sm transition flex items-center gap-2"
            >
              <WhatsAppIcon className="w-4 h-4 text-[#25D366]" />
              <span>WhatsApp Us</span>
            </a>
          </div>
        </div>
      </div>

      {/* Main Footer Links */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-10 lg:gap-8">
          {/* Brand Info */}
          <div className="lg:col-span-2 space-y-4">
            <Link href="/" className="inline-block group">
              <div className="relative h-9 sm:h-10 w-48 sm:w-56">
                <Image
                  src="/assets/rr_logo_white.png"
                  alt="RR FOUNDATIONS®"
                  fill
                  className="object-contain object-left group-hover:opacity-90 transition"
                />
              </div>
            </Link>

            <p className="text-white/75 text-sm leading-relaxed max-w-sm font-light">
              Professional manufacturing and custom product solutions. Precision metal badges, conference credential kits, UV-printed MDF clipboards, and corporate merchandise engineered with industrial consistency.
            </p>

            <div className="pt-2 text-xs text-white/60 space-y-1.5">
              <p className="flex items-center gap-2">
                <span className="w-1.5 h-1.5 rounded-full bg-gold/80 flex-shrink-0" />
                <span>Verified Production Facilities in New Delhi</span>
              </p>
              <p className="flex items-center gap-2">
                <span className="w-1.5 h-1.5 rounded-full bg-gold/80 flex-shrink-0" />
                <span>Nationwide Logistics &amp; Custom Institutional Packing</span>
              </p>
            </div>
          </div>

          {/* Product Categories */}
          <div>
            <h4 className="font-heading font-bold text-xs text-gold uppercase tracking-widest mb-4 border-b border-white/10 pb-2">
              Product Categories
            </h4>
            <ul className="space-y-2.5 text-sm">
              {CATEGORIES.map((cat) => (
                <li key={cat.id}>
                  <Link
                    href={`/products#${cat.slug}`}
                    className="text-white/70 hover:text-gold transition flex items-center justify-between group"
                  >
                    <span>{cat.name}</span>
                    <ArrowRight className="w-3 h-3 opacity-0 group-hover:opacity-100 transition-opacity text-gold" strokeWidth={1.75} />
                  </Link>
                </li>
              ))}
              <li>
                <Link
                  href="/products"
                  className="text-gold font-medium hover:underline text-xs inline-flex items-center gap-1.5 pt-1 group"
                >
                  <span>View All Verified Products</span>
                  <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-0.5 transition-transform" strokeWidth={1.75} />
                </Link>
              </li>
            </ul>
          </div>

          {/* Quick Links */}
          <div>
            <h4 className="font-heading font-bold text-xs text-gold uppercase tracking-widest mb-4 border-b border-white/10 pb-2">
              Corporate &amp; Capabilities
            </h4>
            <ul className="space-y-2.5 text-sm">
              <li>
                <Link href="/about" className="text-white/70 hover:text-gold transition">
                  About Our Company
                </Link>
              </li>
              <li>
                <Link href="/manufacturing" className="text-white/70 hover:text-gold transition">
                  Manufacturing Capabilities
                </Link>
              </li>
              <li>
                <Link href="/industries" className="text-white/70 hover:text-gold transition">
                  Industries We Serve
                </Link>
              </li>
              <li>
                <Link href="/request-quote" className="text-white/70 hover:text-gold transition">
                  Request a Formal Quote
                </Link>
              </li>
              <li>
                <Link href="/contact" className="text-white/70 hover:text-gold transition">
                  Contact &amp; Location
                </Link>
              </li>
            </ul>
          </div>

          {/* Verified Contact Details */}
          <div>
            <h4 className="font-heading font-bold text-xs text-gold uppercase tracking-widest mb-4 border-b border-white/10 pb-2">
              Verified Office &amp; Facility
            </h4>
            <ul className="space-y-3.5 text-sm">
              <li className="flex items-start gap-2.5 text-white/80">
                <MapPin className="w-4 h-4 text-gold flex-shrink-0 mt-1" strokeWidth={1.75} />
                <span className="text-xs leading-relaxed font-light">
                  {COMPANY_INFO.address}
                </span>
              </li>
              <li className="flex items-center gap-2.5 text-white/80">
                <Phone className="w-4 h-4 text-gold flex-shrink-0" strokeWidth={1.75} />
                <a
                  href={`tel:${COMPANY_INFO.phone}`}
                  className="text-xs hover:text-gold transition"
                >
                  {COMPANY_INFO.phone}
                </a>
              </li>
              <li className="flex items-center gap-2.5 text-white/80">
                <Mail className="w-4 h-4 text-gold flex-shrink-0" strokeWidth={1.75} />
                <a
                  href={`mailto:${COMPANY_INFO.email}`}
                  className="text-xs hover:text-gold transition"
                >
                  {COMPANY_INFO.email}
                </a>
              </li>
              <li className="flex items-center gap-2.5 text-white/80">
                <Clock className="w-4 h-4 text-gold flex-shrink-0" strokeWidth={1.75} />
                <span className="text-xs font-light">{COMPANY_INFO.hours}</span>
              </li>
            </ul>
          </div>
        </div>

        {/* Legal & Subfooter */}
        <div className="mt-14 pt-8 border-t border-white/10 flex flex-col sm:flex-row items-center justify-between gap-4 text-xs text-white/50">
          <p>© {currentYear} {COMPANY_INFO.name}. All verified manufacturing rights reserved.</p>
          <div className="flex items-center gap-6">
            <Link href="/privacy-policy" className="hover:text-gold transition">
              Privacy Policy
            </Link>
            <Link href="/terms-and-conditions" className="hover:text-gold transition">
              Terms &amp; Conditions
            </Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
