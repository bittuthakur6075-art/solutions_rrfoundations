import React, { useState, useEffect } from "react";
import {
  Globe,
  Save,
  Search,
  ExternalLink,
  RefreshCw,
  Loader2,
  CheckCircle2,
  FileCode,
  ShieldCheck,
  Eye,
  Sparkles,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "../components/Toast";

interface SeoSettings {
  [key: string]: string;
}

const coreRoutes = [
  { path: "/", name: "Homepage", defaultTitle: "RR Foundations | Industrial Manufacturing Excellence" },
  { path: "/products", name: "Product Catalogue", defaultTitle: "Industrial Products Catalogue | RR Foundations" },
  { path: "/manufacturing", name: "Manufacturing Infrastructure", defaultTitle: "State-of-the-Art Manufacturing | RR Foundations" },
  { path: "/industries", name: "Industries Served", defaultTitle: "Defence, Corporate & Industrial Solutions | RR Foundations" },
  { path: "/about", name: "About Us & Legacy", defaultTitle: "Our Heritage & Quality Standards | RR Foundations" },
  { path: "/contact", name: "Contact & Head Office", defaultTitle: "Get in Touch | RR Foundations" },
  { path: "/request-quote", name: "Request for Quotation (RFQ)", defaultTitle: "Submit RFQ & Custom Order | RR Foundations" },
];

export function AdminSeoPage() {
  const { csrfToken } = useAdminAuth();
  const toast = useToast();

  const [settings, setSettings] = useState<SeoSettings>({});
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [selectedRoute, setSelectedRoute] = useState(coreRoutes[0].path);

  const fetchSettings = async () => {
    setLoading(true);
    try {
      const res = await fetch("/api/admin/settings", { credentials: "include" });
      const data = await res.json();
      if (res.ok && data.settings) {
        setSettings(data.settings);
      }
    } catch (e) {
      toast.error("Failed to load SEO configuration");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchSettings();
  }, []);

  const handleChange = (key: string, value: string) => {
    setSettings((prev) => ({ ...prev, [key]: value }));
  };

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    try {
      const res = await fetch("/api/admin/settings", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: JSON.stringify({ settings }),
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success("SEO configurations saved successfully");
      } else {
        toast.error(data.message || "Failed to update settings");
      }
    } catch (e) {
      toast.error("Error saving SEO configuration");
    } finally {
      setSaving(false);
    }
  };

  // Route specific key helpers
  const routePrefix = selectedRoute === "/" ? "home" : selectedRoute.replace("/", "");
  const currentTitle = settings[`seo_${routePrefix}_title`] || "";
  const currentDesc = settings[`seo_${routePrefix}_desc`] || "";

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2">
            <h2 className="text-2xl font-bold text-[#102A25] tracking-tight">
              Search Engine Optimization (SEO)
            </h2>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-100 text-emerald-800">
              Sitemap Active
            </span>
          </div>
          <p className="text-xs text-neutral-500 mt-1">
            Configure canonical tags, meta titles, Google Analytics tracking, and sitemap synchronization.
          </p>
        </div>

        <button
          onClick={handleSave}
          disabled={saving || loading}
          className="inline-flex items-center gap-1.5 px-5 py-2.5 rounded-xl bg-[#102A25] hover:bg-[#172B27] text-white text-xs font-bold shadow-sm transition disabled:opacity-50"
        >
          {saving ? (
            <Loader2 className="w-4 h-4 animate-spin text-[#D9B878]" />
          ) : (
            <Save className="w-4 h-4 text-[#D9B878]" />
          )}
          <span>Save SEO Settings</span>
        </button>
      </div>

      {loading ? (
        <div className="py-20 text-center">
          <Loader2 className="w-8 h-8 animate-spin text-[#102A25] mx-auto mb-2" />
          <p className="text-xs text-neutral-400">Loading SEO configurations...</p>
        </div>
      ) : (
        <form onSubmit={handleSave} className="space-y-6">
          {/* Global Analytics & Verification Card */}
          <div className="bg-white rounded-2xl p-6 border border-neutral-200 shadow-xs space-y-4">
            <div className="flex items-center gap-2 border-b border-neutral-100 pb-3">
              <Globe className="w-5 h-5 text-[#D9B878]" />
              <h3 className="font-bold text-sm text-[#102A25]">
                Global Search Engine & Analytics Integrations
              </h3>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-xs">
              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Google Analytics Measurement ID
                </label>
                <input
                  type="text"
                  value={settings.google_analytics_id || ""}
                  onChange={(e) => handleChange("google_analytics_id", e.target.value)}
                  placeholder="G-XXXXXXXXXX"
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 font-mono text-[11px]"
                />
                <p className="text-[10px] text-neutral-400 mt-1">Injected into public head template</p>
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Google Search Console Verification Token
                </label>
                <input
                  type="text"
                  value={settings.google_site_verification || ""}
                  onChange={(e) => handleChange("google_site_verification", e.target.value)}
                  placeholder="verification_token_string"
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 font-mono text-[11px]"
                />
                <p className="text-[10px] text-neutral-400 mt-1">google-site-verification meta tag</p>
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Default OG Social Share Image URL
                </label>
                <input
                  type="text"
                  value={settings.default_og_image || ""}
                  onChange={(e) => handleChange("default_og_image", e.target.value)}
                  placeholder="/assets/products/category-badge-showcase.jpg"
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 text-[11px]"
                />
                <p className="text-[10px] text-neutral-400 mt-1">Recommended 1200x630px</p>
              </div>
            </div>
          </div>

          {/* Route-By-Route SEO Editor */}
          <div className="bg-white rounded-2xl p-6 border border-neutral-200 shadow-xs space-y-6">
            <div className="border-b border-neutral-100 pb-3 flex items-center justify-between">
              <div>
                <h3 className="font-bold text-sm text-[#102A25]">
                  Core Route Metadata Configuration
                </h3>
                <p className="text-xs text-neutral-500 mt-0.5">
                  Select a public page to customize its specific search engine title and description.
                </p>
              </div>
            </div>

            {/* Route Tabs */}
            <div className="flex flex-wrap gap-2">
              {coreRoutes.map((route) => (
                <button
                  type="button"
                  key={route.path}
                  onClick={() => setSelectedRoute(route.path)}
                  className={`px-3 py-1.5 rounded-xl text-xs font-semibold transition ${
                    selectedRoute === route.path
                      ? "bg-[#102A25] text-white shadow-xs"
                      : "bg-neutral-100 text-neutral-600 hover:bg-neutral-200"
                  }`}
                >
                  {route.name}
                  <span className="ml-1.5 text-[10px] opacity-70 font-mono">{route.path}</span>
                </button>
              ))}
            </div>

            {/* Inputs for selected route */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 pt-2">
              <div className="space-y-4 text-xs">
                <div>
                  <div className="flex justify-between items-center mb-1">
                    <label className="font-semibold text-neutral-700">Meta Title</label>
                    <span className="text-[10px] text-neutral-400 font-mono">
                      {currentTitle.length}/60 chars
                    </span>
                  </div>
                  <input
                    type="text"
                    value={currentTitle}
                    onChange={(e) => handleChange(`seo_${routePrefix}_title`, e.target.value)}
                    placeholder={coreRoutes.find((r) => r.path === selectedRoute)?.defaultTitle}
                    className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
                  />
                </div>

                <div>
                  <div className="flex justify-between items-center mb-1">
                    <label className="font-semibold text-neutral-700">Meta Description</label>
                    <span className="text-[10px] text-neutral-400 font-mono">
                      {currentDesc.length}/160 chars
                    </span>
                  </div>
                  <textarea
                    rows={4}
                    value={currentDesc}
                    onChange={(e) => handleChange(`seo_${routePrefix}_desc`, e.target.value)}
                    placeholder="Enter an engaging, keyword-rich summary for search engine snippet result..."
                    className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
                  />
                </div>
              </div>

              {/* SERP Search Result Live Preview */}
              <div>
                <label className="block text-xs font-bold text-neutral-700 mb-2">
                  Live Google SERP Snippet Preview
                </label>
                <div className="p-4 rounded-xl border border-neutral-200 bg-[#FAF8F5] space-y-1 text-left">
                  <div className="flex items-center gap-1.5 text-[11px] text-[#202124]">
                    <div className="w-4 h-4 rounded-full bg-[#102A25] flex items-center justify-center text-[#D9B878] text-[9px] font-bold">
                      R
                    </div>
                    <span className="text-neutral-700 font-medium truncate">
                      solutions.rrfoundations.org{selectedRoute}
                    </span>
                  </div>
                  <h4 className="text-sm font-semibold text-[#1a0dab] hover:underline cursor-pointer line-clamp-1 leading-snug">
                    {currentTitle || coreRoutes.find((r) => r.path === selectedRoute)?.defaultTitle}
                  </h4>
                  <p className="text-xs text-[#4d5156] line-clamp-2 leading-relaxed">
                    {currentDesc ||
                      "RR Foundations manufactures bespoke corporate lapel pins, military medals, metal emblems, and industrial trophies for government, corporate and defence clients across India."}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </form>
      )}
    </div>
  );
}
