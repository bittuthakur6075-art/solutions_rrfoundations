import { z } from "zod";

export const EnquirySchema = z.object({
  fullName: z.string().min(2, "Full name must be at least 2 characters"),
  companyName: z.string().optional(),
  email: z.string().email("Please provide a valid email address"),
  phone: z.string().min(8, "Please provide a valid contact number"),
  productName: z.string().optional(),
  category: z.string().optional(),
  quantity: z.string().min(1, "Please specify an estimated quantity"),
  customizationDetails: z.string().optional(),
  message: z.string().min(5, "Please share some details about your requirement"),
  website_hp: z.string().optional(),
});

export type EnquiryFormData = z.infer<typeof EnquirySchema>;
