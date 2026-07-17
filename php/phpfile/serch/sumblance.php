<?php
include './connect.php';

    // مجموع الداخل - عملة 1
    $stmt1 = $con->prepare("SELECT SUM(blanc) as total FROM blanctb WHERE typ = 1 AND id_ex = 1"); // تم تعديل id_ex
    $stmt1->execute();
    $inpt1 = $stmt1->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;

    // مجموع الداخل - عملة 2
    $stmt2 = $con->prepare("SELECT SUM(blanc) as total FROM blanctb WHERE typ = 1 AND id_ex = 2"); // تم تعديل id_ex
    $stmt2->execute();
    $inpt2 = $stmt2->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;

    // مجموع الخارج - عملة 1
    $stmt3 = $con->prepare("SELECT SUM(blanc) as total FROM blanctb WHERE typ = 2 AND id_ex = 1"); // تم تعديل id_ex
    $stmt3->execute();
    $out3 = $stmt3->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;

    // مجموع الخارج - عملة 2
    $stmt4 = $con->prepare("SELECT SUM(blanc) as total FROM blanctb WHERE typ = 2 AND id_ex = 2"); // تم تعديل id_ex
    $stmt4->execute();
    $out4 = $stmt4->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;

    echo json_encode(array(
        "status" => "success",
        "data" => array(
            "in_1"  => (float)$inpt1,
            "in_2"  => (float)$inpt2,
            "out_1" => (float)$out3,
            "out_2" => (float)$out4
        )
    ));
?>
