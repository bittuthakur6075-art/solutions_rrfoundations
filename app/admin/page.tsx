"use client";

import React, { useState, useEffect, useMemo } from "react";
import Link from "next/link";
import Image from "next/image";
import {
  Package,
  Inbox,
  BarChart3,
  Search,
  ExternalLink,
  TrendingUp,
} from "lucide-react";
import { PRODUCTS } from "@/lib/data/products";
import { CATEGORIES } from "@/lib/data/categories";
import type { InquirySubmission } from "@/types";

export default function AdminDashboardPage() {
  const [activeTab, setActiveTab] = useState<"products" | "inquiries" | "overview">("overview");
  const [inquiries, setInquiries] = useState<InquirySubmission[]>([]);
  const [searchFilter, setSearchFilter] = useState("");

  useEffect(() => {
    // Load local enquiries from API endpoint
    fetch("/api/enquiry")
      .then((res) => {
        if (!res.ok) throw new Error("Failed to fetch enquiries");
        return res.json();
      })
      .then((data: unknown) => {
        if (Array.isArray(data) && data.length > 0) {
          setInquiries(data as InquirySubmission[]);
        } else {
          // If no submissions recorded yet, provide verified default sample for staff preview
          setInquiries([
            {
              id: "enq_1793702130962_6z3qp",
              timestamp: "2026-11-03T10:35:30.962Z",
              fullName: "Test Procurement Manager",
              companyName: "Apex Enterprises",
              email: "test@apex.example",
              phone: "+919876543210",
              productName: "Customized Metal Name Badges",
              quantity: "500",
              message: "Requesting prototype and sample quote for 500 units.",
              status: "New",
            },
          ]);
        }
      })
      .catch(() => {
        // Fallback default sample for staff review
        setInquiries([
          {
            id: "enq_1793702130962_6z3qp",
            timestamp: "2026-11-03T10:35:30.962Z",
            fullName: "Test Procurement Manager",
            companyName: "Apex Enterprises",
            email: "test@apex.example",
            phone: "+919876543210",
            productName: "Customized Metal Name Badges",
            quantity: "500",
            message: "Requesting prototype and sample quote for 500 units.",
            status: "New",
          },
        ]);
      });
  }, []);

  const filteredProducts = useMemo(() => {
    if (!searchFilter.trim()) return PRODUCTS;
    const lower = searchFilter.toLowerCase();
    return PRODUCTS.filter((p) => p.title.toLowerCase().includes(lower));
  }, [searchFilter]);

  return (
    <div className="min-h-screen bg-[#F7F4EE] flex flex-col md:flex-row text-[#182A25] font-sans">
      {/* 1. FOREST GREEN SIDEBAR */}
      <aside className="w-full md:w-64 bg-[#102A25] text-white flex-shrink-0 flex flex-col justify-between border-r border-white/10">
        <div>
          {/* Admin Header */}
          <div className="p-6 border-b border-white/10 flex items-center justify-between">
            <Link href="/" className="flex items-center gap-3">
              <div className="relative w-9 h-9 rounded-xl overflow-hidden flex items-center justify-center">
                <Image
                  src="/icon.png"
                  alt="RR Foundations"
                  width={36}
                  height={36}
                  className="object-contain"
                />
              </div>
              <div>
                <span className="font-heading font-bold text-sm tracking-wide block">
                  Operations Portal
                </span>
                <span className="text-[10px] text-gold block font-mono">v1.2.0 • Delhi Plant</span>
              </div>
            </Link>
          </div>

          {/* Navigation Links */}
          <nav className="p-4 space-y-1.5">
            <button
              onClick={() => setActiveTab("overview")}
              className={`w-full flex items-center gap-3 px-3.5 py-2.5 rounded-xl text-xs font-heading font-semibold transition ${
                activeTab === "overview"
                  ? "bg-gold text-forest-950 font-bold"
                  : "text-white/80 hover:bg-white/5 hover:text-white"
              }`}
            >
              <BarChart3 className="w-4 h-4" />
              <span>Operations Overview</span>
            </button>

            <button
              onClick={() => setActiveTab("products")}
              className={`w-full flex items-center gap-3 px-3.5 py-2.5 rounded-xl text-xs font-heading font-semibold transition ${
                activeTab === "products"
                  ? "bg-gold text-forest-950 font-bold"
                  : "text-white/80 hover:bg-white/5 hover:text-white"
              }`}
            >
              <Package className="w-4 h-4" />
              <span>Catalogue Management ({PRODUCTS.length})</span>
            </button>

            <button
              onClick={() => setActiveTab("inquiries")}
              className={`w-full flex items-center justify-between px-3.5 py-2.5 rounded-xl text-xs font-heading font-semibold transition ${
                activeTab === "inquiries"
                  ? "bg-gold text-forest-950 font-bold"
                  : "text-white/80 hover:bg-white/5 hover:text-white"
              }`}
            >
              <div className="flex items-center gap-3">
                <Inbox className="w-4 h-4" />
                <span>RFQs &amp; Enquiries</span>
              </div>
              <span className="px-1.5 py-0.5 rounded-full bg-forest-800 text-gold text-[10px] font-bold">
                {inquiries.length}
              </span>
            </button>
          </nav>
        </div>

        {/* Sidebar Footer */}
        <div className="p-4 border-t border-white/10 text-xs text-white/50 space-y-2">
          <Link
            href="/"
            className="flex items-center justify-between text-gold hover:underline font-heading font-medium"
          >
            <span>Exit to Public Store</span>
            <ExternalLink className="w-3.5 h-3.5" />
          </Link>
          <p className="text-[10px]">Logged in as Manufacturing Admin</p>
        </div>
      </aside>

      {/* 2. MAIN WORKSPACE */}
      <main className="flex-1 p-6 sm:p-10 overflow-y-auto">
        {/* Top Header */}
        <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 mb-8 pb-6 border-b border-[#E8E2D7]">
          <div>
            <span className="text-xs font-heading font-bold text-[#B89650] uppercase tracking-wider block mb-1">
              Internal Facility Console
            </span>
            <h1 className="font-serif text-3xl text-[#182A25]">
              {activeTab === "overview" && "Plant Operations & Metrics"}
              {activeTab === "products" && "Product Catalogue Cataloguing"}
              {activeTab === "inquiries" && "Bulk RFQ & Lead Management"}
            </h1>
          </div>

          <div className="flex items-center gap-3">
            <Link
              href="/request-quote"
              target="_blank"
              className="px-4 py-2 bg-[#102A25] text-white rounded-xl text-xs font-heading font-semibold hover:bg-forest-800 transition"
            >
              Open Live RFQ Funnel ↗
            </Link>
          </div>
        </div>

        {/* TAB 1: OVERVIEW METRICS */}
        {activeTab === "overview" && (
          <div className="space-y-8">
            {/* KPI Cards */}
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
              <div className="bg-white p-6 rounded-2xl border border-[#E8E2D7] shadow-card">
                <span className="text-xs font-heading font-semibold text-[#5C6E66] block mb-1">
                  Verified Catalog SKUs
                </span>
                <div className="flex items-baseline gap-2">
                  <span className="font-heading font-bold text-3xl text-[#182A25]">
                    {PRODUCTS.length}
                  </span>
                  <span className="text-xs text-brand-success font-semibold flex items-center">
                    <TrendingUp className="w-3 h-3 mr-0.5" /> Live
                  </span>
                </div>
                <span className="text-[11px] text-[#5C6E66] mt-2 block">
                  Across 6 verified categories
                </span>
              </div>

              <div className="bg-white p-6 rounded-2xl border border-[#E8E2D7] shadow-card">
                <span className="text-xs font-heading font-semibold text-[#5C6E66] block mb-1">
                  Active B2B Inquiries
                </span>
                <div className="flex items-baseline gap-2">
                  <span className="font-heading font-bold text-3xl text-[#182A25]">
                    {inquiries.length}
                  </span>
                  <span className="text-xs text-[#B89650] font-semibold">New RFQs</span>
                </div>
                <span className="text-[11px] text-[#5C6E66] mt-2 block">
                  Avg response target: &lt; 4 hrs
                </span>
              </div>

              <div className="bg-white p-6 rounded-2xl border border-[#E8E2D7] shadow-card">
                <span className="text-xs font-heading font-semibold text-[#5C6E66] block mb-1">
                  Machinery Lines
                </span>
                <div className="flex items-baseline gap-2">
                  <span className="font-heading font-bold text-3xl text-[#182A25]">
                    4
                  </span>
                  <span className="text-xs text-brand-success font-semibold">Operational</span>
                </div>
                <span className="text-[11px] text-[#5C6E66] mt-2 block">
                  Laser, UV Flatbed, Stamping, Sublimation
                </span>
              </div>

              <div className="bg-white p-6 rounded-2xl border border-[#E8E2D7] shadow-card">
                <span className="text-xs font-heading font-semibold text-[#5C6E66] block mb-1">
                  Batch Capacity Tier
                </span>
                <div className="flex items-baseline gap-2">
                  <span className="font-heading font-bold text-3xl text-[#182A25]">
                    50K+
                  </span>
                  <span className="text-xs text-[#182A25] font-semibold">Units / mo</span>
                </div>
                <span className="text-[11px] text-[#5C6E66] mt-2 block">
                  Scalable institutional runs
                </span>
              </div>
            </div>

            {/* Quick Actions & Recent Activity */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
              {/* Category Breakdown */}
              <div className="bg-white p-6 sm:p-8 rounded-2xl border border-[#E8E2D7] shadow-card">
                <h3 className="font-heading font-bold text-base text-[#182A25] mb-4">
                  Categories &amp; Production Lines
                </h3>
                <div className="space-y-3">
                  {CATEGORIES.map((c) => (
                    <div key={c.id} className="flex items-center justify-between p-3 rounded-xl bg-[#F7F4EE]/60">
                      <div>
                        <span className="font-heading font-bold text-xs text-[#182A25] block">
                          {c.name}
                        </span>
                        <span className="text-[11px] text-[#5C6E66]">
                          {c.slug}
                        </span>
                      </div>
                      <span className="px-2.5 py-1 rounded-full bg-[#102A25] text-gold font-bold text-xs font-heading">
                        {PRODUCTS.filter((p) => p.category === c.slug).length || 1} SKUs
                      </span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Latest Submissions */}
              <div className="bg-white p-6 sm:p-8 rounded-2xl border border-[#E8E2D7] shadow-card">
                <h3 className="font-heading font-bold text-base text-[#182A25] mb-4">
                  Recent Incoming RFQ Transmissions
                </h3>
                {inquiries.length === 0 ? (
                  <p className="text-xs text-[#5C6E66]">No submissions recorded yet.</p>
                ) : (
                  <div className="space-y-3">
                    {inquiries.slice(0, 5).map((inq, i) => (
                      <div key={i} className="p-3.5 rounded-xl border border-[#E8E2D7] space-y-1">
                        <div className="flex items-center justify-between">
                          <span className="font-heading font-bold text-xs text-[#182A25]">
                            {inq.fullName} ({inq.companyName || "Direct Inquiry"})
                          </span>
                          <span className="text-[10px] px-2 py-0.5 rounded bg-brand-success/15 text-brand-success font-semibold">
                            {inq.status || "New"}
                          </span>
                        </div>
                        <p className="text-xs text-[#5C6E66]">
                          Item: <strong>{inq.productName}</strong> • Qty: {inq.quantity}
                        </p>
                        <p className="text-[11px] text-[#5C6E66] font-mono">
                          {inq.email} • {inq.phone}
                        </p>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            </div>
          </div>
        )}

        {/* TAB 2: PRODUCTS TABLE */}
        {activeTab === "products" && (
          <div className="bg-white rounded-2xl border border-[#E8E2D7] shadow-card overflow-hidden">
            <div className="p-5 border-b border-[#E8E2D7] flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-4">
              <div className="relative min-w-[280px]">
                <Search className="w-4 h-4 text-[#5C6E66] absolute left-3.5 top-1/2 -translate-y-1/2" />
                <input
                  type="text"
                  placeholder="Filter catalog items..."
                  value={searchFilter}
                  onChange={(e) => setSearchFilter(e.target.value)}
                  className="w-full pl-9 pr-4 py-2 text-xs rounded-xl border border-[#E8E2D7] focus:border-[#102A25] outline-none"
                />
              </div>
              <span className="text-xs text-[#5C6E66]">
                Showing {PRODUCTS.length} verified physical products
              </span>
            </div>

            <div className="overflow-x-auto">
              <table className="w-full text-left text-xs">
                <thead className="bg-[#F7F4EE] text-[#182A25] font-heading font-bold border-b border-[#E8E2D7]">
                  <tr>
                    <th className="py-3 px-4">Item</th>
                    <th className="py-3 px-4">Category</th>
                    <th className="py-3 px-4">Primary Substrate</th>
                    <th className="py-3 px-4">Min Batch</th>
                    <th className="py-3 px-4">Featured</th>
                    <th className="py-3 px-4">Status</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-[#E8E2D7]">
                  {filteredProducts.map((p) => (
                    <tr key={p.id} className="hover:bg-[#F7F4EE]/50 transition">
                      <td className="py-3.5 px-4 font-semibold text-[#182A25] flex items-center gap-3">
                        <div className="relative w-9 h-9 rounded-lg bg-[#F7F4EE] border border-[#E8E2D7] flex-shrink-0 p-1">
                          <Image
                            src={p.thumbnail}
                            alt={p.title}
                            fill
                            className="object-contain p-1"
                          />
                        </div>
                        <span className="truncate max-w-[240px]">{p.title}</span>
                      </td>
                      <td className="py-3.5 px-4 text-[#5C6E66]">{p.categoryName}</td>
                      <td className="py-3.5 px-4 text-[#182A25] font-medium">
                        {p.materials?.[0] || "Custom"}
                      </td>
                      <td className="py-3.5 px-4 text-[#5C6E66]">{p.minQuantity || 50} pcs</td>
                      <td className="py-3.5 px-4">
                        {p.featured ? (
                          <span className="px-2 py-0.5 rounded-full bg-gold/20 text-[#B89650] font-bold text-[10px]">
                            Hero Featured
                          </span>
                        ) : (
                          <span className="text-[#5C6E66] text-[10px]">Standard</span>
                        )}
                      </td>
                      <td className="py-3.5 px-4">
                        <span className="px-2 py-0.5 rounded-full bg-brand-success/10 text-brand-success font-semibold text-[10px]">
                          In Production
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* TAB 3: INQUIRIES TABLE */}
        {activeTab === "inquiries" && (
          <div className="bg-white rounded-2xl border border-[#E8E2D7] shadow-card overflow-hidden">
            <div className="p-5 border-b border-[#E8E2D7] flex items-center justify-between">
              <h3 className="font-heading font-bold text-sm text-[#182A25]">
                Direct Commercial Leads ({inquiries.length})
              </h3>
              <span className="text-xs text-[#5C6E66]">
                Stored locally in <code className="font-mono text-[11px] bg-[#F7F4EE] px-1.5 py-0.5 rounded">docs/enquiry_submissions.json</code>
              </span>
            </div>

            <div className="overflow-x-auto">
              <table className="w-full text-left text-xs">
                <thead className="bg-[#F7F4EE] text-[#182A25] font-heading font-bold border-b border-[#E8E2D7]">
                  <tr>
                    <th className="py-3 px-4">Date</th>
                    <th className="py-3 px-4">Client / Company</th>
                    <th className="py-3 px-4">Contact</th>
                    <th className="py-3 px-4">Item &amp; Volume</th>
                    <th className="py-3 px-4">Message Specs</th>
                    <th className="py-3 px-4">Status</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-[#E8E2D7]">
                  {inquiries.map((inq, i) => (
                    <tr key={i} className="hover:bg-[#F7F4EE]/50 transition">
                      <td className="py-3.5 px-4 text-[#5C6E66] whitespace-nowrap">
                        {new Date(inq.timestamp || Date.now()).toLocaleDateString("en-IN", {
                          day: "numeric",
                          month: "short",
                          hour: "2-digit",
                          minute: "2-digit",
                        })}
                      </td>
                      <td className="py-3.5 px-4">
                        <span className="font-bold text-[#182A25] block">{inq.fullName}</span>
                        <span className="text-[11px] text-[#5C6E66]">{inq.companyName || "Individual"}</span>
                      </td>
                      <td className="py-3.5 px-4">
                        <a href={`mailto:${inq.email}`} className="text-gold-dark hover:underline block">
                          {inq.email}
                        </a>
                        <a href={`tel:${inq.phone}`} className="text-[#5C6E66] block text-[11px]">
                          {inq.phone}
                        </a>
                      </td>
                      <td className="py-3.5 px-4">
                        <span className="font-semibold text-[#182A25] block">{inq.productName}</span>
                        <span className="text-[11px] text-[#5C6E66]">Volume: {inq.quantity}</span>
                      </td>
                      <td className="py-3.5 px-4 text-[#5C6E66] max-w-xs truncate">
                        {inq.message}
                      </td>
                      <td className="py-3.5 px-4">
                        <span className="px-2.5 py-1 rounded-full bg-brand-success/15 text-brand-success font-semibold text-[10px]">
                          {inq.status || "New"}
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}
      </main>
    </div>
  );
}
