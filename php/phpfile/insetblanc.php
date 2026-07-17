<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "blanctb"; 
$typ  = filterRequest("typ");
$datt  = filterRequest("datt");
$datile = filterRequest("datile");
$noott = filterRequest("noott");
$blanc = filterRequest("blanc");
$id_ex = filterRequest("id_ex");
if (!empty($blanc)) {
    $data = array(
        "typ"  => $typ,
        "datt" => $datt,       
        "datile" => $datile,
        "noott" => $noott,
        "blanc" => $blanc,
        "id_ex" => $id_ex,
    );
    insertData($table, $data);
    exit;
} else {
   echo json_encode(array("status" => "failure", "message" => "empty fields"));
    exit;
}
?>