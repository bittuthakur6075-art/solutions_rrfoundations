import React, { useState, useEffect, useRef } from "react";
import {
  X,
  Save,
  Upload,
  Plus,
  Trash2,
  Copy,
  ExternalLink,
  Eye,
  CheckCircle,
  AlertCircle,
  Loader2,
  Image as ImageIcon,
  Check,
  Star,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "../components/Toast";

export interface ProductFormData {
  id?: string;
  title: string;
  slug: string;
  sku: string;
  categoryId: string;
  categoryName?: string;
  shortDescription: string;
  fullDescription: string;
  thumbnail: string;
  images: string[];
  materials: string[];
  specifications: Record<string, string>;
  tags: string[];
  featured: boolean;
  minQuantity: number;
  status: "published" | "draft" | "archived";
  displayOrder: number;
  seoTitle?: string;
  seoDescription?: string;
  canonicalUrl?: string;
}

interface CategoryOption {
  id: string;
  name: string;
}

export function AdminProductEditor({
  productId,
  isOpen,
  onClose,
  onSaved,
}: {
  productId: string | null;
  isOpen: boolean;
  onClose: () => void;
  onSaved: () => void;
}) {
  const { csrfToken } = useAdminAuth();
  const toast = useToast();

  const [loading, setLoading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [categories, setCategories] = useState<CategoryOption[]>([]);

  // Form State
  const [formData, setFormData] = useState<ProductFormData>({
    title: "",
    slug: "",
    sku: "",
    categoryId: "badges-lapel-pins",
    shortDescription: "",
    fullDescription: "",
    thumbnail: "/assets/products/category-badge-showcase.jpg",
    images: [],
    materials: [],
    specifications: {},
    tags: [],
    featured: false,
    minQuantity: 100,
    status: "published",
    displayOrder: 0,
    seoTitle: "",
    seoDescription: "",
    canonicalUrl: "",
  });

  // Material & Tag input temporary fields
  const [newMaterial, setNewMaterial] = useState("");
  const [newTag, setNewTag] = useState("");
  const [specKey, setSpecKey] = useState("");
  const [specVal, setSpecVal] = useState("");

  // Drag-and-drop Image Upload State & Refs
  const thumbInputRef = useRef<HTMLInputElement>(null);
  const galleryInputRef = useRef<HTMLInputElement>(null);
  const [isDraggingThumb, setIsDraggingThumb] = useState(false);
  const [isDraggingGallery, setIsDraggingGallery] = useState(false);
  const [uploadingThumb, setUploadingThumb] = useState(false);
  const [uploadingGallery, setUploadingGallery] = useState(false);

  // Upload single file helper
  const uploadImageFile = async (file: File): Promise<string | null> => {
    if (!file.type.startsWith("image/")) {
      toast.error(`"${file.name}" is not an image file.`);
      return null;
    }
    if (file.size > 5 * 1024 * 1024) {
      toast.error(`"${file.name}" exceeds 5MB size limit.`);
      return null;
    }

    const body = new FormData();
    body.append("file", file);
    body.append("alt_text", formData.title || file.name.replace(/\.[^/.]+$/, ""));

    try {
      const res = await fetch("/api/admin/media", {
        method: "POST",
        headers: {
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body,
      });
      const data = await res.json();
      if (res.ok && data.success && data.media) {
        return data.media.filePath || data.media.file_path;
      } else {
        toast.error(data.message || "Failed to upload image");
        return null;
      }
    } catch (e) {
      toast.error("Network error during image upload");
      return null;
    }
  };

  // Thumbnail upload handler
  const handleThumbnailUpload = async (files: FileList | null) => {
    if (!files || files.length === 0) return;
    setUploadingThumb(true);
    const uploadedPath = await uploadImageFile(files[0]);
    setUploadingThumb(false);
    if (uploadedPath) {
      setFormData((prev) => ({
        ...prev,
        thumbnail: uploadedPath,
        images: [uploadedPath, ...prev.images.filter((img) => img !== uploadedPath)],
      }));
      toast.success("Thumbnail uploaded and placed at the top!");
    }
  };

  // Gallery multi-upload handler
  const handleGalleryUpload = async (files: FileList | null) => {
    if (!files || files.length === 0) return;
    setUploadingGallery(true);
    const newPaths: string[] = [];

    for (let i = 0; i < files.length; i++) {
      const p = await uploadImageFile(files[i]);
      if (p) newPaths.push(p);
    }

    setUploadingGallery(false);
    if (newPaths.length > 0) {
      setFormData((prev) => ({
        ...prev,
        thumbnail: newPaths[0],
        images: [...newPaths, ...prev.images.filter((p) => !newPaths.includes(p))],
      }));
      toast.success(`Uploaded ${newPaths.length} photo(s) at the top!`);
    }
  };

  const removeGalleryImage = (idx: number) => {
    setFormData((prev) => {
      const target = prev.images[idx];
      const remaining = prev.images.filter((_, i) => i !== idx);
      return {
        ...prev,
        images: remaining,
        thumbnail: prev.thumbnail === target ? remaining[0] || "" : prev.thumbnail,
      };
    });
  };

  const setAsThumbnail = (path: string) => {
    setFormData((prev) => ({ ...prev, thumbnail: path }));
    toast.success("Primary thumbnail updated");
  };

  // Load Categories & Product Data
  useEffect(() => {
    if (!isOpen) return;

    const loadData = async () => {
      setLoading(true);
      try {
        // Fetch categories
        const catRes = await fetch("/api/admin/categories", { credentials: "include" });
        if (catRes.ok) {
          const catData = await catRes.json();
          if (catData.categories) setCategories(catData.categories);
        }

        // Fetch product if editing
        if (productId) {
          const prodRes = await fetch(`/api/admin/products?id=${productId}`, {
            credentials: "include",
          });
          if (prodRes.ok) {
            const json = await prodRes.json();
            if (json.product) {
              const p = json.product;
              setFormData({
                id: p.id,
                title: p.title || "",
                slug: p.slug || "",
                sku: p.sku || "",
                categoryId: p.category_id || p.category || "badges-lapel-pins",
                categoryName: p.category_name || p.categoryName || "",
                shortDescription: p.short_description || p.shortDescription || "",
                fullDescription: p.full_description || p.fullDescription || "",
                thumbnail: p.thumbnail || "",
                images: p.images || [],
                materials: p.materials || [],
                specifications: p.specifications || {},
                tags: p.tags || [],
                featured: Boolean(p.featured),
                minQuantity: Number(p.min_quantity || p.minQuantity || 100),
                status: p.status || "published",
                displayOrder: Number(p.display_order || p.displayOrder || 0),
                seoTitle: p.seo_title || p.seoTitle || "",
                seoDescription: p.seo_description || p.seoDescription || "",
                canonicalUrl: p.canonical_url || p.canonicalUrl || "",
              });
            }
          }
        } else {
          // Defaults for new product
          setFormData({
            title: "",
            slug: "",
            sku: "",
            categoryId: "badges-lapel-pins",
            shortDescription: "",
            fullDescription: "",
            thumbnail: "/assets/products/category-badge-showcase.jpg",
            images: ["/assets/products/category-badge-showcase.jpg"],
            materials: ["Stainless Steel", "High-Grade Acrylic"],
            specifications: { "Standard Dimensions": "Custom sizing available", "Minimum Order": "100 Units" },
            tags: ["Custom Badges", "Corporate ID"],
            featured: false,
            minQuantity: 100,
            status: "published",
            displayOrder: 0,
            seoTitle: "",
            seoDescription: "",
            canonicalUrl: "",
          });
        }
      } catch (e) {
        toast.error("Failed to load product details.");
      } finally {
        setLoading(false);
      }
    };

    loadData();
  }, [isOpen, productId]);

  const handleTitleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const title = e.target.value;
    setFormData((prev) => ({
      ...prev,
      title,
      // Auto slugify if adding new product
      slug: !productId && !prev.slug ? title.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "") : prev.slug,
    }));
  };

  const handleAddMaterial = () => {
    if (!newMaterial.trim()) return;
    setFormData((prev) => ({
      ...prev,
      materials: [...prev.materials, newMaterial.trim()],
    }));
    setNewMaterial("");
  };

  const handleRemoveMaterial = (idx: number) => {
    setFormData((prev) => ({
      ...prev,
      materials: prev.materials.filter((_, i) => i !== idx),
    }));
  };

  const handleAddTag = () => {
    if (!newTag.trim()) return;
    setFormData((prev) => ({
      ...prev,
      tags: [...prev.tags, newTag.trim()],
    }));
    setNewTag("");
  };

  const handleRemoveTag = (idx: number) => {
    setFormData((prev) => ({
      ...prev,
      tags: prev.tags.filter((_, i) => i !== idx),
    }));
  };

  const handleAddSpec = () => {
    if (!specKey.trim() || !specVal.trim()) return;
    setFormData((prev) => ({
      ...prev,
      specifications: {
        ...prev.specifications,
        [specKey.trim()]: specVal.trim(),
      },
    }));
    setSpecKey("");
    setSpecVal("");
  };

  const handleRemoveSpec = (key: string) => {
    setFormData((prev) => {
      const copy = { ...prev.specifications };
      delete copy[key];
      return { ...prev, specifications: copy };
    });
  };

  const handleSubmit = async (targetStatus?: "published" | "draft" | "archived") => {
    if (!formData.title.trim()) {
      toast.error("Product title is required.");
      return;
    }
    if (!formData.shortDescription.trim()) {
      toast.error("Short description is required.");
      return;
    }

    setSaving(true);
    const payload = {
      ...formData,
      status: targetStatus || formData.status,
    };

    try {
      const url = productId ? `/api/admin/products?id=${productId}` : "/api/admin/products";
      const method = productId ? "PUT" : "POST";

      const res = await fetch(url, {
        method,
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: JSON.stringify(payload),
      });

      const json = await res.json();
      if (res.ok && json.success) {
        toast.success(productId ? "Product updated successfully!" : "Product created successfully!");
        onSaved();
        onClose();
      } else {
        toast.error(json.message || "Failed to save product.");
      }
    } catch (e) {
      toast.error("Error saving product.");
    } finally {
      setSaving(false);
    }
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 overflow-hidden bg-black/60 backdrop-blur-xs flex justify-end animate-in fade-in duration-200">
      <div className="w-full max-w-3xl bg-white h-full flex flex-col shadow-2xl animate-in slide-in-from-right duration-300">
        {/* Header */}
        <div className="px-6 py-4 border-b border-neutral-200 flex items-center justify-between bg-[#102A25] text-white">
          <div>
            <h2 className="text-base font-bold font-heading">
              {productId ? "Edit Product" : "Create New Product"}
            </h2>
            <p className="text-xs text-white/60">
              {productId ? `Editing ${formData.sku || productId}` : "Add a new verified product to catalogue"}
            </p>
          </div>
          <button
            onClick={onClose}
            className="p-2 text-white/60 hover:text-white rounded-lg transition"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Content Form */}
        {loading ? (
          <div className="flex-1 flex flex-col items-center justify-center">
            <Loader2 className="w-8 h-8 animate-spin text-[#102A25] mb-2" />
            <p className="text-xs text-neutral-400">Loading product editor...</p>
          </div>
        ) : (
          <div className="flex-1 overflow-y-auto p-6 space-y-6">
            {/* General Info */}
            <div className="bg-[#F7F4EE] p-5 rounded-2xl border border-[#E8E2D7] space-y-4">
              <h3 className="text-xs font-bold uppercase tracking-wider text-neutral-500">
                Core Information
              </h3>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div className="sm:col-span-2">
                  <label className="block text-xs font-semibold text-neutral-700 mb-1">
                    Product Title *
                  </label>
                  <input
                    type="text"
                    value={formData.title}
                    onChange={handleTitleChange}
                    placeholder="e.g. Executive Metallic Pen — Model EX-01"
                    className="w-full px-3.5 py-2 rounded-xl bg-white border border-neutral-300 text-xs focus:ring-2 focus:ring-[#102A25] focus:outline-none"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-neutral-700 mb-1">
                    URL Slug *
                  </label>
                  <input
                    type="text"
                    value={formData.slug}
                    onChange={(e) => setFormData({ ...formData, slug: e.target.value })}
                    placeholder="executive-metallic-pen-ex-01"
                    className="w-full px-3.5 py-2 rounded-xl bg-white border border-neutral-300 text-xs font-mono focus:ring-2 focus:ring-[#102A25] focus:outline-none"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-neutral-700 mb-1">
                    SKU / Product Code
                  </label>
                  <input
                    type="text"
                    value={formData.sku}
                    onChange={(e) => setFormData({ ...formData, sku: e.target.value })}
                    placeholder="RRF-PEN-001"
                    className="w-full px-3.5 py-2 rounded-xl bg-white border border-neutral-300 text-xs font-mono focus:ring-2 focus:ring-[#102A25] focus:outline-none"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-neutral-700 mb-1">
                    Primary Category *
                  </label>
                  <select
                    value={formData.categoryId}
                    onChange={(e) => setFormData({ ...formData, categoryId: e.target.value })}
                    className="w-full px-3.5 py-2 rounded-xl bg-white border border-neutral-300 text-xs focus:ring-2 focus:ring-[#102A25] focus:outline-none"
                  >
                    {categories.map((c) => (
                      <option key={c.id} value={c.id}>
                        {c.name}
                      </option>
                    ))}
                  </select>
                </div>

                <div>
                  <label className="block text-xs font-semibold text-neutral-700 mb-1">
                    Min Order Quantity (MOQ)
                  </label>
                  <input
                    type="number"
                    value={formData.minQuantity}
                    onChange={(e) => setFormData({ ...formData, minQuantity: Number(e.target.value) })}
                    className="w-full px-3.5 py-2 rounded-xl bg-white border border-neutral-300 text-xs focus:ring-2 focus:ring-[#102A25] focus:outline-none"
                  />
                </div>
              </div>
            </div>

            {/* Descriptions */}
            <div className="bg-white p-5 rounded-2xl border border-neutral-200 space-y-4">
              <h3 className="text-xs font-bold uppercase tracking-wider text-neutral-500">
                Descriptions
              </h3>

              <div>
                <label className="block text-xs font-semibold text-neutral-700 mb-1">
                  Short Description (Catalog Cards) *
                </label>
                <textarea
                  rows={2}
                  value={formData.shortDescription}
                  onChange={(e) => setFormData({ ...formData, shortDescription: e.target.value })}
                  placeholder="Concise overview of product manufacturing, core specs, and usage."
                  className="w-full px-3.5 py-2 rounded-xl bg-neutral-50 border border-neutral-200 text-xs focus:ring-2 focus:ring-[#102A25] focus:outline-none"
                />
              </div>

              <div>
                <label className="block text-xs font-semibold text-neutral-700 mb-1">
                  Full Technical Description
                </label>
                <textarea
                  rows={4}
                  value={formData.fullDescription}
                  onChange={(e) => setFormData({ ...formData, fullDescription: e.target.value })}
                  placeholder="In-depth manufacturing processes, tolerances, packaging, and institutional warranty."
                  className="w-full px-3.5 py-2 rounded-xl bg-neutral-50 border border-neutral-200 text-xs focus:ring-2 focus:ring-[#102A25] focus:outline-none"
                />
              </div>
            </div>

            {/* Imagery & Smooth Drag-and-Drop Photo Uploader */}
            <div className="bg-white p-6 rounded-2xl border border-neutral-200 space-y-6">
              <div className="flex items-center justify-between border-b border-neutral-100 pb-3">
                <div>
                  <h3 className="text-xs font-bold uppercase tracking-wider text-neutral-800 flex items-center gap-2">
                    <ImageIcon className="w-4 h-4 text-[#D9B878]" />
                    <span>Product Photography & Image Gallery</span>
                  </h3>
                  <p className="text-[11px] text-neutral-400 mt-0.5">
                    Drag and drop images directly or select files. Supports PNG, JPG, WebP, SVG up to 5MB.
                  </p>
                </div>
              </div>

              {/* 1. Main Thumbnail Dropzone */}
              <div>
                <label className="block text-xs font-bold text-neutral-700 mb-2">
                  Primary Catalog Thumbnail <span className="text-red-500">*</span>
                </label>

                {/* Hidden File Input */}
                <input
                  type="file"
                  ref={thumbInputRef}
                  onChange={(e) => handleThumbnailUpload(e.target.files)}
                  accept="image/png,image/jpeg,image/webp,image/svg+xml"
                  className="hidden"
                />

                <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-4">
                  {/* Thumbnail Preview Box */}
                  <div
                    onClick={() => thumbInputRef.current?.click()}
                    className="w-28 h-28 rounded-2xl border-2 border-neutral-200 hover:border-[#102A25] bg-neutral-50 overflow-hidden shrink-0 flex items-center justify-center relative cursor-pointer group shadow-xs transition"
                    title="Click to change primary thumbnail"
                  >
                    {formData.thumbnail ? (
                      <img
                        src={formData.thumbnail}
                        alt="Thumbnail preview"
                        className="w-full h-full object-cover group-hover:scale-105 transition duration-300"
                        onError={(e) => {
                          (e.target as HTMLElement).style.display = "none";
                        }}
                      />
                    ) : (
                      <ImageIcon className="w-8 h-8 text-neutral-300 group-hover:text-[#102A25] transition" />
                    )}

                    <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition flex flex-col items-center justify-center text-white text-[10px] font-semibold">
                      <Upload className="w-4 h-4 mb-1 text-[#D9B878]" />
                      <span>Change</span>
                    </div>

                    {uploadingThumb && (
                      <div className="absolute inset-0 bg-black/60 backdrop-blur-xs flex items-center justify-center text-white text-xs font-semibold">
                        <Loader2 className="w-6 h-6 animate-spin text-[#D9B878]" />
                      </div>
                    )}
                  </div>

                  {/* Thumbnail Drag & Drop Area */}
                  <div
                    onDragOver={(e) => {
                      e.preventDefault();
                      e.stopPropagation();
                      setIsDraggingThumb(true);
                    }}
                    onDragLeave={(e) => {
                      e.preventDefault();
                      e.stopPropagation();
                      setIsDraggingThumb(false);
                    }}
                    onDrop={(e) => {
                      e.preventDefault();
                      e.stopPropagation();
                      setIsDraggingThumb(false);
                      handleThumbnailUpload(e.dataTransfer.files);
                    }}
                    onClick={() => thumbInputRef.current?.click()}
                    className={`flex-1 border-2 border-dashed rounded-2xl p-4 flex flex-col sm:flex-row items-center justify-center gap-3 cursor-pointer transition text-center sm:text-left ${
                      isDraggingThumb
                        ? "border-[#D9B878] bg-[#D9B878]/10 scale-[1.01]"
                        : "border-neutral-200 hover:border-[#102A25]/50 bg-[#FAF8F5]/60 hover:bg-[#FAF8F5]"
                    }`}
                  >
                    <div className="w-10 h-10 rounded-xl bg-white shadow-xs border border-neutral-200 flex items-center justify-center text-[#102A25] shrink-0">
                      {uploadingThumb ? (
                        <Loader2 className="w-5 h-5 animate-spin text-[#D9B878]" />
                      ) : (
                        <Upload className="w-5 h-5" />
                      )}
                    </div>
                    <div>
                      <p className="text-xs font-bold text-neutral-800">
                        {uploadingThumb ? "Uploading thumbnail..." : "Drag & drop primary thumbnail here"}
                      </p>
                      <p className="text-[11px] text-neutral-400 mt-0.5">
                        Or click to browse from computer. Automatic WebP optimization.
                      </p>
                    </div>
                  </div>
                </div>

                {/* Direct URL input fallback */}
                <div className="mt-2.5">
                  <input
                    type="text"
                    value={formData.thumbnail}
                    onChange={(e) => setFormData({ ...formData, thumbnail: e.target.value })}
                    placeholder="/assets/products/category-badge-showcase.jpg"
                    className="w-full px-3 py-1.5 rounded-xl bg-neutral-50 border border-neutral-200 text-[11px] font-mono text-neutral-600 focus:outline-none focus:border-[#102A25]"
                  />
                </div>
              </div>

              {/* 2. Additional Gallery Images Multi-Dropzone */}
              <div className="pt-4 border-t border-neutral-100">
                <div className="flex items-center justify-between mb-2">
                  <label className="block text-xs font-bold text-neutral-700">
                    Product Gallery Images ({formData.images.length})
                  </label>
                  <span className="text-[10px] text-neutral-400">
                    Displayed in client product zoom gallery
                  </span>
                </div>

                {/* Hidden Multi-File Input */}
                <input
                  type="file"
                  multiple
                  ref={galleryInputRef}
                  onChange={(e) => handleGalleryUpload(e.target.files)}
                  accept="image/png,image/jpeg,image/webp,image/svg+xml"
                  className="hidden"
                />

                {/* Gallery Dropzone */}
                <div
                  onDragOver={(e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    setIsDraggingGallery(true);
                  }}
                  onDragLeave={(e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    setIsDraggingGallery(false);
                  }}
                  onDrop={(e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    setIsDraggingGallery(false);
                    handleGalleryUpload(e.dataTransfer.files);
                  }}
                  onClick={() => galleryInputRef.current?.click()}
                  className={`border-2 border-dashed rounded-2xl p-5 flex flex-col items-center justify-center gap-2 cursor-pointer transition text-center ${
                    isDraggingGallery
                      ? "border-[#D9B878] bg-[#D9B878]/10 scale-[1.01]"
                      : "border-neutral-200 hover:border-[#102A25]/50 bg-neutral-50/50 hover:bg-neutral-50"
                  }`}
                >
                  <div className="w-11 h-11 rounded-2xl bg-white shadow-xs border border-neutral-200 flex items-center justify-center text-[#102A25]">
                    {uploadingGallery ? (
                      <Loader2 className="w-5 h-5 animate-spin text-[#D9B878]" />
                    ) : (
                      <Plus className="w-5 h-5 text-[#D9B878]" />
                    )}
                  </div>
                  <div>
                    <p className="text-xs font-bold text-neutral-800">
                      {uploadingGallery
                        ? "Uploading gallery images..."
                        : "Drag & drop multiple product photos here"}
                    </p>
                    <p className="text-[11px] text-neutral-400 mt-0.5">
                      Batch upload angles, finishes, packaging, and scale shots.
                    </p>
                  </div>
                </div>

                {/* Gallery Items Grid */}
                {formData.images.length > 0 && (
                  <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mt-4">
                    {formData.images.map((imgUrl, idx) => {
                      const isMain = formData.thumbnail === imgUrl;
                      return (
                        <div
                          key={idx}
                          className={`group relative rounded-xl border overflow-hidden bg-white shadow-xs transition flex flex-col ${
                            isMain
                              ? "border-[#102A25] ring-2 ring-[#102A25]/20"
                              : "border-neutral-200 hover:border-neutral-300"
                          }`}
                        >
                          <div className="aspect-square bg-neutral-100 relative overflow-hidden flex items-center justify-center">
                            <img
                              src={imgUrl}
                              alt={`Gallery photo ${idx + 1}`}
                              className="w-full h-full object-cover group-hover:scale-105 transition duration-300"
                              onError={(e) => {
                                (e.target as HTMLElement).style.display = "none";
                              }}
                            />

                            {/* Main badge */}
                            {isMain && (
                              <span className="absolute top-2 left-2 px-2 py-0.5 rounded-md bg-[#102A25] text-[#D9B878] text-[9px] font-bold uppercase tracking-wider shadow-sm flex items-center gap-1">
                                <Star className="w-2.5 h-2.5 fill-[#D9B878]" />
                                <span>Main</span>
                              </span>
                            )}

                            {/* Hover Actions */}
                            <div className="absolute inset-0 bg-black/50 opacity-0 group-hover:opacity-100 transition flex items-center justify-center gap-2">
                              {!isMain && (
                                <button
                                  type="button"
                                  onClick={() => setAsThumbnail(imgUrl)}
                                  className="px-2 py-1 rounded-lg bg-white text-neutral-800 text-[10px] font-bold hover:bg-[#D9B878] transition shadow-xs"
                                  title="Set as main thumbnail"
                                >
                                  Make Main
                                </button>
                              )}
                              <button
                                type="button"
                                onClick={() => removeGalleryImage(idx)}
                                className="p-1.5 rounded-lg bg-white text-red-600 hover:bg-red-50 transition shadow-xs"
                                title="Remove photo"
                              >
                                <Trash2 className="w-3.5 h-3.5" />
                              </button>
                            </div>
                          </div>

                          <div className="p-1.5 bg-neutral-50 border-t border-neutral-100">
                            <p className="text-[10px] font-mono text-neutral-500 truncate" title={imgUrl}>
                              {imgUrl.split("/").pop()}
                            </p>
                          </div>
                        </div>
                      );
                    })}
                  </div>
                )}
              </div>
            </div>

            {/* Materials & Tags */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              {/* Materials */}
              <div className="bg-white p-4 rounded-2xl border border-neutral-200 space-y-3">
                <label className="block text-xs font-semibold text-neutral-700">
                  Materials Used
                </label>
                <div className="flex gap-2">
                  <input
                    type="text"
                    value={newMaterial}
                    onChange={(e) => setNewMaterial(e.target.value)}
                    onKeyDown={(e) => e.key === "Enter" && (e.preventDefault(), handleAddMaterial())}
                    placeholder="e.g. Zinc Alloy"
                    className="flex-1 px-3 py-1.5 rounded-lg bg-neutral-50 border border-neutral-200 text-xs"
                  />
                  <button
                    type="button"
                    onClick={handleAddMaterial}
                    className="px-3 py-1.5 rounded-lg bg-[#102A25] text-white text-xs font-semibold hover:bg-[#172B27]"
                  >
                    Add
                  </button>
                </div>

                <div className="flex flex-wrap gap-1.5 pt-1">
                  {formData.materials.map((m, idx) => (
                    <span
                      key={idx}
                      className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg bg-[#F7F4EE] border border-[#E8E2D7] text-xs font-medium text-neutral-700"
                    >
                      {m}
                      <button
                        type="button"
                        onClick={() => handleRemoveMaterial(idx)}
                        className="text-neutral-400 hover:text-red-500"
                      >
                        <X className="w-3 h-3" />
                      </button>
                    </span>
                  ))}
                </div>
              </div>

              {/* Tags */}
              <div className="bg-white p-4 rounded-2xl border border-neutral-200 space-y-3">
                <label className="block text-xs font-semibold text-neutral-700">
                  Keywords & Search Tags
                </label>
                <div className="flex gap-2">
                  <input
                    type="text"
                    value={newTag}
                    onChange={(e) => setNewTag(e.target.value)}
                    onKeyDown={(e) => e.key === "Enter" && (e.preventDefault(), handleAddTag())}
                    placeholder="e.g. Lapel Pin"
                    className="flex-1 px-3 py-1.5 rounded-lg bg-neutral-50 border border-neutral-200 text-xs"
                  />
                  <button
                    type="button"
                    onClick={handleAddTag}
                    className="px-3 py-1.5 rounded-lg bg-[#102A25] text-white text-xs font-semibold hover:bg-[#172B27]"
                  >
                    Add
                  </button>
                </div>

                <div className="flex flex-wrap gap-1.5 pt-1">
                  {formData.tags.map((t, idx) => (
                    <span
                      key={idx}
                      className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg bg-neutral-100 text-xs font-medium text-neutral-700"
                    >
                      #{t}
                      <button
                        type="button"
                        onClick={() => handleRemoveTag(idx)}
                        className="text-neutral-400 hover:text-red-500"
                      >
                        <X className="w-3 h-3" />
                      </button>
                    </span>
                  ))}
                </div>
              </div>
            </div>

            {/* Custom Specifications Table */}
            <div className="bg-white p-5 rounded-2xl border border-neutral-200 space-y-3">
              <h3 className="text-xs font-bold uppercase tracking-wider text-neutral-500">
                Technical Specifications (Key / Value)
              </h3>

              <div className="flex items-center gap-2">
                <input
                  type="text"
                  value={specKey}
                  onChange={(e) => setSpecKey(e.target.value)}
                  placeholder="Spec Attribute (e.g. Dimensions)"
                  className="flex-1 px-3 py-1.5 rounded-lg bg-neutral-50 border border-neutral-200 text-xs"
                />
                <input
                  type="text"
                  value={specVal}
                  onChange={(e) => setSpecVal(e.target.value)}
                  placeholder="Spec Value (e.g. 70 x 25 mm)"
                  className="flex-1 px-3 py-1.5 rounded-lg bg-neutral-50 border border-neutral-200 text-xs"
                />
                <button
                  type="button"
                  onClick={handleAddSpec}
                  className="px-3 py-1.5 rounded-lg bg-[#102A25] text-white text-xs font-semibold hover:bg-[#172B27]"
                >
                  Add Spec
                </button>
              </div>

              <div className="divide-y divide-neutral-100 border border-neutral-100 rounded-xl overflow-hidden mt-2">
                {Object.entries(formData.specifications).map(([k, v]) => (
                  <div key={k} className="flex items-center justify-between p-2.5 text-xs">
                    <span className="font-semibold text-neutral-700 w-1/3">{k}</span>
                    <span className="text-neutral-600 flex-1">{v}</span>
                    <button
                      type="button"
                      onClick={() => handleRemoveSpec(k)}
                      className="text-neutral-400 hover:text-red-500 ml-2"
                    >
                      <Trash2 className="w-3.5 h-3.5" />
                    </button>
                  </div>
                ))}
                {Object.keys(formData.specifications).length === 0 && (
                  <div className="p-4 text-center text-xs text-neutral-400">
                    No technical specifications added.
                  </div>
                )}
              </div>
            </div>

            {/* SEO & Meta Preview */}
            <div className="bg-white p-5 rounded-2xl border border-neutral-200 space-y-4">
              <h3 className="text-xs font-bold uppercase tracking-wider text-neutral-500">
                SEO & Google Search Preview
              </h3>

              <div className="p-4 rounded-xl bg-neutral-50 border border-neutral-200 font-sans space-y-1">
                <div className="text-[11px] text-[#202124] flex items-center gap-1.5">
                  <span className="text-emerald-700 font-medium">https://solutions.rrfoundations.org</span>
                  <span>›</span>
                  <span className="text-neutral-500">products</span>
                  <span>›</span>
                  <span className="text-neutral-500">{formData.slug || "product-slug"}</span>
                </div>
                <div className="text-sm font-semibold text-[#1a0dab] hover:underline cursor-pointer">
                  {formData.seoTitle || `${formData.title || "Product Title"} | Direct Manufacturer RR Foundations`}
                </div>
                <div className="text-xs text-[#4d5156] line-clamp-2">
                  {formData.seoDescription || formData.shortDescription || "Direct manufacturing and institutional supply in New Delhi."}
                </div>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                  <label className="block text-xs font-semibold text-neutral-700 mb-1">
                    Custom SEO Title
                  </label>
                  <input
                    type="text"
                    value={formData.seoTitle}
                    onChange={(e) => setFormData({ ...formData, seoTitle: e.target.value })}
                    placeholder="Auto-generated if blank"
                    className="w-full px-3.5 py-2 rounded-xl bg-neutral-50 border border-neutral-200 text-xs"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-neutral-700 mb-1">
                    Canonical Override URL
                  </label>
                  <input
                    type="text"
                    value={formData.canonicalUrl}
                    onChange={(e) => setFormData({ ...formData, canonicalUrl: e.target.value })}
                    placeholder="https://..."
                    className="w-full px-3.5 py-2 rounded-xl bg-neutral-50 border border-neutral-200 text-xs"
                  />
                </div>
              </div>
            </div>

            {/* Status & Options */}
            <div className="p-4 rounded-2xl bg-[#F7F4EE] border border-[#E8E2D7] flex flex-wrap items-center justify-between gap-4">
              <label className="flex items-center gap-2 cursor-pointer select-none text-xs font-semibold text-neutral-800">
                <input
                  type="checkbox"
                  checked={formData.featured}
                  onChange={(e) => setFormData({ ...formData, featured: e.target.checked })}
                  className="rounded border-neutral-300 text-[#102A25] focus:ring-[#102A25]"
                />
                Mark as Featured Product on Homepage
              </label>

              <div className="flex items-center gap-2 text-xs">
                <span className="font-semibold text-neutral-600">Status:</span>
                <select
                  value={formData.status}
                  onChange={(e) => setFormData({ ...formData, status: e.target.value as any })}
                  className="px-3 py-1.5 rounded-lg bg-white border border-neutral-300 text-xs font-medium"
                >
                  <option value="published">Published</option>
                  <option value="draft">Draft</option>
                  <option value="archived">Archived</option>
                </select>
              </div>
            </div>
          </div>
        )}

        {/* Footer Actions */}
        <div className="px-6 py-4 border-t border-neutral-200 bg-neutral-50 flex items-center justify-between">
          <button
            type="button"
            onClick={onClose}
            className="px-4 py-2 rounded-xl text-xs font-semibold text-neutral-600 hover:bg-neutral-200 transition"
          >
            Cancel
          </button>

          <div className="flex items-center gap-2">
            <button
              type="button"
              disabled={saving}
              onClick={() => handleSubmit("draft")}
              className="px-4 py-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 text-xs font-semibold text-neutral-700 transition disabled:opacity-50"
            >
              Save as Draft
            </button>

            <button
              type="button"
              disabled={saving}
              onClick={() => handleSubmit("published")}
              className="px-5 py-2 rounded-xl bg-[#102A25] hover:bg-[#172B27] text-white text-xs font-bold transition flex items-center gap-2 shadow-md disabled:opacity-50"
            >
              {saving ? (
                <Loader2 className="w-3.5 h-3.5 animate-spin text-[#D9B878]" />
              ) : (
                <Save className="w-3.5 h-3.5 text-[#D9B878]" />
              )}
              <span>{productId ? "Update Product" : "Publish Product"}</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
