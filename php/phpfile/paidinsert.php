<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "paiidtb"; 
$costt  = filterRequest("costt");
$datt = filterRequest("datt");
$idcom = filterRequest("idcom");
$idex = filterRequest("idex");
$iduser = filterRequest("iduser");
$nott = filterRequest("nott");
if (!empty($costt)) {
    $data = array(
        "costt"  => $costt,
        "datt" => $datt,
        "idcom" => $idcom,
        "idex" => $idex,
        "iduser" => $iduser,
        "nott" => $nott,
    );
    insertData($table, $data);
   exit;
} else {
   echo json_encode(array("status" => "failure", "message" => "empty fields"));
    exit;
}
?>