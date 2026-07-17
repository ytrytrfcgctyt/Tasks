<?php
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "blanctb"; 
$idbl = filterRequest("idbl"); 
if (!empty($idbl)) {
  $count = deleteData($table, "idbl = $idbl", false);
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