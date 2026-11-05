import React, { useState, useEffect, useCallback } from "react";
import {
  Package,
  Plus,
  Search,
  Filter,
  Download,
  Trash2,
  Edit2,
  Copy,
  ExternalLink,
  ChevronLeft,
  ChevronRight,
  Eye,
  RefreshCw,
  Loader2,
  CheckCircle,
  Archive,
  Star,
  MoreVertical,
  AlertCircle,
} from "lucide-react";
import { AdminProductEditor } from "./AdminProductEditor";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "../components/Toast";

interface ProductItem {
  id: string;
  sku: string;
  title: string;
  slug: string;
  categoryId: string;
  categoryName: string;
  thumbnail: string;
  featured: boolean;
  minQuantity: number;
  status: "published" | "draft" | "archived";
  displayOrder: number;
  updatedAt: string;
}

interface CategoryOption {
  id: string;
  name: string;
}

export function AdminProductsPage() {
  const { csrfToken } = useAdminAuth();
  const toast = useToast();

  const [products, setProducts] = useState<ProductItem[]>([]);
  const [categories, setCategories] = useState<CategoryOption[]>([]);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);

  // Filters & Pagination
  const [search, setSearch] = useState("");
  const [debouncedSearch, setDebouncedSearch] = useState("");
  const [categoryFilter, setCategoryFilter] = useState("");
  const [statusFilter, setStatusFilter] = useState("");
  const [sortOrder, setSortOrder] = useState("order");
  const [page, setPage] = useState(1);
  const [limit, setLimit] = useState(25);
  const [totalPages, setTotalPages] = useState(1);
  const [totalCount, setTotalCount] = useState(0);

  // Selection & Bulk
  const [selectedIds, setSelectedIds] = useState<string[]>([]);
  const [bulkProcessing, setBulkProcessing] = useState(false);

  // Editor Modal
  const [editorOpen, setEditorOpen] = useState(false);
  const [editingProductId, setEditingProductId] = useState<string | null>(null);

  // Delete Confirm Modal
  const [deleteConfirmId, setDeleteConfirmId] = useState<string | null>(null);

  // Debounce search
  useEffect(() => {
    const timer = setTimeout(() => {
      setDebouncedSearch(search);
      setPage(1);
    }, 350);
    return () => clearTimeout(timer);
  }, [search]);

  // Load categories
  useEffect(() => {
    fetch("/api/admin/categories", { credentials: "include" })
      .then((r) => r.json())
      .then((d) => {
        if (d.categories) setCategories(d.categories);
      })
      .catch(() => {});
  }, []);

  const fetchProducts = useCallback(
    async (isManual = false) => {
      if (isManual) setRefreshing(true);
      else setLoading(true);

      try {
        const params = new URLSearchParams({
          page: String(page),
          limit: String(limit),
          sort: sortOrder,
        });
        if (debouncedSearch) params.set("search", debouncedSearch);
        if (categoryFilter) params.set("category", categoryFilter);
        if (statusFilter) params.set("status", statusFilter);

        const res = await fetch(`/api/admin/products?${params.toString()}`, {
          credentials: "include",
        });
        const data = await res.json();

        if (res.ok && data.success) {
          setProducts(data.products || []);
          setTotalCount(data.total || 0);
          setTotalPages(data.totalPages || 1);
        } else {
          toast.error(data.message || "Failed to load products");
        }
      } catch (e) {
        toast.error("Network error while loading products");
      } finally {
        setLoading(false);
        setRefreshing(false);
      }
    },
    [page, limit, sortOrder, debouncedSearch, categoryFilter, statusFilter, toast]
  );

  useEffect(() => {
    fetchProducts();
  }, [fetchProducts]);

  // Handle single delete
  const handleDeleteProduct = async (id: string) => {
    try {
      const res = await fetch(`/api/admin/products?id=${encodeURIComponent(id)}`, {
        method: "DELETE",
        headers: {
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success("Product deleted successfully");
        setDeleteConfirmId(null);
        setSelectedIds((prev) => prev.filter((i) => i !== id));
        fetchProducts();
      } else {
        toast.error(data.message || "Could not delete product");
      }
    } catch (e) {
      toast.error("Failed to execute deletion");
    }
  };

  // Handle Bulk Actions
  const handleBulkAction = async (action: "publish" | "draft" | "archive" | "delete") => {
    if (selectedIds.length === 0) return;
    if (
      action === "delete" &&
      !window.confirm(`Are you sure you want to permanently delete ${selectedIds.length} selected products?`)
    ) {
      return;
    }

    setBulkProcessing(true);
    try {
      const res = await fetch("/api/admin/products?action=bulk", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: JSON.stringify({
          ids: selectedIds,
          bulkAction: action,
        }),
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success(`Bulk ${action} completed for ${selectedIds.length} items`);
        setSelectedIds([]);
        fetchProducts();
      } else {
        toast.error(data.message || "Bulk action failed");
      }
    } catch (e) {
      toast.error("Error processing bulk action");
    } finally {
      setBulkProcessing(false);
    }
  };

  // Toggle selection
  const toggleSelectAll = () => {
    if (selectedIds.length === products.length) {
      setSelectedIds([]);
    } else {
      setSelectedIds(products.map((p) => p.id));
    }
  };

  const toggleSelect = (id: string) => {
    setSelectedIds((prev) =>
      prev.includes(id) ? prev.filter((i) => i !== id) : [...prev, id]
    );
  };

  return (
    <div className="space-y-6">
      {/* Top Banner & Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2">
            <h2 className="text-2xl font-bold text-[#102A25] tracking-tight">
              Product Catalogue
            </h2>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-[#102A25]/10 text-[#102A25]">
              {totalCount} Total
            </span>
          </div>
          <p className="text-xs text-neutral-500 mt-1">
            Manage your industrial products, specifications, photo galleries, and SEO parameters.
          </p>
        </div>

        <div className="flex items-center gap-2.5">
          <a
            href="/api/admin/products?action=export"
            download
            className="inline-flex items-center gap-1.5 px-3 py-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 text-xs font-semibold text-neutral-700 shadow-xs transition"
            title="Export CSV of current catalogue"
          >
            <Download className="w-4 h-4 text-neutral-500" />
            <span className="hidden sm:inline">Export CSV</span>
          </a>

          <button
            onClick={() => fetchProducts(true)}
            disabled={refreshing}
            className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 text-neutral-600 transition shadow-xs"
            title="Refresh List"
          >
            <RefreshCw className={`w-4 h-4 ${refreshing ? "animate-spin" : ""}`} />
          </button>

          <button
            onClick={() => {
              setEditingProductId(null);
              setEditorOpen(true);
            }}
            className="inline-flex items-center gap-1.5 px-4 py-2 rounded-xl bg-[#102A25] hover:bg-[#172B27] text-white text-xs font-bold shadow-sm transition"
          >
            <Plus className="w-4 h-4 text-[#D9B878]" />
            <span>Add Product</span>
          </button>
        </div>
      </div>

      {/* Filter & Search Bar */}
      <div className="bg-white rounded-2xl p-4 border border-neutral-200 shadow-xs flex flex-col md:flex-row gap-3 items-stretch md:items-center justify-between">
        <div className="relative flex-1">
          <Search className="w-4 h-4 absolute left-3.5 top-1/2 -translate-y-1/2 text-neutral-400" />
          <input
            type="text"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="Search products by title, SKU, tags or material..."
            className="w-full pl-9 pr-4 py-2 text-xs rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25] focus:ring-1 focus:ring-[#102A25] transition"
          />
        </div>

        <div className="flex flex-wrap items-center gap-2">
          {/* Category Filter */}
          <select
            value={categoryFilter}
            onChange={(e) => {
              setCategoryFilter(e.target.value);
              setPage(1);
            }}
            className="px-3 py-2 text-xs rounded-xl border border-neutral-200 bg-white text-neutral-700 focus:outline-none focus:border-[#102A25]"
          >
            <option value="">All Categories</option>
            {categories.map((c) => (
              <option key={c.id} value={c.id}>
                {c.name}
              </option>
            ))}
          </select>

          {/* Status Filter */}
          <select
            value={statusFilter}
            onChange={(e) => {
              setStatusFilter(e.target.value);
              setPage(1);
            }}
            className="px-3 py-2 text-xs rounded-xl border border-neutral-200 bg-white text-neutral-700 focus:outline-none focus:border-[#102A25]"
          >
            <option value="">All Statuses</option>
            <option value="published">Published</option>
            <option value="draft">Draft</option>
            <option value="archived">Archived</option>
          </select>

          {/* Sort Order */}
          <select
            value={sortOrder}
            onChange={(e) => {
              setSortOrder(e.target.value);
              setPage(1);
            }}
            className="px-3 py-2 text-xs rounded-xl border border-neutral-200 bg-white text-neutral-700 focus:outline-none focus:border-[#102A25]"
          >
            <option value="order">Display Order</option>
            <option value="newest">Recently Updated</option>
            <option value="title_asc">Title (A-Z)</option>
            <option value="sku_asc">SKU (A-Z)</option>
          </select>
        </div>
      </div>

      {/* Bulk Action Bar (when selected) */}
      {selectedIds.length > 0 && (
        <div className="bg-[#102A25] text-white p-3 rounded-xl shadow-lg flex items-center justify-between animate-in slide-in-from-top-2 duration-200">
          <div className="flex items-center gap-2 text-xs font-medium pl-2">
            <span className="w-5 h-5 rounded-full bg-[#D9B878] text-[#102A25] font-bold flex items-center justify-center text-[10px]">
              {selectedIds.length}
            </span>
            <span>products selected</span>
          </div>

          <div className="flex items-center gap-2">
            <button
              onClick={() => handleBulkAction("publish")}
              disabled={bulkProcessing}
              className="px-3 py-1.5 rounded-lg bg-emerald-700 hover:bg-emerald-600 text-xs font-semibold transition"
            >
              Publish
            </button>
            <button
              onClick={() => handleBulkAction("draft")}
              disabled={bulkProcessing}
              className="px-3 py-1.5 rounded-lg bg-amber-700 hover:bg-amber-600 text-xs font-semibold transition"
            >
              Draft
            </button>
            <button
              onClick={() => handleBulkAction("archive")}
              disabled={bulkProcessing}
              className="px-3 py-1.5 rounded-lg bg-neutral-700 hover:bg-neutral-600 text-xs font-semibold transition"
            >
              Archive
            </button>
            <button
              onClick={() => handleBulkAction("delete")}
              disabled={bulkProcessing}
              className="px-3 py-1.5 rounded-lg bg-red-600 hover:bg-red-500 text-xs font-semibold transition flex items-center gap-1"
            >
              <Trash2 className="w-3.5 h-3.5" />
              <span>Delete</span>
            </button>
          </div>
        </div>
      )}

      {/* Products Table */}
      <div className="bg-white rounded-2xl border border-neutral-200 shadow-xs overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-xs text-neutral-600">
            <thead className="bg-[#FAF8F5] border-b border-neutral-200 text-neutral-500 uppercase tracking-wider font-semibold text-[10px]">
              <tr>
                <th className="p-4 w-10">
                  <input
                    type="checkbox"
                    checked={
                      products.length > 0 && selectedIds.length === products.length
                    }
                    onChange={toggleSelectAll}
                    className="rounded border-neutral-300 text-[#102A25] focus:ring-[#102A25]"
                  />
                </th>
                <th className="p-4 w-16">Item</th>
                <th className="p-4">Title & Details</th>
                <th className="p-4">Category</th>
                <th className="p-4">Status</th>
                <th className="p-4">Order</th>
                <th className="p-4 text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-neutral-100">
              {loading ? (
                <tr>
                  <td colSpan={7} className="py-16 text-center">
                    <Loader2 className="w-6 h-6 animate-spin text-[#102A25] mx-auto mb-2" />
                    <p className="text-xs text-neutral-400">Loading products from catalogue...</p>
                  </td>
                </tr>
              ) : products.length === 0 ? (
                <tr>
                  <td colSpan={7} className="py-16 text-center">
                    <Package className="w-8 h-8 text-neutral-300 mx-auto mb-2" />
                    <p className="text-sm font-semibold text-neutral-700">No products found</p>
                    <p className="text-xs text-neutral-400 mt-0.5">
                      Try adjusting your search criteria or add a new product.
                    </p>
                  </td>
                </tr>
              ) : (
                products.map((p) => {
                  const isSelected = selectedIds.includes(p.id);
                  return (
                    <tr
                      key={p.id}
                      className={`hover:bg-[#FAF8F5]/60 transition ${
                        isSelected ? "bg-[#FAF8F5]" : ""
                      }`}
                    >
                      <td className="p-4">
                        <input
                          type="checkbox"
                          checked={isSelected}
                          onChange={() => toggleSelect(p.id)}
                          className="rounded border-neutral-300 text-[#102A25] focus:ring-[#102A25]"
                        />
                      </td>

                      {/* Thumbnail */}
                      <td className="p-4">
                        <div className="w-12 h-12 rounded-lg bg-neutral-100 border border-neutral-200 overflow-hidden flex items-center justify-center shrink-0">
                          {p.thumbnail ? (
                            <img
                              src={p.thumbnail}
                              alt={p.title}
                              className="w-full h-full object-cover"
                              onError={(e) => {
                                (e.target as HTMLElement).style.display = "none";
                              }}
                            />
                          ) : (
                            <Package className="w-5 h-5 text-neutral-300" />
                          )}
                        </div>
                      </td>

                      {/* Title & SKU */}
                      <td className="p-4 max-w-sm">
                        <div className="flex items-center gap-2">
                          <span className="font-bold text-neutral-900 line-clamp-1">
                            {p.title}
                          </span>
                          {p.featured && (
                            <span className="px-1.5 py-0.5 rounded text-[10px] font-semibold bg-[#D9B878]/30 text-[#102A25]">
                              Featured
                            </span>
                          )}
                        </div>
                        <div className="flex items-center gap-2 mt-0.5 text-[11px] text-neutral-400 font-mono">
                          <span>SKU: {p.sku}</span>
                          <span>•</span>
                          <span>MOQ: {p.minQuantity}</span>
                        </div>
                      </td>

                      {/* Category */}
                      <td className="p-4">
                        <span className="inline-block px-2.5 py-1 rounded-md text-[11px] font-medium bg-neutral-100 text-neutral-700">
                          {p.categoryName || p.categoryId}
                        </span>
                      </td>

                      {/* Status */}
                      <td className="p-4">
                        <span
                          className={`inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-semibold ${
                            p.status === "published"
                              ? "bg-emerald-50 text-emerald-700 border border-emerald-200"
                              : p.status === "draft"
                              ? "bg-amber-50 text-amber-700 border border-amber-200"
                              : "bg-neutral-100 text-neutral-600 border border-neutral-200"
                          }`}
                        >
                          {p.status.charAt(0).toUpperCase() + p.status.slice(1)}
                        </span>
                      </td>

                      {/* Display Order */}
                      <td className="p-4 font-mono text-[11px] text-neutral-500">
                        #{p.displayOrder}
                      </td>

                      {/* Actions */}
                      <td className="p-4 text-right">
                        <div className="inline-flex items-center gap-1">
                          <a
                            href={`/products/${p.slug}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="p-1.5 rounded-lg text-neutral-400 hover:text-neutral-700 hover:bg-neutral-100 transition"
                            title="View Public Page"
                          >
                            <ExternalLink className="w-3.5 h-3.5" />
                          </a>

                          <button
                            onClick={() => {
                              setEditingProductId(p.id);
                              setEditorOpen(true);
                            }}
                            className="p-1.5 rounded-lg text-[#102A25] hover:bg-[#102A25]/10 transition"
                            title="Edit Product"
                          >
                            <Edit2 className="w-3.5 h-3.5" />
                          </button>

                          <button
                            onClick={() => setDeleteConfirmId(p.id)}
                            className="p-1.5 rounded-lg text-red-500 hover:bg-red-50 transition"
                            title="Delete Product"
                          >
                            <Trash2 className="w-3.5 h-3.5" />
                          </button>
                        </div>
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>

        {/* Pagination Footer */}
        <div className="px-6 py-4 border-t border-neutral-200 bg-[#FAF8F5] flex flex-col sm:flex-row items-center justify-between gap-4">
          <div className="text-xs text-neutral-500">
            Showing <span className="font-semibold">{products.length ? (page - 1) * limit + 1 : 0}</span> to{" "}
            <span className="font-semibold">{Math.min(page * limit, totalCount)}</span> of{" "}
            <span className="font-semibold">{totalCount}</span> items
          </div>

          <div className="flex items-center gap-2">
            <button
              onClick={() => setPage((p) => Math.max(1, p - 1))}
              disabled={page <= 1 || loading}
              className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 disabled:opacity-40 transition text-neutral-700"
            >
              <ChevronLeft className="w-4 h-4" />
            </button>

            <span className="text-xs font-semibold px-2 text-neutral-700">
              Page {page} of {totalPages}
            </span>

            <button
              onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
              disabled={page >= totalPages || loading}
              className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 disabled:opacity-40 transition text-neutral-700"
            >
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>

      {/* Editor Modal Drawer */}
      <AdminProductEditor
        productId={editingProductId}
        isOpen={editorOpen}
        onClose={() => setEditorOpen(false)}
        onSaved={() => {
          fetchProducts();
        }}
      />

      {/* Delete Confirmation Modal */}
      {deleteConfirmId && (
        <div className="fixed inset-0 z-50 bg-black/60 backdrop-blur-xs flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl max-w-sm w-full p-6 shadow-2xl border border-neutral-200 animate-in zoom-in-95 duration-150">
            <div className="w-12 h-12 rounded-full bg-red-100 text-red-600 flex items-center justify-center mx-auto mb-4">
              <AlertCircle className="w-6 h-6" />
            </div>
            <h3 className="text-center font-bold text-neutral-900 text-base">
              Delete Product?
            </h3>
            <p className="text-center text-xs text-neutral-500 mt-2">
              Are you sure you want to delete this product? This action cannot be undone. Public URLs may return 404 until static cache is regenerated.
            </p>
            <div className="flex items-center gap-3 mt-6">
              <button
                onClick={() => setDeleteConfirmId(null)}
                className="flex-1 py-2 text-xs font-semibold rounded-xl border border-neutral-300 text-neutral-700 hover:bg-neutral-50 transition"
              >
                Cancel
              </button>
              <button
                onClick={() => handleDeleteProduct(deleteConfirmId)}
                className="flex-1 py-2 text-xs font-bold rounded-xl bg-red-600 text-white hover:bg-red-700 transition"
              >
                Delete Permanently
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
