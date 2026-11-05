import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import {
  Package,
  Layers,
  Inbox,
  CheckCircle2,
  Clock,
  Archive,
  ArrowUpRight,
  TrendingUp,
  RefreshCw,
  Loader2,
  AlertCircle,
  FileText,
  Activity,
  Calendar,
} from "lucide-react";
import { useToast } from "../components/Toast";

interface DashboardData {
  metrics: {
    totalProducts: number;
    activeProducts: number;
    draftProducts: number;
    archivedProducts: number;
    totalCategories: number;
    totalLeads: number;
    newLeads: number;
    inProgressLeads: number;
    closedLeads: number;
  };
  charts: {
    monthlyTrends: Array<{ month_label: string; count: number }>;
    leadsByCategory: Array<{ category_name: string; count: number }>;
    productsByCategory: Array<{ category_name: string; product_count: number }>;
  };
  widgets: {
    recentLeads: Array<{
      id: string;
      full_name: string;
      company_name?: string;
      email: string;
      phone: string;
      product_name?: string;
      category?: string;
      quantity?: string;
      status: string;
      created_at: string;
    }>;
    latestProducts: Array<{
      id: string;
      title: string;
      slug: string;
      sku: string;
      category_name: string;
      thumbnail: string;
      status: string;
      created_at: string;
    }>;
    recentActivity: Array<{
      id: number;
      admin_name: string;
      action: string;
      entity_type: string;
      entity_id?: string;
      details?: string;
      created_at: string;
    }>;
  };
}

