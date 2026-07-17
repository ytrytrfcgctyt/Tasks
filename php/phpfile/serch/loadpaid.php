<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "paiidtb";
$idcom = filterRequest("idcom");
getAllData($table, "idcom = ?", array($idcom));
?>