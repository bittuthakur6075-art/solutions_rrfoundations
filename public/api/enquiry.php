<?php
/**
 * RR FOUNDATIONS — B2B ENQUIRY SUBMISSION HANDLER
 * Production-Hardened Endpoint for Hostinger Premium Web Hosting
 */

// 1. Strict Error Handling: Never expose server internals or stack traces
error_reporting(0);
ini_set('display_errors', '0');
ini_set('log_errors', '1');

// 2. Security Headers & CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
header("Content-Type: application/json; charset=UTF-8");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["success" => false, "message" => "Method not allowed"]);
    exit;
}

// 3. Read & Validate JSON Payload
$rawInput = file_get_contents("php://input");
if (empty($rawInput)) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Empty request body"]);
    exit;
}

$data = json_decode($rawInput, true);
if (!is_array($data)) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Invalid JSON payload"]);
    exit;
}

// 4. Server-Side Honeypot Spam Defense
if (!empty($data['website_hp'])) {
    // Return artificial success to fool automated bots without persisting spam
    echo json_encode([
        "success" => true,
        "id" => "enq_verified",
        "message" => "Enquiry received successfully."
    ]);
    exit;
}

// 5. Input Sanitization & Boundary Constraints
$fullName    = isset($data['fullName']) ? mb_substr(trim(strip_tags((string)$data['fullName'])), 0, 100) : '';
$email       = isset($data['email']) ? mb_substr(trim(filter_var((string)$data['email'], FILTER_SANITIZE_EMAIL)), 0, 100) : '';
$phone       = isset($data['phone']) ? mb_substr(trim(strip_tags((string)$data['phone'])), 0, 25) : '';
$companyName = isset($data['companyName']) ? mb_substr(trim(strip_tags((string)$data['companyName'])), 0, 100) : '';
$productName = isset($data['productName']) ? mb_substr(trim(strip_tags((string)$data['productName'])), 0, 150) : 'General Requirement';
$category    = isset($data['category']) ? mb_substr(trim(strip_tags((string)$data['category'])), 0, 100) : 'General';
$quantity    = isset($data['quantity']) ? mb_substr(trim(strip_tags((string)$data['quantity'])), 0, 50) : 'Unspecified';
$message     = isset($data['message']) ? mb_substr(trim(strip_tags((string)$data['message'])), 0, 3000) : '';

$errors = [];
if (mb_strlen($fullName) < 2) {
    $errors[] = "Full name must be at least 2 characters";
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = "Please provide a valid work email address";
}
if (mb_strlen($phone) < 8 || !preg_match('/^[0-9+\s\-()]+$/', $phone)) {
    $errors[] = "Please provide a valid contact number";
}
if (mb_strlen($message) < 5) {
    $errors[] = "Please provide requirement details (minimum 5 characters)";
}

if (!empty($errors)) {
    http_response_code(400);
    echo json_encode(["success" => false, "errors" => $errors]);
    exit;
}

// 6. Record Generation & Database Insertion
$submissionId = "enq_" . time() . "_" . bin2hex(random_bytes(3));
$timestamp    = date("c");

$submission = [
    "id"          => $submissionId,
    "timestamp"   => $timestamp,
    "fullName"    => $fullName,
    "companyName" => $companyName,
    "email"       => $email,
    "phone"       => $phone,
    "productName" => $productName,
    "category"    => $category,
    "quantity"    => $quantity,
    "message"     => $message,
    "status"      => "New",
    "ip"          => $_SERVER['REMOTE_ADDR'] ?? 'unknown'
];

