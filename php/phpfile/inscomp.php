<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "companytb"; 
$namcomp  = filterRequest("namcomp");
$phone = filterRequest("phone");
$adress = filterRequest("adress");
$mang = filterRequest("mang");
$typ = filterRequest("typ");
if (!empty($namcomp)) {
    $data = array(
        "namcomp"  => $namcomp,
        "phone" => $phone,
        "adress" => $adress,
        "mang" => $mang,
        "typ" => $typ,
    );
    insertData($table, $data);
    $response = getAllData($table, "1 = 1");
    echo json_encode($response);
    exit;
} else {
    $response = getAllData($table, "1 = 1");
    echo json_encode($response);
    exit;
}
?>