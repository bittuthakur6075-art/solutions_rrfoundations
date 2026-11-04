"use client";

import React from "react";
import { MessageCircle } from "lucide-react";
import { getWhatsAppUrl, COMPANY_INFO } from "@/lib/utils";

export function WhatsAppButton() {
  return (
    <a
      href={getWhatsAppUrl("Hello RR Foundations, I would like to inquire about bulk manufacturing and custom products.")}
      target="_blank"
      rel="noopener noreferrer"
      aria-label="Direct WhatsApp Consultation"
      className="fixed bottom-6 right-6 z-40 flex items-center gap-2 px-4 py-3 bg-[#25D366] text-white rounded-full shadow-elevated hover:shadow-luxury hover:scale-105 transition-all duration-300 font-heading font-semibold text-sm group"
    >
      <MessageCircle className="w-5 h-5 fill-current" />
      <span className="hidden sm:inline">WhatsApp Inquiries</span>
      <span className="inline-block w-2 h-2 rounded-full bg-white animate-pulse" />
    </a>
  );
}
