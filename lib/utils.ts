import { type ClassValue, clsx } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export const COMPANY_INFO = {
  name: "RR Foundations",
  legalName: "RR Foundations & Manufacturing Solutions",
  tagline: "Manufacturing Ideas Into Products That Matter",
  email: "help@rrfoundation.org",
  phone: "+91 74280 45813",
  phoneRaw: "917428045813",
  address: "Shop No. 12, Om Vihar, Opposite Metro Pillar No. 702, New Delhi – 110059, India",
  hours: "Monday to Friday, 9:00 AM – 6:00 PM IST",
  website: "https://solutions.rrfoundations.org",
};

export function getWhatsAppUrl(message?: string): string {
  const defaultMsg = "Hello RR Foundations, I am interested in inquiring about bulk manufacturing and custom products.";
  const text = encodeURIComponent(message || defaultMsg);
  return `https://wa.me/${COMPANY_INFO.phoneRaw}?text=${text}`;
}

export function formatQuantity(num?: number): string {
  if (!num) return "Bulk custom";
  return `${num.toLocaleString()}+ units`;
}
