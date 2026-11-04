import { NextRequest, NextResponse } from "next/server";
import fs from "fs";
import path from "path";
import { EnquirySchema } from "@/lib/validation/enquiry";

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();
    const validatedData = EnquirySchema.parse(body);

    const submission = {
      id: `enq_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
      timestamp: new Date().toISOString(),
      ...validatedData,
      status: "New",
    };

    // Persist to local JSON datastore
    const dataFilePath = path.join(process.cwd(), "docs", "enquiry_submissions.json");
    let currentData = [];
    if (fs.existsSync(dataFilePath)) {
      try {
        const fileContent = fs.readFileSync(dataFilePath, "utf8");
        currentData = JSON.parse(fileContent);
      } catch (e) {
        currentData = [];
      }
    }
    currentData.push(submission);
    fs.writeFileSync(dataFilePath, JSON.stringify(currentData, null, 2), "utf8");

    console.log("Recorded B2B Enquiry:", submission.id, submission.fullName, submission.productName);

    return NextResponse.json({
      success: true,
      id: submission.id,
      message: "Enquiry received successfully. Our sales desk will follow up shortly.",
    });
  } catch (err: any) {
    console.error("Enquiry submission error:", err);
    if (err.errors) {
      return NextResponse.json(
        { success: false, errors: err.errors },
        { status: 400 }
      );
    }
    return NextResponse.json(
      { success: false, message: "Internal server error" },
      { status: 500 }
    );
  }
}
