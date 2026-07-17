<?php
include './connect.php';
// ... الترويسات (Headers) تبقى كما هي

$idcom = filterRequest("idcom");

// حتى لو الـ ID فارغ، سنرجع أصفار بدل الفشل
if (!empty($idcom)) {
    // استعلاماتك كما هي تماماً
    $stmt1 = $con->prepare("SELECT SUM(costt) as total FROM movtrans WHERE idcom = ? AND idex = 1");
    $stmt1->execute(array($idcom));
    $total_mov_currency1 = $stmt1->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;

    $stmt2 = $con->prepare("SELECT SUM(costt) as total FROM movtrans WHERE idcom = ? AND idex = 2");
    $stmt2->execute(array($idcom));
    $total_mov_currency2 = $stmt2->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;

    $stmt3 = $con->prepare("SELECT SUM(costt) as total FROM paiidtb WHERE idcom = ? AND idex = 1");
    $stmt3->execute(array($idcom));
    $total_paid_currency1 = $stmt3->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;

    $stmt4 = $con->prepare("SELECT SUM(costt) as total FROM paiidtb WHERE idcom = ? AND idex = 2");
    $stmt4->execute(array($idcom));
    $total_paid_currency2 = $stmt4->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;

    echo json_encode(array(
        "status" => "success",
        "data" => array(
            "total_mov_1"  => (float)$total_mov_currency1,
            "total_mov_2"  => (float)$total_mov_currency2,
            "total_paid_1" => (float)$total_paid_currency1,
            "total_paid_2" => (float)$total_paid_currency2
        )
    ));
} else {
    // إذا لم يرسل الـ ID، لا تقل فشل، بل قل نجاح وأعطِ أصفاراً لتصفير الواجهة
    echo json_encode(array(
        "status" => "success",
        "data" => array(
            "total_mov_1"  => 0,
            "total_mov_2"  => 0,
            "total_paid_1" => 0,
            "total_paid_2" => 0
        )
    ));
}
?>
