<?php
include './connect.php';

$table = "company_summary_view";

// 1. استلام نص البحث
$searchName = filterRequest("namcomp");

// 2. تجهيز القيمة للبحث
$searchValue = "%" . $searchName . "%";

// 3. الشرط الصحيح
$where = "namcomp LIKE ?";

// 4. الاستدعاء الصحيح
getAllData($table, $where, array($searchValue));

?>