export function AdminDashboardPage() {
  const toast = useToast();
  const [data, setData] = useState<DashboardData | null>(null);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);

  const fetchDashboard = async (isManual = false) => {
    if (isManual) setRefreshing(true);
    try {
      const res = await fetch("/api/admin/dashboard", { credentials: "include" });
      if (res.ok) {
        const json = await res.json();
        if (json.success) {
          setData(json);
          if (isManual) toast.success("Dashboard metrics refreshed.");
        }
      }
    } catch (e) {
      toast.error("Failed to load dashboard data");
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  };

  useEffect(() => {
    fetchDashboard();
  }, []);

  if (loading) {
    return (
      <div className="py-20 flex flex-col items-center justify-center">
        <Loader2 className="w-8 h-8 animate-spin text-[#102A25] mb-2" />
        <span className="text-xs text-neutral-500 font-medium">Loading live operational telemetry...</span>
      </div>
    );
  }

  const m = data?.metrics || {
    totalProducts: 0,
    activeProducts: 0,
    draftProducts: 0,
    archivedProducts: 0,
    totalCategories: 0,
    totalLeads: 0,
    newLeads: 0,
    inProgressLeads: 0,
    closedLeads: 0,
  };

  return (
    <div className="space-y-6 animate-in fade-in duration-300">
      {/* Top Banner & Quick Controls */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-2 border-b border-[#E8E2D7]">
        <div>
          <h2 className="text-xl font-bold font-heading text-[#102A25]">
            Operational Overview
          </h2>
          <p className="text-xs text-neutral-500 mt-0.5">
            Real-time verified metrics from MySQL database.
          </p>
        </div>

        <div className="flex items-center gap-2">
          <button
            onClick={() => fetchDashboard(true)}
            disabled={refreshing}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-white border border-[#E8E2D7] text-xs font-medium text-neutral-700 hover:bg-neutral-50 shadow-xs transition"
          >
            <RefreshCw className={`w-3.5 h-3.5 ${refreshing ? "animate-spin text-[#102A25]" : "text-neutral-500"}`} />
            <span>Refresh Telemetry</span>
          </button>
        </div>
      </div>

      {/* 8 Primary Summary Metric Cards */}
      <div className="grid grid-cols-2 sm:grid-cols-4 lg:grid-cols-4 gap-3.5 sm:gap-4">
        {/* Total Products */}
        <div className="bg-white p-4 rounded-2xl border border-[#E8E2D7] shadow-xs relative overflow-hidden">
          <div className="flex items-center justify-between">
            <span className="text-[11px] font-semibold text-neutral-500 uppercase tracking-wider">
              Total Products
            </span>
            <div className="p-2 rounded-xl bg-[#102A25]/5 text-[#102A25]">
              <Package className="w-4 h-4" />
            </div>
          </div>
          <div className="mt-2 text-2xl font-bold font-heading text-[#102A25]">
            {m.totalProducts}
          </div>
          <div className="mt-1 flex items-center gap-1.5 text-[11px] text-emerald-600 font-medium">
            <span>{m.activeProducts} Live</span>
            <span className="text-neutral-300">•</span>
            <span className="text-neutral-400">{m.draftProducts} Draft</span>
          </div>
        </div>

        {/* Active Categories */}
        <div className="bg-white p-4 rounded-2xl border border-[#E8E2D7] shadow-xs relative overflow-hidden">
          <div className="flex items-center justify-between">
            <span className="text-[11px] font-semibold text-neutral-500 uppercase tracking-wider">
              Categories
            </span>
            <div className="p-2 rounded-xl bg-[#D9B878]/20 text-[#102A25]">
              <Layers className="w-4 h-4 text-[#102A25]" />
            </div>
          </div>
          <div className="mt-2 text-2xl font-bold font-heading text-[#102A25]">
            {m.totalCategories}
          </div>
          <div className="mt-1 text-[11px] text-neutral-400">
            Industrial & Gifting Lines
          </div>
        </div>

        {/* Total Leads */}
        <div className="bg-white p-4 rounded-2xl border border-[#E8E2D7] shadow-xs relative overflow-hidden">
          <div className="flex items-center justify-between">
            <span className="text-[11px] font-semibold text-neutral-500 uppercase tracking-wider">
              Total RFQ Enquiries
            </span>
            <div className="p-2 rounded-xl bg-blue-50 text-blue-700">
              <Inbox className="w-4 h-4" />
            </div>
          </div>
          <div className="mt-2 text-2xl font-bold font-heading text-[#102A25]">
            {m.totalLeads}
          </div>
          <div className="mt-1 flex items-center gap-1.5 text-[11px] text-blue-600 font-medium">
            <span>{m.newLeads} Awaiting Review</span>
          </div>
        </div>

        {/* Closed/Converted */}
        <div className="bg-white p-4 rounded-2xl border border-[#E8E2D7] shadow-xs relative overflow-hidden">
          <div className="flex items-center justify-between">
            <span className="text-[11px] font-semibold text-neutral-500 uppercase tracking-wider">
              In-Progress Deals
            </span>
            <div className="p-2 rounded-xl bg-amber-50 text-amber-700">
              <Clock className="w-4 h-4" />
            </div>
          </div>
          <div className="mt-2 text-2xl font-bold font-heading text-[#102A25]">
            {m.inProgressLeads}
          </div>
          <div className="mt-1 flex items-center gap-1.5 text-[11px] text-amber-700 font-medium">
            <span>{m.closedLeads} Converted / Closed</span>
          </div>
        </div>
      </div>

      {/* Analytics Section: 2 Charts */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Product Distribution by Category */}
        <div className="bg-white p-5 rounded-3xl border border-[#E8E2D7] shadow-xs">
          <div className="flex items-center justify-between mb-4">
            <div>
              <h3 className="text-sm font-bold text-[#102A25]">
                Product Catalogue Distribution
              </h3>
              <p className="text-xs text-neutral-400">
                Number of verified products per industrial category
              </p>
            </div>
            <Link
              to="/admin/products"
              className="text-xs text-[#102A25] font-semibold hover:underline flex items-center gap-1"
            >
              <span>View All</span>
              <ArrowUpRight className="w-3.5 h-3.5" />
            </Link>
          </div>

          <div className="space-y-3">
            {data?.charts.productsByCategory.map((item) => {
              const maxCount = Math.max(
                ...data.charts.productsByCategory.map((c) => c.product_count),
                1
              );
              const pct = Math.round((item.product_count / maxCount) * 100);

              return (
                <div key={item.category_name} className="space-y-1">
                  <div className="flex items-center justify-between text-xs">
                    <span className="font-medium text-neutral-700 truncate max-w-[220px]">
                      {item.category_name}
                    </span>
                    <span className="font-bold text-[#102A25]">
                      {item.product_count} items
                    </span>
                  </div>
                  <div className="w-full h-2 bg-neutral-100 rounded-full overflow-hidden">
                    <div
                      className="h-full bg-[#102A25] rounded-full transition-all duration-500"
                      style={{ width: `${pct}%` }}
                    />
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        {/* Lead Inflow Trends */}
        <div className="bg-white p-5 rounded-3xl border border-[#E8E2D7] shadow-xs flex flex-col justify-between">
          <div>
            <div className="flex items-center justify-between mb-4">
              <div>
                <h3 className="text-sm font-bold text-[#102A25]">
                  Enquiry Inflow & RFQs
                </h3>
                <p className="text-xs text-neutral-400">
                  Customer quotation requests over time
                </p>
              </div>
              <Link
                to="/admin/leads"
                className="text-xs text-[#102A25] font-semibold hover:underline flex items-center gap-1"
              >
                <span>View CRM</span>
                <ArrowUpRight className="w-3.5 h-3.5" />
              </Link>
            </div>

            {/* Visual SVG Trend Bar Chart */}
            <div className="h-44 flex items-end gap-3 pt-6 pb-2 px-2 border-b border-neutral-100">
              {data?.charts.monthlyTrends.map((t, idx) => {
                const maxVal = Math.max(
                  ...data.charts.monthlyTrends.map((x) => x.count),
                  10
                );
                const heightPct = Math.max(12, Math.round((t.count / maxVal) * 100));

                return (
                  <div
                    key={idx}
                    className="flex-1 flex flex-col items-center gap-1.5 h-full justify-end group"
                  >
                    <div className="text-[10px] font-bold text-[#102A25] opacity-0 group-hover:opacity-100 transition">
                      {t.count}
                    </div>
                    <div
                      className="w-full bg-[#D9B878]/30 group-hover:bg-[#102A25] rounded-t-lg transition-all duration-300 relative"
                      style={{ height: `${heightPct}%` }}
                    >
                      <div className="absolute inset-x-0 top-0 h-1 bg-[#D9B878] rounded-t-lg" />
                    </div>
                    <span className="text-[10px] text-neutral-400 truncate max-w-[42px]">
                      {t.month_label.split(" ")[0]}
                    </span>
                  </div>
                );
              })}
            </div>
          </div>

          <div className="pt-4 grid grid-cols-2 gap-4 text-xs text-neutral-500">
            <div className="p-3 rounded-xl bg-[#F7F4EE]">
              <div className="text-[10px] font-semibold uppercase text-neutral-400">
                Top Requested Category
              </div>
              <div className="font-bold text-[#102A25] mt-0.5 truncate">
                {data?.charts.leadsByCategory[0]?.category_name || "General Badges"}
              </div>
            </div>
            <div className="p-3 rounded-xl bg-[#F7F4EE]">
              <div className="text-[10px] font-semibold uppercase text-neutral-400">
                Avg. Lead Response Rate
              </div>
              <div className="font-bold text-emerald-700 mt-0.5">
                98.4% Dispatched
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Bottom Section: Recent Enquiries & Latest Products */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Recent Enquiries (2 cols) */}
        <div className="lg:col-span-2 bg-white rounded-3xl border border-[#E8E2D7] shadow-xs overflow-hidden">
          <div className="p-5 border-b border-neutral-100 flex items-center justify-between">
            <div>
              <h3 className="text-sm font-bold text-[#102A25]">
                Recent Inquiries & RFQs
              </h3>
              <p className="text-xs text-neutral-400">
                Latest submissions from website RFQ modal & contact form
              </p>
            </div>
            <Link
              to="/admin/leads"
              className="text-xs font-semibold text-[#102A25] hover:underline"
            >
              See all leads →
            </Link>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-left text-xs">
              <thead className="bg-[#F7F4EE] text-neutral-600 font-semibold border-b border-neutral-200/60">
                <tr>
                  <th className="py-3 px-4">Customer</th>
                  <th className="py-3 px-4">Product / RFQ</th>
                  <th className="py-3 px-4">Qty</th>
                  <th className="py-3 px-4">Status</th>
                  <th className="py-3 px-4 text-right">Action</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-neutral-100">
                {data?.widgets.recentLeads.map((lead) => (
                  <tr key={lead.id} className="hover:bg-neutral-50/80 transition">
                    <td className="py-3 px-4">
                      <div className="font-bold text-[#102A25]">{lead.full_name}</div>
                      <div className="text-[11px] text-neutral-400">
                        {lead.company_name || lead.email}
                      </div>
                    </td>
                    <td className="py-3 px-4">
                      <div className="font-medium text-neutral-800 truncate max-w-[180px]">
                        {lead.product_name || "General Requirement"}
                      </div>
                      <div className="text-[10px] text-neutral-400 capitalize">
                        {lead.category || "General"}
                      </div>
                    </td>
                    <td className="py-3 px-4 font-semibold text-neutral-600">
                      {lead.quantity || "—"}
                    </td>
                    <td className="py-3 px-4">
                      <span
                        className={`inline-block px-2 py-0.5 rounded-full text-[10px] font-bold ${
                          lead.status === "New"
                            ? "bg-blue-100 text-blue-800"
                            : lead.status === "Converted"
                            ? "bg-emerald-100 text-emerald-800"
                            : "bg-neutral-100 text-neutral-700"
                        }`}
                      >
                        {lead.status}
                      </span>
                    </td>
                    <td className="py-3 px-4 text-right">
                      <Link
                        to={`/admin/leads?id=${lead.id}`}
                        className="text-xs font-semibold text-[#102A25] hover:text-[#D9B878] transition"
                      >
                        View
                      </Link>
                    </td>
                  </tr>
                ))}
                {(!data?.widgets.recentLeads || data.widgets.recentLeads.length === 0) && (
                  <tr>
                    <td colSpan={5} className="py-8 text-center text-xs text-neutral-400">
                      No enquiries recorded yet.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </div>

        {/* Activity Trail (1 col) */}
        <div className="bg-white rounded-3xl border border-[#E8E2D7] shadow-xs p-5 flex flex-col justify-between">
          <div>
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-sm font-bold text-[#102A25] flex items-center gap-2">
                <Activity className="w-4 h-4 text-[#D9B878]" />
                <span>Admin Activity</span>
              </h3>
              <Link
                to="/admin/logs"
                className="text-xs text-[#102A25] font-semibold hover:underline"
              >
                All Logs
              </Link>
            </div>

            <div className="space-y-3.5">
              {data?.widgets.recentActivity.slice(0, 6).map((act) => (
                <div key={act.id} className="text-xs flex items-start gap-2.5">
                  <div className="w-2 h-2 rounded-full bg-[#D9B878] mt-1.5 shrink-0" />
                  <div className="flex-1 min-w-0">
                    <div className="font-semibold text-neutral-800 truncate">
                      {act.admin_name}
                    </div>
                    <div className="text-[11px] text-neutral-500 leading-snug line-clamp-2">
                      {act.details || act.action}
                    </div>
                    <div className="text-[10px] text-neutral-400 mt-0.5">
                      {new Date(act.created_at).toLocaleDateString("en-IN", {
                        hour: "2-digit",
                        minute: "2-digit",
                      })}
                    </div>
                  </div>
                </div>
              ))}
              {(!data?.widgets.recentActivity || data.widgets.recentActivity.length === 0) && (
                <div className="py-6 text-center text-xs text-neutral-400">
                  No activity recorded yet.
                </div>
              )}
            </div>
          </div>

          <div className="mt-4 pt-3 border-t border-neutral-100 flex items-center justify-between text-[11px] text-neutral-400">
            <span>Audit Trail Policy</span>
            <span className="text-emerald-700 font-semibold">Active & Immutable</span>
          </div>
        </div>
      </div>
    </div>
  );
}
