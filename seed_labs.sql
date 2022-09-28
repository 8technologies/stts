-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 28, 2022 at 04:37 PM
-- Server version: 10.3.36-MariaDB-log-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eightechconsults_stts_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `seed_labs`
--

CREATE TABLE `seed_labs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `form_stock_examination_request_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `collection_date` date DEFAULT NULL,
  `payment_receipt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicant_remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sampling_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_weight` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packaging` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_units` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_lot` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_condition` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector_remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tests_required` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lab_technician_id` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `purity` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `germination_capacity` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abnormal_sprouts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `broken_germs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_recommendation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector` bigint(20) DEFAULT NULL,
  `inspector_is_done` tinyint(4) DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lot_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receptionist_is_done` tinyint(4) DEFAULT 0,
  `receptionist_remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lab_test_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lab_technician` int(11) DEFAULT 1,
  `p_x_g` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No name',
  `temp_parent` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seed_labs`
--

INSERT INTO `seed_labs` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `form_stock_examination_request_id`, `collection_date`, `payment_receipt`, `applicant_remarks`, `sampling_date`, `sample_weight`, `packaging`, `number_of_units`, `mother_lot`, `sample_condition`, `inspector_remarks`, `tests_required`, `lab_technician_id`, `quantity`, `purity`, `germination_capacity`, `abnormal_sprouts`, `broken_germs`, `report_recommendation`, `inspector`, `inspector_is_done`, `status`, `status_comment`, `lot_number`, `receptionist_is_done`, `receptionist_remarks`, `lab_test_number`, `lab_technician`, `p_x_g`, `parent_id`, `order`, `title`, `temp_parent`) VALUES
(91, '2022-09-26 19:04:24', '2022-09-27 17:19:51', 169, 1, 4, '2022-09-30', 'files/2dead325648a38f689ea1cb7c4abc915.jpg', 'Grain stock of 1 MT', '2022-09-26', '2', 'Sisal bag', '15', '112213082', 'Quality cleared seed', NULL, 'Moisture content,Purity,Germination', NULL, 90, '100', '92', '0', '0', '11', 20, 0, 9, NULL, '707345102', 1, NULL, '2447260', 23, 89, 0, 0, 'No name', 0),
(92, '2022-09-26 19:05:00', '2022-09-26 19:43:17', 172, 1, 132, '2022-09-26', 'files/16641938051447867727845051544737.jpg', 'Kindly find the attached for your action', '2022-09-26', '10000', '2', '15', '1072321', NULL, NULL, 'Purity,Germination,Seed health', NULL, 100, '99', '99', '0', '0', '11', 168, 1, 5, NULL, 'ss1072321', 1, NULL, '3662800', 23, 98, 0, 0, 'No name', 0),
(93, '2022-09-26 19:05:03', '2022-09-26 19:43:44', 170, 1, 4, '2022-09-30', 'files/16641938060154012373047030251995.jpg', 'Sample ready for collection', '2022-09-26', '10', 'Green', '15', '60687007', NULL, NULL, 'Purity,Germination', NULL, 8, '99', '99', '0', '0', '11', 28, 1, 5, NULL, '20920597', 1, NULL, '7540407', 23, 98, 0, 0, 'No name', 0),
(94, '2022-09-26 19:05:23', '2022-09-27 16:18:53', 180, 1, 2, '2022-09-30', 'files/16641938507194566231795520591156.jpg', 'High quality seeds', '2022-09-26', '2', 'Paper bag', '15', '921965864', 'Quality cleared seed', NULL, 'Purity,Germination', NULL, 60, '98', '91', '3', '6', '11', 168, 0, 9, NULL, '487036066', 1, NULL, '5163662', 23, 98, 0, 0, 'No name', 0),
(95, '2022-09-26 19:05:44', '2022-09-27 18:37:41', 174, 1, 5, '2022-09-26', 'files/16641938608333149814470784354722.jpg', 'Ready for collection', '2022-09-26', '2', '2', '15', '1072321', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 948, '93', '98', '1', '1', '11', 168, 1, 5, NULL, '957199460', 1, NULL, '7140822', 23, 91, 0, 0, 'No name', 0),
(96, '2022-09-26 19:06:03', '2022-09-26 19:45:32', 177, 1, 126, '2022-09-26', 'files/IMG_20220926_120924_6.jpg', 'Kindly approve mi seeds', '2022-09-26', '10', 'Bags', '15', '911729737', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 24, '99', '99', '1', '0', '11', 176, 1, 5, NULL, '855558180', 1, NULL, '1733088', 23, 98, 0, 0, 'No name', 0),
(97, '2022-09-26 19:06:24', '2022-09-26 19:46:14', 171, 1, 2, '2022-09-29', 'files/IMG-20220804-WA0002.jpg', 'Viability  of the seeds', '2022-09-26', '20', 'Bags', '15', '911729737', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 40, '99', '99', '1', '0', '11', 176, 1, 5, NULL, '964319652', 1, NULL, '8370861', 23, 98, 0, 0, 'No name', 0),
(98, '2022-09-26 19:06:51', '2022-09-26 19:46:55', 48, 1, 7, '2022-09-26', 'files/16641939485978234022169131896048.jpg', 'Good', '2022-09-26', '2', 'Polyethene', '15', '657235816', NULL, NULL, 'Germination', NULL, 100, '98', '99', '1', '0', '11', 167, 1, 5, NULL, '290952797', 1, NULL, '7945542', 23, 97, 0, 0, 'No name', 0),
(99, '2022-09-26 19:07:08', '2022-09-26 19:47:11', 173, 1, 263, '2022-09-26', 'files/16641939492281272070827059925242.jpg', 'Payment Receipt', '2022-09-26', '10', '5', '15', '1072321', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 40, '99', '99', '1', '0', '11', 168, 1, 5, NULL, '279191883', 1, NULL, '6197447', 23, 98, 0, 0, 'No name', 0),
(100, '2022-09-26 19:09:00', '2022-09-26 19:46:40', 175, 1, 4, '2022-09-30', 'files/16641939693431694355646284196567.jpg', 'Will be  grateful for your positive response', '2022-09-26', '5', 'Bags', '15', '911729737', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 30, '99', '90', '5', '5', '11', 176, 1, 5, NULL, '427879148', 1, NULL, '8077210', 23, 89, 0, 0, 'No name', 0),
(101, '2022-09-26 19:12:27', '2022-09-26 19:46:12', 44, 1, 113, '2022-09-26', 'files/6777170aabd997f73a947273ba6c0696.jpg', 'ready for examination', '2022-09-26', '2', '2', '15', '1072321', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 9, '2', '93', '3', '6', '11', 168, 1, 5, NULL, '64220704', 1, NULL, '8307669', 23, 2, 0, 0, 'No name', 0),
(102, '2022-09-26 19:12:31', '2022-09-26 19:45:41', 45, 1, 69, '2022-09-26', 'files/16641943769656487371995772569157.jpg', 'Good for sale', '2022-09-26', '1', 'Sisal bag', '15', '636004703', NULL, NULL, 'Germination', NULL, 1, '99', '95', '3', '2', '11', 167, 1, 5, NULL, '576454815', 1, NULL, '4648418', 23, 94, 0, 0, 'No name', 0),
(103, '2022-09-26 19:12:31', '2022-09-26 19:45:15', 182, 1, 4, '2022-09-26', 'files/16641942440222369369952917738969.jpg', 'Ready', '2022-09-26', '10', 'Green', '15', '60687007', NULL, NULL, 'Purity,Germination', NULL, 1000, '99', '92', '5', '3', '11', 28, 1, 5, NULL, '382261391', 1, NULL, '9189321', 23, 91, 0, 0, 'No name', 0),
(104, '2022-09-26 19:14:29', '2022-09-26 19:44:03', 179, 1, 8, '2022-09-26', 'files/16641943837986615210641387769699.jpg', 'Payment receipt', '2022-09-26', '2', '2', '15', '1072321', NULL, NULL, 'Purity,Germination,Seed health', NULL, 19, '99', '90', '7', '3', '11', 168, 1, 5, NULL, '732152776', 1, NULL, '8851354', 23, 89, 0, 0, 'No name', 0),
(105, '2022-09-26 19:14:38', '2022-09-26 19:43:37', 178, 1, 6, '2022-09-30', 'files/c3b98c45d48527cecbcbb8f95bbd9c94.jpg', 'For lab testing', '2022-09-26', '0', 'Paper bag', '15', '657235816', NULL, NULL, 'Germination', NULL, 5, '99', '90', '3', '7', '11', 167, 1, 5, NULL, '621208651', 1, NULL, '8542963', 23, 89, 0, 0, 'No name', 0),
(106, '2022-09-27 15:40:23', '2022-09-27 16:10:37', 171, 1, 98, '2022-09-30', '1664268023-557824.jpg', 'Seeds ready for examination', '2022-09-27', '2', 'Sisal bag', '15', '790234111', NULL, NULL, 'Purity', NULL, 80, '99', '99', '0', '1', '11', 168, 0, 2, NULL, '687335929', 1, NULL, '4728440', 35, 86, 1, 0, 'No name', 0),
(107, '2022-09-27 15:40:35', '2022-09-27 16:02:05', 182, 1, 102, '2022-09-27', '1664268035-115245.jpg', 'Ready', '2022-09-27', '1', 'Polyethene', '15', '567892111', NULL, NULL, 'Purity', NULL, 100, '100', '99', '0', '0', '11', 34, 1, 5, NULL, '786308281', 1, NULL, '8027407', 35, 99, 0, 0, 'No name', 0),
(108, '2022-09-27 15:40:41', '2022-09-27 16:02:31', 44, 1, 112, '2022-09-30', '1664268041-628459.jpg', 'Ready at that time', '2022-09-27', '1', 'Paper bag', '15', '234566780', NULL, NULL, 'Purity', NULL, 10000, '99.8', '92', '5', '0', '11', 167, 1, 5, NULL, '357146052', 1, NULL, '6732018', 23, 91, 0, 0, 'No name', 0),
(109, '2022-09-27 15:40:42', '2022-09-27 16:03:02', 178, 1, 95, '2022-09-30', '1664268042-160997.jpg', 'Seed delivered for lab testing', '2022-09-27', '2000', '2', '15', '1074321', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 125, '100', '89', '0', '0', '11', 168, 1, 5, NULL, '131723278', 1, NULL, '1802897', 23, 89, 0, 0, 'No name', 0),
(110, '2022-09-27 15:40:45', '2022-09-27 17:26:58', 170, 1, 108, '2022-09-30', '1664268045-636459.jpg', 'Stock ready for examination', '2022-09-27', '5000', '5', '15', '1074321', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 68, '99.5', '88', '8', '0', '11', 168, 1, 5, NULL, '529810667', 1, NULL, '2044479', 23, 87, 0, 0, 'No name', 0),
(111, '2022-09-27 15:41:00', '2022-09-27 16:04:14', 177, 1, 101, '2022-09-30', '1664268060-567091.jpg', 'Please examine my seeds', '2022-09-27', '1', 'Sisal bag', '15', '345678111', NULL, NULL, 'Purity', NULL, 80, '100', '99', '0', '0', '11', 167, 1, 5, NULL, '985217376', 1, NULL, '5690625', 23, 99, 0, 0, 'No name', 0),
(112, '2022-09-27 15:41:18', '2022-09-27 16:06:06', 175, 1, 99, '2022-09-30', '1664268078-112540.jpg', 'My appreciation in advance', '2022-09-27', '1', 'Paper bag', '15', '678900007', NULL, NULL, 'Germination', NULL, 80, '100', '99', '0', '0', '11', 167, 1, 5, NULL, '723394986', 1, NULL, '5372494', 35, 99, 0, 0, 'No name', 0),
(113, '2022-09-27 15:41:19', '2022-09-27 17:15:40', 48, 1, 117, '2022-09-27', '1664268079-100740.jpg', 'Good seed', '2022-09-27', '3000', '6', '15', '1074321', 'Processed seed', NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 12, '100', '99', '0', '0', '11', 168, 0, 2, NULL, '532757217', 1, NULL, '3283260', 35, NULL, 1, 0, 'No name', 0),
(114, '2022-09-27 15:41:52', '2022-09-27 16:11:39', 174, 1, 91, '2022-09-27', '1664268112-255757.jpg', 'Good seed for examination', '2022-09-27', '1', 'Sisal bag', '15', '456789000', NULL, NULL, 'Germination', NULL, 40, '100', '99', '0', '0', '11', 168, 0, 2, NULL, '988283772', 1, NULL, '2861165', 35, NULL, 1, 0, 'No name', 0),
(115, '2022-09-27 15:42:03', '2022-09-27 16:07:18', 45, 1, 92, '2022-09-27', '1664268123-540005.jpg', 'Well labeled', '2022-09-27', '3500', '3', '15', '1074321', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 60, '100', '99', '0', '0', '11', 168, 1, 5, NULL, '351135084', 1, NULL, '1692811', 35, 99, 0, 0, 'No name', 0),
(116, '2022-09-27 15:42:13', '2022-09-27 16:07:44', 180, 1, 0, '2022-09-27', 'files/16642680604486223520757555043539.jpg', 'Quality seeds', '2022-09-27', '2', 'Sisal bag', '15', '345890000', NULL, NULL, 'Purity', NULL, 60, '100', '99', '0', '0', '11', 167, 1, 5, NULL, '520210136', 1, NULL, '4599709', 35, 99, 1, 0, 'No name', 0),
(117, '2022-09-27 15:43:37', '2022-09-27 16:05:36', 172, 1, 97, '2022-09-27', '1664268217-230874.jpg', 'Kindly find the above request', '2022-09-27', '5500', '5', '15', '1074321', NULL, NULL, 'Moisture content,Purity,Germination,Seed health', NULL, 30, '100', '99', '0', '0', '11', 168, 1, 5, NULL, '725020150', 1, NULL, '8196227', 35, 99, 0, 0, 'No name', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `seed_labs`
--
ALTER TABLE `seed_labs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `seed_labs`
--
ALTER TABLE `seed_labs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
