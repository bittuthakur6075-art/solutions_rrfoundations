"use client";

import React, { useState } from "react";
import Link from "next/link";
import { Send, CheckCircle2, ShieldCheck, Loader2 } from "lucide-react";
import { WhatsAppIcon } from "@/components/ui/Icon";
import { Button } from "@/components/ui/Button";
import { CATEGORIES } from "@/lib/data/categories";
import { getWhatsAppUrl } from "@/lib/utils";

export default function RequestQuotePage() {
  const [formData, setFormData] = useState({
    fullName: "",
    companyName: "",
    email: "",
    phone: "",
    category: "badges-identification",
    quantity: "500-1000",
    materials: "Stainless Steel 304",
    customizationDetails: "",
    message: "",
  });
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSubmitting(true);
    setError(null);

    try {
      const res = await fetch("/api/enquiry", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          ...formData,
          productName: `RFQ Category: ${formData.category}`,
        }),
      });

      if (!res.ok) {
        throw new Error("Unable to transmit quote request right now. Please reach via WhatsApp.");
      }
      setSubmitted(true);
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : "Error submitting quote");
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#F7F4EE] text-[#182A25]">
      {/* 1. DARK HERO */}
      <section className="bg-[#102A25] text-white py-16 sm:py-24 border-b border-white/10 relative overflow-hidden">
        <div className="absolute top-0 right-1/4 w-[600px] h-[600px] bg-gold/5 rounded-full blur-[140px] pointer-events-none" />

        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center">
          <div className="flex items-center justify-center gap-2 text-xs text-white/60 mb-3 font-heading">
            <Link href="/" className="hover:text-gold transition">Home</Link>
            <span>/</span>
            <span className="text-gold font-semibold">RFQ Builder</span>
          </div>

          <div className="max-w-2xl mx-auto">
            <div className="flex items-center justify-center gap-2 mb-2">
              <span className="w-5 h-[1.5px] bg-gold" />
              <span className="text-gold font-heading font-bold text-xs uppercase tracking-[0.2em]">
                FORMAL PROCUREMENT DESK
              </span>
              <span className="w-5 h-[1.5px] bg-gold" />
            </div>
            <h1 className="font-serif text-4xl sm:text-5xl lg:text-6xl text-white tracking-tight leading-tight">
              Request a Bulk{" "}
              <span className="italic text-gold font-normal">
                Manufacturing Quote.
              </span>
            </h1>
            <p className="text-white/80 text-base sm:text-lg mt-4 leading-relaxed font-light">
              Submit your project specifications directly to our Delhi engineering desk. We provide transparent direct factory pricing, turnaround schedules, and material samples.
            </p>
          </div>
        </div>
      </section>

      {/* 2. RFQ FORM */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-16 sm:py-24">
        <div className="bg-white rounded-3xl p-8 sm:p-12 border border-[#E8E2D7] shadow-luxury">
          {submitted ? (
            <div className="text-center py-12">
              <CheckCircle2 className="w-16 h-16 text-brand-success mx-auto mb-4" strokeWidth={1.75} />
              <h3 className="font-serif text-3xl text-[#182A25] mb-2">
                Quotation Request Transmitted
              </h3>
              <p className="text-[#5C6E66] text-sm max-w-md mx-auto leading-relaxed mb-6 font-light">
                Our sales engineering team in Delhi has received your specifications. We will generate a formal proposal and contact you within 4 business hours.
              </p>
              <div className="flex flex-wrap items-center justify-center gap-3">
                <Button
                  variant="gold"
                  size="md"
                  href={getWhatsAppUrl("Hello RR Foundations, I just submitted a formal RFQ on your website.")}
                  external
                  className="font-bold flex items-center gap-1.5"
                >
                  <WhatsAppIcon className="w-4 h-4 text-[#102A25]" />
                  <span>Confirm on WhatsApp</span>
                </Button>
                <Button variant="outline" size="md" onClick={() => setSubmitted(false)} className="border-[#E8E2D7] text-[#182A25]">
                  Submit Another RFQ
                </Button>
              </div>
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-6">
              {error && (
                <div className="p-3 bg-brand-danger/10 text-brand-danger border border-brand-danger/20 rounded-lg text-xs font-medium">
                  {error}
                </div>
              )}

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                  <label className="block text-xs font-semibold text-[#182A25] mb-1.5 font-heading">
                    Full Contact Name *
                  </label>
                  <input
                    type="text"
                    required
                    value={formData.fullName}
                    onChange={(e) => setFormData({ ...formData, fullName: e.target.value })}
                    placeholder="e.g. Sumanth Verma"
                    className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/30 outline-none transition"
                  />
                </div>
                <div>
                  <label className="block text-xs font-semibold text-[#182A25] mb-1.5 font-heading">
                    Company / Organization *
                  </label>
                  <input
                    type="text"
                    required
                    value={formData.companyName}
                    onChange={(e) => setFormData({ ...formData, companyName: e.target.value })}
                    placeholder="e.g. Deloitte / Delhi Public School"
                    className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/30 outline-none transition"
                  />
                </div>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                  <label className="block text-xs font-semibold text-[#182A25] mb-1.5 font-heading">
                    Corporate Email *
                  </label>
                  <input
                    type="email"
                    required
                    value={formData.email}
                    onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                    placeholder="s.verma@company.com"
                    className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/30 outline-none transition"
                  />
                </div>
                <div>
                  <label className="block text-xs font-semibold text-[#182A25] mb-1.5 font-heading">
                    Phone / WhatsApp Number *
                  </label>
                  <input
                    type="tel"
                    required
                    value={formData.phone}
                    onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                    placeholder="+91 98990 11223"
                    className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/30 outline-none transition"
                  />
                </div>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                  <label className="block text-xs font-semibold text-[#182A25] mb-1.5 font-heading">
                    Primary Product Category *
                  </label>
                  <select
                    value={formData.category}
                    onChange={(e) => setFormData({ ...formData, category: e.target.value })}
                    className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/30 outline-none transition"
                  >
                    {CATEGORIES.map((c) => (
                      <option key={c.id} value={c.slug}>
                        {c.name}
                      </option>
                    ))}
                    <option value="custom-other">Other Bespoke Custom Item</option>
                  </select>
                </div>
                <div>
                  <label className="block text-xs font-semibold text-[#182A25] mb-1.5 font-heading">
                    Estimated Order Volume *
                  </label>
                  <select
                    value={formData.quantity}
                    onChange={(e) => setFormData({ ...formData, quantity: e.target.value })}
                    className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/30 outline-none transition"
                  >
                    <option value="50-200">50 – 200 units (Small batch / Sample)</option>
                    <option value="200-500">200 – 500 units (Standard batch)</option>
                    <option value="500-2000">500 – 2,000 units (Bulk procurement)</option>
                    <option value="2000-10000">2,000 – 10,000 units (Enterprise tier)</option>
                    <option value="10000+">10,000+ units (National institution rollout)</option>
                  </select>
                </div>
              </div>

              <div>
                <label className="block text-xs font-semibold text-[#182A25] mb-1.5 font-heading">
                  Substrate &amp; Material Preferences
                </label>
                <input
                  type="text"
                  value={formData.materials}
                  onChange={(e) => setFormData({ ...formData, materials: e.target.value })}
                  placeholder="e.g. Pure Copper, Stainless Steel 304, Calibrated MDF, Satin Ribbon..."
                  className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/30 outline-none transition"
                />
              </div>

              <div>
                <label className="block text-xs font-semibold text-[#182A25] mb-1.5 font-heading">
                  Detailed Specifications, Dimensions &amp; Target Delivery Date *
                </label>
                <textarea
                  required
                  rows={4}
                  value={formData.message}
                  onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                  placeholder="Include logo artwork details (laser etch / full UV color), magnet vs pin backings, packaging preferences, delivery city, and expected in-hand date..."
                  className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/30 outline-none transition resize-none"
                />
              </div>

              <div className="pt-2 flex flex-col sm:flex-row items-center justify-between gap-4">
                <div className="flex items-center gap-2 text-xs text-[#5C6E66]">
                  <ShieldCheck className="w-4 h-4 text-[#102A25]" strokeWidth={1.75} />
                  <span>Direct Factory Quotation • Zero Obligation</span>
                </div>
                <Button type="submit" variant="gold" size="lg" className="font-bold" disabled={submitting}>
                  {submitting ? (
                    <>
                      <Loader2 className="w-4 h-4 animate-spin mr-2" />
                      <span>Transmitting RFQ...</span>
                    </>
                  ) : (
                    <>
                      <Send className="w-4 h-4 mr-2" strokeWidth={1.75} />
                      <span>Transmit RFQ to Production Desk</span>
                    </>
                  )}
                </Button>
              </div>
            </form>
          )}
        </div>
      </div>
    </div>
  );
}
