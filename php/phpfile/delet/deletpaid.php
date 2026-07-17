<?php
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "paiidtb"; 
$idpush = filterRequest("idpush"); 
if (!empty($idpush)) {
  $count = deleteData($table, "idpush = $idpush", false);
}
   if ($count > 0) {
       echo json_encode(array(
            "status" => "success",
            "count"  => $count
        ));
   } else {
       echo json_encode(array("status" => "failure"));
   }
   exit;
?>