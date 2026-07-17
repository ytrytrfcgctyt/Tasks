-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql9001.site4now.net
-- Generation Time: 14 يوليو 2026 الساعة 08:53
-- إصدار الخادم: 8.0.41
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ac8cc0_ayseria`
--

-- --------------------------------------------------------

--
-- Structure for view `company_summary_view`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`ac8cc0_ayseria`@`%` SQL SECURITY DEFINER VIEW `company_summary_view`  AS SELECT `c`.`idcom` AS `idcom`, `c`.`namcomp` AS `namcomp`, `c`.`phone` AS `phone`, `c`.`adress` AS `adress`, `c`.`mang` AS `mang`, (sum((case when (`total_mov`.`idex` = 1) then `total_mov`.`sum_mov` else 0 end)) - sum((case when (`total_paid`.`idex` = 1) then `total_paid`.`sum_paid` else 0 end))) AS `balance_currency_1`, (sum((case when (`total_mov`.`idex` = 2) then `total_mov`.`sum_mov` else 0 end)) - sum((case when (`total_paid`.`idex` = 2) then `total_paid`.`sum_paid` else 0 end))) AS `balance_currency_2` FROM ((`companytb` `c` left join (select `movtrans`.`idcom` AS `idcom`,`movtrans`.`idex` AS `idex`,sum(`movtrans`.`costt`) AS `sum_mov` from `movtrans` group by `movtrans`.`idcom`,`movtrans`.`idex`) `total_mov` on((`c`.`idcom` = `total_mov`.`idcom`))) left join (select `paiidtb`.`idcom` AS `idcom`,`paiidtb`.`idex` AS `idex`,sum(`paiidtb`.`costt`) AS `sum_paid` from `paiidtb` group by `paiidtb`.`idcom`,`paiidtb`.`idex`) `total_paid` on(((`c`.`idcom` = `total_paid`.`idcom`) and (`total_mov`.`idex` = `total_paid`.`idex`)))) GROUP BY `c`.`idcom` ;

--
-- VIEW `company_summary_view`
-- Data: لا شيء
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
