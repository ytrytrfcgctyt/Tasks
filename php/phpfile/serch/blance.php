<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "blanctb";
getAllData($table, "1 = 1",);
?>