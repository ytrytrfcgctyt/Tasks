<?php
include './connect.php'; 
$table = "companytb";
$idcom   = filterRequest("idcom");
$namcomp = filterRequest("namcomp");
$phone   = filterRequest("phone");
$adress  = filterRequest("adress");
$mang  = filterRequest("mang");
$data = array(
    "namcomp" => $namcomp,
    "phone"   => $phone,
    "adress"  => $adress,
    "mang"  => $mang
);
$where = "idcom = $idcom";
$count = updateData($table, $data, $where); 
?>