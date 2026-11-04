<?php
/**
 * RR FOUNDATIONS — B2B ENQUIRY SUBMISSION HANDLER
 * Native PHP Endpoint for Hostinger Premium Web Hosting
 */

// Allow CORS for preview/local environments
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["success" => false, "message" => "Method not allowed"]);
    exit;
}

// Read raw JSON body
$rawInput = file_get_contents("php://input");
$data = json_decode($rawInput, true);

if (!$data) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Invalid JSON payload"]);
    exit;
}

// Honeypot Spam Trap Check
if (!empty($data['website_hp'])) {
    // Silently return success to fool spam bots
    echo json_encode([
        "success" => true,
        "id" => "enq_verified",
        "message" => "Enquiry received successfully."
    ]);
    exit;
}

// Extract & Validate Fields
$fullName = isset($data['fullName']) ? trim(strip_tags($data['fullName'])) : '';
$email = isset($data['email']) ? trim(filter_var($data['email'], FILTER_SANITIZE_EMAIL)) : '';
$phone = isset($data['phone']) ? trim(strip_tags($data['phone'])) : '';
$companyName = isset($data['companyName']) ? trim(strip_tags($data['companyName'])) : '';
$productName = isset($data['productName']) ? trim(strip_tags($data['productName'])) : 'General Requirement';
$category = isset($data['category']) ? trim(strip_tags($data['category'])) : 'General';
$quantity = isset($data['quantity']) ? trim(strip_tags($data['quantity'])) : 'Unspecified';
$message = isset($data['message']) ? trim(strip_tags($data['message'])) : '';

$errors = [];
if (strlen($fullName) < 2) {
    $errors[] = "Full name must be at least 2 characters";
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = "Please provide a valid email address";
}
if (strlen($phone) < 8) {
    $errors[] = "Please provide a valid contact number";
}
if (strlen($message) < 5) {
    $errors[] = "Please share requirement details (minimum 5 characters)";
}

if (!empty($errors)) {
    http_response_code(400);
    echo json_encode(["success" => false, "errors" => $errors]);
    exit;
}

// Prepare verified submission record
$submissionId = "enq_" . time() . "_" . substr(md5(uniqid(rand(), true)), 0, 5);
$timestamp = date("c");

$submission = [
    "id" => $submissionId,
    "timestamp" => $timestamp,
    "fullName" => $fullName,
    "companyName" => $companyName,
    "email" => $email,
    "phone" => $phone,
    "productName" => $productName,
    "category" => $category,
    "quantity" => $quantity,
    "message" => $message,
    "status" => "New",
    "ip" => $_SERVER['REMOTE_ADDR'] ?? 'unknown'
];

// 1. Data Store Persistence (Local JSON file in protected storage)
$dataDir = __DIR__ . "/../../data";
if (!is_dir($dataDir)) {
    @mkdir($dataDir, 0755, true);
}
$dataFile = $dataDir . "/enquiry_submissions.json";
$existingData = [];
if (file_exists($dataFile)) {
    $content = file_get_contents($dataFile);
    $decoded = json_decode($content, true);
    if (is_array($decoded)) {
        $existingData = $decoded;
    }
}
$existingData[] = $submission;
@file_put_contents($dataFile, json_encode($existingData, JSON_PRETTY_PRINT));

// 2. Email Notification to Factory Sales Desk
$toEmail = "help@rrfoundation.org";
$subject = "New B2B Manufacturing Enquiry — " . $productName . " [" . $submissionId . "]";
$headers = "From: RR Foundations Web <noreply@rrfoundations.org>\r\n";
$headers .= "Reply-To: " . $fullName . " <" . $email . ">\r\n";
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

$body = "=== NEW B2B ENQUIRY RECEIVED ===\n\n";
$body .= "ID: " . $submissionId . "\n";
$body .= "Time: " . $timestamp . "\n\n";
$body .= "Client: " . $fullName . "\n";
$body .= "Company: " . ($companyName ?: "Not Specified") . "\n";
$body .= "Email: " . $email . "\n";
$body .= "Phone: " . $phone . "\n\n";
$body .= "Product: " . $productName . " (" . $category . ")\n";
$body .= "Estimated Quantity: " . $quantity . "\n\n";
$body .= "Message / Specifications:\n" . $message . "\n\n";
$body .= "================================\n";

@mail($toEmail, $subject, $body, $headers);

echo json_encode([
    "success" => true,
    "id" => $submissionId,
    "message" => "Enquiry received successfully. Our sales desk will follow up shortly."
]);
