"use client";

import React from "react";
import { MessageCircle, FileText } from "lucide-react";
import { Button } from "@/components/ui/Button";
import { getWhatsAppUrl } from "@/lib/utils";

interface CustomManufacturingCtaProps {
  onOpenQuote: () => void;
}

export function CustomManufacturingCta({ onOpenQuote }: CustomManufacturingCtaProps) {
  return (
    <section className="py-20 sm:py-28 bg-[#102A25] text-white relative overflow-hidden border-b border-white/10">
      {/* Decorative ambient background */}
      <div className="absolute top-0 right-1/4 w-[500px] h-[500px] bg-gold/5 rounded-full blur-[140px] pointer-events-none" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="bg-gradient-to-br from-[#172B27] to-[#102A25] border border-white/15 rounded-3xl p-8 sm:p-14 lg:p-16 shadow-luxury">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-10 items-center">
            {/* Left Content */}
            <div className="lg:col-span-8 space-y-6">
              <div className="flex items-center gap-2">
                <span className="w-5 h-[1.5px] bg-gold" />
                <span className="text-gold text-xs font-heading font-bold uppercase tracking-[0.2em]">
                  BESPOKE ENGINEERING &amp; TOOLING
                </span>
              </div>

              <h2 className="font-serif text-3xl sm:text-4xl lg:text-5xl text-white tracking-tight leading-[1.12]">
                Have a Unique Requirement?{" "}
                <span className="italic text-gold font-normal">
                  Let’s Create It.
                </span>
              </h2>

              <p className="text-white/80 text-base sm:text-lg leading-relaxed max-w-2xl font-light">
                Do not settle for generic off-the-shelf items. Whether you need custom die-struck coin badges, specialized metal alloy finishes, custom dimensioned MDF exam boards, or branded executive VIP boxes, our Delhi production engineers can prototype and mass-manufacture to your exact CAD specs.
              </p>

              {/* Steps */}
              <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 pt-2">
                <div className="flex items-start gap-2.5">
                  <div className="w-6 h-6 rounded-full bg-gold text-forest-950 flex items-center justify-center font-heading font-bold text-xs flex-shrink-0 mt-0.5">
                    1
                  </div>
                  <div>
                    <h4 className="font-heading font-bold text-sm text-white">Share Concept &amp; Specs</h4>
                    <p className="text-xs text-white/60 mt-0.5">Send vector artwork, dimensions &amp; quantities</p>
                  </div>
                </div>

                <div className="flex items-start gap-2.5">
                  <div className="w-6 h-6 rounded-full bg-gold text-forest-950 flex items-center justify-center font-heading font-bold text-xs flex-shrink-0 mt-0.5">
                    2
                  </div>
                  <div>
                    <h4 className="font-heading font-bold text-sm text-white">Sample Approval</h4>
                    <p className="text-xs text-white/60 mt-0.5">Rapid physical pre-production proof dispatch</p>
                  </div>
                </div>

                <div className="flex items-start gap-2.5">
                  <div className="w-6 h-6 rounded-full bg-gold text-forest-950 flex items-center justify-center font-heading font-bold text-xs flex-shrink-0 mt-0.5">
                    3
                  </div>
                  <div>
                    <h4 className="font-heading font-bold text-sm text-white">Mass Batch Production</h4>
                    <p className="text-xs text-white/60 mt-0.5">Automated manufacturing &amp; secure delivery</p>
                  </div>
                </div>
              </div>
            </div>

            {/* Right Action Box */}
            <div className="lg:col-span-4 bg-[#203A33] border border-white/15 p-8 rounded-2xl text-center space-y-4 shadow-luxury">
              <h3 className="font-serif text-2xl text-white">
                Start Your Custom Order
              </h3>
              <p className="text-xs text-white/70 leading-relaxed font-light">
                Connect directly with our manufacturing desk for tailored pricing, material feasibility, and rapid sample proofing.
              </p>

              <div className="space-y-3 pt-2">
                <Button
                  variant="gold"
                  size="lg"
                  onClick={onOpenQuote}
                  className="w-full font-bold shadow-gold"
                >
                  <FileText className="w-4 h-4 mr-1.5" />
                  <span>Request a Custom Quote</span>
                </Button>

                <Button
                  variant="outline"
                  size="md"
                  href={getWhatsAppUrl("Hello RR Foundations, I have a custom manufacturing inquiry.")}
                  external
                  className="w-full border-white/20 hover:border-gold"
                >
                  <MessageCircle className="w-4 h-4 mr-1.5 text-[#25D366]" />
                  <span>Direct WhatsApp Inquiries</span>
                </Button>
              </div>

              <p className="text-[11px] text-white/50 pt-2">
                Typical response time: Under 4 business hours
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
