"use client";

import React, { useState, useEffect } from "react";
import { X, Send, CheckCircle2, ShieldCheck, Loader2 } from "lucide-react";
import { Button } from "./Button";
import { getWhatsAppUrl } from "@/lib/utils";

interface EnquiryModalProps {
  isOpen: boolean;
  onClose: () => void;
  productName?: string;
  categoryName?: string;
}

export function EnquiryModal({ isOpen, onClose, productName, categoryName }: EnquiryModalProps) {
  const [formData, setFormData] = useState({
    fullName: "",
    companyName: "",
    email: "",
    phone: "",
    quantity: "500",
    message: "",
  });
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (isOpen) {
      document.body.style.overflow = "hidden";
      setSubmitted(false);
      setError(null);
      if (productName) {
        setFormData((prev) => ({
          ...prev,
          message: `Hello, we would like to request bulk pricing and custom specifications for: ${productName}.`,
        }));
      }
    } else {
      document.body.style.overflow = "unset";
    }
    return () => {
      document.body.style.overflow = "unset";
    };
  }, [isOpen, productName]);

  if (!isOpen) return null;

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
          productName: productName || "General Requirement",
          category: categoryName || "General",
        }),
      });

      if (!res.ok) {
        throw new Error("Unable to transmit enquiry right now. Please try again or reach via WhatsApp.");
      }

      setSubmitted(true);
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : "Something went wrong");
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-[#0B1D19]/80 backdrop-blur-md animate-in fade-in duration-200">
      <div
        className="relative w-full max-w-lg bg-white rounded-3xl shadow-luxury border border-[#E8E2D7] overflow-hidden"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="bg-[#102A25] text-white px-6 py-5 flex items-center justify-between border-b border-white/10">
          <div>
            <span className="text-gold text-[11px] font-heading font-bold uppercase tracking-widest block">
              B2B DIRECT MANUFACTURING
            </span>
            <h3 className="font-serif text-2xl text-white mt-0.5">
              {productName ? `Quote: ${productName}` : "Request a Bulk Quote"}
            </h3>
          </div>
          <button
            onClick={onClose}
            className="text-white/70 hover:text-white p-2 rounded-full hover:bg-white/10 transition"
            aria-label="Close modal"
          >
            <X className="w-5 h-5 text-gold" />
          </button>
        </div>

        {/* Content */}
        <div className="p-6">
          {submitted ? (
            <div className="text-center py-8">
              <CheckCircle2 className="w-14 h-14 text-brand-success mx-auto mb-4" />
              <h4 className="font-serif text-2xl text-[#182A25] mb-2">
                Enquiry Transmitted Successfully
              </h4>
              <p className="text-[#5C6E66] text-sm mb-6 max-w-sm mx-auto leading-relaxed font-light">
                Thank you! Our technical sales engineer will review your specification and get back within 4 business hours.
              </p>
              <div className="flex flex-col sm:flex-row gap-3 justify-center">
                <Button
                  variant="gold"
                  href={getWhatsAppUrl(`Hello RR Foundations, I just submitted an enquiry for ${productName || "bulk manufacturing"}.`)}
                  external
                  className="font-bold"
                >
                  Connect via WhatsApp
                </Button>
                <Button variant="outline" onClick={onClose} className="border-[#E8E2D7] text-[#182A25]">
                  Close
                </Button>
              </div>
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-4">
              {error && (
                <div className="p-3 bg-brand-danger/10 text-brand-danger border border-brand-danger/20 rounded-lg text-xs font-medium">
                  {error}
                </div>
              )}

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <div>
                  <label className="block text-xs font-semibold text-[#182A25] mb-1 font-heading">
                    Full Name *
                  </label>
                  <input
                    type="text"
                    required
                    value={formData.fullName}
                    onChange={(e) => setFormData({ ...formData, fullName: e.target.value })}
                    placeholder="e.g. Rajesh Sharma"
                    className="w-full px-3.5 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/50 transition outline-none"
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
                    placeholder="e.g. TechCorp India"
                    className="w-full px-3.5 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/50 transition outline-none"
                  />
                </div>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <div>
                  <label className="block text-xs font-semibold text-[#182A25] mb-1 font-heading">
                    Work Email *
                  </label>
                  <input
                    type="email"
                    required
                    value={formData.email}
                    onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                    placeholder="rajesh@company.com"
                    className="w-full px-3.5 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/50 transition outline-none"
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
                    placeholder="+91 98765 43210"
                    className="w-full px-3.5 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/50 transition outline-none"
                  />
                </div>
              </div>

              <div>
                <label className="block text-xs font-semibold text-[#182A25] mb-1 font-heading">
                  Estimated Quantity *
                </label>
                <select
                  value={formData.quantity}
                  onChange={(e) => setFormData({ ...formData, quantity: e.target.value })}
                  className="w-full px-3.5 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/50 transition outline-none"
                >
                  <option value="50-100">50 – 100 units (Sample / Pilot batch)</option>
                  <option value="100-500">100 – 500 units (Standard order)</option>
                  <option value="500-2000">500 – 2,000 units (Bulk procurement)</option>
                  <option value="2000+">2,000+ units (Large enterprise / Institution)</option>
                </select>
              </div>

              <div>
                <label className="block text-xs font-semibold text-[#182A25] mb-1 font-heading">
                  Customization Specifications &amp; Timelines *
                </label>
                <textarea
                  required
                  rows={3}
                  value={formData.message}
                  onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                  placeholder="Mention desired materials, logo laser engraving, dimensions, or target delivery date..."
                  className="w-full px-3.5 py-2.5 text-sm rounded-xl border border-[#E8E2D7] focus:border-[#102A25] bg-[#F7F4EE]/50 transition outline-none resize-none"
                />
              </div>

              <div className="pt-2 flex items-center justify-between">
                <div className="flex items-center gap-1.5 text-xs text-[#5C6E66]">
                  <ShieldCheck className="w-4 h-4 text-[#102A25]" />
                  <span>Direct Factory Quotes</span>
                </div>
                <div className="flex items-center gap-2">
                  <button
                    type="button"
                    onClick={onClose}
                    className="px-4 py-2 text-xs font-heading font-semibold text-[#5C6E66] hover:text-[#182A25]"
                  >
                    Cancel
                  </button>
                  <Button type="submit" variant="gold" size="md" disabled={submitting} className="font-bold">
                    {submitting ? (
                      <>
                        <Loader2 className="w-4 h-4 animate-spin mr-1" />
                        <span>Sending...</span>
                      </>
                    ) : (
                      <>
                        <Send className="w-4 h-4 mr-1 text-forest-950" />
                        <span>Send RFQ</span>
                      </>
                    )}
                  </Button>
                </div>
              </div>
            </form>
          )}
        </div>
      </div>
    </div>
  );
}
