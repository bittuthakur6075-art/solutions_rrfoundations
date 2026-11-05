import React, { useState, useEffect, useCallback, useRef } from "react";
import {
  Image as ImageIcon,
  Upload,
  Search,
  Trash2,
  Copy,
  Check,
  ExternalLink,
  ChevronLeft,
  ChevronRight,
  RefreshCw,
  Loader2,
  X,
  AlertCircle,
  FileImage,
  Info,
} from "lucide-react";
import { useAdminAuth } from "../context/AdminAuthContext";
import { useToast } from "../components/Toast";

interface MediaItem {
  id: number;
  filename: string;
  original_name: string;
  file_path: string;
  file_size: number;
  mime_type: string;
  width?: number;
  height?: number;
  alt_text?: string;
  created_at: string;
}

export function AdminMediaPage() {
  const { csrfToken } = useAdminAuth();
  const toast = useToast();
  const fileInputRef = useRef<HTMLInputElement>(null);

  const [mediaList, setMediaList] = useState<MediaItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [uploading, setUploading] = useState(false);
  const [refreshing, setRefreshing] = useState(false);

  // Filters & Pagination
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalCount, setTotalCount] = useState(0);

  // Preview Modal
  const [selectedMedia, setSelectedMedia] = useState<MediaItem | null>(null);
  const [copiedId, setCopiedId] = useState<number | null>(null);

  // Delete modal
  const [deleteConfirm, setDeleteConfirm] = useState<MediaItem | null>(null);

  const fetchMedia = useCallback(
    async (isManual = false) => {
      if (isManual) setRefreshing(true);
      else setLoading(true);

      try {
        const params = new URLSearchParams({
          page: String(page),
          limit: "24",
        });
        if (search) params.set("search", search);

        const res = await fetch(`/api/admin/media?${params.toString()}`, {
          credentials: "include",
        });
        const data = await res.json();
        if (res.ok && data.success) {
          setMediaList(data.media || []);
          setTotalCount(data.pagination?.total || 0);
          setTotalPages(data.pagination?.totalPages || 1);
        } else {
          toast.error(data.message || "Failed to load media assets");
        }
      } catch (e) {
        toast.error("Network error while loading media");
      } finally {
        setLoading(false);
        setRefreshing(false);
      }
    },
    [page, search, toast]
  );

  useEffect(() => {
    fetchMedia();
  }, [fetchMedia]);

  // Handle File Upload
  const handleUpload = async (files: FileList | null) => {
    if (!files || files.length === 0) return;

    const file = files[0];
    if (file.size > 5 * 1024 * 1024) {
      toast.error("File size exceeds 5MB limit.");
      return;
    }

    setUploading(true);
    const formData = new FormData();
    formData.append("file", file);
    formData.append("alt_text", file.name.replace(/\.[^/.]+$/, ""));

    try {
      const res = await fetch("/api/admin/media", {
        method: "POST",
        headers: {
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
        body: formData,
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success(`Uploaded ${data.media.originalName}`);
        fetchMedia();
      } else {
        toast.error(data.message || "Upload failed");
      }
    } catch (e) {
      toast.error("Network error during file upload");
    } finally {
      setUploading(false);
      if (fileInputRef.current) fileInputRef.current.value = "";
    }
  };

  // Copy to clipboard
  const copyUrl = (path: string, id: number) => {
    navigator.clipboard.writeText(path);
    setCopiedId(id);
    toast.success("Image URL copied to clipboard");
    setTimeout(() => setCopiedId(null), 2500);
  };

  // Delete media item
  const handleDelete = async (id: number, force = false) => {
    try {
      const url = `/api/admin/media?id=${id}${force ? "&force=true" : ""}`;
      const res = await fetch(url, {
        method: "DELETE",
        headers: {
          "X-CSRF-Token": csrfToken,
        },
        credentials: "include",
      });
      const data = await res.json();
      if (res.ok && data.success) {
        toast.success("Media deleted successfully");
        setDeleteConfirm(null);
        if (selectedMedia?.id === id) setSelectedMedia(null);
        fetchMedia();
      } else {
        toast.error(data.message || "Failed to delete image");
      }
    } catch (e) {
      toast.error("Error executing media deletion");
    }
  };

  const formatBytes = (bytes: number) => {
    if (bytes === 0) return "0 Bytes";
    const k = 1024;
    const sizes = ["Bytes", "KB", "MB"];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(1)) + " " + sizes[i];
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2">
            <h2 className="text-2xl font-bold text-[#102A25] tracking-tight">
              Media & Photography Library
            </h2>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-[#102A25]/10 text-[#102A25]">
              {totalCount} Assets
            </span>
          </div>
          <p className="text-xs text-neutral-500 mt-1">
            Upload and manage product photography, category hero banners, and brand assets.
          </p>
        </div>

        <div className="flex items-center gap-2.5">
          <button
            onClick={() => fetchMedia(true)}
            disabled={refreshing}
            className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 text-neutral-600 transition shadow-xs"
            title="Refresh List"
          >
            <RefreshCw className={`w-4 h-4 ${refreshing ? "animate-spin" : ""}`} />
          </button>

          <input
            type="file"
            ref={fileInputRef}
            onChange={(e) => handleUpload(e.target.files)}
            accept="image/png,image/jpeg,image/webp,image/svg+xml"
            className="hidden"
          />

          <button
            onClick={() => fileInputRef.current?.click()}
            disabled={uploading}
            className="inline-flex items-center gap-1.5 px-4 py-2 rounded-xl bg-[#102A25] hover:bg-[#172B27] text-white text-xs font-bold shadow-sm transition disabled:opacity-50"
          >
            {uploading ? (
              <Loader2 className="w-4 h-4 animate-spin text-[#D9B878]" />
            ) : (
              <Upload className="w-4 h-4 text-[#D9B878]" />
            )}
            <span>{uploading ? "Uploading..." : "Upload New Image"}</span>
          </button>
        </div>
      </div>

      {/* Upload Drop Area & Search Bar */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {/* Drag Drop Strip */}
        <div
          onDragOver={(e) => e.preventDefault()}
          onDrop={(e) => {
            e.preventDefault();
            handleUpload(e.dataTransfer.files);
          }}
          onClick={() => fileInputRef.current?.click()}
          className="md:col-span-2 border-2 border-dashed border-[#102A25]/20 hover:border-[#102A25]/50 bg-white rounded-2xl p-4 flex items-center justify-center gap-3 cursor-pointer transition text-center group"
        >
          <div className="w-10 h-10 rounded-xl bg-[#FAF8F5] group-hover:bg-[#D9B878]/20 flex items-center justify-center text-[#102A25] transition">
            <Upload className="w-5 h-5" />
          </div>
          <div className="text-left">
            <p className="text-xs font-bold text-neutral-800">
              Drop image files here or click to browse
            </p>
            <p className="text-[10px] text-neutral-400">
              Supports PNG, JPG, WebP, SVG up to 5MB. Automatic WebP optimization.
            </p>
          </div>
        </div>

        {/* Search */}
        <div className="bg-white rounded-2xl p-4 border border-neutral-200 shadow-xs flex items-center">
          <div className="relative w-full">
            <Search className="w-4 h-4 absolute left-3 top-1/2 -translate-y-1/2 text-neutral-400" />
            <input
              type="text"
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                setPage(1);
              }}
              placeholder="Search assets by filename..."
              className="w-full pl-9 pr-3 py-2 text-xs rounded-xl border border-neutral-200 focus:outline-none focus:border-[#102A25]"
            />
          </div>
        </div>
      </div>

      {/* Media Gallery Grid */}
      {loading ? (
        <div className="py-20 text-center">
          <Loader2 className="w-8 h-8 animate-spin text-[#102A25] mx-auto mb-2" />
          <p className="text-xs text-neutral-400">Loading media library...</p>
        </div>
      ) : mediaList.length === 0 ? (
        <div className="bg-white rounded-2xl p-12 text-center border border-neutral-200">
          <FileImage className="w-10 h-10 text-neutral-300 mx-auto mb-3" />
          <h3 className="text-base font-bold text-neutral-800">No media assets found</h3>
          <p className="text-xs text-neutral-500 mt-1">
            Upload your first high-resolution product photography above.
          </p>
        </div>
      ) : (
        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4">
          {mediaList.map((item) => (
            <div
              key={item.id}
              onClick={() => setSelectedMedia(item)}
              className="group bg-white rounded-xl border border-neutral-200 shadow-xs overflow-hidden cursor-pointer hover:border-[#102A25]/40 transition flex flex-col"
            >
              <div className="aspect-square bg-neutral-100 relative overflow-hidden flex items-center justify-center">
                <img
                  src={item.file_path}
                  alt={item.alt_text || item.original_name}
                  className="w-full h-full object-cover group-hover:scale-105 transition duration-300"
                  onError={(e) => {
                    (e.target as HTMLElement).style.display = "none";
                  }}
                />

                {/* Hover overlay actions */}
                <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition flex items-center justify-center gap-2">
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      copyUrl(item.file_path, item.id);
                    }}
                    className="p-1.5 rounded-lg bg-white/90 text-neutral-800 hover:bg-white transition"
                    title="Copy URL"
                  >
                    {copiedId === item.id ? (
                      <Check className="w-3.5 h-3.5 text-emerald-600" />
                    ) : (
                      <Copy className="w-3.5 h-3.5" />
                    )}
                  </button>

                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      setDeleteConfirm(item);
                    }}
                    className="p-1.5 rounded-lg bg-white/90 text-red-600 hover:bg-white transition"
                    title="Delete Image"
                  >
                    <Trash2 className="w-3.5 h-3.5" />
                  </button>
                </div>
              </div>

              <div className="p-2.5">
                <p className="text-[11px] font-semibold text-neutral-800 truncate" title={item.original_name}>
                  {item.original_name}
                </p>
                <div className="flex items-center justify-between text-[10px] text-neutral-400 mt-1">
                  <span>{formatBytes(item.file_size)}</span>
                  {item.width && item.height && (
                    <span>
                      {item.width}x{item.height}
                    </span>
                  )}
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Pagination */}
      <div className="bg-white rounded-2xl p-4 border border-neutral-200 flex items-center justify-between text-xs text-neutral-500">
        <div>
          Showing <span className="font-semibold">{mediaList.length ? (page - 1) * 24 + 1 : 0}</span> to{" "}
          <span className="font-semibold">{Math.min(page * 24, totalCount)}</span> of{" "}
          <span className="font-semibold">{totalCount}</span> assets
        </div>

        <div className="flex items-center gap-2">
          <button
            onClick={() => setPage((p) => Math.max(1, p - 1))}
            disabled={page <= 1 || loading}
            className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 disabled:opacity-40 transition"
          >
            <ChevronLeft className="w-4 h-4" />
          </button>
          <span className="font-semibold px-2">
            Page {page} of {totalPages}
          </span>
          <button
            onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
            disabled={page >= totalPages || loading}
            className="p-2 rounded-xl border border-neutral-300 bg-white hover:bg-neutral-50 disabled:opacity-40 transition"
          >
            <ChevronRight className="w-4 h-4" />
          </button>
        </div>
      </div>

      {/* Preview Modal */}
      {selectedMedia && (
        <div className="fixed inset-0 z-50 bg-black/70 backdrop-blur-xs flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl max-w-2xl w-full p-6 shadow-2xl border border-neutral-200 flex flex-col md:flex-row gap-6 animate-in zoom-in-95 duration-150">
            {/* Image display */}
            <div className="flex-1 bg-neutral-100 rounded-xl overflow-hidden flex items-center justify-center min-h-[260px] border border-neutral-200">
              <img
                src={selectedMedia.file_path}
                alt={selectedMedia.original_name}
                className="max-h-[360px] max-w-full object-contain"
              />
            </div>

            {/* Details & Actions */}
            <div className="w-full md:w-64 flex flex-col justify-between text-xs text-neutral-700">
              <div>
                <div className="flex items-center justify-between pb-3 border-b border-neutral-100 mb-3">
                  <h3 className="font-bold text-sm text-[#102A25] truncate">
                    Asset Details
                  </h3>
                  <button
                    onClick={() => setSelectedMedia(null)}
                    className="p-1 rounded-lg text-neutral-400 hover:text-neutral-700"
                  >
                    <X className="w-4 h-4" />
                  </button>
                </div>

                <div className="space-y-2">
                  <div>
                    <span className="text-[10px] text-neutral-400 block">Filename:</span>
                    <span className="font-mono text-[11px] break-all">{selectedMedia.filename}</span>
                  </div>

                  <div>
                    <span className="text-[10px] text-neutral-400 block">Dimensions:</span>
                    <span className="font-semibold">
                      {selectedMedia.width && selectedMedia.height
                        ? `${selectedMedia.width} × ${selectedMedia.height} px`
                        : "Unknown"}
                    </span>
                  </div>

                  <div>
                    <span className="text-[10px] text-neutral-400 block">File Size:</span>
                    <span className="font-semibold">{formatBytes(selectedMedia.file_size)}</span>
                  </div>

                  <div>
                    <span className="text-[10px] text-neutral-400 block">MIME Type:</span>
                    <span className="font-mono text-[11px]">{selectedMedia.mime_type}</span>
                  </div>

                  <div>
                    <span className="text-[10px] text-neutral-400 block">Uploaded On:</span>
                    <span>{new Date(selectedMedia.created_at).toLocaleDateString("en-IN")}</span>
                  </div>
                </div>
              </div>

              {/* Actions */}
              <div className="pt-4 border-t border-neutral-100 space-y-2">
                <button
                  onClick={() => copyUrl(selectedMedia.file_path, selectedMedia.id)}
                  className="w-full py-2 px-3 rounded-xl bg-[#102A25] hover:bg-[#172B27] text-white font-bold flex items-center justify-center gap-2 transition"
                >
                  {copiedId === selectedMedia.id ? (
                    <>
                      <Check className="w-4 h-4 text-emerald-400" />
                      <span>Copied!</span>
                    </>
                  ) : (
                    <>
                      <Copy className="w-4 h-4 text-[#D9B878]" />
                      <span>Copy Asset Path</span>
                    </>
                  )}
                </button>

                <button
                  onClick={() => {
                    setDeleteConfirm(selectedMedia);
                  }}
                  className="w-full py-2 px-3 rounded-xl border border-red-200 text-red-600 hover:bg-red-50 font-semibold transition"
                >
                  Delete Asset
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Delete Confirmation Modal */}
      {deleteConfirm && (
        <div className="fixed inset-0 z-50 bg-black/60 backdrop-blur-xs flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl max-w-sm w-full p-6 shadow-2xl border border-neutral-200 animate-in zoom-in-95 duration-150">
            <div className="w-12 h-12 rounded-full bg-red-100 text-red-600 flex items-center justify-center mx-auto mb-4">
              <AlertCircle className="w-6 h-6" />
            </div>
            <h3 className="text-center font-bold text-neutral-900 text-base">
              Delete Media Asset?
            </h3>
            <p className="text-center text-xs text-neutral-500 mt-2">
              Are you sure you want to delete <span className="font-mono font-semibold">{deleteConfirm.original_name}</span>? This will permanently remove the file from the Hostinger uploads directory.
            </p>
            <div className="flex items-center gap-3 mt-6">
              <button
                onClick={() => setDeleteConfirm(null)}
                className="flex-1 py-2 text-xs font-semibold rounded-xl border border-neutral-300 text-neutral-700 hover:bg-neutral-50"
              >
                Cancel
              </button>
              <button
                onClick={() => handleDelete(deleteConfirm.id)}
                className="flex-1 py-2 text-xs font-bold rounded-xl bg-red-600 text-white hover:bg-red-700"
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
