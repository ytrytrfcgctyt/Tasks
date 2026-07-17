<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");

$table = "movtrans";
$idcom = filterRequest("idcom");
$startDate = filterRequest("startdate"); // التاريخ الأول
$endDate = filterRequest("enddate");     // التاريخ الثاني

// نقوم بإنشاء شرط يجمع بين idcom والتاريخين
// نستخدم AND للربط، و BETWEEN للبحث في النطاق الزمني
$where = "idcom = ? AND datt BETWEEN ? AND ? ORDER BY datt DESC"; 

// نمرر المصفوفة بالترتيب الصحيح (idcom ثم تاريخ البداية ثم تاريخ النهاية)
getAllData($table, $where, array($idcom, $startDate, $endDate));
?>