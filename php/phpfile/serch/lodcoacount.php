<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");

$table = "movtrans";
$idcom = filterRequest("idcom");

// التعديل هنا: أضفنا ORDER BY مباشرة في نص الـ where
// تأكد من تغيير 'date' إلى اسم العمود الحقيقي في جدولك
$where = "idcom = ? ORDER BY datt DESC"; 

getAllData($table, $where, array($idcom));
?>