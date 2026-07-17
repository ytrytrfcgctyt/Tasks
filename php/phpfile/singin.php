<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "users";
$user = filterRequest("username");
$pass = filterRequest("password");
getAllData($table, "username = ? AND password = ?", array($user, $pass));
?>