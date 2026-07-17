-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql9001.site4now.net
-- Generation Time: 14 يوليو 2026 الساعة 08:24
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
-- بنية الجدول `blanctb`
--

CREATE TABLE `blanctb` (
  `idbl` int NOT NULL,
  `typ` int NOT NULL,
  `datt` date NOT NULL,
  `datile` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `noott` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `blanc` decimal(18,0) NOT NULL,
  `id_ex` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `companytb`
--

CREATE TABLE `companytb` (
  `idcom` int NOT NULL,
  `namcomp` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mang` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `typ` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `companytb`
--

INSERT INTO `companytb` (`idcom`, `namcomp`, `phone`, `adress`, `mang`, `typ`) VALUES
(82, 'خيرات سما التقدم للتجارة', '7800001180', 'بغداد', 'ماجد', 1),
(86, 'الازد للوكالات التجارية', '7800001180', 'بغداد', 'سيد طي', 1),
(87, 'سعد عبد الصمد', '7800001180', 'العراق', 'ايسر', 1),
(93, 'سيماالسرورللتجارة', '7800001180', 'اربيل', 'مصطفى', 1),
(94, 'نسيم الواثف للتجارة العامة', '7800001180', 'بغداد', 'حجى ضياء', 1),
(95, 'وميض الساحل', '7800001180', 'بغداد', 'حجى ضياء', 1),
(96, 'الزود لليجارة العامة', '7800001180', 'بغداد', 'حجى ضياء', 1),
(99, 'مسار البحرللتحارة', '7800001180', 'بغداد', 'حجى ضياء', 1),
(100, 'عطرالاريج للتجارة', '7800001180', 'بغداد', 'حجى ضياء', 1),
(101, 'نبع الوقود', '7800001180', 'بغداد', 'احمدالقيس', 1),
(102, 'نفط الخليج للتجارة', '7800001180', 'السماوة', 'مرتض', 1),
(103, 'نبع الوقودللتجارة ', '7800001180', 'نخف', 'وليد', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `company_summary_view`
-- (See below for the actual view)
--
CREATE TABLE `company_summary_view` (
`adress` varchar(255)
,`balance_currency_1` double
,`balance_currency_2` double
,`idcom` int
,`mang` varchar(255)
,`namcomp` varchar(255)
,`phone` varchar(255)
);

-- --------------------------------------------------------

--
-- بنية الجدول `movtrans`
--

CREATE TABLE `movtrans` (
  `idmov` int NOT NULL,
  `subj` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `datt` date NOT NULL,
  `costt` varchar(225) COLLATE utf8mb3_unicode_ci NOT NULL,
  `a1` decimal(18,0) NOT NULL,
  `a2` decimal(18,0) NOT NULL,
  `a3` decimal(18,0) NOT NULL,
  `a4` decimal(18,0) NOT NULL,
  `a5` decimal(18,0) NOT NULL,
  `a6` decimal(18,0) NOT NULL,
  `a7` decimal(18,0) NOT NULL,
  `a8` decimal(18,0) NOT NULL,
  `a9` decimal(18,0) NOT NULL,
  `nott` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `numbme` varchar(225) COLLATE utf8mb3_unicode_ci NOT NULL,
  `idcom` int NOT NULL,
  `idex` int NOT NULL,
  `iduser` int NOT NULL,
  `namdriv` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `numbcar` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `typcar` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `compsent` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `moveto` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `acountmoveto` decimal(18,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `movtrans`
--

INSERT INTO `movtrans` (`idmov`, `subj`, `datt`, `costt`, `a1`, `a2`, `a3`, `a4`, `a5`, `a6`, `a7`, `a8`, `a9`, `nott`, `numbme`, `idcom`, `idex`, `iduser`, `namdriv`, `numbcar`, `typcar`, `compsent`, `moveto`, `acountmoveto`) VALUES
(43, 'كاسات', '2026-07-07', '1861000.0', 0, 1071000, 75000, 0, 250000, 200000, 65000, 0, 200000, '', '26-24', 69, 1, 1, 'عمار معيشر', '8153/الانبار', '0', 'حمة امين', '', 0),
(44, 'كاسات', '2026-07-07', '1861000.0', 0, 1071000, 75000, 0, 250000, 200000, 65000, 0, 200000, '', '26-24', 69, 1, 1, 'عمار معيشر', '8153/الانبار', '0', 'حمة امين', '', 0),
(51, 'زيوت محركت', '2026-07-07', '14674000.0', 0, 12334000, 0, 0, 400000, 225000, 65000, 100000, 350000, '', '59-26', 72, 1, 1, 'صفاء سعد', '18503', 'مرس', 'السعودية', 'من عرعر الئ كركوك', 1200000),
(52, 'زيوت محركت', '2026-07-07', '14674000.0', 0, 12334000, 0, 0, 400000, 225000, 65000, 100000, 350000, '', '59-26', 72, 1, 1, 'صفاء سعد', '18503', 'مرس', 'السعودية', 'من عرعر الئ كركوك', 1200000),
(68, 'رول خيوط', '2026-07-08', '9710001.0', 0, 5770000, 475000, 0, 350000, 2000001, 65000, 0, 250000, '', '179', 82, 1, 1, 'مرتض حيدر', '11116', 'مرسدسي', 'السعودية', 'بغداد الصويرة', 800000),
(69, 'اضافات خرسانية ساىلة', '2026-07-08', '4464000.0', 200000, 1849000, 0, 0, 600000, 200000, 65000, 0, 350000, '', '77', 82, 1, 1, 'مرتضى سجاد', '54499', 'مرسدسي', 'الوليد', '', 1200000),
(72, 'رول خيوط', '2026-07-09', '8860000.0', 0, 5770000, 475000, 0, 350000, 200000, 65000, 900000, 250000, '', '179', 82, 1, 1, 'مرتض حيدر', '11116', 'مرسيد ', 'دبي', 'بغداد', 850000),
(75, 'كرات محشوة بطحينية', '2026-07-11', '8805000.0', 1860000, 3455000, 0, 1500000, 350000, 225000, 65000, 0, 350000, '', '73', 86, 1, 1, 'فلاح حسين ', '10391', 'مرسيدس', 'السعودية', 'بغداد', 1000000),
(77, 'ملابس', '2026-07-11', '66759000.0', 0, 65894000, 0, 0, 350000, 200000, 65000, 0, 250000, '', '0020260226', 87, 1, 1, 'محمدجح', '11220', 'مرسيدس', 'دبي', 'بغداد', 0),
(82, 'زيوت محركات', '2026-07-11', '13943000.0', 0, 11778000, 0, 0, 400000, 200000, 65000, 0, 250000, '', '1061', 93, 1, 1, 'محمداحمد', '39174', 'مرسيدس', 'دبي', 'اربيل', 1250000),
(83, 'شاي اسود', '2026-07-11', '6907000.0', 300000, 5017000, 125000, 0, 750000, 200000, 65000, 150000, 300000, '', 'EXP012526', 94, 1, 1, 'طارق ناطق', '81984', 'م', 'عمان', 'بغداد', 0),
(85, 'شرانح', '2026-07-11', '5426000.0', 300000, 3686000, 50000, 0, 750000, 200000, 65000, 75000, 300000, '', 'EX/016', 95, 1, 1, 'احمد مضلوم', '12129', 'م', 'النبر', 'بغداد', 0),
(86, 'شاي اسود', '2026-07-11', '9255000.0', 300000, 7565000, 0, 0, 750000, 200000, 65000, 75000, 300000, '', 'EXP0612526', 94, 1, 1, 'وليد خالد', '65708', 'م', 'البنر', 'بغداد', 0),
(87, 'حليب باودر', '2026-07-11', '7704000.0', 300000, 6014000, 0, 0, 750000, 200000, 65000, 75000, 300000, '', 'SO-158825', 94, 1, 1, 'علي ابراهيم', '19744', 'م', 'النبر', 'بغداد', 0),
(88, 'حليب باودر', '2026-07-11', '7704000.0', 300000, 6014000, 0, 0, 750000, 200000, 65000, 75000, 300000, '', 'SO-158825', 94, 1, 1, 'علي ابراهيم', '19744', 'م', 'النبر', 'بغداد', 0),
(89, 'حليب باودر', '2026-07-11', '7704000.0', 300000, 6014000, 0, 0, 750000, 200000, 65000, 75000, 300000, '', 'SO-158825', 94, 1, 1, 'علي ابراهيم', '19744', 'م', 'النبر', 'بغداد', 0),
(90, 'حليب باودر', '2026-07-11', '7704000.0', 300000, 6014000, 0, 0, 750000, 200000, 65000, 75000, 300000, '', 'SO-158825', 94, 1, 1, 'علي ابراهيم', '19744', 'م', 'النبر', 'بغداد', 0),
(91, 'حليب باودر', '2026-07-11', '7754000.0', 300000, 6014000, 50000, 0, 750000, 200000, 65000, 75000, 300000, '', 'SO-158825', 94, 1, 1, 'حسين سعدون', '87627', 'م', 'النبر', 'بغداد', 0),
(92, 'لوز', '2026-07-11', '13676000.0', 300000, 11936000, 50000, 0, 750000, 200000, 65000, 75000, 300000, '', '24852', 96, 1, 1, 'عباس رحيم', '61055', 'م', 'النبر', 'بغداد', 0),
(96, 'ذرة مخلل', '2026-07-13', '3132000.0', 0, 1742000, 75000, 0, 750000, 200000, 65000, 0, 300000, '', 'sAF-006/', 99, 1, 1, 'محمدغانم', '11709', 'مرسيدس', 'عمان', 'بغداد', 0),
(98, 'ماجى نكهات', '2026-07-13', '4522000.0', 300000, 2757000, 75000, 0, 750000, 200000, 65000, 75000, 300000, '', 'SD202602040', 100, 1, 1, 'عبدالحميد رحيم', '19664', 'م', 'عمان', 'بغداد', 0),
(99, 'خيار مخلل', '2026-07-13', '3107000.0', 0, 1742000, 50000, 0, 750000, 200000, 65000, 0, 300000, '', 'SAF006', 99, 1, 1, 'حسام صالح', '18903', 'م', 'عمان', 'بغداد', 0),
(100, 'ذرة مخلل +خيار مخلل', '2026-07-13', '3107000.0', 0, 1742000, 50000, 0, 750000, 200000, 65000, 0, 300000, '', '006', 99, 1, 1, 'احمد خلف', '14921', 'م', 'عمان', 'بغداد', 0),
(101, 'زيوت محركات', '2026-07-13', '11182000.0', 0, 9142000, 0, 0, 400000, 225000, 65000, 100000, 350000, '', '2066', 101, 1, 1, 'علي ناجح', '93436', '', 'دبي', 'بغداد', 900000),
(102, 'زيوت محركات', '2026-07-13', '11182000.0', 0, 9142000, 0, 0, 400000, 225000, 65000, 100000, 350000, '', '2066', 101, 1, 1, 'حيدرمحمد', '28057', 'م', 'دبي', 'بغداد', 900000),
(103, 'زيوت محركات', '2026-07-13', '14380000.0', 0, 12190000, 0, 0, 400000, 225000, 65000, 100000, 300000, '', '3797', 102, 1, 1, 'مظهر جباد', '15872', 'م', 'دبي', 'السماوة', 1100000),
(104, 'زيوت محركات', '2026-07-13', '14278000.0', 0, 11988000, 0, 0, 400000, 225000, 65000, 100000, 300000, '', '3791', 102, 1, 1, 'طلال ابراهيم', '10137', 'مم', 'دبي', 'ناصرية', 1200000),
(105, 'زيوي محركات', '2026-07-13', '13928000.0', 0, 11638000, 0, 0, 400000, 225000, 65000, 100000, 300000, '', '3798', 102, 1, 1, 'حسين رشيد', '29541', 'م', 'دبي', 'ناصرية', 1200000),
(106, 'زيوت محركات', '2026-07-13', '14249000.0', 0, 12259000, 0, 0, 400000, 225000, 65000, 100000, 300000, '', '3790', 102, 1, 1, 'ثمين خشان', '33948', 'م', 'دبي', 'بغداد', 900000),
(107, 'زيوت محركات', '2026-07-13', '11725000.0', 0, 9685000, 0, 0, 400000, 225000, 65000, 100000, 350000, '', '7034', 103, 1, 1, 'احمد حمزة', '11760', 'م', 'دبي', 'نجف', 900000),
(108, 'زيوت محركات', '2026-07-13', '11725000.0', 0, 9685000, 0, 0, 400000, 225000, 65000, 100000, 350000, '', '7034', 103, 1, 1, 'صادق ضياء', '21755', 'م', 'دبي', 'نجف', 900000),
(109, 'زيوت محركات', '2026-07-13', '11725000.0', 0, 9685000, 0, 0, 400000, 225000, 65000, 100000, 350000, '', '7034', 103, 1, 1, 'ثامر طالب', '24011', 'م', 'دبي', 'نجف', 900000);

-- --------------------------------------------------------

--
-- بنية الجدول `paiidtb`
--

CREATE TABLE `paiidtb` (
  `idpush` int NOT NULL,
  `idcom` int NOT NULL,
  `iduser` int NOT NULL,
  `costt` decimal(18,0) NOT NULL,
  `idex` int NOT NULL,
  `datt` date NOT NULL,
  `nott` varchar(225) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `iduser` int NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`iduser`, `username`, `password`, `nam`) VALUES
(1, '1234', '1234', 'ايسر'),
(2, 'ahmed', '1122', 'احمد');

-- --------------------------------------------------------

--
-- Structure for view `company_summary_view`
--
DROP TABLE IF EXISTS `company_summary_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ac8cc0_ayseria`@`%` SQL SECURITY DEFINER VIEW `company_summary_view`  AS SELECT `c`.`idcom` AS `idcom`, `c`.`namcomp` AS `namcomp`, `c`.`phone` AS `phone`, `c`.`adress` AS `adress`, `c`.`mang` AS `mang`, (sum((case when (`total_mov`.`idex` = 1) then `total_mov`.`sum_mov` else 0 end)) - sum((case when (`total_paid`.`idex` = 1) then `total_paid`.`sum_paid` else 0 end))) AS `balance_currency_1`, (sum((case when (`total_mov`.`idex` = 2) then `total_mov`.`sum_mov` else 0 end)) - sum((case when (`total_paid`.`idex` = 2) then `total_paid`.`sum_paid` else 0 end))) AS `balance_currency_2` FROM ((`companytb` `c` left join (select `movtrans`.`idcom` AS `idcom`,`movtrans`.`idex` AS `idex`,sum(`movtrans`.`costt`) AS `sum_mov` from `movtrans` group by `movtrans`.`idcom`,`movtrans`.`idex`) `total_mov` on((`c`.`idcom` = `total_mov`.`idcom`))) left join (select `paiidtb`.`idcom` AS `idcom`,`paiidtb`.`idex` AS `idex`,sum(`paiidtb`.`costt`) AS `sum_paid` from `paiidtb` group by `paiidtb`.`idcom`,`paiidtb`.`idex`) `total_paid` on(((`c`.`idcom` = `total_paid`.`idcom`) and (`total_mov`.`idex` = `total_paid`.`idex`)))) GROUP BY `c`.`idcom` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blanctb`
--
ALTER TABLE `blanctb`
  ADD PRIMARY KEY (`idbl`);

--
-- Indexes for table `companytb`
--
ALTER TABLE `companytb`
  ADD PRIMARY KEY (`idcom`);

--
-- Indexes for table `movtrans`
--
ALTER TABLE `movtrans`
  ADD PRIMARY KEY (`idmov`);

--
-- Indexes for table `paiidtb`
--
ALTER TABLE `paiidtb`
  ADD PRIMARY KEY (`idpush`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `usernam` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blanctb`
--
ALTER TABLE `blanctb`
  MODIFY `idbl` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `companytb`
--
ALTER TABLE `companytb`
  MODIFY `idcom` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `movtrans`
--
ALTER TABLE `movtrans`
  MODIFY `idmov` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `paiidtb`
--
ALTER TABLE `paiidtb`
  MODIFY `idpush` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
