<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");
$table = "movtrans"; 
$compsent  = filterRequest("compsent");
$costt  = filterRequest("costt");
$a1  = filterRequest("a1");
$a2  = filterRequest("a2");
$a3  = filterRequest("a3");
$a4  = filterRequest("a4");
$a5  = filterRequest("a5");
$a6  = filterRequest("a6");
$a7  = filterRequest("a7");
$a8  = filterRequest("a8");
$a9  = filterRequest("a9");
$datt = filterRequest("datt");
$idcom = filterRequest("idcom");
$idex = filterRequest("idex");
$iduser = filterRequest("iduser");
$namdriv = filterRequest("namdriv");
$nott = filterRequest("nott");
$numbcar = filterRequest("numbcar");
$numbme = filterRequest("numbme");
$subj = filterRequest("subj");
$typcar = filterRequest("typcar");  
$moveto = filterRequest("moveto");  
$acountmoveto = filterRequest("acountmoveto");  
$reblec = filterRequest("reblec");  
if (!empty($idcom)) {
    $data = array(
        "compsent"  => $compsent,
        "costt" => $costt,
        "a1" => $a1,
        "a2" => $a2,
        "a3" => $a3,
        "a4" => $a4,
        "a5" => $a5,
        "a6" => $a6,
        "a7" => $a7,
        "a8" => $a8,
        "a9" => $a9,
        "datt" => $datt,
        "idcom" => $idcom,
        "idex" => $idex,
        "iduser" => $iduser,
        "namdriv" => $namdriv,
        "nott" => $nott,
        "numbcar" => $numbcar,
        "numbme" => $numbme,
        "subj" => $subj,
        "typcar" => $typcar,
        "moveto" => $moveto,
        "acountmoveto" => $acountmoveto,
        "reblec" => $reblec,
    );
    insertData($table, $data);
    exit;
} else {
   echo json_encode(array("status" => "failure", "message" => "empty fields"));
    exit;
}
?>