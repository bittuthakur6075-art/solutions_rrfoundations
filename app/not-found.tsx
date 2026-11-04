import React from "react";
import Link from "next/link";
import { Button } from "@/components/ui/Button";

export default function NotFound() {
  return (
    <div className="min-h-[70vh] bg-[#F7F4EE] flex items-center justify-center px-4 py-16 text-[#182A25]">
      <div className="max-w-md w-full text-center space-y-6">
        <span className="text-xs font-heading font-bold text-[#B89650] uppercase tracking-widest block">
          404 — PAGE NOT FOUND
        </span>
        <h1 className="font-serif text-4xl sm:text-5xl text-[#182A25]">
          Page Not Found
        </h1>
        <p className="text-sm text-[#5C6E66] leading-relaxed">
          The requested page or product catalogue item does not exist or has been moved to our verified canonical listings.
        </p>
        <div className="pt-2">
          <Link href="/products">
            <Button variant="gold" size="md">
              Browse Complete Catalogue
            </Button>
          </Link>
        </div>
      </div>
    </div>
  );
}
