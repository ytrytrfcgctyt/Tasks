<?php
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table1 = "companytb"; 
$table2 = "paiidtb"; 
$table3 = "movtrans"; 
$idcom = filterRequest("idcom"); 
if (!empty($idcom)) {
  $count1 = deleteData($table1, "idcom = $idcom", false);
  $count2 = deleteData($table2, "idcom = $idcom", false);
  $count3 = deleteData($table3, "idcom = $idcom", false);
}
   if ($count1 > 0) {
       echo json_encode(array(
            "status" => "success",
            "count"  => $count
        ));
   } else {
       echo json_encode(array("status" => "failure"));
   }
   exit;
?>