// 6.1 Database Lead Persistence (Hostinger MySQL)
if (file_exists(__DIR__ . DIRECTORY_SEPARATOR . 'config.php')) {
    require_once __DIR__ . DIRECTORY_SEPARATOR . 'config.php';
    $db = getDbConnection();
    if ($db) {
        try {
            $leadStmt = $db->prepare("
                INSERT INTO leads (id, full_name, company_name, email, phone, product_name, category, quantity, message, status, ip_address, created_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'New', ?, NOW())
            ");
            $leadStmt->execute([
                $submissionId, $fullName, $companyName ?: null, $email, $phone,
                $productName, $category, $quantity, $message, $_SERVER['REMOTE_ADDR'] ?? null
            ]);
        } catch (Exception $e) {
            error_log('Failed to persist lead to MySQL: ' . $e->getMessage());
        }
    }
}

// 7. Secure Data Storage — Exclusively Outside public_html
// All customer submissions are stored in an unroutable directory above web root.
// No fallback to public_html or web-accessible directories is permitted.

$privateDirCandidates = [];

// Candidate A: Direct parent of DOCUMENT_ROOT (Hostinger standard: /home/u123456789/private_data)
if (!empty($_SERVER['DOCUMENT_ROOT'])) {
    $docRoot = realpath($_SERVER['DOCUMENT_ROOT']) ?: $_SERVER['DOCUMENT_ROOT'];
    $docRootParent = dirname($docRoot);
    if (!empty($docRootParent) && is_dir($docRootParent)) {
        $privateDirCandidates[] = rtrim($docRootParent, '/\\') . DIRECTORY_SEPARATOR . 'private_data';
    }
}

// Candidate B: Two levels above current api script (public_html/api -> /home/u123456789/private_data)
$apiParent2 = dirname(__DIR__, 2);
if (is_dir($apiParent2)) {
    $privateDirCandidates[] = rtrim($apiParent2, '/\\') . DIRECTORY_SEPARATOR . 'private_data';
}

// Candidate C: Three levels above current api script (for subdomain public_html/subfolder/api setups)
$apiParent3 = dirname(__DIR__, 3);
if (is_dir($apiParent3)) {
    $privateDirCandidates[] = rtrim($apiParent3, '/\\') . DIRECTORY_SEPARATOR . 'private_data';
}

// Candidate D: Dedicated system secure temp directory fallback strictly outside webroot
$sysTemp = sys_get_temp_dir();
if (!empty($sysTemp) && is_dir($sysTemp)) {
    $privateDirCandidates[] = rtrim($sysTemp, '/\\') . DIRECTORY_SEPARATOR . 'rrfoundations_secure_data';
}

// Validate candidate is strictly OUTSIDE public_html / web root
$targetPrivateDir = null;
foreach ($privateDirCandidates as $candidate) {
    $normalizedCandidate = str_replace('\\', '/', $candidate);
    
    // Reject any candidate inside public_html
    if (preg_match('#/public_html(/|$)#i', $normalizedCandidate)) {
        continue;
    }
    if (!empty($_SERVER['DOCUMENT_ROOT'])) {
        $docRoot = str_replace('\\', '/', realpath($_SERVER['DOCUMENT_ROOT']) ?: $_SERVER['DOCUMENT_ROOT']);
        if (!empty($docRoot) && strpos($normalizedCandidate, $docRoot) === 0) {
            continue;
        }
    }

    // Attempt creation with restricted permissions (owner read/write/execute only)
    if (!is_dir($candidate)) {
        @mkdir($candidate, 0750, true);
    }

    if (is_dir($candidate) && is_writable($candidate)) {
        $targetPrivateDir = $candidate;
        break;
    }
}

// Fail-safe check: If private storage outside public_html is unavailable, fail safely without leaking data
if ($targetPrivateDir === null) {
    // Log technical error with reference ID only — never log customer PII
    error_log("RR FOUNDATIONS SECURITY ALERT: Private storage directory outside public_html is unavailable or unwritable. Reference ID: " . $submissionId);
    
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Enquiry processing service is temporarily unavailable. Please email help@rrfoundation.org directly.",
        "id"      => $submissionId
    ]);
    exit;
}

$dataFile = $targetPrivateDir . DIRECTORY_SEPARATOR . "enquiry_submissions.json";
$writeSuccess = false;

// Atomic concurrent file writing with exclusive lock (LOCK_EX)
$fp = @fopen($dataFile, "c+");
if ($fp) {
    if (flock($fp, LOCK_EX)) {
        $fileSize = filesize($dataFile);
        $currentData = [];
        if ($fileSize > 0) {
            $contents = fread($fp, $fileSize);
            $parsed = json_decode($contents, true);
            if (is_array($parsed)) {
                $currentData = $parsed;
            }
        }
        $currentData[] = $submission;
        ftruncate($fp, 0);
        rewind($fp);
        fwrite($fp, json_encode($currentData, JSON_PRETTY_PRINT));
        fflush($fp);
        flock($fp, LOCK_UN);
        $writeSuccess = true;
    }
    fclose($fp);
}

if (!$writeSuccess) {
    // Log failure without exposing customer PII
    error_log("RR FOUNDATIONS SECURITY ALERT: Failed to lock or write to private datastore outside public_html. Reference ID: " . $submissionId);
    
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Enquiry processing service is temporarily unavailable. Please email help@rrfoundation.org directly.",
        "id"      => $submissionId
    ]);
    exit;
}

// 8. Factory Notification Email Dispatch
$toEmail = "help@rrfoundation.org";
$subject = "New B2B Manufacturing RFQ: " . $productName . " [" . $submissionId . "]";

$emailBody = "====================================================\n";
$emailBody .= "   RR FOUNDATIONS — NEW B2B ENQUIRY\n";
$emailBody .= "====================================================\n\n";
$emailBody .= "Enquiry ID   : " . $submissionId . "\n";
$emailBody .= "Date & Time  : " . $timestamp . "\n\n";
$emailBody .= "--- CLIENT INFORMATION ---\n";
$emailBody .= "Full Name    : " . $fullName . "\n";
$emailBody .= "Company      : " . ($companyName ?: "Not Specified") . "\n";
$emailBody .= "Email Address: " . $email . "\n";
$emailBody .= "Phone Number : " . $phone . "\n\n";
$emailBody .= "--- REQUIREMENT SPECIFICATIONS ---\n";
$emailBody .= "Product Name : " . $productName . "\n";
$emailBody .= "Category     : " . $category . "\n";
$emailBody .= "Est. Quantity: " . $quantity . "\n\n";
$emailBody .= "--- MESSAGE / NOTES ---\n";
$emailBody .= $message . "\n\n";
$emailBody .= "====================================================\n";

$headers  = "From: RR Foundations Web <noreply@rrfoundations.org>\r\n";
$headers .= "Reply-To: " . $fullName . " <" . $email . ">\r\n";
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: text/plain; charset=UTF-8\r\n";
$headers .= "X-Mailer: PHP/" . phpversion() . "\r\n";

// Dispatch via mail() with error suppression
@mail($toEmail, $subject, $emailBody, $headers);

// 9. Standardized Success Response
echo json_encode([
    "success" => true,
    "id"      => $submissionId,
    "message" => "Enquiry received successfully. Our sales desk will follow up shortly."
]);
