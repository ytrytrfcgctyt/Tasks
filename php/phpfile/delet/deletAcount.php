<?php
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "movtrans"; 
$idmov = filterRequest("idmov"); 
if (!empty($idmov)) {
  $count = deleteData($table, "idmov = $idmov", false);
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