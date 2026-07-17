<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");

$table = "paiidtb";
$idcom = filterRequest("idcom");
$startDate = filterRequest("startdate");
$endDate = filterRequest("enddate");

// نقوم بإنشاء شرط يجمع بين idcom والتاريخين مع الترتيب حسب التاريخ
$where = "idcom = ? AND datt BETWEEN ? AND ? ORDER BY datt DESC"; 

// نمرر القيم الثلاث (idcom, startdate, enddate)
getAllData($table, $where, array($idcom, $startDate, $endDate));
?>