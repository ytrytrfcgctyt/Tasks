<?php
$dsn = "mysql:host=mysql5036.site4now.net;dbname=db_acc046_shrktal;charset=utf8";
$user = "acc046_shrktal";
$pass = "shr951201";
$option = array(
   PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
);
$countrowinpage = 9;
try {
   $con = new PDO($dsn, $user, $pass, $option);
   $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   header("Access-Control-Allow-Origin: *");
   header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
   header("Access-Control-Allow-Methods: POST, OPTIONS , GET");
   include "./functions.php";
   if (!isset($notAuth)) {
       checkAuthenticate();
   }
} catch (PDOException $e) {
   echo $e->getMessage();
}
