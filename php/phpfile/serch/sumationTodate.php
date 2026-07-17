<?php 
include './connect.php'; 
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8");

$idcom = filterRequest("idcom");
$startDate = filterRequest("startdate");
$endDate = filterRequest("enddate");
if (!empty($idcom)) {
    function getSumByDate($con, $table, $idcom, $idex, $startDate, $endDate) {
        $sql = "SELECT SUM(costt) as total FROM $table WHERE idcom = ? AND idex = ? AND datt BETWEEN ? AND ?";
        $stmt = $con->prepare($sql);
        $stmt->execute(array($idcom, $idex, $startDate, $endDate));
        return $stmt->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;
    }
    $total_mov_1  = getSumByDate($con, "movtrans", $idcom, 1, $startDate, $endDate);
    $total_mov_2  = getSumByDate($con, "movtrans", $idcom, 2, $startDate, $endDate);
    $total_paid_1 = getSumByDate($con, "paiidtb", $idcom, 1, $startDate, $endDate);
    $total_paid_2 = getSumByDate($con, "paiidtb", $idcom, 2, $startDate, $endDate);
    echo json_encode(array(
        "status" => "success",
        "data" => array(
            "total_mov_1"  => (float)$total_mov_1,
            "total_mov_2"  => (float)$total_mov_2,
            "total_paid_1" => (float)$total_paid_1,
            "total_paid_2" => (float)$total_paid_2
        )
    ));
} else {
    echo json_encode(array("status" => "success", "data" => array("total_mov_1" => 0, "total_mov_2" => 0, "total_paid_1" => 0, "total_paid_2" => 0)));
}
?>