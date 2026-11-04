"use client";

import React, { useState } from "react";
import Link from "next/link";
import { Mail, Phone, MapPin, Clock, Send, CheckCircle2, MessageCircle, Loader2 } from "lucide-react";
import { COMPANY_INFO, getWhatsAppUrl } from "@/lib/utils";
import { Button } from "@/components/ui/Button";

export default function ContactPage() {
  const [formData, setFormData] = useState({
    fullName: "",
    companyName: "",
    email: "",
    phone: "",
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
          quantity: "Direct Contact Form",
          productName: "Contact Inquiry",
        }),
      });

      if (!res.ok) {
        throw new Error("Unable to submit right now. Please reach via WhatsApp.");
      }
      setSubmitted(true);
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : "Error submitting message");
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#F7F4EE] text-[#182A25]">
      {/* 1. DARK HERO */}
      <section className="bg-[#102A25] text-white py-16 sm:py-24 border-b border-white/10 relative overflow-hidden">
        <div className="absolute top-0 right-1/4 w-[600px] h-[600px] bg-gold/5 rounded-full blur-[140px] pointer-events-none" />

        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
          <div className="flex items-center gap-2 text-xs text-white/60 mb-3 font-heading">
            <Link href="/" className="hover:text-gold transition">Home</Link>
            <span>/</span>
            <span className="text-gold font-semibold">Contact Desk</span>
          </div>

          <div className="max-w-3xl">
            <div className="flex items-center gap-2 mb-2">
              <span className="w-5 h-[1.5px] bg-gold" />
              <span className="text-gold font-heading font-bold text-xs uppercase tracking-[0.2em]">
                DIRECT COMMUNICATIONS DESK
              </span>
            </div>
            <h1 className="font-serif text-4xl sm:text-5xl lg:text-6xl text-white tracking-tight leading-tight">
              Contact RR Foundations &amp;{" "}
              <span className="italic text-gold font-normal">
                Manufacturing Solutions.
              </span>
            </h1>
            <p className="text-white/80 text-base sm:text-lg mt-4 leading-relaxed font-light">
              Get in touch with our Delhi engineering and sales desk to discuss your customized manufacturing requirements, bulk quotations, or sample dispatches.
            </p>
          </div>
        </div>
      </section>

      {/* 2. FORM & CONTACT DETAILS */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 sm:py-24">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
          {/* Verified Contact Details Card */}
          <div className="lg:col-span-5 bg-[#102A25] text-white rounded-3xl p-8 sm:p-10 shadow-luxury space-y-8 border border-white/10">
            <div>
              <span className="text-gold text-xs font-heading font-semibold uppercase tracking-widest block mb-1">
                HEADQUARTERS &amp; WORKSHOP
              </span>
              <h3 className="font-serif text-3xl text-white">
                New Delhi Facility
              </h3>
            </div>

            <div className="space-y-6 text-sm">
              <div className="flex items-start gap-3.5">
                <MapPin className="w-5 h-5 text-gold flex-shrink-0 mt-1" />
                <div>
                  <h4 className="font-heading font-semibold text-white mb-0.5">Physical Address</h4>
                  <p className="text-white/70 leading-relaxed text-xs sm:text-sm font-light">
                    {COMPANY_INFO.address}
                  </p>
                </div>
              </div>

              <div className="flex items-start gap-3.5">
                <Phone className="w-5 h-5 text-gold flex-shrink-0 mt-1" />
                <div>
                  <h4 className="font-heading font-semibold text-white mb-0.5">Telephone &amp; Orders</h4>
                  <a href={`tel:${COMPANY_INFO.phone}`} className="text-gold hover:underline text-sm font-semibold">
                    {COMPANY_INFO.phone}
                  </a>
                  <p className="text-xs text-white/60 mt-0.5">Monday to Friday, 9:00 AM – 6:00 PM IST</p>
                </div>
              </div>

              <div className="flex items-start gap-3.5">
                <Mail className="w-5 h-5 text-gold flex-shrink-0 mt-1" />
                <div>
                  <h4 className="font-heading font-semibold text-white mb-0.5">Official Email</h4>
                  <a href={`mailto:${COMPANY_INFO.email}`} className="text-gold hover:underline text-sm">
                    {COMPANY_INFO.email}
                  </a>
                </div>
              </div>

              <div className="flex items-start gap-3.5">
                <Clock className="w-5 h-5 text-gold flex-shrink-0 mt-1" />
                <div>
                  <h4 className="font-heading font-semibold text-white mb-0.5">Operational Schedule</h4>
                  <p className="text-xs text-white/70 font-light">{COMPANY_INFO.hours}</p>
                </div>
              </div>
            </div>

            <div className="pt-4 border-t border-white/10">
              <a
                href={getWhatsAppUrl("Hello RR Foundations, I am contacting you from your website.")}
                target="_blank"
                rel="noopener noreferrer"
                className="w-full py-3.5 px-4 bg-[#25D366] text-white rounded-xl font-heading font-semibold text-sm flex items-center justify-center gap-2 hover:bg-[#20ba59] transition shadow-card"
              >
                <MessageCircle className="w-4 h-4 fill-current" />
                <span>Instant WhatsApp Concierge</span>
              </a>
            </div>
          </div>

          {/* Form */}
          <div className="lg:col-span-7 bg-white rounded-3xl p-8 sm:p-10 border border-[#E8E2D7] shadow-luxury">
            {submitted ? (
              <div className="text-center py-12">
                <CheckCircle2 className="w-16 h-16 text-brand-success mx-auto mb-4" />
                <h3 className="font-serif text-3xl text-[#182A25] mb-2">
                  Message Dispatched Successfully
                </h3>
                <p className="text-[#5C6E66] text-sm max-w-md mx-auto leading-relaxed mb-6 font-light">
                  Thank you for reaching out. One of our production managers will respond to your enquiry within 4 business hours.
                </p>
                <Button variant="gold" onClick={() => setSubmitted(false)}>
                  Send Another Message
                </Button>
              </div>
            ) : (
              <form onSubmit={handleSubmit} className="space-y-5">
                <h3 className="font-serif text-2xl text-[#182A25] mb-1">
                  Transmit an Official Requirement
                </h3>
                <p className="text-xs text-[#5C6E66] mb-4">
                  Fill in your details below for a prompt, direct-from-factory quote.
                </p>

                {error && (
                  <div className="p-3 bg-brand-danger/10 text-brand-danger border border-brand-danger/20 rounded-lg text-xs font-medium">
                    {error}
                  </div>
                )}

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-semibold text-[#182A25] mb-1 font-heading">
                      Full Name *
                    </label>
                    <input
                      type="text"
                      required
                      value={formData.fullName}
                      onChange={(e) => setFormData({ ...formData, fullName: e.target.value })}
                      placeholder="e.g. Vikram Singhania"
                      className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/40 outline-none transition"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-semibold text-[#182A25] mb-1 font-heading">
                      Company / Organization
                    </label>
                    <input
                      type="text"
                      value={formData.companyName}
                      onChange={(e) => setFormData({ ...formData, companyName: e.target.value })}
                      placeholder="e.g. Apex Hospitality Group"
                      className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/40 outline-none transition"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-semibold text-[#182A25] mb-1 font-heading">
                      Email Address *
                    </label>
                    <input
                      type="email"
                      required
                      value={formData.email}
                      onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                      placeholder="vikram@apex.in"
                      className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/40 outline-none transition"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-semibold text-[#182A25] mb-1 font-heading">
                      Contact Phone *
                    </label>
                    <input
                      type="tel"
                      required
                      value={formData.phone}
                      onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                      placeholder="+91 98111 22334"
                      className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/40 outline-none transition"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-xs font-semibold text-[#182A25] mb-1 font-heading">
                    Project Requirements / Message *
                  </label>
                  <textarea
                    required
                    rows={4}
                    value={formData.message}
                    onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                    placeholder="Describe your desired quantities, preferred substrates (copper, steel, MDF, satin), and expected deadline..."
                    className="w-full px-4 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/40 outline-none transition resize-none"
                  />
                </div>

                <Button type="submit" variant="gold" size="lg" className="w-full font-bold" disabled={submitting}>
                  {submitting ? (
                    <>
                      <Loader2 className="w-4 h-4 animate-spin mr-2" />
                      <span>Transmitting...</span>
                    </>
                  ) : (
                    <>
                      <Send className="w-4 h-4 mr-2" />
                      <span>Send Enquiry to Delhi Factory</span>
                    </>
                  )}
                </Button>
              </form>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
