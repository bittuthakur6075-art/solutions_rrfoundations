import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import {
  Layers,
  Plus,
  Edit2,
  Trash2,
  ExternalLink,
  RefreshCw,
  Loader2,
  Image as ImageIcon,
  AlertCircle,
  Save,
  X,
  Package,
  ArrowUp,
  ArrowDown,
  CheckCircle,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "../components/Toast";

interface Category {
  id: string;
  name: string;
  slug: string;
  description: string;
  image: string;
  banner_image?: string;
  icon?: string;
  highlights?: string[];
  display_order: number;
  status: "published" | "draft" | "archived";
  actual_product_count: number;
  seo_title?: string;
  seo_description?: string;
}

export function AdminCategoriesPage() {
  const { csrfToken } = useAdminAuth();
  const toast = useToast();

  const [categories, setCategories] = useState<Category[]>([]);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);

  // Modal State
  const [modalOpen, setModalOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [formData, setFormData] = useState({
    id: "",
    name: "",
    slug: "",
    description: "",
    image: "",
    bannerImage: "",
    icon: "Layers",
    highlights: [] as string[],
    displayOrder: 0,
    status: "published" as "published" | "draft" | "archived",
    seoTitle: "",
    seoDescription: "",
  });
  const [newHighlight, setNewHighlight] = useState("");
  const [saving, setSaving] = useState(false);

  // Delete modal
  const [deleteConfirm, setDeleteConfirm] = useState<{ id: string; name: string; count: number } | null>(null);

  const fetchCategories = async (isManual = false) => {
    if (isManual) setRefreshing(true);
    else setLoading(true);

    try {
      const res = await fetch("/api/admin/categories", { credentials: "include" });
      const data = await res.json();
      if (res.ok && data.categories) {
        setCategories(data.categories);
      } else {
        toast.error(data.message || "Failed to load categories");
      }
    } catch (e) {
      toast.error("Network error while loading categories");
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  };

  useEffect(() => {
    fetchCategories();
  }, []);

  const openCreateModal = () => {
    setEditingId(null);
    setFormData({
      id: "",
      name: "",
      slug: "",
      description: "",
      image: "/assets/products/category-badge-showcase.jpg",
      bannerImage: "",
      icon: "Layers",
      highlights: [],
      displayOrder: categories.length + 1,
      status: "published",
      seoTitle: "",
      seoDescription: "",
    });
    setModalOpen(true);
  };

  const openEditModal = (cat: Category) => {
    setEditingId(cat.id);
    setFormData({
      id: cat.id,
      name: cat.name,
      slug: cat.slug || cat.id,
      description: cat.description || "",
      image: cat.image || "",
      bannerImage: cat.banner_image || "",
      icon: cat.icon || "Layers",
      highlights: Array.isArray(cat.highlights) ? cat.highlights : [],
      displayOrder: cat.display_order || 0,
      status: cat.status || "published",
      seoTitle: cat.seo_title || "",
      seoDescription: cat.seo_description || "",
    });
    setModalOpen(true);
  };

  const handleNameChange = (name: string) => {
    if (!editingId) {
      const slug = name
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, "-")
        .replace(/(^-|-$)+/g, "");
      setFormData((prev) => ({ ...prev, name, id: slug, slug }));
    } else {
      setFormData((prev) => ({ ...prev, name }));
    }
  };

  const addHighlight = () => {
    const val = newHighlight.trim();
    if (!val) return;
    if (!formData.highlights.includes(val)) {
      setFormData((prev) => ({ ...prev, highlights: [...prev.highlights, val] }));
    }
    setNewHighlight("");
  };

  const removeHighlight = (index: number) => {
    setFormData((prev) => ({
      ...prev,
      highlights: prev.highlights.filter((_, i) => i !== index),
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.name.trim() || !formData.id.trim()) {
      toast.error("Category name and ID are required.");
      return;
    }

    setSaving(true);
    try {
      const url = editingId
        ? `/api/admin/categories?id=${encodeURIComponent(editingId)}`
        : "/api/admin/categories";
      const method = editingId ? "PUT" : "POST";

      const res = await fetch(url, {
        method,
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: JSON.stringify(formData),
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success(editingId ? "Category updated successfully" : "Category created successfully");
        setModalOpen(false);
        fetchCategories();
      } else {
        toast.error(data.message || "Failed to save category");
      }
    } catch (e) {
      toast.error("Network error while saving category");
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async (id: string) => {
    try {
      const res = await fetch(`/api/admin/categories?id=${encodeURIComponent(id)}`, {
        method: "DELETE",
        headers: {
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success("Category deleted successfully");
        setDeleteConfirm(null);
        fetchCategories();
      } else {
        toast.error(data.message || "Failed to delete category");
      }
    } catch (e) {
      toast.error("Network error while deleting category");
    }
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2">
            <h2 className="text-2xl font-bold text-[#102A25] tracking-tight">
              Category Taxonomy
            </h2>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-[#102A25]/10 text-[#102A25]">
              {categories.length} Categories
            </span>
          </div>
          <p className="text-xs text-neutral-500 mt-1">
            Organize products into industrial categories with custom SEO landing pages and photography.
          </p>
        </div>

        <div className="flex items-center gap-2.5">
          <button
            onClick={() => fetchCategories(true)}
            disabled={refreshing}
            className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 text-neutral-600 transition shadow-xs"
            title="Refresh List"
          >
            <RefreshCw className={`w-4 h-4 ${refreshing ? "animate-spin" : ""}`} />
          </button>

          <button
            onClick={openCreateModal}
            className="inline-flex items-center gap-1.5 px-4 py-2 rounded-xl bg-[#102A25] hover:bg-[#172B27] text-white text-xs font-bold shadow-sm transition"
          >
            <Plus className="w-4 h-4 text-[#D9B878]" />
            <span>Add Category</span>
          </button>
        </div>
      </div>

      {/* Categories Grid */}
      {loading ? (
        <div className="py-20 text-center">
          <Loader2 className="w-8 h-8 animate-spin text-[#102A25] mx-auto mb-2" />
          <p className="text-xs text-neutral-400">Loading taxonomy catalogue...</p>
        </div>
      ) : categories.length === 0 ? (
        <div className="bg-white rounded-2xl p-12 text-center border border-neutral-200">
          <Layers className="w-10 h-10 text-neutral-300 mx-auto mb-3" />
          <h3 className="text-base font-bold text-neutral-800">No categories found</h3>
          <p className="text-xs text-neutral-500 mt-1">
            Get started by creating your first product category.
          </p>
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
          {categories.map((cat) => (
            <div
              key={cat.id}
              className="bg-white rounded-2xl border border-neutral-200 shadow-xs overflow-hidden flex flex-col hover:border-[#102A25]/30 transition group"
            >
              {/* Category Thumbnail & Cover */}
              <div className="h-40 bg-neutral-100 relative overflow-hidden">
                {cat.image ? (
                  <img
                    src={cat.image}
                    alt={cat.name}
                    className="w-full h-full object-cover group-hover:scale-105 transition duration-500"
                    onError={(e) => {
                      (e.target as HTMLElement).style.display = "none";
                    }}
                  />
                ) : (
                  <div className="w-full h-full flex items-center justify-center text-neutral-300">
                    <ImageIcon className="w-10 h-10" />
                  </div>
                )}
                <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-transparent" />

                {/* Status Badge */}
                <div className="absolute top-3 right-3 flex items-center gap-1.5">
                  <span
                    className={`px-2 py-0.5 rounded-full text-[10px] font-bold uppercase tracking-wider backdrop-blur-md ${
                      cat.status === "published"
                        ? "bg-emerald-500/80 text-white"
                        : "bg-amber-500/80 text-white"
                    }`}
                  >
                    {cat.status}
                  </span>
                </div>

                {/* Name & Count */}
                <div className="absolute bottom-3 left-4 right-4">
                  <h3 className="font-bold text-white text-base leading-tight drop-shadow-sm">
                    {cat.name}
                  </h3>
                  <div className="flex items-center gap-2 mt-1 text-[11px] text-[#D9B878]">
                    <span className="font-mono">ID: {cat.id}</span>
                    <span>•</span>
                    <span className="font-semibold">{cat.actual_product_count} Products</span>
                  </div>
                </div>
              </div>

              {/* Body */}
              <div className="p-4 flex-1 flex flex-col justify-between">
                <div>
                  <p className="text-xs text-neutral-600 line-clamp-2 leading-relaxed">
                    {cat.description || "No category description provided."}
                  </p>

                  {cat.highlights && cat.highlights.length > 0 && (
                    <div className="flex flex-wrap gap-1 mt-3">
                      {cat.highlights.slice(0, 3).map((h, i) => (
                        <span
                          key={i}
                          className="px-2 py-0.5 bg-neutral-100 rounded text-[10px] text-neutral-600"
                        >
                          {h}
                        </span>
                      ))}
                      {cat.highlights.length > 3 && (
                        <span className="px-1.5 py-0.5 bg-neutral-100 rounded text-[10px] text-neutral-400">
                          +{cat.highlights.length - 3}
                        </span>
                      )}
                    </div>
                  )}
                </div>

                {/* Action Bar */}
                <div className="mt-4 pt-3 border-t border-neutral-100 flex items-center justify-between">
                  <Link
                    to={`/admin/products?category=${encodeURIComponent(cat.id)}`}
                    className="inline-flex items-center gap-1 text-[11px] font-semibold text-[#102A25] hover:text-[#D9B878] transition"
                  >
                    <Package className="w-3.5 h-3.5" />
                    <span>View {cat.actual_product_count} Items</span>
                  </Link>

                  <div className="flex items-center gap-1">
                    <button
                      onClick={() => openEditModal(cat)}
                      className="p-1.5 rounded-lg text-neutral-600 hover:text-neutral-900 hover:bg-neutral-100 transition"
                      title="Edit Category"
                    >
                      <Edit2 className="w-4 h-4" />
                    </button>

                    <button
                      onClick={() =>
                        setDeleteConfirm({
                          id: cat.id,
                          name: cat.name,
                          count: cat.actual_product_count,
                        })
                      }
                      className="p-1.5 rounded-lg text-red-500 hover:bg-red-50 transition"
                      title="Delete Category"
                    >
                      <Trash2 className="w-4 h-4" />
                    </button>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Edit / Create Modal */}
      {modalOpen && (
        <div className="fixed inset-0 z-50 bg-black/60 backdrop-blur-xs flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl max-w-xl w-full max-h-[90vh] flex flex-col shadow-2xl border border-neutral-200 animate-in zoom-in-95 duration-150">
            {/* Modal Header */}
            <div className="px-6 py-4 border-b border-neutral-200 flex items-center justify-between">
              <div>
                <h3 className="font-bold text-base text-[#102A25]">
                  {editingId ? "Edit Category" : "Create New Category"}
                </h3>
                <p className="text-xs text-neutral-500">
                  {editingId ? `Updating '${formData.name}'` : "Add an industrial category to the taxonomy"}
                </p>
              </div>
              <button
                onClick={() => setModalOpen(false)}
                className="p-2 text-neutral-400 hover:text-neutral-700 rounded-lg"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            {/* Modal Body */}
            <form onSubmit={handleSubmit} className="flex-1 overflow-y-auto p-6 space-y-4 text-xs">
              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Category Name <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  required
                  value={formData.name}
                  onChange={(e) => handleNameChange(e.target.value)}
                  placeholder="e.g., Precision Medals & Badges"
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
                />
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Unique Slug / ID <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  required
                  disabled={!!editingId}
                  value={formData.id}
                  onChange={(e) => setFormData((prev) => ({ ...prev, id: e.target.value, slug: e.target.value }))}
                  placeholder="e.g., precision-medals-badges"
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25] font-mono text-[11px] disabled:bg-neutral-100"
                />
                <p className="text-[10px] text-neutral-400 mt-1">
                  Used in URL paths and database relations. Cannot be changed once created.
                </p>
              </div>

              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Description
                </label>
                <textarea
                  rows={3}
                  value={formData.description}
                  onChange={(e) => setFormData((prev) => ({ ...prev, description: e.target.value }))}
                  placeholder="Comprehensive description of materials, finishes, and manufacturing specs..."
                  className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
                />
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                  <label className="block font-semibold text-neutral-700 mb-1">
                    Image Asset URL
                  </label>
                  <input
                    type="text"
                    value={formData.image}
                    onChange={(e) => setFormData((prev) => ({ ...prev, image: e.target.value }))}
                    placeholder="/assets/products/category-badge-showcase.jpg"
                    className="w-full px-3 py-2 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25] text-[11px]"
                  />
                </div>

                <div>
                  <label className="block font-semibold text-neutral-700 mb-1">
                    Status
                  </label>
                  <select
                    value={formData.status}
                    onChange={(e) => setFormData((prev) => ({ ...prev, status: e.target.value as any }))}
                    className="w-full px-3 py-2 rounded-xl border border-neutral-200 bg-white"
                  >
                    <option value="published">Published</option>
                    <option value="draft">Draft</option>
                    <option value="archived">Archived</option>
                  </select>
                </div>
              </div>

              {/* Highlights */}
              <div>
                <label className="block font-semibold text-neutral-700 mb-1">
                  Highlights & Key Specifications
                </label>
                <div className="flex gap-2 mb-2">
                  <input
                    type="text"
                    value={newHighlight}
                    onChange={(e) => setNewHighlight(e.target.value)}
                    onKeyDown={(e) => {
                      if (e.key === "Enter") {
                        e.preventDefault();
                        addHighlight();
                      }
                    }}
                    placeholder="Add bullet highlight..."
                    className="flex-1 px-3 py-1.5 rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
                  />
                  <button
                    type="button"
                    onClick={addHighlight}
                    className="px-3 py-1.5 rounded-xl bg-neutral-200 text-neutral-700 font-semibold"
                  >
                    Add
                  </button>
                </div>
                <div className="flex flex-wrap gap-1.5">
                  {formData.highlights.map((h, i) => (
                    <span
                      key={i}
                      className="inline-flex items-center gap-1 px-2.5 py-1 rounded-lg bg-neutral-100 text-neutral-700 text-[11px]"
                    >
                      <span>{h}</span>
                      <button
                        type="button"
                        onClick={() => removeHighlight(i)}
                        className="text-neutral-400 hover:text-neutral-700"
                      >
                        <X className="w-3 h-3" />
                      </button>
                    </span>
                  ))}
                </div>
              </div>

              {/* SEO Parameters */}
              <div className="pt-2 border-t border-neutral-100 space-y-3">
                <h4 className="font-bold text-neutral-800 text-xs">SEO Metadata</h4>
                <div>
                  <label className="block text-[11px] text-neutral-600 mb-1">SEO Title</label>
                  <input
                    type="text"
                    value={formData.seoTitle}
                    onChange={(e) => setFormData((prev) => ({ ...prev, seoTitle: e.target.value }))}
                    placeholder="Custom Title tag for search engines..."
                    className="w-full px-3 py-1.5 rounded-xl border border-neutral-200"
                  />
                </div>
                <div>
                  <label className="block text-[11px] text-neutral-600 mb-1">SEO Meta Description</label>
                  <textarea
                    rows={2}
                    value={formData.seoDescription}
                    onChange={(e) => setFormData((prev) => ({ ...prev, seoDescription: e.target.value }))}
                    placeholder="Search snippet description under 160 characters..."
                    className="w-full px-3 py-1.5 rounded-xl border border-neutral-200"
                  />
                </div>
              </div>

              {/* Submit Buttons */}
              <div className="pt-4 border-t border-neutral-200 flex items-center justify-end gap-2">
                <button
                  type="button"
                  onClick={() => setModalOpen(false)}
                  className="px-4 py-2 rounded-xl border border-neutral-300 text-neutral-700 font-semibold hover:bg-neutral-50"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  disabled={saving}
                  className="px-5 py-2 rounded-xl bg-[#102A25] text-white font-bold hover:bg-[#172B27] flex items-center gap-2"
                >
                  {saving ? <Loader2 className="w-4 h-4 animate-spin text-[#D9B878]" /> : <Save className="w-4 h-4 text-[#D9B878]" />}
                  <span>{editingId ? "Update Category" : "Save Category"}</span>
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Delete Safeguard Modal */}
      {deleteConfirm && (
        <div className="fixed inset-0 z-50 bg-black/60 backdrop-blur-xs flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl max-w-sm w-full p-6 shadow-2xl border border-neutral-200 animate-in zoom-in-95 duration-150">
            <div className="w-12 h-12 rounded-full bg-red-100 text-red-600 flex items-center justify-center mx-auto mb-4">
              <AlertCircle className="w-6 h-6" />
            </div>
            <h3 className="text-center font-bold text-neutral-900 text-base">
              Delete '{deleteConfirm.name}'?
            </h3>
            {deleteConfirm.count > 0 ? (
              <div className="mt-3 p-3 bg-amber-50 border border-amber-200 rounded-xl text-amber-800 text-xs text-center">
                <span className="font-bold">Safeguard Triggered:</span> This category currently has{" "}
                <span className="font-extrabold">{deleteConfirm.count} active products</span>. You cannot delete it until all products are reassigned or archived.
              </div>
            ) : (
              <p className="text-center text-xs text-neutral-500 mt-2">
                Are you sure you want to delete this category? This action cannot be undone.
              </p>
            )}

            <div className="flex items-center gap-3 mt-6">
              <button
                onClick={() => setDeleteConfirm(null)}
                className="flex-1 py-2 text-xs font-semibold rounded-xl border border-neutral-300 text-neutral-700 hover:bg-neutral-50"
              >
                Close
              </button>
              {deleteConfirm.count === 0 && (
                <button
                  onClick={() => handleDelete(deleteConfirm.id)}
                  className="flex-1 py-2 text-xs font-bold rounded-xl bg-red-600 text-white hover:bg-red-700"
                >
                  Delete
                </button>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
