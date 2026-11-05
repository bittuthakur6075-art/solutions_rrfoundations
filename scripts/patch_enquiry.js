const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../public/api/enquiry.php');
let content = fs.readFileSync(filePath, 'utf8');

const regex = /\/\/ 6\. Record Generation[\s\S]*?"ip"          => \$_SERVER\['REMOTE_ADDR'\] \?\? 'unknown'[\r\n]+\];/;

const replacement = `// 6. Record Generation & Database Insertion
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
}`;

if (regex.test(content)) {
    content = content.replace(regex, replacement);
    fs.writeFileSync(filePath, content, 'utf8');
    console.log('Successfully updated enquiry.php with MySQL integration');
} else {
    console.error('Could not match target pattern in enquiry.php');
}
