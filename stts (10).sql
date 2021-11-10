-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 10, 2021 at 02:33 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stts`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2021-11-05 11:05:07'),
(2, 0, 26, 'Admin', 'fa-tasks', '', NULL, NULL, '2021-11-10 06:41:42'),
(3, 2, 27, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2021-11-10 06:41:42'),
(4, 2, 28, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2021-11-10 06:41:42'),
(5, 2, 29, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-11-10 06:41:42'),
(6, 2, 30, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2021-11-10 06:41:42'),
(7, 2, 31, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2021-11-10 06:41:42'),
(8, 0, 20, 'Media manager', 'fa-file', 'media', NULL, '2021-10-20 12:28:29', '2021-11-10 06:41:42'),
(10, 0, 19, 'My Profile', 'fa-user-md', 'auth/setting', NULL, '2021-10-20 13:29:13', '2021-11-10 06:41:42'),
(12, 0, 2, 'Application Forms', 'fa-wpforms', NULL, NULL, '2021-10-20 17:41:29', '2021-11-05 11:05:07'),
(13, 12, 3, 'SR4 - Seed Merchant', 'fa-wpforms', 'form-sr4s', NULL, '2021-10-20 17:42:02', '2021-11-05 11:05:07'),
(15, 12, 4, 'SR6 - Seed grower', 'fa-wpforms', 'form-sr6s', NULL, '2021-10-22 03:47:14', '2021-11-05 11:05:07'),
(16, 12, 5, 'QDS - Producer', 'fa-wpforms', 'form-qds', NULL, '2021-10-25 05:25:04', '2021-11-05 11:05:07'),
(18, 0, 17, 'System Configuration', 'fa-cogs', 'configuration', NULL, '2021-10-27 04:22:36', '2021-11-10 06:41:42'),
(19, 18, 18, 'Crops', 'fa-yelp', 'crops', NULL, '2021-10-27 04:24:09', '2021-11-10 06:41:42'),
(20, 0, 21, 'Helpers', 'fa-gears', '', NULL, '2021-10-27 05:50:02', '2021-11-10 06:41:42'),
(21, 20, 22, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2021-10-27 05:50:02', '2021-11-10 06:41:42'),
(22, 20, 23, 'Database terminal', 'fa-database', 'helpers/terminal/database', NULL, '2021-10-27 05:50:02', '2021-11-10 06:41:42'),
(23, 20, 24, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2021-10-27 05:50:02', '2021-11-10 06:41:42'),
(24, 20, 25, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2021-10-27 05:50:02', '2021-11-10 06:41:42'),
(25, 0, 6, 'Quality Assurance', 'fa-check', 'import-export-permits', NULL, '2021-10-27 08:48:57', '2021-11-05 11:05:07'),
(26, 25, 7, 'Import permit', 'fa-wpforms', 'import-export-permits', NULL, '2021-10-27 08:50:08', '2021-11-05 11:05:07'),
(27, 25, 9, 'Planting returns', 'fa-archive', 'planting-returns', NULL, '2021-10-27 08:51:32', '2021-11-05 11:05:07'),
(28, 25, 12, 'Seed lab', 'fa-adjust', 'seed-labs', NULL, '2021-10-27 08:52:30', '2021-11-10 06:43:27'),
(29, 25, 13, 'Seed labels', 'fa-adjust', 'seed-labs', NULL, '2021-10-27 08:53:14', '2021-11-10 06:42:51'),
(30, 25, 8, 'Export permit', 'fa-wpforms', 'import-export-permits-2', NULL, '2020-12-31 21:06:05', '2021-11-05 11:05:07'),
(31, 25, 10, 'SR10 - Plant inspection', 'fa-wpforms', 'form-sr10s', NULL, '2021-11-01 12:14:10', '2021-11-05 11:05:07'),
(32, 25, 11, 'QDS - Crop declarations', 'fa-wpforms', 'form-crop-declarations', NULL, '2021-11-04 09:24:52', '2021-11-05 11:05:07'),
(33, 0, 14, 'Seed stock', 'fa-archive', '#', NULL, '2021-11-05 10:45:53', '2021-11-05 11:05:07'),
(34, 33, 15, 'Stock examination', 'fa-wpforms', 'form-stock-examination-requests', NULL, '2021-11-05 10:47:45', '2021-11-05 11:05:07'),
(35, 33, 16, 'My stock', 'fa-archive', 'stock-records', NULL, '2021-11-05 10:49:04', '2021-11-09 07:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 04:57:21', '2021-10-27 04:57:21'),
(2, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 04:57:28', '2021-10-27 04:57:28'),
(3, 1, 'admin/crops/3', 'PUT', '::1', '{\"name\":\"Bush Beans\",\"number_of_inspection\":\"3\",\"number_of_days_before_submision\":\"15\",\"crop_varieties\":{\"new_1\":{\"name\":\"NABE1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"NABE2\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"name\":\"NABE15\",\"id\":null,\"_remove_\":\"0\"},\"new_4\":{\"name\":\"NABE16\",\"id\":null,\"_remove_\":\"0\"},\"new_5\":{\"name\":\"NABE17\",\"id\":null,\"_remove_\":\"0\"},\"new_6\":{\"name\":\"NABE18\",\"id\":null,\"_remove_\":\"0\"},\"new_7\":{\"name\":\"NABE19\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"CS7ASWVoFFPvqAIvztEF5cmLFPTsGEjZ8uznnjYt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/crops\"}', '2021-10-27 05:00:02', '2021-10-27 05:00:02'),
(4, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:00:02', '2021-10-27 05:00:02'),
(5, 1, 'admin/crops/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:00:15', '2021-10-27 05:00:15'),
(6, 1, 'admin/crops', 'POST', '::1', '{\"name\":\"Climbing Beans\",\"number_of_inspection\":\"3\",\"number_of_days_before_submision\":\"15\",\"crop_varieties\":{\"new_1\":{\"name\":\"NABE7C\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"NABE8C\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"CS7ASWVoFFPvqAIvztEF5cmLFPTsGEjZ8uznnjYt\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/crops\"}', '2021-10-27 05:01:26', '2021-10-27 05:01:26'),
(7, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:01:26', '2021-10-27 05:01:26'),
(8, 1, 'admin/crops/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:01:28', '2021-10-27 05:01:28'),
(9, 1, 'admin/crops', 'POST', '::1', '{\"name\":\"Ground Nuts\",\"number_of_inspection\":\"2\",\"number_of_days_before_submision\":\"30\",\"crop_varieties\":{\"new_1\":{\"name\":\"BUKENE (OBSE LET)\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"IGORA\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"CS7ASWVoFFPvqAIvztEF5cmLFPTsGEjZ8uznnjYt\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/crops\"}', '2021-10-27 05:02:56', '2021-10-27 05:02:56'),
(10, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:02:56', '2021-10-27 05:02:56'),
(11, 1, 'admin/crops/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:02:59', '2021-10-27 05:02:59'),
(12, 1, 'admin/crops', 'POST', '::1', '{\"name\":\"Maize (OPV)\",\"number_of_inspection\":\"6\",\"number_of_days_before_submision\":\"45\",\"crop_varieties\":{\"new_1\":{\"name\":\"Bazooka\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Dk8051\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"CS7ASWVoFFPvqAIvztEF5cmLFPTsGEjZ8uznnjYt\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/crops\"}', '2021-10-27 05:04:44', '2021-10-27 05:04:44'),
(13, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:04:44', '2021-10-27 05:04:44'),
(14, 1, 'admin/crops/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:04:58', '2021-10-27 05:04:58'),
(15, 1, 'admin/crops', 'POST', '::1', '{\"name\":\"Sim sim\",\"number_of_inspection\":\"3\",\"number_of_days_before_submision\":\"20\",\"crop_varieties\":{\"new_1\":{\"name\":\"SESAME 1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"SESAME 2\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"name\":\"SESAME 3\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"CS7ASWVoFFPvqAIvztEF5cmLFPTsGEjZ8uznnjYt\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/crops\"}', '2021-10-27 05:05:47', '2021-10-27 05:05:47'),
(16, 1, 'admin/crops/create', 'GET', '::1', '[]', '2021-10-27 05:05:47', '2021-10-27 05:05:47'),
(17, 1, 'admin/crops', 'POST', '::1', '{\"name\":\"Soybeans\",\"number_of_inspection\":\"2\",\"number_of_days_before_submision\":\"30\",\"crop_varieties\":{\"new_1\":{\"name\":\"Buakalasa 4\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Congo 72\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"CS7ASWVoFFPvqAIvztEF5cmLFPTsGEjZ8uznnjYt\",\"after-save\":\"2\"}', '2021-10-27 05:06:44', '2021-10-27 05:06:44'),
(18, 1, 'admin/crops/create', 'GET', '::1', '[]', '2021-10-27 05:06:44', '2021-10-27 05:06:44'),
(19, 1, 'admin/crops', 'POST', '::1', '{\"name\":\"Maize (Hybrid\",\"number_of_inspection\":\"5\",\"number_of_days_before_submision\":\"30\",\"crop_varieties\":{\"new_1\":{\"name\":\"FH5160\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"F86150\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"CS7ASWVoFFPvqAIvztEF5cmLFPTsGEjZ8uznnjYt\",\"after-save\":\"2\"}', '2021-10-27 05:07:42', '2021-10-27 05:07:42'),
(20, 1, 'admin/crops/create', 'GET', '::1', '[]', '2021-10-27 05:07:43', '2021-10-27 05:07:43'),
(21, 1, 'admin/crops', 'POST', '::1', '{\"name\":\"Sorghum\",\"number_of_inspection\":\"3\",\"number_of_days_before_submision\":\"20\",\"crop_varieties\":{\"new_1\":{\"name\":\"Sekedo\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Seso 3\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"CS7ASWVoFFPvqAIvztEF5cmLFPTsGEjZ8uznnjYt\",\"after-save\":\"2\"}', '2021-10-27 05:08:39', '2021-10-27 05:08:39'),
(22, 1, 'admin/crops/create', 'GET', '::1', '[]', '2021-10-27 05:08:39', '2021-10-27 05:08:39'),
(23, 1, 'admin/crops', 'POST', '::1', '{\"name\":\"Rice\",\"number_of_inspection\":\"3\",\"number_of_days_before_submision\":\"20\",\"crop_varieties\":{\"new_1\":{\"name\":\"Namche 1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Namche 2\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"name\":\"Namche 3\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"CS7ASWVoFFPvqAIvztEF5cmLFPTsGEjZ8uznnjYt\"}', '2021-10-27 05:09:21', '2021-10-27 05:09:21'),
(24, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:09:22', '2021-10-27 05:09:22'),
(25, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:10:14', '2021-10-27 05:10:14'),
(26, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:12:41', '2021-10-27 05:12:41'),
(27, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:13:12', '2021-10-27 05:13:12'),
(28, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:13:30', '2021-10-27 05:13:30'),
(29, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:13:55', '2021-10-27 05:13:55'),
(30, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:14:16', '2021-10-27 05:14:16'),
(31, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:14:23', '2021-10-27 05:14:23'),
(32, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:14:44', '2021-10-27 05:14:44'),
(33, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:14:56', '2021-10-27 05:14:56'),
(34, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 05:15:17', '2021-10-27 05:15:17'),
(35, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:16:02', '2021-10-27 05:16:02'),
(36, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:16:07', '2021-10-27 05:16:07'),
(37, 1, 'admin/crops/3', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:16:54', '2021-10-27 05:16:54'),
(38, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:16:56', '2021-10-27 05:16:56'),
(39, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:16:59', '2021-10-27 05:16:59'),
(40, 1, 'admin/crops/3/edit', 'GET', '::1', '[]', '2021-10-27 05:17:12', '2021-10-27 05:17:12'),
(41, 1, 'admin/crops/3/edit', 'GET', '::1', '[]', '2021-10-27 05:17:40', '2021-10-27 05:17:40'),
(42, 1, 'admin/crops/3/edit', 'GET', '::1', '[]', '2021-10-27 05:18:01', '2021-10-27 05:18:01'),
(43, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:18:09', '2021-10-27 05:18:09'),
(44, 1, 'admin/crops/3', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:18:22', '2021-10-27 05:18:22'),
(45, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:18:45', '2021-10-27 05:18:45'),
(46, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:19:47', '2021-10-27 05:19:47'),
(47, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:20:32', '2021-10-27 05:20:32'),
(48, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:20:40', '2021-10-27 05:20:40'),
(49, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:21:13', '2021-10-27 05:21:13'),
(50, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:21:34', '2021-10-27 05:21:34'),
(51, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:21:52', '2021-10-27 05:21:52'),
(52, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:23:33', '2021-10-27 05:23:33'),
(53, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:23:45', '2021-10-27 05:23:45'),
(54, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:25:43', '2021-10-27 05:25:43'),
(55, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:27:35', '2021-10-27 05:27:35'),
(56, 1, 'admin/crops/3', 'GET', '::1', '[]', '2021-10-27 05:28:27', '2021-10-27 05:28:27'),
(57, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:28:42', '2021-10-27 05:28:42'),
(58, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:28:48', '2021-10-27 05:28:48'),
(59, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:29:12', '2021-10-27 05:29:12'),
(60, 1, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:29:20', '2021-10-27 05:29:20'),
(61, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:29:32', '2021-10-27 05:29:32'),
(62, 1, 'admin', 'GET', '::1', '[]', '2021-10-27 05:29:47', '2021-10-27 05:29:47'),
(63, 1, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:30:31', '2021-10-27 05:30:31'),
(64, 1, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:30:36', '2021-10-27 05:30:36'),
(65, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:30:39', '2021-10-27 05:30:39'),
(66, 3, 'admin', 'GET', '::1', '[]', '2021-10-27 05:30:47', '2021-10-27 05:30:47'),
(67, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:30:51', '2021-10-27 05:30:51'),
(68, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:30:53', '2021-10-27 05:30:53'),
(69, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:30:53', '2021-10-27 05:30:53'),
(70, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:41:10', '2021-10-27 05:41:10'),
(71, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:41:12', '2021-10-27 05:41:12'),
(72, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:41:13', '2021-10-27 05:41:13'),
(73, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:41:17', '2021-10-27 05:41:17'),
(74, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:41:19', '2021-10-27 05:41:19'),
(75, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:41:20', '2021-10-27 05:41:20'),
(76, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:41:23', '2021-10-27 05:41:23'),
(77, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:41:23', '2021-10-27 05:41:23'),
(78, 3, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-10-27 05:50:56', '2021-10-27 05:50:56'),
(79, 3, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:51:05', '2021-10-27 05:51:05'),
(80, 3, 'admin', 'GET', '::1', '[]', '2021-10-27 05:51:07', '2021-10-27 05:51:07'),
(81, 3, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:51:10', '2021-10-27 05:51:10'),
(82, 3, 'admin/helpers/terminal/database', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:53:43', '2021-10-27 05:53:43'),
(83, 3, 'admin/helpers/terminal/database', 'POST', '::1', '{\"c\":\"db:mysql\",\"q\":\"select * from users\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 05:53:50', '2021-10-27 05:53:50'),
(84, 3, 'admin/helpers/terminal/database', 'POST', '::1', '{\"c\":\"db:mysql\",\"q\":\"select * from admin_users\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 05:54:01', '2021-10-27 05:54:01'),
(85, 3, 'admin/helpers/terminal/artisan', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:54:20', '2021-10-27 05:54:20'),
(86, 3, 'admin/helpers/terminal/database', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:55:10', '2021-10-27 05:55:10'),
(87, 3, 'admin/helpers/terminal/artisan', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:55:12', '2021-10-27 05:55:12'),
(88, 3, 'admin/helpers/terminal/database', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:55:27', '2021-10-27 05:55:27'),
(89, 3, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:55:31', '2021-10-27 05:55:31'),
(90, 3, 'admin/helpers/terminal/artisan', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:56:27', '2021-10-27 05:56:27'),
(91, 3, 'admin/helpers/terminal/artisan', 'POST', '::1', '{\"c\":\"php artisan storage:link\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 05:56:31', '2021-10-27 05:56:31'),
(92, 3, 'admin/helpers/terminal/artisan', 'POST', '::1', '{\"c\":\"storage:link\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 05:56:51', '2021-10-27 05:56:51'),
(93, 3, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 05:57:02', '2021-10-27 05:57:02'),
(94, 3, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"form_sr6_has_crops\",\"model_name\":\"App\\\\Models\\\\FormSr6HasCrop\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\FormSr6HasCropControllers\",\"create\":[\"migration\",\"model\",\"migrate\"],\"fields\":[{\"name\":\"form_sr6_id\",\"type\":\"bigInteger\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"crop_id\",\"type\":\"bigInteger\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 06:02:08', '2021-10-27 06:02:08'),
(95, 3, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-10-27 06:02:08', '2021-10-27 06:02:08'),
(96, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:12:04', '2021-10-27 06:12:04'),
(97, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:12:06', '2021-10-27 06:12:06'),
(98, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:12:06', '2021-10-27 06:12:06'),
(99, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:13:58', '2021-10-27 06:13:58'),
(100, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:13:59', '2021-10-27 06:13:59'),
(101, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:16:31', '2021-10-27 06:16:31'),
(102, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:16:32', '2021-10-27 06:16:32'),
(103, 3, 'admin/form-sr6s', 'POST', '::1', '{\"form_sr6_has_crops\":{\"new_1\":{\"crop_id\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":\"3\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Board Bazar, Gazipur, Dhakah\",\"premises_location\":\"11\",\"years_of_expirience\":\"11\",\"group-a\":[{\"crop\":\"11\",\"variety\":\"23\",\"ha\":\"AS\",\"origin\":\"ASAS\"}],\"as\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"asas\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr6s\\/create?_pjax=%23pjax-container\"}', '2021-10-27 06:17:08', '2021-10-27 06:17:08'),
(104, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:17:08', '2021-10-27 06:17:08'),
(105, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 06:20:05', '2021-10-27 06:20:05'),
(106, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 06:20:06', '2021-10-27 06:20:06'),
(107, 3, 'admin/form-sr6s', 'POST', '::1', '{\"form_sr6_has_crops\":{\"new_1\":{\"crop_id\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":\"3\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kisaasi.\",\"premises_location\":\"11\",\"group-a\":[{\"crop\":\"11\",\"variety\":\"23\",\"ha\":\"AS\",\"origin\":\"ASAS\"}],\"as\":\"1\",\"previous_grower_number\":\"12\",\"cropping_histroy\":\"33 years_of_expirience\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"1\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 06:20:39', '2021-10-27 06:20:39'),
(108, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 06:20:40', '2021-10-27 06:20:40'),
(109, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:22:12', '2021-10-27 06:22:12'),
(110, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 06:22:14', '2021-10-27 06:22:14'),
(111, 3, 'admin/form-sr6s', 'POST', '::1', '{\"form_sr6_has_crops\":{\"new_1\":{\"crop_id\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":\"3\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Magdalene Lane Opposite Ndere Cultural Centre, Ntinda -\",\"premises_location\":\"11\",\"years_of_expirience\":\"55\",\"as\":\"0\",\"cropping_histroy\":\"years_of_expirience\",\"have_adequate_storage\":\"0\",\"have_adequate_isolation\":\"0\",\"have_adequate_labor\":\"0\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 06:22:56', '2021-10-27 06:22:56'),
(112, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 06:22:57', '2021-10-27 06:22:57'),
(113, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 06:45:39', '2021-10-27 06:45:39'),
(114, 3, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:51:34', '2021-10-27 06:51:34'),
(115, 3, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"form_sr6s\",\"model_name\":\"App\\\\Models\\\\FormSr6Controller\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\FormSr6Controller\",\"create\":[\"controller\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null}],\"primary_key\":\"id\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 06:53:14', '2021-10-27 06:53:14'),
(116, 3, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-10-27 06:53:14', '2021-10-27 06:53:14'),
(117, 3, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"form_sr6s\",\"model_name\":\"App\\\\Models\\\\FormSr6Controller\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\FormSr6Controller\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"primary_key\":\"id\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 06:53:27', '2021-10-27 06:53:27'),
(118, 3, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-10-27 06:53:28', '2021-10-27 06:53:28'),
(119, 3, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"form_sr6s\",\"model_name\":\"App\\\\Models\\\\FormSr6Controller\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\FormSr6Controller\",\"create\":[\"controller\"],\"primary_key\":\"id\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 06:53:41', '2021-10-27 06:53:41'),
(120, 3, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-10-27 06:53:42', '2021-10-27 06:53:42'),
(121, 3, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-10-27 06:55:05', '2021-10-27 06:55:05'),
(122, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:55:16', '2021-10-27 06:55:16'),
(123, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:55:19', '2021-10-27 06:55:19'),
(124, 3, 'admin/form-sr6s', 'POST', '::1', '{\"administrator_id\":\"1\",\"name_of_applicant\":\"Muhindo MubarakaA\",\"address\":\"Kibuli, Kampala, Uganda\",\"company_initials\":\"IUT\",\"premises_location\":\"ASAS\",\"years_of_expirience\":\"AS\",\"dealers_in\":\"ASAS\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"ASAS\",\"have_adequate_isolation\":\"off\",\"have_adequate_labor\":\"on\",\"aware_of_minimum_standards\":\"off\",\"signature_of_applicant\":null,\"grower_number\":null,\"registration_number\":null,\"valid_from\":\"2021-10-27 09:55:19\",\"valid_until\":\"2021-10-27 09:55:19\",\"status\":null,\"inspector\":null,\"status_comment\":null,\"have_adequate_storage\":\"off\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr6s\"}', '2021-10-27 06:55:39', '2021-10-27 06:55:39'),
(125, 3, 'admin/form-sr6s', 'GET', '::1', '[]', '2021-10-27 06:55:39', '2021-10-27 06:55:39'),
(126, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 06:55:59', '2021-10-27 06:55:59'),
(127, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 06:57:17', '2021-10-27 06:57:17'),
(128, 3, 'admin/form-sr6s', 'POST', '::1', '{\"form_sr6_has_crops\":{\"new_1\":{\"crop_id\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_id\":\"12\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":null,\"name_of_applicant\":null,\"address\":null,\"company_initials\":null,\"premises_location\":null,\"years_of_expirience\":null,\"dealers_in\":null,\"previous_grower_number\":null,\"cropping_histroy\":null,\"have_adequate_isolation\":\"off\",\"have_adequate_labor\":\"off\",\"aware_of_minimum_standards\":\"off\",\"signature_of_applicant\":null,\"grower_number\":null,\"registration_number\":null,\"valid_from\":\"2021-10-27 09:57:17\",\"valid_until\":\"2021-10-27 09:57:17\",\"status\":null,\"inspector\":null,\"status_comment\":null,\"have_adequate_storage\":\"off\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 06:57:37', '2021-10-27 06:57:37'),
(129, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 06:57:38', '2021-10-27 06:57:38'),
(130, 3, 'admin/form-sr6s', 'POST', '::1', '{\"form_sr6_has_crops\":{\"new___LA_KEY__\":{\"crop_id\":\"12\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":\"1\",\"name_of_applicant\":null,\"address\":null,\"company_initials\":null,\"premises_location\":null,\"years_of_expirience\":null,\"dealers_in\":null,\"previous_grower_number\":null,\"cropping_histroy\":null,\"have_adequate_isolation\":\"off\",\"have_adequate_labor\":\"off\",\"aware_of_minimum_standards\":\"off\",\"signature_of_applicant\":null,\"grower_number\":null,\"registration_number\":null,\"valid_from\":\"2021-10-27 09:57:17\",\"valid_until\":\"2021-10-27 09:57:17\",\"status\":null,\"inspector\":null,\"status_comment\":null,\"have_adequate_storage\":\"off\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 06:58:02', '2021-10-27 06:58:02'),
(131, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 06:58:02', '2021-10-27 06:58:02'),
(132, 3, 'admin/form-sr6s', 'POST', '::1', '{\"form_sr6_has_crops\":{\"new___LA_KEY__\":{\"crop_id\":\"12\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":\"1\",\"name_of_applicant\":null,\"address\":null,\"company_initials\":null,\"premises_location\":null,\"years_of_expirience\":null,\"dealers_in\":null,\"previous_grower_number\":null,\"cropping_histroy\":null,\"have_adequate_isolation\":\"off\",\"have_adequate_labor\":\"off\",\"aware_of_minimum_standards\":\"off\",\"signature_of_applicant\":null,\"grower_number\":null,\"registration_number\":null,\"valid_from\":\"2021-10-27 09:57:17\",\"valid_until\":\"2021-10-27 09:57:17\",\"status\":null,\"inspector\":null,\"status_comment\":null,\"have_adequate_storage\":\"off\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\"}', '2021-10-27 07:00:08', '2021-10-27 07:00:08'),
(133, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 07:00:08', '2021-10-27 07:00:08'),
(134, 3, 'admin/form-sr6s', 'POST', '::1', '{\"form_sr6_has_crops\":{\"new___LA_KEY__\":{\"crop_id\":\"12\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":\"1\",\"name_of_applicant\":null,\"address\":null,\"company_initials\":null,\"premises_location\":null,\"years_of_expirience\":null,\"dealers_in\":null,\"previous_grower_number\":null,\"cropping_histroy\":null,\"have_adequate_isolation\":\"off\",\"have_adequate_labor\":\"off\",\"aware_of_minimum_standards\":\"off\",\"signature_of_applicant\":null,\"grower_number\":null,\"registration_number\":null,\"valid_from\":\"2021-10-27 09:57:17\",\"valid_until\":\"2021-10-27 09:57:17\",\"status\":null,\"inspector\":null,\"status_comment\":null,\"have_adequate_storage\":\"off\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\"}', '2021-10-27 07:01:10', '2021-10-27 07:01:10'),
(135, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 07:01:11', '2021-10-27 07:01:11'),
(136, 3, 'admin/form-sr6s', 'POST', '::1', '{\"form_sr6_has_crops\":{\"new___LA_KEY__\":{\"crop_id\":\"12\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":\"1\",\"name_of_applicant\":null,\"address\":null,\"company_initials\":null,\"premises_location\":null,\"years_of_expirience\":null,\"dealers_in\":null,\"previous_grower_number\":null,\"cropping_histroy\":null,\"have_adequate_isolation\":\"off\",\"have_adequate_labor\":\"off\",\"aware_of_minimum_standards\":\"off\",\"signature_of_applicant\":null,\"grower_number\":null,\"registration_number\":null,\"valid_from\":\"2021-10-27 09:57:17\",\"valid_until\":\"2021-10-27 09:57:17\",\"status\":null,\"inspector\":null,\"status_comment\":null,\"have_adequate_storage\":\"off\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 07:02:52', '2021-10-27 07:02:52'),
(137, 3, 'admin/form-sr6s', 'GET', '::1', '[]', '2021-10-27 07:02:52', '2021-10-27 07:02:52'),
(138, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:02:56', '2021-10-27 07:02:56'),
(139, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:02:57', '2021-10-27 07:02:57'),
(140, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:03:03', '2021-10-27 07:03:03'),
(141, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"form_sr6_has_crops\":{\"1\":{\"crop_id\":\"12\",\"id\":\"1\",\"_remove_\":\"0\"},\"new_1\":{\"crop_id\":\"ggg\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":\"1\",\"name_of_applicant\":null,\"address\":null,\"company_initials\":null,\"premises_location\":null,\"years_of_expirience\":null,\"dealers_in\":null,\"previous_grower_number\":null,\"cropping_histroy\":null,\"have_adequate_isolation\":\"off\",\"have_adequate_labor\":\"off\",\"aware_of_minimum_standards\":\"off\",\"signature_of_applicant\":null,\"grower_number\":null,\"registration_number\":null,\"valid_from\":\"2021-10-27 09:57:17\",\"valid_until\":\"2021-10-27 09:57:17\",\"status\":null,\"inspector\":null,\"status_comment\":null,\"have_adequate_storage\":\"off\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr6s\"}', '2021-10-27 07:03:22', '2021-10-27 07:03:22'),
(142, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:03:22', '2021-10-27 07:03:22'),
(143, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"form_sr6_has_crops\":{\"1\":{\"crop_id\":\"12\",\"id\":\"1\",\"_remove_\":\"0\"},\"new___LA_KEY__\":{\"crop_id\":\"33\",\"id\":null,\"_remove_\":\"0\"}},\"administrator_id\":\"1\",\"name_of_applicant\":null,\"address\":null,\"company_initials\":null,\"premises_location\":null,\"years_of_expirience\":null,\"dealers_in\":null,\"previous_grower_number\":null,\"cropping_histroy\":null,\"have_adequate_isolation\":\"off\",\"have_adequate_labor\":\"off\",\"aware_of_minimum_standards\":\"off\",\"signature_of_applicant\":null,\"grower_number\":null,\"registration_number\":null,\"valid_from\":\"2021-10-27 09:57:17\",\"valid_until\":\"2021-10-27 09:57:17\",\"status\":null,\"inspector\":null,\"status_comment\":null,\"have_adequate_storage\":\"off\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"_method\":\"PUT\"}', '2021-10-27 07:03:32', '2021-10-27 07:03:32'),
(144, 3, 'admin/form-sr6s', 'GET', '::1', '[]', '2021-10-27 07:03:32', '2021-10-27 07:03:32'),
(145, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:03:37', '2021-10-27 07:03:37'),
(146, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:18:25', '2021-10-27 07:18:25'),
(147, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:18:29', '2021-10-27 07:18:29'),
(148, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:19:53', '2021-10-27 07:19:53'),
(149, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:19:54', '2021-10-27 07:19:54'),
(150, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:20:18', '2021-10-27 07:20:18'),
(151, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:21:16', '2021-10-27 07:21:16'),
(152, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:23:18', '2021-10-27 07:23:18'),
(153, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:30:58', '2021-10-27 07:30:58'),
(154, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:30:59', '2021-10-27 07:30:59'),
(155, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:31:31', '2021-10-27 07:31:31'),
(156, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:31:32', '2021-10-27 07:31:32'),
(157, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:32:19', '2021-10-27 07:32:19'),
(158, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:32:20', '2021-10-27 07:32:20'),
(159, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:33:43', '2021-10-27 07:33:43'),
(160, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:33:44', '2021-10-27 07:33:44'),
(161, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:35:18', '2021-10-27 07:35:18'),
(162, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:35:20', '2021-10-27 07:35:20'),
(163, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:35:56', '2021-10-27 07:35:56'),
(164, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:35:57', '2021-10-27 07:35:57'),
(165, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:36:50', '2021-10-27 07:36:50'),
(166, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:36:51', '2021-10-27 07:36:51'),
(167, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:38:41', '2021-10-27 07:38:41'),
(168, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:38:42', '2021-10-27 07:38:42'),
(169, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:40:45', '2021-10-27 07:40:45'),
(170, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 07:40:46', '2021-10-27 07:40:46'),
(171, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:42:04', '2021-10-27 07:42:04'),
(172, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:42:05', '2021-10-27 07:42:05'),
(173, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:44:03', '2021-10-27 07:44:03'),
(174, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:44:05', '2021-10-27 07:44:05'),
(175, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:44:20', '2021-10-27 07:44:20'),
(176, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:44:20', '2021-10-27 07:44:20'),
(177, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:44:52', '2021-10-27 07:44:52'),
(178, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:44:53', '2021-10-27 07:44:53'),
(179, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:45:44', '2021-10-27 07:45:44'),
(180, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:48:30', '2021-10-27 07:48:30'),
(181, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:49:17', '2021-10-27 07:49:17'),
(182, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:49:19', '2021-10-27 07:49:19'),
(183, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:52:22', '2021-10-27 07:52:22'),
(184, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:52:22', '2021-10-27 07:52:22'),
(185, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:53:15', '2021-10-27 07:53:15'),
(186, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:53:16', '2021-10-27 07:53:16'),
(187, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:58:07', '2021-10-27 07:58:07'),
(188, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 07:58:08', '2021-10-27 07:58:08'),
(189, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:04:13', '2021-10-27 08:04:13'),
(190, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:04:14', '2021-10-27 08:04:14'),
(191, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:05:51', '2021-10-27 08:05:51'),
(192, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:05:52', '2021-10-27 08:05:52'),
(193, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:07:43', '2021-10-27 08:07:43'),
(194, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:07:44', '2021-10-27 08:07:44'),
(195, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:09:28', '2021-10-27 08:09:28'),
(196, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:09:29', '2021-10-27 08:09:29'),
(197, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:12:53', '2021-10-27 08:12:53'),
(198, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:12:54', '2021-10-27 08:12:54'),
(199, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"administrator_id\":\"1\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"33\",\"form_sr6_has_crops\":{\"1\":{\"form_sr6_id\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"form_sr6_id\":\"7\",\"id\":\"2\",\"_remove_\":\"0\"},\"new_1\":{\"form_sr6_id\":\"3\",\"id\":null,\"_remove_\":\"0\"}},\"as\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"->required();\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr6s\\/11\\/edit?_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container\"}', '2021-10-27 08:14:25', '2021-10-27 08:14:25'),
(200, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:14:25', '2021-10-27 08:14:25'),
(201, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"administrator_id\":\"1\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"33\",\"form_sr6_has_crops\":{\"1\":{\"form_sr6_id\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"form_sr6_id\":\"7\",\"id\":\"2\",\"_remove_\":\"0\"},\"new___LA_KEY__\":{\"form_sr6_id\":\"3\",\"id\":null,\"_remove_\":\"0\"}},\"as\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"->required();\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr6s\\/11\\/edit?_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container\"}', '2021-10-27 08:15:54', '2021-10-27 08:15:54'),
(202, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:15:54', '2021-10-27 08:15:54'),
(203, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"administrator_id\":\"1\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"33\",\"form_sr6_has_crops\":{\"1\":{\"form_sr6_id\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"form_sr6_id\":\"7\",\"id\":\"2\",\"_remove_\":\"0\"},\"new___LA_KEY__\":{\"form_sr6_id\":\"3\",\"id\":null,\"_remove_\":\"0\"}},\"as\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"->required();\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-27 08:19:31', '2021-10-27 08:19:31'),
(204, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:19:31', '2021-10-27 08:19:31'),
(205, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"administrator_id\":\"1\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"33\",\"form_sr6_has_crops\":{\"1\":{\"form_sr6_id\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"form_sr6_id\":\"7\",\"id\":\"2\",\"_remove_\":\"0\"},\"new___LA_KEY__\":{\"form_sr6_id\":\"3\",\"id\":null,\"_remove_\":\"0\"}},\"as\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"->required();\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-27 08:19:38', '2021-10-27 08:19:38'),
(206, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:19:39', '2021-10-27 08:19:39'),
(207, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"administrator_id\":\"1\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"33\",\"form_sr6_has_crops\":{\"1\":{\"form_sr6_id\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"form_sr6_id\":\"7\",\"id\":\"2\",\"_remove_\":\"0\"},\"new___LA_KEY__\":{\"form_sr6_id\":\"3\",\"id\":null,\"_remove_\":\"0\"}},\"as\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"->required();\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-27 08:19:57', '2021-10-27 08:19:57'),
(208, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:19:57', '2021-10-27 08:19:57'),
(209, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"administrator_id\":\"1\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"33\",\"form_sr6_has_crops\":{\"1\":{\"form_sr6_id\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"form_sr6_id\":\"7\",\"id\":\"2\",\"_remove_\":\"0\"},\"new___LA_KEY__\":{\"form_sr6_id\":\"3\",\"id\":null,\"_remove_\":\"0\"}},\"as\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"->required();\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-27 08:20:00', '2021-10-27 08:20:00'),
(210, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:20:00', '2021-10-27 08:20:00'),
(211, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:21:54', '2021-10-27 08:21:54'),
(212, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:21:55', '2021-10-27 08:21:55'),
(213, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"administrator_id\":\"1\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"33\",\"form_sr6_has_crops\":{\"1\":{\"form_sr6_id\":\"11\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"form_sr6_id\":\"7\",\"id\":\"2\",\"_remove_\":\"0\"},\"new___LA_KEY__\":{\"form_sr6_id\":\"3\",\"id\":null,\"_remove_\":\"0\"}},\"as\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"->required();\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-27 08:22:42', '2021-10-27 08:22:42'),
(214, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:22:42', '2021-10-27 08:22:42'),
(215, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:24:02', '2021-10-27 08:24:02'),
(216, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:24:04', '2021-10-27 08:24:04'),
(217, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:24:28', '2021-10-27 08:24:28'),
(218, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:24:29', '2021-10-27 08:24:29'),
(219, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:25:53', '2021-10-27 08:25:53'),
(220, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:25:54', '2021-10-27 08:25:54'),
(221, 3, 'admin/form-sr6s/11', 'PUT', '::1', '{\"administrator_id\":\"1\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"11\",\"form_sr6_has_crops\":{\"1\":{\"crop_id\":\"4\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"crop_id\":\"6\",\"id\":\"2\",\"_remove_\":\"0\"},\"new_1\":{\"crop_id\":\"5\",\"id\":null,\"_remove_\":\"0\"}},\"seed_grower_in_past\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"id\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"0\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-27 08:26:25', '2021-10-27 08:26:25'),
(222, 3, 'admin/form-sr6s/11/edit', 'GET', '::1', '[]', '2021-10-27 08:26:25', '2021-10-27 08:26:25'),
(223, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:26:37', '2021-10-27 08:26:37'),
(224, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:26:40', '2021-10-27 08:26:40'),
(225, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:26:45', '2021-10-27 08:26:45'),
(226, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:26:46', '2021-10-27 08:26:46'),
(227, 3, 'admin/form-sr6s', 'POST', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"21\",\"form_sr6_has_crops\":{\"new_1\":{\"crop_id\":\"3\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_id\":\"6\",\"id\":null,\"_remove_\":\"0\"}},\"seed_grower_in_past\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"asas\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"0\",\"_token\":\"le8HTPse6uO02TvcNqPlNc8L76bAtm89txEnp2lg\"}', '2021-10-27 08:27:20', '2021-10-27 08:27:20'),
(228, 3, 'admin/form-sr6s', 'GET', '::1', '[]', '2021-10-27 08:27:21', '2021-10-27 08:27:21'),
(229, 3, 'admin/form-sr6s/create', 'GET', '::1', '[]', '2021-10-27 08:27:43', '2021-10-27 08:27:43'),
(230, 3, 'admin/form-sr6s', 'GET', '::1', '[]', '2021-10-27 08:27:44', '2021-10-27 08:27:44'),
(231, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:28:07', '2021-10-27 08:28:07'),
(232, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:28:13', '2021-10-27 08:28:13'),
(233, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:28:21', '2021-10-27 08:28:21'),
(234, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:29:34', '2021-10-27 08:29:34'),
(235, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:29:40', '2021-10-27 08:29:40'),
(236, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:29:45', '2021-10-27 08:29:45'),
(237, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:29:51', '2021-10-27 08:29:51'),
(238, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:29:52', '2021-10-27 08:29:52'),
(239, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:30:14', '2021-10-27 08:30:14'),
(240, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:30:14', '2021-10-27 08:30:14'),
(241, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:32:36', '2021-10-27 08:32:36'),
(242, 1, 'admin', 'GET', '::1', '[]', '2021-10-27 08:32:46', '2021-10-27 08:32:46'),
(243, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:33:06', '2021-10-27 08:33:06'),
(244, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:33:13', '2021-10-27 08:33:13'),
(245, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:33:23', '2021-10-27 08:33:23'),
(246, 1, 'admin/crops/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:33:46', '2021-10-27 08:33:46'),
(247, 1, 'admin/crops/9', 'PUT', '::1', '{\"name\":\"Maize (Hybrid)\",\"number_of_inspection\":\"5\",\"number_of_days_before_submision\":\"30\",\"crop_varieties\":{\"21\":{\"name\":\"FH5160\",\"id\":\"21\",\"_remove_\":\"0\"},\"22\":{\"name\":\"F86150\",\"id\":\"22\",\"_remove_\":\"0\"}},\"_token\":\"JdvCOjGOJpaFQKEhV2yetDA1q1AuN991012cEzxQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/crops\"}', '2021-10-27 08:33:52', '2021-10-27 08:33:52'),
(248, 1, 'admin/crops', 'GET', '::1', '[]', '2021-10-27 08:33:53', '2021-10-27 08:33:53'),
(249, 1, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:34:02', '2021-10-27 08:34:02'),
(250, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"12\",\"_model\":\"App_Models_FormSr6\",\"_token\":\"JdvCOjGOJpaFQKEhV2yetDA1q1AuN991012cEzxQ\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-10-27 08:34:08', '2021-10-27 08:34:08'),
(251, 1, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:34:08', '2021-10-27 08:34:08'),
(252, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"7\",\"_model\":\"App_Models_FormSr6\",\"_token\":\"JdvCOjGOJpaFQKEhV2yetDA1q1AuN991012cEzxQ\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-10-27 08:34:13', '2021-10-27 08:34:13'),
(253, 1, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:34:14', '2021-10-27 08:34:14'),
(254, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"11\",\"_model\":\"App_Models_FormSr6\",\"_token\":\"JdvCOjGOJpaFQKEhV2yetDA1q1AuN991012cEzxQ\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-10-27 08:34:18', '2021-10-27 08:34:18'),
(255, 1, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:34:19', '2021-10-27 08:34:19'),
(256, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:34:23', '2021-10-27 08:34:23'),
(257, 3, 'admin', 'GET', '::1', '[]', '2021-10-27 08:34:30', '2021-10-27 08:34:30'),
(258, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:34:35', '2021-10-27 08:34:35'),
(259, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:34:37', '2021-10-27 08:34:37');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(260, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:36:09', '2021-10-27 08:36:09'),
(261, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:36:16', '2021-10-27 08:36:16'),
(262, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:36:18', '2021-10-27 08:36:18'),
(263, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:36:44', '2021-10-27 08:36:44'),
(264, 1, 'admin', 'GET', '::1', '[]', '2021-10-27 08:36:54', '2021-10-27 08:36:54'),
(265, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:37:04', '2021-10-27 08:37:04'),
(266, 1, 'admin/auth/menu/16/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:37:09', '2021-10-27 08:37:09'),
(267, 1, 'admin/auth/menu/16', 'PUT', '::1', '{\"parent_id\":\"12\",\"title\":\"QDS - Producer\",\"icon\":\"fa-wpforms\",\"uri\":\"form-qds\",\"roles\":[null],\"permission\":null,\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2021-10-27 08:38:01', '2021-10-27 08:38:01'),
(268, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:38:02', '2021-10-27 08:38:02'),
(269, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:38:07', '2021-10-27 08:38:07'),
(270, 1, 'admin', 'GET', '::1', '[]', '2021-10-27 08:38:09', '2021-10-27 08:38:09'),
(271, 1, 'admin', 'GET', '::1', '[]', '2021-10-27 08:38:12', '2021-10-27 08:38:12'),
(272, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:47:24', '2021-10-27 08:47:24'),
(273, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Quality Assurance\",\"icon\":\"fa-check\",\"uri\":\"import-export-permits\",\"roles\":[null],\"permission\":null,\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\"}', '2021-10-27 08:48:57', '2021-10-27 08:48:57'),
(274, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:48:57', '2021-10-27 08:48:57'),
(275, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\",\"_order\":\"[{\\\"id\\\":25},{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19},{\\\"id\\\":17}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-10-27 08:49:00', '2021-10-27 08:49:00'),
(276, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:49:00', '2021-10-27 08:49:00'),
(277, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:49:15', '2021-10-27 08:49:15'),
(278, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19},{\\\"id\\\":17}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-10-27 08:49:25', '2021-10-27 08:49:25'),
(279, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:49:25', '2021-10-27 08:49:25'),
(280, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:49:28', '2021-10-27 08:49:28'),
(281, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"25\",\"title\":\"Import\\/export permit\",\"icon\":\"fa-wpforms\",\"uri\":\"import-export-permits\",\"roles\":[null],\"permission\":null,\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\"}', '2021-10-27 08:50:08', '2021-10-27 08:50:08'),
(282, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:50:08', '2021-10-27 08:50:08'),
(283, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19},{\\\"id\\\":17}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-10-27 08:50:10', '2021-10-27 08:50:10'),
(284, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:50:10', '2021-10-27 08:50:10'),
(285, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:50:12', '2021-10-27 08:50:12'),
(286, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:50:23', '2021-10-27 08:50:23'),
(287, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:50:36', '2021-10-27 08:50:36'),
(288, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:50:38', '2021-10-27 08:50:38'),
(289, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:50:40', '2021-10-27 08:50:40'),
(290, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:50:42', '2021-10-27 08:50:42'),
(291, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"25\",\"title\":\"Planting returns\",\"icon\":\"fa-adjust\",\"uri\":\"#\",\"roles\":[null],\"permission\":null,\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\"}', '2021-10-27 08:51:32', '2021-10-27 08:51:32'),
(292, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:51:32', '2021-10-27 08:51:32'),
(293, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"25\",\"title\":\"Seed lab\",\"icon\":\"fa-adjust\",\"uri\":\"#\",\"roles\":[null],\"permission\":null,\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\"}', '2021-10-27 08:52:30', '2021-10-27 08:52:30'),
(294, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:52:30', '2021-10-27 08:52:30'),
(295, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"25\",\"title\":\"Seed labels\",\"icon\":\"fa-adjust\",\"uri\":\"#\",\"roles\":[null],\"permission\":null,\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\"}', '2021-10-27 08:53:14', '2021-10-27 08:53:14'),
(296, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:53:15', '2021-10-27 08:53:15'),
(297, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:53:34', '2021-10-27 08:53:34'),
(298, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:53:44', '2021-10-27 08:53:44'),
(299, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19},{\\\"id\\\":17}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-10-27 08:53:56', '2021-10-27 08:53:56'),
(300, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:53:56', '2021-10-27 08:53:56'),
(301, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-27 08:54:03', '2021-10-27 08:54:03'),
(302, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 08:54:08', '2021-10-27 08:54:08'),
(303, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:00:59', '2021-10-27 09:00:59'),
(304, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:02:11', '2021-10-27 09:02:11'),
(305, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:02:17', '2021-10-27 09:02:17'),
(306, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:02:46', '2021-10-27 09:02:46'),
(307, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:02:53', '2021-10-27 09:02:53'),
(308, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:03:05', '2021-10-27 09:03:05'),
(309, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:05:04', '2021-10-27 09:05:04'),
(310, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:05:57', '2021-10-27 09:05:57'),
(311, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:06:45', '2021-10-27 09:06:45'),
(312, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:07:30', '2021-10-27 09:07:30'),
(313, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:11:26', '2021-10-27 09:11:26'),
(314, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:15:29', '2021-10-27 09:15:29'),
(315, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:20:14', '2021-10-27 09:20:14'),
(316, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:20:45', '2021-10-27 09:20:45'),
(317, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:29:18', '2021-10-27 09:29:18'),
(318, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:30:19', '2021-10-27 09:30:19'),
(319, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:30:39', '2021-10-27 09:30:39'),
(320, 1, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"2323\",\"name_address_of_origin\":\"asasas\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_id\":\"4\",\"varieties\":\"Simple\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_id\":\"5\",\"varieties\":\"najskkja\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\"}', '2021-10-27 09:31:55', '2021-10-27 09:31:55'),
(321, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:31:55', '2021-10-27 09:31:55'),
(322, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:35:44', '2021-10-27 09:35:44'),
(323, 1, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"33\",\"name_address_of_origin\":\"hkjkn\",\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\",\"after-save\":\"1\"}', '2021-10-27 09:35:57', '2021-10-27 09:35:57'),
(324, 1, 'admin/import-export-permits/2/edit', 'GET', '::1', '[]', '2021-10-27 09:35:57', '2021-10-27 09:35:57'),
(325, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:35:57', '2021-10-27 09:35:57'),
(326, 1, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"22\",\"name_address_of_origin\":\"hkjkn\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_id\":\"5\",\"varieties\":\"Simple\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_id\":\"5\",\"varieties\":\"najskkja\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"crop_id\":\"6\",\"varieties\":\"erer\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\",\"after-save\":\"1\"}', '2021-10-27 09:39:03', '2021-10-27 09:39:03'),
(327, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:39:03', '2021-10-27 09:39:03'),
(328, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-27 09:49:03', '2021-10-27 09:49:03'),
(329, 1, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"11\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_id\":\"4\",\"varieties\":\"Simple\",\"category\":\"qwqw\",\"weight\":\"qwqw\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_id\":\"5\",\"varieties\":\"najskkjaqw\",\"category\":\"qwqw\",\"weight\":\"qwqwqwqw\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\"}', '2021-10-27 09:49:48', '2021-10-27 09:49:48'),
(330, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-27 09:49:49', '2021-10-27 09:49:49'),
(331, 1, 'admin/import-export-permits/2,4', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\"}', '2021-10-27 09:51:12', '2021-10-27 09:51:12'),
(332, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 09:51:12', '2021-10-27 09:51:12'),
(333, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-27 10:18:35', '2021-10-27 10:18:35'),
(334, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:20:13', '2021-10-27 10:20:13'),
(335, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:20:16', '2021-10-27 10:20:16'),
(336, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-27 10:20:50', '2021-10-27 10:20:50'),
(337, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:20:53', '2021-10-27 10:20:53'),
(338, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-27 10:23:13', '2021-10-27 10:23:13'),
(339, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:26:10', '2021-10-27 10:26:10'),
(340, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:26:36', '2021-10-27 10:26:36'),
(341, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:26:39', '2021-10-27 10:26:39'),
(342, 1, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"12\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_id\":\"4\",\"varieties\":\"Simple\",\"category\":\"qwqw\",\"weight\":\"qwqw\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"Kt1HZSVWEz4PjKwqVxkuZ7340B2aIX8gO58DoGv3\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-27 10:27:19', '2021-10-27 10:27:19'),
(343, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-27 10:27:19', '2021-10-27 10:27:19'),
(344, 1, 'admin/import-export-permits/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:27:25', '2021-10-27 10:27:25'),
(345, 1, 'admin/import-export-permits/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:29:48', '2021-10-27 10:29:48'),
(346, 1, 'admin/import-export-permits/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:33:11', '2021-10-27 10:33:11'),
(347, 1, 'admin/import-export-permits/5', 'GET', '::1', '[]', '2021-10-27 10:34:02', '2021-10-27 10:34:02'),
(348, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 10:38:41', '2021-10-27 10:38:41'),
(349, 1, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 12:07:44', '2021-10-27 12:07:44'),
(350, 1, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-27 12:07:48', '2021-10-27 12:07:48'),
(351, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 02:12:07', '2021-10-28 02:12:07'),
(352, 1, 'admin/import-export-permits/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:12:59', '2021-10-28 02:12:59'),
(353, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 02:19:49', '2021-10-28 02:19:49'),
(354, 1, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 02:20:58', '2021-10-28 02:20:58'),
(355, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:21:26', '2021-10-28 02:21:26'),
(356, 3, 'admin', 'GET', '::1', '[]', '2021-10-28 02:21:37', '2021-10-28 02:21:37'),
(357, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:21:46', '2021-10-28 02:21:46'),
(358, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 02:21:51', '2021-10-28 02:21:51'),
(359, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:21:55', '2021-10-28 02:21:55'),
(360, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:22:18', '2021-10-28 02:22:18'),
(361, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:22:21', '2021-10-28 02:22:21'),
(362, 1, 'admin', 'GET', '::1', '[]', '2021-10-28 02:22:31', '2021-10-28 02:22:31'),
(363, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:22:34', '2021-10-28 02:22:34'),
(364, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:24:46', '2021-10-28 02:24:46'),
(365, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 02:24:48', '2021-10-28 02:24:48'),
(366, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 02:24:52', '2021-10-28 02:24:52'),
(367, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 02:24:55', '2021-10-28 02:24:55'),
(368, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:35:43', '2021-10-28 02:35:43'),
(369, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 02:37:08', '2021-10-28 02:37:08'),
(370, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 02:55:14', '2021-10-28 02:55:14'),
(371, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:55:18', '2021-10-28 02:55:18'),
(372, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:55:19', '2021-10-28 02:55:19'),
(373, 1, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:55:22', '2021-10-28 02:55:22'),
(374, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:55:28', '2021-10-28 02:55:28'),
(375, 3, 'admin', 'GET', '::1', '[]', '2021-10-28 02:55:36', '2021-10-28 02:55:36'),
(376, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:55:45', '2021-10-28 02:55:45'),
(377, 3, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:55:54', '2021-10-28 02:55:54'),
(378, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:55:56', '2021-10-28 02:55:56'),
(379, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:55:58', '2021-10-28 02:55:58'),
(380, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:59:45', '2021-10-28 02:59:45'),
(381, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 02:59:46', '2021-10-28 02:59:46'),
(382, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:03:36', '2021-10-28 03:03:36'),
(383, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 03:07:17', '2021-10-28 03:07:17'),
(384, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:07:26', '2021-10-28 03:07:26'),
(385, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 03:07:57', '2021-10-28 03:07:57'),
(386, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:12:41', '2021-10-28 03:12:41'),
(387, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:12:42', '2021-10-28 03:12:42'),
(388, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 03:15:59', '2021-10-28 03:15:59'),
(389, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:17:33', '2021-10-28 03:17:33'),
(390, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:18:31', '2021-10-28 03:18:31'),
(391, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:19:05', '2021-10-28 03:19:05'),
(392, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:19:59', '2021-10-28 03:19:59'),
(393, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:25:08', '2021-10-28 03:25:08'),
(394, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:25:09', '2021-10-28 03:25:09'),
(395, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:25:18', '2021-10-28 03:25:18'),
(396, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:26:07', '2021-10-28 03:26:07'),
(397, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:26:23', '2021-10-28 03:26:23'),
(398, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:27:38', '2021-10-28 03:27:38'),
(399, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:27:41', '2021-10-28 03:27:41'),
(400, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:27:45', '2021-10-28 03:27:45'),
(401, 3, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"100900911\",\"store_location\":\"1200,0000\",\"quantiry_of_seed\":\"12000\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_variety_id\":\"4\",\"category\":\"Test\",\"weight\":\"12000\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"4\",\"category\":\"Category test\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"JPjWcLUy4pKx5R2sjrRrW08YqWuPj7JA5e52PX9j\"}', '2021-10-28 03:31:36', '2021-10-28 03:31:36'),
(402, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 03:31:37', '2021-10-28 03:31:37'),
(403, 3, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"100900911\",\"store_location\":\"1200,0000\",\"quantiry_of_seed\":\"12000\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"4\",\"category\":\"Category test\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"JPjWcLUy4pKx5R2sjrRrW08YqWuPj7JA5e52PX9j\",\"after-save\":\"1\"}', '2021-10-28 03:32:33', '2021-10-28 03:32:33'),
(404, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 03:32:34', '2021-10-28 03:32:34'),
(405, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 03:33:04', '2021-10-28 03:33:04'),
(406, 3, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"1222\",\"name_address_of_origin\":\"121212\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_variety_id\":\"5\",\"category\":\"1122\",\"weight\":\"12000\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"5\",\"category\":\"3112\",\"weight\":\"122\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"JPjWcLUy4pKx5R2sjrRrW08YqWuPj7JA5e52PX9j\"}', '2021-10-28 03:33:36', '2021-10-28 03:33:36'),
(407, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 03:33:36', '2021-10-28 03:33:36'),
(408, 3, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"1222\",\"name_address_of_origin\":\"121212\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"5\",\"category\":\"3112\",\"weight\":\"122\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"JPjWcLUy4pKx5R2sjrRrW08YqWuPj7JA5e52PX9j\"}', '2021-10-28 03:34:22', '2021-10-28 03:34:22'),
(409, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 03:34:23', '2021-10-28 03:34:23'),
(410, 3, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"1222\",\"name_address_of_origin\":\"121212\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"5\",\"category\":\"3112\",\"weight\":\"122\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"JPjWcLUy4pKx5R2sjrRrW08YqWuPj7JA5e52PX9j\"}', '2021-10-28 03:35:12', '2021-10-28 03:35:12'),
(411, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 03:35:12', '2021-10-28 03:35:12'),
(412, 3, 'admin/import-export-permits', 'POST', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"1222\",\"name_address_of_origin\":\"121212\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"5\",\"category\":\"3112\",\"weight\":\"122\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"JPjWcLUy4pKx5R2sjrRrW08YqWuPj7JA5e52PX9j\"}', '2021-10-28 03:36:17', '2021-10-28 03:36:17'),
(413, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 03:36:17', '2021-10-28 03:36:17'),
(414, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:36:21', '2021-10-28 03:36:21'),
(415, 3, 'admin/import-export-permits/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"assa\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"1222\",\"name_address_of_origin\":\"121212\",\"import_export_permits_has_crops\":{\"4\":{\"crop_variety_id\":\"3\",\"category\":\"3112\",\"weight\":\"122\",\"id\":\"4\",\"_remove_\":\"0\"},\"new_1\":{\"crop_variety_id\":\"6\",\"category\":\"1122\",\"weight\":\"1222\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"JPjWcLUy4pKx5R2sjrRrW08YqWuPj7JA5e52PX9j\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-28 03:36:48', '2021-10-28 03:36:48'),
(416, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 03:36:48', '2021-10-28 03:36:48'),
(417, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:37:59', '2021-10-28 03:37:59'),
(418, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:40:33', '2021-10-28 03:40:33'),
(419, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 03:40:40', '2021-10-28 03:40:40'),
(420, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:41:01', '2021-10-28 03:41:01'),
(421, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:41:10', '2021-10-28 03:41:10'),
(422, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:41:12', '2021-10-28 03:41:12'),
(423, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:41:20', '2021-10-28 03:41:20'),
(424, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 03:44:01', '2021-10-28 03:44:01'),
(425, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:44:06', '2021-10-28 03:44:06'),
(426, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:49:51', '2021-10-28 03:49:51'),
(427, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 03:51:33', '2021-10-28 03:51:33'),
(428, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:52:48', '2021-10-28 03:52:48'),
(429, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:53:58', '2021-10-28 03:53:58'),
(430, 3, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:54:05', '2021-10-28 03:54:05'),
(431, 3, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:54:51', '2021-10-28 03:54:51'),
(432, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:54:55', '2021-10-28 03:54:55'),
(433, 3, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:54:59', '2021-10-28 03:54:59'),
(434, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:55:01', '2021-10-28 03:55:01'),
(435, 3, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 03:55:03', '2021-10-28 03:55:03'),
(436, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 03:58:55', '2021-10-28 03:58:55'),
(437, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:00:17', '2021-10-28 04:00:17'),
(438, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:03:03', '2021-10-28 04:03:03'),
(439, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:03:28', '2021-10-28 04:03:28'),
(440, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:03:42', '2021-10-28 04:03:42'),
(441, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:08:23', '2021-10-28 04:08:23'),
(442, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:08:50', '2021-10-28 04:08:50'),
(443, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:08:56', '2021-10-28 04:08:56'),
(444, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:09:02', '2021-10-28 04:09:02'),
(445, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:09:28', '2021-10-28 04:09:28'),
(446, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:09:55', '2021-10-28 04:09:55'),
(447, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:10:19', '2021-10-28 04:10:19'),
(448, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:10:35', '2021-10-28 04:10:35'),
(449, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:11:04', '2021-10-28 04:11:04'),
(450, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:11:21', '2021-10-28 04:11:21'),
(451, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:11:29', '2021-10-28 04:11:29'),
(452, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:11:32', '2021-10-28 04:11:32'),
(453, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:11:53', '2021-10-28 04:11:53'),
(454, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:11:55', '2021-10-28 04:11:55'),
(455, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:12:01', '2021-10-28 04:12:01'),
(456, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:12:19', '2021-10-28 04:12:19'),
(457, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:12:21', '2021-10-28 04:12:21'),
(458, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:13:38', '2021-10-28 04:13:38'),
(459, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:13:53', '2021-10-28 04:13:53'),
(460, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:14:11', '2021-10-28 04:14:11'),
(461, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:14:31', '2021-10-28 04:14:31'),
(462, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:14:43', '2021-10-28 04:14:43'),
(463, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:15:06', '2021-10-28 04:15:06'),
(464, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:15:58', '2021-10-28 04:15:58'),
(465, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:17:35', '2021-10-28 04:17:35'),
(466, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:18:19', '2021-10-28 04:18:19'),
(467, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:18:27', '2021-10-28 04:18:27'),
(468, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:21:05', '2021-10-28 04:21:05'),
(469, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:21:27', '2021-10-28 04:21:27'),
(470, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:21:43', '2021-10-28 04:21:43'),
(471, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:21:59', '2021-10-28 04:21:59'),
(472, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:22:33', '2021-10-28 04:22:33'),
(473, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:23:07', '2021-10-28 04:23:07'),
(474, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:24:27', '2021-10-28 04:24:27'),
(475, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:24:30', '2021-10-28 04:24:30'),
(476, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:24:50', '2021-10-28 04:24:50'),
(477, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:25:15', '2021-10-28 04:25:15'),
(478, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:26:28', '2021-10-28 04:26:28'),
(479, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:26:37', '2021-10-28 04:26:37'),
(480, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:26:45', '2021-10-28 04:26:45'),
(481, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2021-10-28 04:27:06', '2021-10-28 04:27:06'),
(482, 3, 'admin/import-export-permits/6', 'GET', '::1', '[]', '2020-12-31 21:02:26', '2020-12-31 21:02:26'),
(483, 3, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:02:52', '2020-12-31 21:02:52'),
(484, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:03:04', '2020-12-31 21:03:04'),
(485, 3, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:03:08', '2020-12-31 21:03:08'),
(486, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:03:09', '2020-12-31 21:03:09'),
(487, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:03:36', '2020-12-31 21:03:36'),
(488, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:03:37', '2020-12-31 21:03:37'),
(489, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:03:57', '2020-12-31 21:03:57'),
(490, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:04:05', '2020-12-31 21:04:05'),
(491, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:04:29', '2020-12-31 21:04:29'),
(492, 1, 'admin', 'GET', '::1', '[]', '2020-12-31 21:04:37', '2020-12-31 21:04:37'),
(493, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:04:43', '2020-12-31 21:04:43'),
(494, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:04:54', '2020-12-31 21:04:54'),
(495, 1, 'admin/auth/menu/17', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"9Uy7f1RSvlxRQhCR9lKtUXfGBxLdkgEtPhMOi3Yy\"}', '2020-12-31 21:05:03', '2020-12-31 21:05:03'),
(496, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:05:03', '2020-12-31 21:05:03'),
(497, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"9Uy7f1RSvlxRQhCR9lKtUXfGBxLdkgEtPhMOi3Yy\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2020-12-31 21:05:10', '2020-12-31 21:05:10'),
(498, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:05:10', '2020-12-31 21:05:10'),
(499, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"9Uy7f1RSvlxRQhCR9lKtUXfGBxLdkgEtPhMOi3Yy\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2020-12-31 21:05:13', '2020-12-31 21:05:13'),
(500, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:05:14', '2020-12-31 21:05:14'),
(501, 1, 'admin/auth/menu/26/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-31 21:05:19', '2020-12-31 21:05:19'),
(502, 1, 'admin/auth/menu/26', 'PUT', '::1', '{\"parent_id\":\"25\",\"title\":\"Import permit\",\"icon\":\"fa-wpforms\",\"uri\":\"import-export-permits\",\"roles\":[null],\"permission\":null,\"_token\":\"9Uy7f1RSvlxRQhCR9lKtUXfGBxLdkgEtPhMOi3Yy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2020-12-31 21:05:30', '2020-12-31 21:05:30'),
(503, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2020-12-31 21:05:31', '2020-12-31 21:05:31'),
(504, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"25\",\"title\":\"Export permit\",\"icon\":\"fa-wpforms\",\"uri\":\"#\",\"roles\":[null],\"permission\":null,\"_token\":\"9Uy7f1RSvlxRQhCR9lKtUXfGBxLdkgEtPhMOi3Yy\"}', '2020-12-31 21:06:05', '2020-12-31 21:06:05'),
(505, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2020-12-31 21:06:06', '2020-12-31 21:06:06'),
(506, 1, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:42:37', '2021-10-28 04:42:37'),
(507, 1, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:42:40', '2021-10-28 04:42:40'),
(508, 1, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:42:56', '2021-10-28 04:42:56'),
(509, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:42:59', '2021-10-28 04:42:59'),
(510, 2, 'admin', 'GET', '::1', '[]', '2021-10-28 04:43:12', '2021-10-28 04:43:12'),
(511, 2, 'admin', 'GET', '::1', '[]', '2021-10-28 04:43:25', '2021-10-28 04:43:25'),
(512, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:43:31', '2021-10-28 04:43:31'),
(513, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:43:40', '2021-10-28 04:43:40'),
(514, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 04:44:56', '2021-10-28 04:44:56'),
(515, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 04:45:21', '2021-10-28 04:45:21'),
(516, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:45:49', '2021-10-28 04:45:49'),
(517, 2, 'admin/import-export-permits/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":null,\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"J9dAFMHJhGX6RhALLCRoSPw47mDSnMVn273uCZL4\",\"_method\":\"PUT\"}', '2021-10-28 04:46:08', '2021-10-28 04:46:08'),
(518, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 04:46:09', '2021-10-28 04:46:09'),
(519, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 04:46:47', '2021-10-28 04:46:47'),
(520, 2, 'admin/import-export-permits/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":null,\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"J9dAFMHJhGX6RhALLCRoSPw47mDSnMVn273uCZL4\",\"_method\":\"PUT\"}', '2021-10-28 04:46:58', '2021-10-28 04:46:58'),
(521, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 04:46:59', '2021-10-28 04:46:59'),
(522, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 04:48:01', '2021-10-28 04:48:01'),
(523, 2, 'admin/import-export-permits/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"J9dAFMHJhGX6RhALLCRoSPw47mDSnMVn273uCZL4\",\"_method\":\"PUT\"}', '2021-10-28 04:48:07', '2021-10-28 04:48:07'),
(524, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 04:48:08', '2021-10-28 04:48:08'),
(525, 2, 'admin/import-export-permits/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"J9dAFMHJhGX6RhALLCRoSPw47mDSnMVn273uCZL4\",\"_method\":\"PUT\"}', '2021-10-28 04:50:50', '2021-10-28 04:50:50'),
(526, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 04:50:50', '2021-10-28 04:50:50'),
(527, 2, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:50:56', '2021-10-28 04:50:56'),
(528, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:50:59', '2021-10-28 04:50:59'),
(529, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:51:02', '2021-10-28 04:51:02'),
(530, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:51:05', '2021-10-28 04:51:05'),
(531, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 04:55:17', '2021-10-28 04:55:17'),
(532, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 04:56:07', '2021-10-28 04:56:07'),
(533, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 04:58:11', '2021-10-28 04:58:11'),
(534, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:00:08', '2021-10-28 05:00:08'),
(535, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:00:10', '2021-10-28 05:00:10'),
(536, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:00:14', '2021-10-28 05:00:14'),
(537, 20, 'admin', 'GET', '::1', '[]', '2021-10-28 05:00:23', '2021-10-28 05:00:23'),
(538, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:00:36', '2021-10-28 05:00:36'),
(539, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:00:43', '2021-10-28 05:00:43'),
(540, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:02:52', '2021-10-28 05:02:52'),
(541, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 05:07:15', '2021-10-28 05:07:15'),
(542, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:07:49', '2021-10-28 05:07:49'),
(543, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:07:50', '2021-10-28 05:07:50'),
(544, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:09:12', '2021-10-28 05:09:12'),
(545, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:09:44', '2021-10-28 05:09:44'),
(546, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:10:21', '2021-10-28 05:10:21'),
(547, 20, 'admin/import-export-permits/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Thembo Akisam\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":null,\"status\":\"5\",\"permit_number\":\"762196\",\"valid_from\":\"2021-11-01\",\"valid_until\":\"2021-11-30\",\"_token\":\"kC9kdXknarJeaoW9DdoZoNkrUTC9XkEuv4OzBQVP\",\"_method\":\"PUT\"}', '2021-10-28 05:10:38', '2021-10-28 05:10:38'),
(548, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 05:10:39', '2021-10-28 05:10:39'),
(549, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:12:03', '2021-10-28 05:12:03'),
(550, 20, 'admin/import-export-permits/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"5\",\"permit_number\":\"879878\",\"valid_from\":\"2021-11-01\",\"valid_until\":\"2022-01-31\",\"_token\":\"kC9kdXknarJeaoW9DdoZoNkrUTC9XkEuv4OzBQVP\",\"_method\":\"PUT\"}', '2021-10-28 05:12:23', '2021-10-28 05:12:23'),
(551, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 05:12:23', '2021-10-28 05:12:23'),
(552, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:13:26', '2021-10-28 05:13:26'),
(553, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:13:50', '2021-10-28 05:13:50'),
(554, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 05:13:58', '2021-10-28 05:13:58'),
(555, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:14:15', '2021-10-28 05:14:15'),
(556, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 05:14:26', '2021-10-28 05:14:26'),
(557, 20, 'admin/import-export-permits/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"5\",\"permit_number\":\"122212\",\"valid_from\":\"2021-11-01\",\"valid_until\":\"2021-10-31\",\"_token\":\"kC9kdXknarJeaoW9DdoZoNkrUTC9XkEuv4OzBQVP\",\"_method\":\"PUT\"}', '2021-10-28 05:15:09', '2021-10-28 05:15:09'),
(558, 20, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:15:09', '2021-10-28 05:15:09'),
(559, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:16:52', '2021-10-28 05:16:52'),
(560, 20, 'admin/import-export-permits/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:16:56', '2021-10-28 05:16:56'),
(561, 2, 'admin', 'GET', '::1', '[]', '2021-10-28 05:17:30', '2021-10-28 05:17:30'),
(562, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:17:44', '2021-10-28 05:17:44'),
(563, 2, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:18:27', '2021-10-28 05:18:27');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(564, 2, 'admin/import-export-permits/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-28 05:18:42', '2021-10-28 05:18:42'),
(565, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:18:43', '2021-10-28 05:18:43'),
(566, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:18:50', '2021-10-28 05:18:50'),
(567, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:18:55', '2021-10-28 05:18:55'),
(568, 20, 'admin/import-export-permits/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:19:08', '2021-10-28 05:19:08'),
(569, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:20:30', '2021-10-28 05:20:30'),
(570, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:20:32', '2021-10-28 05:20:32'),
(571, 3, 'admin', 'GET', '::1', '[]', '2021-10-28 05:20:40', '2021-10-28 05:20:40'),
(572, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:20:44', '2021-10-28 05:20:44'),
(573, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"6\",\"_model\":\"App_Models_ImportExportPermit\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-10-28 05:20:51', '2021-10-28 05:20:51'),
(574, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:20:51', '2021-10-28 05:20:51'),
(575, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:20:57', '2021-10-28 05:20:57'),
(576, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:20:59', '2021-10-28 05:20:59'),
(577, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:21:53', '2021-10-28 05:21:53'),
(578, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:22:24', '2021-10-28 05:22:24'),
(579, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:22:26', '2021-10-28 05:22:26'),
(580, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:22:30', '2021-10-28 05:22:30'),
(581, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:22:31', '2021-10-28 05:22:31'),
(582, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:22:34', '2021-10-28 05:22:34'),
(583, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:24:03', '2021-10-28 05:24:03'),
(584, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:30:22', '2021-10-28 05:30:22'),
(585, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:31:34', '2021-10-28 05:31:34'),
(586, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:31:44', '2021-10-28 05:31:44'),
(587, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:32:22', '2021-10-28 05:32:22'),
(588, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:33:17', '2021-10-28 05:33:17'),
(589, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:33:41', '2021-10-28 05:33:41'),
(590, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:33:51', '2021-10-28 05:33:51'),
(591, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:35:43', '2021-10-28 05:35:43'),
(592, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:35:52', '2021-10-28 05:35:52'),
(593, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:36:07', '2021-10-28 05:36:07'),
(594, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:37:13', '2021-10-28 05:37:13'),
(595, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:37:14', '2021-10-28 05:37:14'),
(596, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:39:02', '2021-10-28 05:39:02'),
(597, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:42:54', '2021-10-28 05:42:54'),
(598, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:43:14', '2021-10-28 05:43:14'),
(599, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:43:19', '2021-10-28 05:43:19'),
(600, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:43:40', '2021-10-28 05:43:40'),
(601, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:43:42', '2021-10-28 05:43:42'),
(602, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:44:34', '2021-10-28 05:44:34'),
(603, 3, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-28 05:44:54', '2021-10-28 05:44:54'),
(604, 3, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":30},{\\\"id\\\":26},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-10-28 05:45:19', '2021-10-28 05:45:19'),
(605, 3, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:45:19', '2021-10-28 05:45:19'),
(606, 3, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-28 05:45:21', '2021-10-28 05:45:21'),
(607, 3, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-28 05:45:25', '2021-10-28 05:45:25'),
(608, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:45:28', '2021-10-28 05:45:28'),
(609, 3, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:45:31', '2021-10-28 05:45:31'),
(610, 3, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-28 05:45:33', '2021-10-28 05:45:33'),
(611, 3, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-10-28 05:45:43', '2021-10-28 05:45:43'),
(612, 3, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:45:44', '2021-10-28 05:45:44'),
(613, 3, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:45:51', '2021-10-28 05:45:51'),
(614, 3, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-28 05:45:54', '2021-10-28 05:45:54'),
(615, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:45:58', '2021-10-28 05:45:58'),
(616, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:46:00', '2021-10-28 05:46:00'),
(617, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:46:01', '2021-10-28 05:46:01'),
(618, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:46:17', '2021-10-28 05:46:17'),
(619, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:46:29', '2021-10-28 05:46:29'),
(620, 3, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 05:47:54', '2021-10-28 05:47:54'),
(621, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:47:59', '2021-10-28 05:47:59'),
(622, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:48:02', '2021-10-28 05:48:02'),
(623, 2, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:48:13', '2021-10-28 05:48:13'),
(624, 2, 'admin/form-sr4s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:48:15', '2021-10-28 05:48:15'),
(625, 2, 'admin/form-sr4s/4/edit', 'GET', '::1', '[]', '2021-10-28 05:48:52', '2021-10-28 05:48:52'),
(626, 2, 'admin/form-sr4s/4/edit', 'GET', '::1', '[]', '2021-10-28 05:49:07', '2021-10-28 05:49:07'),
(627, 2, 'admin/form-sr4s/4/edit', 'GET', '::1', '[]', '2021-10-28 05:50:21', '2021-10-28 05:50:21'),
(628, 2, 'admin/form-sr4s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:51:24', '2021-10-28 05:51:24'),
(629, 2, 'admin/form-sr4s/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Bwera, Kasese, Uganda\",\"premises_location\":\"Bwera, Kasese, Uganda\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_method\":\"PUT\"}', '2021-10-28 05:51:31', '2021-10-28 05:51:31'),
(630, 2, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 05:51:31', '2021-10-28 05:51:31'),
(631, 20, 'admin', 'GET', '::1', '[]', '2021-10-28 05:52:13', '2021-10-28 05:52:13'),
(632, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:52:21', '2021-10-28 05:52:21'),
(633, 20, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:52:30', '2021-10-28 05:52:30'),
(634, 20, 'admin/form-sr4s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:52:33', '2021-10-28 05:52:33'),
(635, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:53:30', '2021-10-28 05:53:30'),
(636, 2, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 05:53:37', '2021-10-28 05:53:37'),
(637, 2, 'admin/form-sr4s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:53:43', '2021-10-28 05:53:43'),
(638, 20, 'admin/form-sr4s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:53:55', '2021-10-28 05:53:55'),
(639, 20, 'admin/form-sr4s/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Bwera, Kasese, Uganda\",\"company_initials\":\"Ugnews24\",\"premises_location\":\"Bwera, Kasese, Uganda\",\"status\":\"5\",\"valid_from\":\"2021-10-01\",\"valid_until\":\"2022-12-09\",\"_token\":\"KUwn6dKM662CWeH5HbJYVdOtI3hu8d8LijqDMNse\",\"_method\":\"PUT\"}', '2021-10-28 05:54:07', '2021-10-28 05:54:07'),
(640, 20, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 05:54:07', '2021-10-28 05:54:07'),
(641, 20, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:55:36', '2021-10-28 05:55:36'),
(642, 3, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:55:56', '2021-10-28 05:55:56'),
(643, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:55:58', '2021-10-28 05:55:58'),
(644, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:56:00', '2021-10-28 05:56:00'),
(645, 2, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:56:10', '2021-10-28 05:56:10'),
(646, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"4\",\"_model\":\"App_Models_FormSr4\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-10-28 05:56:18', '2021-10-28 05:56:18'),
(647, 2, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:56:19', '2021-10-28 05:56:19'),
(648, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:56:23', '2021-10-28 05:56:23'),
(649, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:56:29', '2021-10-28 05:56:29'),
(650, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:56:32', '2021-10-28 05:56:32'),
(651, 2, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:56:40', '2021-10-28 05:56:40'),
(652, 20, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:56:48', '2021-10-28 05:56:48'),
(653, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 05:57:46', '2021-10-28 05:57:46'),
(654, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:57:47', '2021-10-28 05:57:47'),
(655, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:57:56', '2021-10-28 05:57:56'),
(656, 3, 'admin/form-sr4s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:57:58', '2021-10-28 05:57:58'),
(657, 3, 'admin/form-sr4s', 'POST', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"company_initials\":\"IUT\",\"premises_location\":\"11\",\"expirience_in\":\"1\",\"years_of_expirience\":\"1\",\"dealers_in\":\"Agricultural crops\",\"processing_of\":\"Agricultural crops\",\"marketing_of\":\"Horticultural crops\",\"have_adequate_land\":\"1\",\"land_size\":\"11\",\"have_adequate_storage\":\"0\",\"have_adequate_equipment\":\"0\",\"have_contractual_agreement\":\"0\",\"have_adequate_field_officers\":\"0\",\"have_conversant_seed_matters\":\"0\",\"souce_of_seed\":\"2\",\"have_adequate_land_for_production\":\"0\",\"have_internal_quality_program\":\"0\",\"accept_declaration\":\"1\",\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr4s\"}', '2021-10-28 05:58:26', '2021-10-28 05:58:26'),
(658, 3, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 05:58:26', '2021-10-28 05:58:26'),
(659, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:58:30', '2021-10-28 05:58:30'),
(660, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:58:33', '2021-10-28 05:58:33'),
(661, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:58:36', '2021-10-28 05:58:36'),
(662, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:58:37', '2021-10-28 05:58:37'),
(663, 2, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:58:44', '2021-10-28 05:58:44'),
(664, 20, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:58:52', '2021-10-28 05:58:52'),
(665, 2, 'admin/form-sr4s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:58:56', '2021-10-28 05:58:56'),
(666, 2, 'admin/form-sr4s/5', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr4s\"}', '2021-10-28 05:59:02', '2021-10-28 05:59:02'),
(667, 2, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 05:59:02', '2021-10-28 05:59:02'),
(668, 20, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:59:04', '2021-10-28 05:59:04'),
(669, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:59:11', '2021-10-28 05:59:11'),
(670, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:59:11', '2021-10-28 05:59:11'),
(671, 2, 'admin/form-sr4s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:59:17', '2021-10-28 05:59:17'),
(672, 20, 'admin/form-sr4s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:59:24', '2021-10-28 05:59:24'),
(673, 20, 'admin/form-sr4s/5', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"company_initials\":\"IUT\",\"premises_location\":\"11\",\"status\":\"5\",\"valid_from\":\"2021-10-28\",\"valid_until\":\"2022-12-01\",\"_token\":\"KUwn6dKM662CWeH5HbJYVdOtI3hu8d8LijqDMNse\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr4s\"}', '2021-10-28 05:59:41', '2021-10-28 05:59:41'),
(674, 20, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 05:59:41', '2021-10-28 05:59:41'),
(675, 2, 'admin/form-sr4s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:59:46', '2021-10-28 05:59:46'),
(676, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:59:50', '2021-10-28 05:59:50'),
(677, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 05:59:51', '2021-10-28 05:59:51'),
(678, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 05:59:58', '2021-10-28 05:59:58'),
(679, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:00:01', '2021-10-28 06:00:01'),
(680, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:00:02', '2021-10-28 06:00:02'),
(681, 3, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:00:03', '2021-10-28 06:00:03'),
(682, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:00:05', '2021-10-28 06:00:05'),
(683, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:00:50', '2021-10-28 06:00:50'),
(684, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:00:52', '2021-10-28 06:00:52'),
(685, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:01:40', '2021-10-28 06:01:40'),
(686, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 06:04:09', '2021-10-28 06:04:09'),
(687, 2, 'admin/form-sr4s/5', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_method\":\"PUT\"}', '2021-10-28 06:08:14', '2021-10-28 06:08:14'),
(688, 2, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 06:08:14', '2021-10-28 06:08:14'),
(689, 20, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:08:23', '2021-10-28 06:08:23'),
(690, 20, 'admin/form-sr4s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:08:26', '2021-10-28 06:08:26'),
(691, 20, 'admin/form-sr4s/5', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"company_initials\":\"IUT\",\"premises_location\":\"11\",\"status\":\"5\",\"seed_board_registration_number\":\"120001000\",\"valid_from\":\"2021-10-28\",\"valid_until\":\"2023-05-11\",\"_token\":\"KUwn6dKM662CWeH5HbJYVdOtI3hu8d8LijqDMNse\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr4s\"}', '2021-10-28 06:08:54', '2021-10-28 06:08:54'),
(692, 20, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 06:08:54', '2021-10-28 06:08:54'),
(693, 2, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 06:09:42', '2021-10-28 06:09:42'),
(694, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:09:57', '2021-10-28 06:09:57'),
(695, 2, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:10:14', '2021-10-28 06:10:14'),
(696, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:10:19', '2021-10-28 06:10:19'),
(697, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:10:40', '2021-10-28 06:10:40'),
(698, 3, 'admin/form-sr4s/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:10:43', '2021-10-28 06:10:43'),
(699, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:10:46', '2021-10-28 06:10:46'),
(700, 3, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 06:12:10', '2021-10-28 06:12:10'),
(701, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 06:13:48', '2021-10-28 06:13:48'),
(702, 20, 'admin/form-sr4s/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:13:56', '2021-10-28 06:13:56'),
(703, 2, 'admin/form-sr4s', 'GET', '::1', '[]', '2021-10-28 06:14:02', '2021-10-28 06:14:02'),
(704, 2, 'admin/form-sr4s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:14:05', '2021-10-28 06:14:05'),
(705, 2, 'admin/form-sr4s/5/edit', 'GET', '::1', '[]', '2021-10-28 06:14:12', '2021-10-28 06:14:12'),
(706, 2, 'admin/form-sr4s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:14:36', '2021-10-28 06:14:36'),
(707, 2, 'admin/form-sr4s/5/edit', 'GET', '::1', '[]', '2021-10-28 06:15:01', '2021-10-28 06:15:01'),
(708, 2, 'admin/form-sr4s/5/edit', 'GET', '::1', '[]', '2021-10-28 06:15:33', '2021-10-28 06:15:33'),
(709, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:15:41', '2021-10-28 06:15:41'),
(710, 2, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 06:15:53', '2021-10-28 06:15:53'),
(711, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:15:54', '2021-10-28 06:15:54'),
(712, 3, 'admin/form-sr4s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:16:03', '2021-10-28 06:16:03'),
(713, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:16:09', '2021-10-28 06:16:09'),
(714, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:16:12', '2021-10-28 06:16:12'),
(715, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:16:33', '2021-10-28 06:16:33'),
(716, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:16:54', '2021-10-28 06:16:54'),
(717, 3, 'admin/import-export-permits', 'POST', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"12000\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_variety_id\":\"5\",\"category\":\"Beans\",\"weight\":\"12\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"5\",\"category\":\"Maize\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\"}', '2021-10-28 06:17:40', '2021-10-28 06:17:40'),
(718, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 06:17:40', '2021-10-28 06:17:40'),
(719, 3, 'admin/import-export-permits', 'POST', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"12000\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"5\",\"category\":\"Maize\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\"}', '2021-10-28 06:19:39', '2021-10-28 06:19:39'),
(720, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 06:19:39', '2021-10-28 06:19:39'),
(721, 3, 'admin/import-export-permits', 'POST', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"12000\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"5\",\"category\":\"Maize\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\"}', '2021-10-28 06:20:20', '2021-10-28 06:20:20'),
(722, 3, 'admin/import-export-permits/create', 'GET', '::1', '[]', '2021-10-28 06:20:20', '2021-10-28 06:20:20'),
(723, 3, 'admin/import-export-permits', 'POST', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"12000\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"5\",\"category\":\"Maize\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\"}', '2021-10-28 06:21:14', '2021-10-28 06:21:14'),
(724, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:21:14', '2021-10-28 06:21:14'),
(725, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:21:25', '2021-10-28 06:21:25'),
(726, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:21:35', '2021-10-28 06:21:35'),
(727, 2, 'admin/import-export-permits/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:21:39', '2021-10-28 06:21:39'),
(728, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:21:39', '2021-10-28 06:21:39'),
(729, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:22:26', '2021-10-28 06:22:26'),
(730, 2, 'admin/import-export-permits/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:22:29', '2021-10-28 06:22:29'),
(731, 2, 'admin/import-export-permits/7', 'PUT', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-28 06:22:37', '2021-10-28 06:22:37'),
(732, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:22:37', '2021-10-28 06:22:37'),
(733, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:22:43', '2021-10-28 06:22:43'),
(734, 20, 'admin/import-export-permits/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:22:49', '2021-10-28 06:22:49'),
(735, 20, 'admin/import-export-permits/7', 'PUT', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"5\",\"permit_number\":\"719774\",\"valid_from\":\"2021-10-28\",\"valid_until\":\"2022-01-28\",\"_token\":\"KUwn6dKM662CWeH5HbJYVdOtI3hu8d8LijqDMNse\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-28 06:23:21', '2021-10-28 06:23:21'),
(736, 20, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:23:21', '2021-10-28 06:23:21'),
(737, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:23:28', '2021-10-28 06:23:28'),
(738, 2, 'admin/import-export-permits/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:23:35', '2021-10-28 06:23:35'),
(739, 2, 'admin/import-export-permits/7', 'PUT', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-28 06:23:42', '2021-10-28 06:23:42'),
(740, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:23:43', '2021-10-28 06:23:43'),
(741, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:23:46', '2021-10-28 06:23:46'),
(742, 20, 'admin/import-export-permits/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:23:50', '2021-10-28 06:23:50'),
(743, 20, 'admin/import-export-permits/7', 'PUT', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"5\",\"permit_number\":\"719774\",\"valid_from\":\"2021-10-28\",\"valid_until\":\"2022-01-28\",\"_token\":\"KUwn6dKM662CWeH5HbJYVdOtI3hu8d8LijqDMNse\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-28 06:23:55', '2021-10-28 06:23:55'),
(744, 20, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:23:55', '2021-10-28 06:23:55'),
(745, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:24:06', '2021-10-28 06:24:06'),
(746, 3, 'admin/import-export-permits/7', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:24:11', '2021-10-28 06:24:11'),
(747, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:24:13', '2021-10-28 06:24:13'),
(748, 3, 'admin/import-export-permits/7', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:26:21', '2021-10-28 06:26:21'),
(749, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:26:27', '2021-10-28 06:26:27'),
(750, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:26:32', '2021-10-28 06:26:32'),
(751, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:28:18', '2021-10-28 06:28:18'),
(752, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:28:30', '2021-10-28 06:28:30'),
(753, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:28:32', '2021-10-28 06:28:32'),
(754, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:28:34', '2021-10-28 06:28:34'),
(755, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:29:18', '2021-10-28 06:29:18'),
(756, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:29:28', '2021-10-28 06:29:28'),
(757, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"7\",\"_model\":\"App_Models_ImportExportPermit\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-10-28 06:29:38', '2021-10-28 06:29:38'),
(758, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:29:38', '2021-10-28 06:29:38'),
(759, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:29:42', '2021-10-28 06:29:42'),
(760, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:29:50', '2021-10-28 06:29:50'),
(761, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:30:26', '2021-10-28 06:30:26'),
(762, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:30:28', '2021-10-28 06:30:28'),
(763, 3, 'admin/import-export-permits', 'POST', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"aasas\",\"quantiry_of_seed\":\"112\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_variety_id\":\"4\",\"category\":\"1122\",\"weight\":\"12000\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"8\",\"category\":\"Category test\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-28 06:30:52', '2021-10-28 06:30:52'),
(764, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:30:53', '2021-10-28 06:30:53'),
(765, 3, 'admin/import-export-permits/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:31:06', '2021-10-28 06:31:06'),
(766, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:31:07', '2021-10-28 06:31:07'),
(767, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:31:10', '2021-10-28 06:31:10'),
(768, 2, 'admin/import-export-permits/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:31:15', '2021-10-28 06:31:15'),
(769, 2, 'admin/import-export-permits/8', 'PUT', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"UBizLN5euXsGiMwpgMb9eHdpo4YApOKMmzgEIWsy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-28 06:31:20', '2021-10-28 06:31:20'),
(770, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:31:20', '2021-10-28 06:31:20'),
(771, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:31:23', '2021-10-28 06:31:23'),
(772, 20, 'admin/import-export-permits/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:31:26', '2021-10-28 06:31:26'),
(773, 20, 'admin/import-export-permits/8', 'PUT', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"5\",\"permit_number\":\"386342\",\"valid_from\":\"2021-10-28\",\"valid_until\":\"2021-10-28\",\"_token\":\"KUwn6dKM662CWeH5HbJYVdOtI3hu8d8LijqDMNse\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-10-28 06:31:41', '2021-10-28 06:31:41'),
(774, 20, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:31:41', '2021-10-28 06:31:41'),
(775, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:31:46', '2021-10-28 06:31:46'),
(776, 3, 'admin/import-export-permits/8', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:31:58', '2021-10-28 06:31:58'),
(777, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:33:22', '2021-10-28 06:33:22'),
(778, 3, 'admin/import-export-permits/8', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:33:34', '2021-10-28 06:33:34'),
(779, 3, 'admin/import-export-permits/8', 'GET', '::1', '[]', '2021-10-28 06:33:51', '2021-10-28 06:33:51'),
(780, 3, 'admin/import-export-permits/8', 'GET', '::1', '[]', '2021-10-28 06:34:13', '2021-10-28 06:34:13'),
(781, 3, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:34:42', '2021-10-28 06:34:42'),
(782, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:37:01', '2021-10-28 06:37:01'),
(783, 1, 'admin', 'GET', '::1', '[]', '2021-10-28 06:37:08', '2021-10-28 06:37:08'),
(784, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:37:13', '2021-10-28 06:37:13'),
(785, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"25\",\"title\":\"import-export-permits-2\",\"icon\":\"fa-wpforms\",\"uri\":\"import-export-permits-2\",\"roles\":[null],\"permission\":null,\"_token\":\"dOts9zwlhLid3vIGjYZWc7TMAS5ckcvsQU5Oastg\"}', '2021-10-28 06:37:44', '2021-10-28 06:37:44'),
(786, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-28 06:37:44', '2021-10-28 06:37:44'),
(787, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"dOts9zwlhLid3vIGjYZWc7TMAS5ckcvsQU5Oastg\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":31},{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-10-28 06:37:47', '2021-10-28 06:37:47'),
(788, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:37:48', '2021-10-28 06:37:48'),
(789, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-28 06:37:49', '2021-10-28 06:37:49'),
(790, 1, 'admin/auth/menu/31', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"dOts9zwlhLid3vIGjYZWc7TMAS5ckcvsQU5Oastg\"}', '2021-10-28 06:38:01', '2021-10-28 06:38:01'),
(791, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:38:01', '2021-10-28 06:38:01'),
(792, 1, 'admin/auth/menu/30/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:38:05', '2021-10-28 06:38:05'),
(793, 1, 'admin/auth/menu/30', 'PUT', '::1', '{\"parent_id\":\"25\",\"title\":\"Export permit\",\"icon\":\"fa-wpforms\",\"uri\":\"import-export-permits-2\",\"roles\":[null],\"permission\":null,\"_token\":\"dOts9zwlhLid3vIGjYZWc7TMAS5ckcvsQU5Oastg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2021-10-28 06:38:13', '2021-10-28 06:38:13'),
(794, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-28 06:38:13', '2021-10-28 06:38:13'),
(795, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"dOts9zwlhLid3vIGjYZWc7TMAS5ckcvsQU5Oastg\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-10-28 06:38:15', '2021-10-28 06:38:15'),
(796, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:38:16', '2021-10-28 06:38:16'),
(797, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-28 06:38:20', '2021-10-28 06:38:20'),
(798, 1, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:38:25', '2021-10-28 06:38:25'),
(799, 3, 'admin', 'GET', '::1', '[]', '2021-10-28 06:38:46', '2021-10-28 06:38:46'),
(800, 3, 'admin', 'GET', '::1', '[]', '2021-10-28 06:38:49', '2021-10-28 06:38:49'),
(801, 3, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:38:55', '2021-10-28 06:38:55'),
(802, 3, 'admin/import-export-permits-2', 'GET', '::1', '[]', '2021-10-28 06:40:44', '2021-10-28 06:40:44'),
(803, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:40:50', '2021-10-28 06:40:50'),
(804, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:41:47', '2021-10-28 06:41:47'),
(805, 3, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:41:51', '2021-10-28 06:41:51'),
(806, 3, 'admin/import-export-permits-2', 'GET', '::1', '[]', '2021-10-28 06:43:14', '2021-10-28 06:43:14'),
(807, 3, 'admin/import-export-permits-2/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:43:20', '2021-10-28 06:43:20'),
(808, 3, 'admin/import-export-permits-2/create', 'GET', '::1', '[]', '2021-10-28 06:45:35', '2021-10-28 06:45:35'),
(809, 3, 'admin/import-export-permits-2/create', 'GET', '::1', '[]', '2021-10-28 06:45:56', '2021-10-28 06:45:56'),
(810, 3, 'admin/import-export-permits-2/create', 'GET', '::1', '[]', '2021-10-28 06:48:02', '2021-10-28 06:48:02'),
(811, 3, 'admin/import-export-permits-2/create', 'GET', '::1', '[]', '2021-10-28 06:48:33', '2021-10-28 06:48:33'),
(812, 3, 'admin/import-export-permits-2/create', 'GET', '::1', '[]', '2021-10-28 06:48:44', '2021-10-28 06:48:44'),
(813, 3, 'admin/import-export-permits-2/create', 'GET', '::1', '[]', '2021-10-28 06:48:53', '2021-10-28 06:48:53'),
(814, 3, 'admin/import-export-permits-2', 'POST', '::1', '{\"is_import\":\"0\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"1200,0000\",\"quantiry_of_seed\":\"1222\",\"name_address_of_origin\":\"Kibuli, Kampala, Uganda\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_variety_id\":\"5\",\"category\":\"Beans\",\"weight\":\"12000\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"7\",\"category\":\"qwqw\",\"weight\":\"122\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\"}', '2021-10-28 06:49:42', '2021-10-28 06:49:42'),
(815, 3, 'admin/import-export-permits-2', 'GET', '::1', '[]', '2021-10-28 06:49:42', '2021-10-28 06:49:42'),
(816, 3, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:49:47', '2021-10-28 06:49:47'),
(817, 3, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:49:52', '2021-10-28 06:49:52'),
(818, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:49:54', '2021-10-28 06:49:54'),
(819, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:49:56', '2021-10-28 06:49:56'),
(820, 3, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:50:00', '2021-10-28 06:50:00'),
(821, 1, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:50:17', '2021-10-28 06:50:17'),
(822, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:50:26', '2021-10-28 06:50:26'),
(823, 2, 'admin', 'GET', '::1', '[]', '2021-10-28 06:50:35', '2021-10-28 06:50:35'),
(824, 2, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:50:44', '2021-10-28 06:50:44'),
(825, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:50:48', '2021-10-28 06:50:48'),
(826, 2, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:50:50', '2021-10-28 06:50:50'),
(827, 2, 'admin/import-export-permits-2/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:50:55', '2021-10-28 06:50:55'),
(828, 2, 'admin/import-export-permits-2/9', 'PUT', '::1', '{\"is_import\":\"0\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"1200,0000\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"CeUrPSJMKqmNXXkLA5CY6RjC4YGnMlUDUrhLdo8A\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits-2\"}', '2021-10-28 06:51:07', '2021-10-28 06:51:07'),
(829, 2, 'admin/import-export-permits-2', 'GET', '::1', '[]', '2021-10-28 06:51:07', '2021-10-28 06:51:07'),
(830, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:51:12', '2021-10-28 06:51:12'),
(831, 20, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:51:14', '2021-10-28 06:51:14'),
(832, 20, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-28 06:51:19', '2021-10-28 06:51:19'),
(833, 20, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:51:21', '2021-10-28 06:51:21'),
(834, 20, 'admin/import-export-permits-2/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:51:26', '2021-10-28 06:51:26'),
(835, 20, 'admin/import-export-permits-2/9', 'PUT', '::1', '{\"is_import\":\"0\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"1200,0000\",\"status\":\"5\",\"permit_number\":\"482530\",\"valid_from\":\"2021-10-28\",\"valid_until\":\"2022-01-08\",\"_token\":\"KUwn6dKM662CWeH5HbJYVdOtI3hu8d8LijqDMNse\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits-2\"}', '2021-10-28 06:51:42', '2021-10-28 06:51:42'),
(836, 20, 'admin/import-export-permits-2', 'GET', '::1', '[]', '2021-10-28 06:51:42', '2021-10-28 06:51:42'),
(837, 2, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:51:49', '2021-10-28 06:51:49'),
(838, 2, 'admin/import-export-permits-2/9', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:51:52', '2021-10-28 06:51:52'),
(839, 2, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:52:02', '2021-10-28 06:52:02'),
(840, 2, 'admin/form-qds/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:52:08', '2021-10-28 06:52:08'),
(841, 2, 'admin/form-qds/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:52:09', '2021-10-28 06:52:09'),
(842, 2, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:52:17', '2021-10-28 06:52:17'),
(843, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"1\",\"_model\":\"App_Models_FormQds\",\"_token\":\"CeUrPSJMKqmNXXkLA5CY6RjC4YGnMlUDUrhLdo8A\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-10-28 06:52:22', '2021-10-28 06:52:22'),
(844, 2, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:52:22', '2021-10-28 06:52:22'),
(845, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:52:35', '2021-10-28 06:52:35'),
(846, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:52:39', '2021-10-28 06:52:39'),
(847, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:52:40', '2021-10-28 06:52:40'),
(848, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:57:29', '2021-10-28 06:57:29'),
(849, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:57:37', '2021-10-28 06:57:37'),
(850, 3, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:57:38', '2021-10-28 06:57:38'),
(851, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:57:42', '2021-10-28 06:57:42'),
(852, 3, 'admin/form-sr4s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:57:48', '2021-10-28 06:57:48'),
(853, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:58:06', '2021-10-28 06:58:06'),
(854, 3, 'admin/form-sr4s/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:58:17', '2021-10-28 06:58:17'),
(855, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:58:41', '2021-10-28 06:58:41'),
(856, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 06:59:47', '2021-10-28 06:59:47'),
(857, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:00:51', '2021-10-28 07:00:51'),
(858, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:00:52', '2021-10-28 07:00:52'),
(859, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:00:55', '2021-10-28 07:00:55'),
(860, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:00:56', '2021-10-28 07:00:56'),
(861, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:03:04', '2021-10-28 07:03:04'),
(862, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:03:05', '2021-10-28 07:03:05'),
(863, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:03:38', '2021-10-28 07:03:38'),
(864, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:03:41', '2021-10-28 07:03:41'),
(865, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:05:17', '2021-10-28 07:05:17'),
(866, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:05:18', '2021-10-28 07:05:18');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(867, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:06:11', '2021-10-28 07:06:11'),
(868, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:06:49', '2021-10-28 07:06:49'),
(869, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:06:50', '2021-10-28 07:06:50'),
(870, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:07:31', '2021-10-28 07:07:31'),
(871, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:07:32', '2021-10-28 07:07:32'),
(872, 3, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:04', '2021-10-28 07:12:04'),
(873, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:06', '2021-10-28 07:12:06'),
(874, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:07', '2021-10-28 07:12:07'),
(875, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:07', '2021-10-28 07:12:07'),
(876, 3, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:08', '2021-10-28 07:12:08'),
(877, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:09', '2021-10-28 07:12:09'),
(878, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:10', '2021-10-28 07:12:10'),
(879, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:12', '2021-10-28 07:12:12'),
(880, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:42', '2021-10-28 07:12:42'),
(881, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:12:44', '2021-10-28 07:12:44'),
(882, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:13:28', '2021-10-28 07:13:28'),
(883, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:13:29', '2021-10-28 07:13:29'),
(884, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:14:30', '2021-10-28 07:14:30'),
(885, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:14:30', '2021-10-28 07:14:30'),
(886, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:14:53', '2021-10-28 07:14:53'),
(887, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:14:55', '2021-10-28 07:14:55'),
(888, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:15', '2021-10-28 07:21:15'),
(889, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:16', '2021-10-28 07:21:16'),
(890, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:16', '2021-10-28 07:21:16'),
(891, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:17', '2021-10-28 07:21:17'),
(892, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:17', '2021-10-28 07:21:17'),
(893, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:17', '2021-10-28 07:21:17'),
(894, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:18', '2021-10-28 07:21:18'),
(895, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:18', '2021-10-28 07:21:18'),
(896, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:19', '2021-10-28 07:21:19'),
(897, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:19', '2021-10-28 07:21:19'),
(898, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:20', '2021-10-28 07:21:20'),
(899, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:20', '2021-10-28 07:21:20'),
(900, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:20', '2021-10-28 07:21:20'),
(901, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:21', '2021-10-28 07:21:21'),
(902, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:21', '2021-10-28 07:21:21'),
(903, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:21', '2021-10-28 07:21:21'),
(904, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:21', '2021-10-28 07:21:21'),
(905, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:22', '2021-10-28 07:21:22'),
(906, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:22', '2021-10-28 07:21:22'),
(907, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:22', '2021-10-28 07:21:22'),
(908, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:21:23', '2021-10-28 07:21:23'),
(909, 3, 'admin/form-qds/create', 'GET', '::1', '[]', '2021-10-28 07:21:23', '2021-10-28 07:21:23'),
(910, 3, 'admin/form-qds/create', 'GET', '::1', '[]', '2021-10-28 07:21:28', '2021-10-28 07:21:28'),
(911, 3, 'admin/form-qds/create', 'GET', '::1', '[]', '2021-10-28 07:21:31', '2021-10-28 07:21:31'),
(912, 3, 'admin/form-qds/create', 'GET', '::1', '[]', '2021-10-28 07:21:49', '2021-10-28 07:21:49'),
(913, 3, 'admin/form-qds/create', 'GET', '::1', '[]', '2021-10-28 07:22:16', '2021-10-28 07:22:16'),
(914, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:23:27', '2021-10-28 07:23:27'),
(915, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:23:28', '2021-10-28 07:23:28'),
(916, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:25:56', '2021-10-28 07:25:56'),
(917, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:25:57', '2021-10-28 07:25:57'),
(918, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:27:05', '2021-10-28 07:27:05'),
(919, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:27:06', '2021-10-28 07:27:06'),
(920, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:28:04', '2021-10-28 07:28:04'),
(921, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:28:05', '2021-10-28 07:28:05'),
(922, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:30:44', '2021-10-28 07:30:44'),
(923, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:30:45', '2021-10-28 07:30:45'),
(924, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:31:38', '2021-10-28 07:31:38'),
(925, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:31:39', '2021-10-28 07:31:39'),
(926, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:34:18', '2021-10-28 07:34:18'),
(927, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:34:19', '2021-10-28 07:34:19'),
(928, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:35:47', '2021-10-28 07:35:47'),
(929, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:35:49', '2021-10-28 07:35:49'),
(930, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:37:08', '2021-10-28 07:37:08'),
(931, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:37:09', '2021-10-28 07:37:09'),
(932, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:38:14', '2021-10-28 07:38:14'),
(933, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:38:15', '2021-10-28 07:38:15'),
(934, 3, 'admin/form-qds', 'POST', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"112\",\"group-a\":[{\"crop\":\"11\",\"variety\":\"23\",\"ha\":\"AS\",\"origin\":\"ASAS\"}],\"have_been_qds\":\"1\",\"previous_grower_number\":\"2112\",\"have_adequate_storage_facility\":\"1\",\"cropping_histroy\":\"asbjkbasjbkjas\",\"have_adequate_isolation\":\"1\",\"isolation_distance\":\"qwqwqw\",\"have_adequate_labor\":\"1\",\"number_of_labors\":\"qwqwqw\",\"aware_of_minimum_standards\":\"1\",\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\"}', '2021-10-28 07:39:20', '2021-10-28 07:39:20'),
(935, 3, 'admin/form-qds/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:39:20', '2021-10-28 07:39:20'),
(936, 3, 'admin/form-qds', 'POST', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"112\",\"crop\":\"112\",\"variety\":\"322\",\"ha\":\"111\",\"origin\":\"122\",\"have_been_qds\":\"1\",\"previous_grower_number\":\"2112\",\"have_adequate_storage_facility\":\"1\",\"cropping_histroy\":\"asbjkbasjbkjas\",\"have_adequate_isolation\":\"1\",\"isolation_distance\":\"12\",\"have_adequate_labor\":\"1\",\"number_of_labors\":\"qwqwqw\",\"aware_of_minimum_standards\":\"1\",\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-qds\\/create?_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container\"}', '2021-10-28 07:40:34', '2021-10-28 07:40:34'),
(937, 3, 'admin/form-qds/create', 'GET', '::1', '[]', '2021-10-28 07:40:34', '2021-10-28 07:40:34'),
(938, 3, 'admin/form-qds', 'POST', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"112\",\"crop\":\"2\",\"variety\":\"212\",\"ha\":\"1212\",\"origin\":\"1212\",\"have_been_qds\":\"1\",\"previous_grower_number\":\"2112\",\"have_adequate_storage_facility\":\"1\",\"cropping_histroy\":\"asbjkbasjbkjas\",\"have_adequate_isolation\":\"1\",\"isolation_distance\":\"12\",\"have_adequate_labor\":\"1\",\"number_of_labors\":\"qwqwqw\",\"aware_of_minimum_standards\":\"1\",\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\"}', '2021-10-28 07:41:21', '2021-10-28 07:41:21'),
(939, 3, 'admin/form-qds/create', 'GET', '::1', '[]', '2021-10-28 07:41:22', '2021-10-28 07:41:22'),
(940, 3, 'admin/form-qds/create', 'GET', '::1', '[]', '2021-10-28 07:41:39', '2021-10-28 07:41:39'),
(941, 3, 'admin/form-qds/create', 'GET', '::1', '[]', '2021-10-28 07:41:40', '2021-10-28 07:41:40'),
(942, 3, 'admin/form-qds', 'POST', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Magdalene Lane Opposite Ndere Cultural Centre, Ntinda - Kisaasi Rd, Kampala\",\"premises_location\":\"11\",\"years_of_expirience\":\"11\",\"group-a\":[{\"crop\":\"12\",\"variety\":\"222\",\"ha\":\"2222\",\"origin\":\"2222\"}],\"have_been_qds\":\"1\",\"previous_grower_number\":\"21122\",\"have_adequate_storage_facility\":\"1\",\"cropping_histroy\":\"aasasas\",\"have_adequate_isolation\":\"0\",\"have_adequate_labor\":\"0\",\"aware_of_minimum_standards\":\"1\",\"_token\":\"bgeon4KsIYB59fUEU6S9LTYNuqAUFZyW7cRPMRgc\",\"after-save\":\"1\"}', '2021-10-28 07:43:06', '2021-10-28 07:43:06'),
(943, 3, 'admin/form-qds/2/edit', 'GET', '::1', '[]', '2021-10-28 07:43:07', '2021-10-28 07:43:07'),
(944, 3, 'admin/form-qds/2/edit', 'GET', '::1', '[]', '2021-10-28 07:43:13', '2021-10-28 07:43:13'),
(945, 3, 'admin/form-qds/2/edit', 'GET', '::1', '[]', '2021-10-28 07:43:14', '2021-10-28 07:43:14'),
(946, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:43:18', '2021-10-28 07:43:18'),
(947, 3, 'admin/form-sr4s/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:43:25', '2021-10-28 07:43:25'),
(948, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:43:29', '2021-10-28 07:43:29'),
(949, 3, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:43:34', '2021-10-28 07:43:34'),
(950, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:43:35', '2021-10-28 07:43:35'),
(951, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-28 07:44:01', '2021-10-28 07:44:01'),
(952, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 08:18:58', '2021-10-28 08:18:58'),
(953, 3, 'admin/import-export-permits/6/edit', 'GET', '::1', '[]', '2021-10-28 18:46:58', '2021-10-28 18:46:58'),
(954, 3, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-10-29 10:53:52', '2021-10-29 10:53:52'),
(955, 2, 'admin', 'GET', '::1', '[]', '2021-10-29 20:35:47', '2021-10-29 20:35:47'),
(956, 2, 'admin/auth/login', 'GET', '::1', '[]', '2021-10-29 20:35:56', '2021-10-29 20:35:56'),
(957, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-29 20:36:02', '2021-10-29 20:36:02'),
(958, 1, 'admin', 'GET', '::1', '[]', '2021-10-29 20:36:11', '2021-10-29 20:36:11'),
(959, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-29 20:36:26', '2021-10-29 20:36:26'),
(960, 2, 'admin', 'GET', '::1', '[]', '2021-10-29 20:44:43', '2021-10-29 20:44:43'),
(961, 2, 'admin', 'GET', '::1', '[]', '2021-11-01 04:26:13', '2021-11-01 04:26:13'),
(962, 2, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:26:42', '2021-11-01 04:26:42'),
(963, 2, 'admin/import-export-permits-2', 'GET', '::1', '[]', '2021-11-01 04:52:43', '2021-11-01 04:52:43'),
(964, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 04:52:57', '2021-11-01 04:52:57'),
(965, 2, 'admin/import-export-permits-2', 'GET', '::1', '[]', '2021-11-01 04:53:03', '2021-11-01 04:53:03'),
(966, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:53:06', '2021-11-01 04:53:06'),
(967, 1, 'admin', 'GET', '::1', '[]', '2021-11-01 04:53:18', '2021-11-01 04:53:18'),
(968, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:53:25', '2021-11-01 04:53:25'),
(969, 1, 'admin/auth/menu/27/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:53:38', '2021-11-01 04:53:38'),
(970, 1, 'admin/auth/menu/27', 'PUT', '::1', '{\"parent_id\":\"25\",\"title\":\"Planting returns\",\"icon\":\"fa-archive\",\"uri\":\"planting-returns\",\"roles\":[null],\"permission\":null,\"_token\":\"b40B1a5UDvWdAO6mJnXOjRQvGZQHkdfcb5IeL9Ys\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2021-11-01 04:53:57', '2021-11-01 04:53:57'),
(971, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-01 04:53:57', '2021-11-01 04:53:57'),
(972, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-01 04:54:00', '2021-11-01 04:54:00'),
(973, 1, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:54:05', '2021-11-01 04:54:05'),
(974, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:54:08', '2021-11-01 04:54:08'),
(975, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:56:17', '2021-11-01 04:56:17'),
(976, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 04:57:07', '2021-11-01 04:57:07'),
(977, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:57:20', '2021-11-01 04:57:20'),
(978, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:57:47', '2021-11-01 04:57:47'),
(979, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:58:19', '2021-11-01 04:58:19'),
(980, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 04:58:38', '2021-11-01 04:58:38'),
(981, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:02:12', '2021-11-01 05:02:12'),
(982, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:10:49', '2021-11-01 05:10:49'),
(983, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:10:52', '2021-11-01 05:10:52'),
(984, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:13:15', '2021-11-01 05:13:15'),
(985, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:13:46', '2021-11-01 05:13:46'),
(986, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:15:27', '2021-11-01 05:15:27'),
(987, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:16:06', '2021-11-01 05:16:06'),
(988, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:18:45', '2021-11-01 05:18:45'),
(989, 1, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:19:40', '2021-11-01 05:19:40'),
(990, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:19:43', '2021-11-01 05:19:43'),
(991, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:28:33', '2021-11-01 05:28:33'),
(992, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:29:13', '2021-11-01 05:29:13'),
(993, 1, 'admin/planting-returns', 'POST', '::1', '{\"administrator_id\":\"1\",\"name\":\"Administrator\",\"address\":\"Bwera, Kasese, Uganda\",\"telephone\":\"088721992\",\"planting_return_crops\":{\"new_1\":{\"crop_variety_id\":\"4\",\"lot_number\":\"1212\",\"size_of_land\":\"12\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2022-02-19\",\"previous_crops\":[\"3\",\"6\",\"20\",null],\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"5\",\"lot_number\":\"12\",\"size_of_land\":\"15\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2021-11-27\",\"previous_crops\":[\"4\",\"8\",\"12\",null],\"id\":null,\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"registerd_dealer\":\"1222\",\"latitude\":\"0.3329997388864956\",\"longitude\":\"32.562575340270996\",\"_token\":\"b40B1a5UDvWdAO6mJnXOjRQvGZQHkdfcb5IeL9Ys\"}', '2021-11-01 05:35:09', '2021-11-01 05:35:09'),
(994, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:35:09', '2021-11-01 05:35:09'),
(995, 1, 'admin/planting-returns', 'POST', '::1', '{\"administrator_id\":\"1\",\"name\":\"Administrator\",\"address\":\"Bwera, Kasese, Uganda\",\"telephone\":\"088721992\",\"planting_return_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"5\",\"lot_number\":\"12\",\"size_of_land\":\"15\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2021-11-27\",\"previous_crops\":[\"3\",\"6\",\"20\",null,\"4\",\"8\",\"12\",null],\"id\":null,\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"registerd_dealer\":\"1222\",\"latitude\":\"0.3329997388864956\",\"longitude\":\"32.562575340270996\",\"_token\":\"b40B1a5UDvWdAO6mJnXOjRQvGZQHkdfcb5IeL9Ys\",\"after-save\":\"1\"}', '2021-11-01 05:36:48', '2021-11-01 05:36:48'),
(996, 1, 'admin/planting-returns/2/edit', 'GET', '::1', '[]', '2021-11-01 05:36:48', '2021-11-01 05:36:48'),
(997, 1, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:37:02', '2021-11-01 05:37:02'),
(998, 1, 'admin/planting-returns/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:37:12', '2021-11-01 05:37:12'),
(999, 1, 'admin/planting-returns/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:37:15', '2021-11-01 05:37:15'),
(1000, 1, 'admin/planting-returns/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:37:33', '2021-11-01 05:37:33'),
(1001, 1, 'admin/planting-returns/2/edit', 'GET', '::1', '[]', '2021-11-01 05:37:35', '2021-11-01 05:37:35'),
(1002, 1, 'admin/planting-returns/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:40:01', '2021-11-01 05:40:01'),
(1003, 1, 'admin/planting-returns/2', 'PUT', '::1', '{\"administrator_id\":\"1\",\"name\":\"Administrator\",\"address\":\"Bwera, Kasese, Uganda\",\"telephone\":\"088721992\",\"planting_return_crops\":{\"1\":{\"crop_variety_id\":\"5\",\"lot_number\":\"12\",\"size_of_land\":\"15\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2021-11-27\",\"id\":\"1\",\"_remove_\":\"0\"},\"new_1\":{\"crop_variety_id\":\"3\",\"lot_number\":\"1212\",\"size_of_land\":\"1212\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2021-11-30\",\"id\":null,\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"registerd_dealer\":\"1222\",\"latitude\":\"0.3329997388864956\",\"longitude\":\"32.562575340270996\",\"_token\":\"b40B1a5UDvWdAO6mJnXOjRQvGZQHkdfcb5IeL9Ys\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-01 05:40:21', '2021-11-01 05:40:21'),
(1004, 1, 'admin/planting-returns/2/edit', 'GET', '::1', '[]', '2021-11-01 05:40:22', '2021-11-01 05:40:22'),
(1005, 1, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:40:50', '2021-11-01 05:40:50'),
(1006, 1, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:41:04', '2021-11-01 05:41:04'),
(1007, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 05:41:16', '2021-11-01 05:41:16'),
(1008, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:59:04', '2021-11-01 05:59:04'),
(1009, 1, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 05:59:32', '2021-11-01 05:59:32'),
(1010, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:00:26', '2021-11-01 06:00:26'),
(1011, 1, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-11-01 06:00:28', '2021-11-01 06:00:28'),
(1012, 1, 'admin/import-export-permits-2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:01:35', '2021-11-01 06:01:35'),
(1013, 1, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:01:37', '2021-11-01 06:01:37'),
(1014, 1, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:01:47', '2021-11-01 06:01:47'),
(1015, 1, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:01:49', '2021-11-01 06:01:49'),
(1016, 1, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 06:01:50', '2021-11-01 06:01:50'),
(1017, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:02:09', '2021-11-01 06:02:09'),
(1018, 3, 'admin', 'GET', '::1', '[]', '2021-11-01 06:02:17', '2021-11-01 06:02:17'),
(1019, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:02:21', '2021-11-01 06:02:21'),
(1020, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:02:24', '2021-11-01 06:02:24'),
(1021, 3, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 06:02:43', '2021-11-01 06:02:43'),
(1022, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 06:02:44', '2021-11-01 06:02:44'),
(1023, 3, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:02:52', '2021-11-01 06:02:52'),
(1024, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:02:56', '2021-11-01 06:02:56'),
(1025, 3, 'admin/form-sr6s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:02:56', '2021-11-01 06:02:56'),
(1026, 3, 'admin/form-sr6s', 'POST', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":null,\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"years_of_expirience\":\"12\",\"form_sr6_has_crops\":{\"new_1\":{\"crop_id\":\"4\",\"id\":null,\"_remove_\":\"0\"}},\"seed_grower_in_past\":\"1\",\"previous_grower_number\":\"2112\",\"cropping_histroy\":\"SIMPLE DETAILL...\",\"have_adequate_storage\":\"1\",\"have_adequate_isolation\":\"1\",\"have_adequate_labor\":\"1\",\"aware_of_minimum_standards\":\"1\",\"_token\":\"77V4BLiFMUEHFN9DS9SAFlkMAm8fEAXgTvXfYbvo\"}', '2021-11-01 06:03:37', '2021-11-01 06:03:37'),
(1027, 3, 'admin/form-sr6s', 'GET', '::1', '[]', '2021-11-01 06:03:37', '2021-11-01 06:03:37'),
(1028, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:03:49', '2021-11-01 06:03:49'),
(1029, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:03:51', '2021-11-01 06:03:51'),
(1030, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 06:03:51', '2021-11-01 06:03:51'),
(1031, 2, 'admin', 'GET', '::1', '[]', '2021-11-01 06:04:23', '2021-11-01 06:04:23'),
(1032, 2, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:04:31', '2021-11-01 06:04:31'),
(1033, 2, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:04:35', '2021-11-01 06:04:35'),
(1034, 2, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:04:36', '2021-11-01 06:04:36'),
(1035, 2, 'admin/form-sr6s/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":\"[]\",\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"scQGPMxGNsCImdph590OjQjEjtZVcetDfR3gE3Xt\",\"_method\":\"PUT\"}', '2021-11-01 06:04:42', '2021-11-01 06:04:42'),
(1036, 2, 'admin/form-sr6s', 'GET', '::1', '[]', '2021-11-01 06:04:42', '2021-11-01 06:04:42'),
(1037, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:04:47', '2021-11-01 06:04:47'),
(1038, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 06:04:48', '2021-11-01 06:04:48'),
(1039, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:04:54', '2021-11-01 06:04:54'),
(1040, 20, 'admin', 'GET', '::1', '[]', '2021-11-01 06:05:08', '2021-11-01 06:05:08'),
(1041, 20, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:05:17', '2021-11-01 06:05:17'),
(1042, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:05:20', '2021-11-01 06:05:20'),
(1043, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:06:21', '2021-11-01 06:06:21'),
(1044, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:06:21', '2021-11-01 06:06:21'),
(1045, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:06:31', '2021-11-01 06:06:31'),
(1046, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:06:32', '2021-11-01 06:06:32'),
(1047, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:06:48', '2021-11-01 06:06:48'),
(1048, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:06:48', '2021-11-01 06:06:48'),
(1049, 20, 'admin/form-sr6s/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":\"[]\",\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"status\":\"5\",\"grower_number\":\"171717\",\"valid_from\":\"2019-04-05\",\"valid_until\":\"2020-04-17\",\"_token\":\"tMvtmUQPENIpTTWvKBmrjfRL7VgHhsQbqD8X1XKv\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-01 06:07:50', '2021-11-01 06:07:50'),
(1050, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '[]', '2021-11-01 06:07:50', '2021-11-01 06:07:50'),
(1051, 20, 'admin/form-sr6s/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":\"[]\",\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"status\":\"5\",\"grower_number\":\"171717\",\"valid_from\":\"2019-04-05\",\"valid_until\":\"2020-04-17\",\"_token\":\"tMvtmUQPENIpTTWvKBmrjfRL7VgHhsQbqD8X1XKv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr6s\\/1\\/edit?_pjax=%23pjax-container&_pjax=%23pjax-container&_pjax=%23pjax-container\"}', '2021-11-01 06:07:58', '2021-11-01 06:07:58'),
(1052, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:07:58', '2021-11-01 06:07:58'),
(1053, 20, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:08:09', '2021-11-01 06:08:09'),
(1054, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:08:15', '2021-11-01 06:08:15'),
(1055, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:08:18', '2021-11-01 06:08:18'),
(1056, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 06:08:18', '2021-11-01 06:08:18'),
(1057, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:08:23', '2021-11-01 06:08:23'),
(1058, 20, 'admin/form-sr6s/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:08:23', '2021-11-01 06:08:23'),
(1059, 20, 'admin/form-sr6s/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":\"[]\",\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"premises_location\":\"11\",\"status\":\"5\",\"grower_number\":\"171717\",\"valid_from\":\"2019-04-05\",\"valid_until\":\"2022-12-01\",\"_token\":\"tMvtmUQPENIpTTWvKBmrjfRL7VgHhsQbqD8X1XKv\",\"_method\":\"PUT\"}', '2021-11-01 06:09:10', '2021-11-01 06:09:10'),
(1060, 20, 'admin/form-sr6s', 'GET', '::1', '[]', '2021-11-01 06:09:10', '2021-11-01 06:09:10'),
(1061, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:09:15', '2021-11-01 06:09:15'),
(1062, 20, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:14:30', '2021-11-01 06:14:30'),
(1063, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:16:21', '2021-11-01 06:16:21'),
(1064, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:18:38', '2021-11-01 06:18:38'),
(1065, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:18:49', '2021-11-01 06:18:49'),
(1066, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:19:08', '2021-11-01 06:19:08'),
(1067, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:21:01', '2021-11-01 06:21:01'),
(1068, 3, 'admin/planting-returns/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:21:09', '2021-11-01 06:21:09'),
(1069, 3, 'admin/planting-returns/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:23:24', '2021-11-01 06:23:24'),
(1070, 3, 'admin/planting-returns/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:23:49', '2021-11-01 06:23:49'),
(1071, 3, 'admin/planting-returns/2', 'GET', '::1', '[]', '2021-11-01 06:27:22', '2021-11-01 06:27:22'),
(1072, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:27:46', '2021-11-01 06:27:46'),
(1073, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:27:49', '2021-11-01 06:27:49'),
(1074, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:27:49', '2021-11-01 06:27:49'),
(1075, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:28:57', '2021-11-01 06:28:57'),
(1076, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:29:03', '2021-11-01 06:29:03'),
(1077, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:29:05', '2021-11-01 06:29:05'),
(1078, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:29:32', '2021-11-01 06:29:32'),
(1079, 3, 'admin/planting-returns', 'POST', '::1', '{\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"0779755798\",\"planting_return_crops\":{\"new_1\":{\"crop_variety_id\":\"3\",\"lot_number\":\"1212\",\"size_of_land\":\"1212\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2021-11-30\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"3\",\"lot_number\":\"12\",\"size_of_land\":\"15\",\"date_planted\":\"2021-11-17\",\"date_harvest\":\"2021-11-30\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"crop_variety_id\":\"4\",\"lot_number\":\"1920\",\"size_of_land\":\"12\",\"date_planted\":\"2021-11-09\",\"date_harvest\":\"2021-12-09\",\"id\":null,\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"registerd_dealer\":\"1222\",\"latitude\":\"0.3130291\",\"longitude\":\"32.5290854\",\"_token\":\"77V4BLiFMUEHFN9DS9SAFlkMAm8fEAXgTvXfYbvo\"}', '2021-11-01 06:32:39', '2021-11-01 06:32:39'),
(1080, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 06:32:40', '2021-11-01 06:32:40'),
(1081, 3, 'admin/planting-returns/3', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:32:50', '2021-11-01 06:32:50'),
(1082, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:32:56', '2021-11-01 06:32:56'),
(1083, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 06:36:05', '2021-11-01 06:36:05'),
(1084, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 06:43:38', '2021-11-01 06:43:38'),
(1085, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:44:43', '2021-11-01 06:44:43'),
(1086, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:44:58', '2021-11-01 06:44:58'),
(1087, 2, 'admin', 'GET', '::1', '[]', '2021-11-01 06:45:06', '2021-11-01 06:45:06'),
(1088, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:46:03', '2021-11-01 06:46:03'),
(1089, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 06:49:43', '2021-11-01 06:49:43'),
(1090, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:02:07', '2021-11-01 07:02:07'),
(1091, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:02:55', '2021-11-01 07:02:55'),
(1092, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:04:09', '2021-11-01 07:04:09'),
(1093, 3, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"0779755798\",\"crop_id\":\"4\",\"lot_number\":\"1200\",\"size_of_land\":\"1900\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2021-12-01\",\"previous_crops\":\"Details\",\"planting_return_crops\":{\"3\":{\"crop_variety_id\":\"3\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"crop_variety_id\":\"3\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"crop_variety_id\":\"4\",\"id\":\"5\",\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"registerd_dealer\":\"1222\",\"latitude\":\"0.3130291\",\"longitude\":\"32.5290854\",\"_token\":\"77V4BLiFMUEHFN9DS9SAFlkMAm8fEAXgTvXfYbvo\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-01 07:05:03', '2021-11-01 07:05:03'),
(1094, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 07:05:04', '2021-11-01 07:05:04'),
(1095, 3, 'admin/planting-returns/3', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:07:27', '2021-11-01 07:07:27'),
(1096, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:07:31', '2021-11-01 07:07:31'),
(1097, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:09:08', '2021-11-01 07:09:08'),
(1098, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"2\",\"_model\":\"App_Models_PlantingReturn\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 07:09:17', '2021-11-01 07:09:17'),
(1099, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:09:18', '2021-11-01 07:09:18'),
(1100, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:09:21', '2021-11-01 07:09:21'),
(1101, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:09:25', '2021-11-01 07:09:25'),
(1102, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 07:09:25', '2021-11-01 07:09:25'),
(1103, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:09:33', '2021-11-01 07:09:33'),
(1104, 2, 'admin/planting-returns/3', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:09:38', '2021-11-01 07:09:38'),
(1105, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:09:40', '2021-11-01 07:09:40'),
(1106, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:09:43', '2021-11-01 07:09:43'),
(1107, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 07:09:43', '2021-11-01 07:09:43'),
(1108, 2, 'admin/planting-returns/3', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:10:09', '2021-11-01 07:10:09'),
(1109, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:10:12', '2021-11-01 07:10:12'),
(1110, 2, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:10:15', '2021-11-01 07:10:15'),
(1111, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 07:10:15', '2021-11-01 07:10:15'),
(1112, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:10:19', '2021-11-01 07:10:19'),
(1113, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 07:10:20', '2021-11-01 07:10:20'),
(1114, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:10:25', '2021-11-01 07:10:25'),
(1115, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 07:10:25', '2021-11-01 07:10:25'),
(1116, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:11:13', '2021-11-01 07:11:13'),
(1117, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:11:44', '2021-11-01 07:11:44'),
(1118, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:13:16', '2021-11-01 07:13:16'),
(1119, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 07:14:58', '2021-11-01 07:14:58'),
(1120, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:15:03', '2021-11-01 07:15:03'),
(1121, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:15:29', '2021-11-01 07:15:29'),
(1122, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 07:15:31', '2021-11-01 07:15:31'),
(1123, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:15:34', '2021-11-01 07:15:34'),
(1124, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:15:38', '2021-11-01 07:15:38'),
(1125, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:15:41', '2021-11-01 07:15:41'),
(1126, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:15:47', '2021-11-01 07:15:47'),
(1127, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:15:52', '2021-11-01 07:15:52'),
(1128, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:17:07', '2021-11-01 07:17:07'),
(1129, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:17:09', '2021-11-01 07:17:09'),
(1130, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:17:17', '2021-11-01 07:17:17'),
(1131, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:17:41', '2021-11-01 07:17:41'),
(1132, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:19:41', '2021-11-01 07:19:41'),
(1133, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:19:57', '2021-11-01 07:19:57'),
(1134, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:22:30', '2021-11-01 07:22:30'),
(1135, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"crop_id\":\"4\",\"test\":null,\"status\":\"2\",\"inspector\":\"10\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 07:22:43', '2021-11-01 07:22:43'),
(1136, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:22:44', '2021-11-01 07:22:44'),
(1137, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"crop_id\":\"4\",\"test\":null,\"status\":\"2\",\"inspector\":\"10\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 07:22:47', '2021-11-01 07:22:47'),
(1138, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:22:47', '2021-11-01 07:22:47'),
(1139, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"crop_id\":\"4\",\"test\":null,\"status\":\"2\",\"inspector\":\"10\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 07:23:08', '2021-11-01 07:23:08'),
(1140, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:23:09', '2021-11-01 07:23:09'),
(1141, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"crop_id\":\"4\",\"test\":null,\"status\":\"2\",\"inspector\":\"10\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 07:23:10', '2021-11-01 07:23:10'),
(1142, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:23:11', '2021-11-01 07:23:11'),
(1143, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:23:52', '2021-11-01 07:23:52'),
(1144, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name_of_applicant\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"crop_id\":\"4\",\"test\":null,\"status\":\"1\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 07:23:57', '2021-11-01 07:23:57'),
(1145, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:23:57', '2021-11-01 07:23:57'),
(1146, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:24:25', '2021-11-01 07:24:25'),
(1147, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:24:54', '2021-11-01 07:24:54'),
(1148, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"crop_id\":\"4\",\"test\":null,\"status\":\"1\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 07:25:00', '2021-11-01 07:25:00'),
(1149, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:25:01', '2021-11-01 07:25:01'),
(1150, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:26:29', '2021-11-01 07:26:29'),
(1151, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"crop_id\":\"4\",\"status\":\"1\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 07:26:38', '2021-11-01 07:26:38'),
(1152, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 07:26:39', '2021-11-01 07:26:39'),
(1153, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:26:43', '2021-11-01 07:26:43'),
(1154, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:27:07', '2021-11-01 07:27:07'),
(1155, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:28:10', '2021-11-01 07:28:10'),
(1156, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:28:18', '2021-11-01 07:28:18'),
(1157, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:28:22', '2021-11-01 07:28:22'),
(1158, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:28:33', '2021-11-01 07:28:33'),
(1159, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:28:45', '2021-11-01 07:28:45'),
(1160, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:29:50', '2021-11-01 07:29:50'),
(1161, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 07:30:24', '2021-11-01 07:30:24'),
(1162, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:31:26', '2021-11-01 07:31:26'),
(1163, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:31:37', '2021-11-01 07:31:37'),
(1164, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:31:52', '2021-11-01 07:31:52'),
(1165, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:31:58', '2021-11-01 07:31:58'),
(1166, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:32:11', '2021-11-01 07:32:11'),
(1167, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:32:25', '2021-11-01 07:32:25'),
(1168, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:32:37', '2021-11-01 07:32:37'),
(1169, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:32:47', '2021-11-01 07:32:47'),
(1170, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:32:51', '2021-11-01 07:32:51'),
(1171, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:57:02', '2021-11-01 07:57:02'),
(1172, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:57:39', '2021-11-01 07:57:39'),
(1173, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:58:05', '2021-11-01 07:58:05'),
(1174, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:58:12', '2021-11-01 07:58:12'),
(1175, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 07:59:35', '2021-11-01 07:59:35'),
(1176, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:00:14', '2021-11-01 08:00:14'),
(1177, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:02:42', '2021-11-01 08:02:42'),
(1178, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:03:04', '2021-11-01 08:03:04'),
(1179, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:03:09', '2021-11-01 08:03:09'),
(1180, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:03:11', '2021-11-01 08:03:11'),
(1181, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:03:33', '2021-11-01 08:03:33'),
(1182, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:03:41', '2021-11-01 08:03:41'),
(1183, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:03:57', '2021-11-01 08:03:57'),
(1184, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:04:15', '2021-11-01 08:04:15'),
(1185, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:04:28', '2021-11-01 08:04:28'),
(1186, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:04:46', '2021-11-01 08:04:46'),
(1187, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:05:04', '2021-11-01 08:05:04'),
(1188, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:05:28', '2021-11-01 08:05:28'),
(1189, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:06:01', '2021-11-01 08:06:01'),
(1190, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:06:51', '2021-11-01 08:06:51'),
(1191, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:07:14', '2021-11-01 08:07:14'),
(1192, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:07:35', '2021-11-01 08:07:35'),
(1193, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:07:55', '2021-11-01 08:07:55'),
(1194, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:08:19', '2021-11-01 08:08:19'),
(1195, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:08:34', '2021-11-01 08:08:34');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1196, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:08:52', '2021-11-01 08:08:52'),
(1197, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:09:07', '2021-11-01 08:09:07'),
(1198, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:09:40', '2021-11-01 08:09:40'),
(1199, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:40', '2021-11-01 08:09:40'),
(1200, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:41', '2021-11-01 08:09:41'),
(1201, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:41', '2021-11-01 08:09:41'),
(1202, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:42', '2021-11-01 08:09:42'),
(1203, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:42', '2021-11-01 08:09:42'),
(1204, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:42', '2021-11-01 08:09:42'),
(1205, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:43', '2021-11-01 08:09:43'),
(1206, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:43', '2021-11-01 08:09:43'),
(1207, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:44', '2021-11-01 08:09:44'),
(1208, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:45', '2021-11-01 08:09:45'),
(1209, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:45', '2021-11-01 08:09:45'),
(1210, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:46', '2021-11-01 08:09:46'),
(1211, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:09:46', '2021-11-01 08:09:46'),
(1212, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:10:05', '2021-11-01 08:10:05'),
(1213, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:10:08', '2021-11-01 08:10:08'),
(1214, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:10:34', '2021-11-01 08:10:34'),
(1215, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:10:52', '2021-11-01 08:10:52'),
(1216, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:12:07', '2021-11-01 08:12:07'),
(1217, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:12:17', '2021-11-01 08:12:17'),
(1218, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:12:33', '2021-11-01 08:12:33'),
(1219, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:12:41', '2021-11-01 08:12:41'),
(1220, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:14:16', '2021-11-01 08:14:16'),
(1221, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:14:33', '2021-11-01 08:14:33'),
(1222, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:14:36', '2021-11-01 08:14:36'),
(1223, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:14:47', '2021-11-01 08:14:47'),
(1224, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:15:06', '2021-11-01 08:15:06'),
(1225, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:16:21', '2021-11-01 08:16:21'),
(1226, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:16:36', '2021-11-01 08:16:36'),
(1227, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:16:59', '2021-11-01 08:16:59'),
(1228, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:17:06', '2021-11-01 08:17:06'),
(1229, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:17:13', '2021-11-01 08:17:13'),
(1230, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":null,\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 08:20:15', '2021-11-01 08:20:15'),
(1231, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:20:16', '2021-11-01 08:20:16'),
(1232, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:20:21', '2021-11-01 08:20:21'),
(1233, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:20:21', '2021-11-01 08:20:21'),
(1234, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:21:14', '2021-11-01 08:21:14'),
(1235, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:21:19', '2021-11-01 08:21:19'),
(1236, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:21:19', '2021-11-01 08:21:19'),
(1237, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:21:49', '2021-11-01 08:21:49'),
(1238, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:21:51', '2021-11-01 08:21:51'),
(1239, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:21:55', '2021-11-01 08:21:55'),
(1240, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:22:02', '2021-11-01 08:22:02'),
(1241, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:22:05', '2021-11-01 08:22:05'),
(1242, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:22:31', '2021-11-01 08:22:31'),
(1243, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:22:36', '2021-11-01 08:22:36'),
(1244, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:22:39', '2021-11-01 08:22:39'),
(1245, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":null,\"status\":\"1\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-01 08:22:46', '2021-11-01 08:22:46'),
(1246, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:22:47', '2021-11-01 08:22:47'),
(1247, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:22:51', '2021-11-01 08:22:51'),
(1248, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:22:53', '2021-11-01 08:22:53'),
(1249, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:23:00', '2021-11-01 08:23:00'),
(1250, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:00', '2021-11-01 08:23:00'),
(1251, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:01', '2021-11-01 08:23:01'),
(1252, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:01', '2021-11-01 08:23:01'),
(1253, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:02', '2021-11-01 08:23:02'),
(1254, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:02', '2021-11-01 08:23:02'),
(1255, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:02', '2021-11-01 08:23:02'),
(1256, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:03', '2021-11-01 08:23:03'),
(1257, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:03', '2021-11-01 08:23:03'),
(1258, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:04', '2021-11-01 08:23:04'),
(1259, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:04', '2021-11-01 08:23:04'),
(1260, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:05', '2021-11-01 08:23:05'),
(1261, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:05', '2021-11-01 08:23:05'),
(1262, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:06', '2021-11-01 08:23:06'),
(1263, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:07', '2021-11-01 08:23:07'),
(1264, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:23:35', '2021-11-01 08:23:35'),
(1265, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:24:05', '2021-11-01 08:24:05'),
(1266, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:24:08', '2021-11-01 08:24:08'),
(1267, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 08:24:24', '2021-11-01 08:24:24'),
(1268, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"5\",\"status\":\"1\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\\/create\"}', '2021-11-01 08:24:29', '2021-11-01 08:24:29'),
(1269, 2, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-01 08:24:30', '2021-11-01 08:24:30'),
(1270, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:24:30', '2021-11-01 08:24:30'),
(1271, 3, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"0779755798\",\"crop_id\":\"4\",\"lot_number\":\"1200\",\"size_of_land\":\"1900\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2021-12-01\",\"previous_crops\":\"Details\",\"planting_return_crops\":{\"3\":{\"crop_variety_id\":\"3\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"crop_variety_id\":\"3\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"crop_variety_id\":\"4\",\"id\":\"5\",\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"registerd_dealer\":\"1222\",\"latitude\":\"0.3130291\",\"longitude\":\"32.5290854\",\"_token\":\"77V4BLiFMUEHFN9DS9SAFlkMAm8fEAXgTvXfYbvo\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-01 08:24:55', '2021-11-01 08:24:55'),
(1272, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:24:55', '2021-11-01 08:24:55'),
(1273, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:24:59', '2021-11-01 08:24:59'),
(1274, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:25:03', '2021-11-01 08:25:03'),
(1275, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:25:28', '2021-11-01 08:25:28'),
(1276, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"4\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 08:25:34', '2021-11-01 08:25:34'),
(1277, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:25:34', '2021-11-01 08:25:34'),
(1278, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:25:40', '2021-11-01 08:25:40'),
(1279, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:25:50', '2021-11-01 08:25:50'),
(1280, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"4\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"qqLIzBIvWwz05Md8vnduitawnNAO6gPjIH0wWp1D\",\"_method\":\"PUT\"}', '2021-11-01 08:26:02', '2021-11-01 08:26:02'),
(1281, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:26:02', '2021-11-01 08:26:02'),
(1282, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 08:27:46', '2021-11-01 08:27:46'),
(1283, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:28:13', '2021-11-01 08:28:13'),
(1284, 2, 'admin', 'GET', '::1', '[]', '2021-11-01 08:28:55', '2021-11-01 08:28:55'),
(1285, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:29:00', '2021-11-01 08:29:00'),
(1286, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:32:02', '2021-11-01 08:32:02'),
(1287, 2, 'admin/planting-returns/3', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:32:10', '2021-11-01 08:32:10'),
(1288, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:32:31', '2021-11-01 08:32:31'),
(1289, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:39:48', '2021-11-01 08:39:48'),
(1290, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:45:09', '2021-11-01 08:45:09'),
(1291, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:46:36', '2021-11-01 08:46:36'),
(1292, 1, 'admin', 'GET', '::1', '[]', '2021-11-01 08:46:44', '2021-11-01 08:46:44'),
(1293, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:46:48', '2021-11-01 08:46:48'),
(1294, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:46:52', '2021-11-01 08:46:52'),
(1295, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:48:06', '2021-11-01 08:48:06'),
(1296, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 08:49:00', '2021-11-01 08:49:00'),
(1297, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:03:00', '2021-11-01 09:03:00'),
(1298, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:03:32', '2021-11-01 09:03:32'),
(1299, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:03:56', '2021-11-01 09:03:56'),
(1300, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:04:17', '2021-11-01 09:04:17'),
(1301, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:04:34', '2021-11-01 09:04:34'),
(1302, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:04:53', '2021-11-01 09:04:53'),
(1303, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:04:59', '2021-11-01 09:04:59'),
(1304, 1, 'admin/crops/3', 'PUT', '::1', '{\"name\":\"Bush Beans\",\"number_of_days_before_submision\":\"15\",\"crop_inspection_types\":{\"new_1\":{\"inspection_stage\":\"Pre-flowering\",\"period_after_planting\":\"30\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"inspection_stage\":\"Flowering\",\"period_after_planting\":\"55\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"inspection_stage\":\"50% pod filling\",\"period_after_planting\":\"80\",\"id\":null,\"_remove_\":\"0\"}},\"crop_varieties\":{\"3\":{\"name\":\"NABE1\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"name\":\"NABE2\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"name\":\"NABE15\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"name\":\"NABE16\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"name\":\"NABE17\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"name\":\"NABE18\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"name\":\"NABE19\",\"id\":\"9\",\"_remove_\":\"0\"}},\"_token\":\"s5fsulpKmNwcDBNpOG2YHOkJQEYGA56wrMb9po5Y\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/crops\"}', '2021-11-01 09:06:23', '2021-11-01 09:06:23'),
(1305, 1, 'admin/crops/3/edit', 'GET', '::1', '[]', '2021-11-01 09:06:24', '2021-11-01 09:06:24'),
(1306, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:06:38', '2021-11-01 09:06:38'),
(1307, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:06:40', '2021-11-01 09:06:40'),
(1308, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:06:43', '2021-11-01 09:06:43'),
(1309, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:06:47', '2021-11-01 09:06:47'),
(1310, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:06:51', '2021-11-01 09:06:51'),
(1311, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:07:36', '2021-11-01 09:07:36'),
(1312, 3, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"0779755798\",\"crop_id\":\"3\",\"lot_number\":\"1200\",\"size_of_land\":\"1900\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2021-12-01\",\"previous_crops\":\"Details\",\"planting_return_crops\":{\"3\":{\"crop_variety_id\":\"3\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"crop_variety_id\":\"3\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"crop_variety_id\":\"4\",\"id\":\"5\",\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"registerd_dealer\":\"1222\",\"latitude\":\"0.3130291\",\"longitude\":\"32.5290854\",\"_token\":\"77V4BLiFMUEHFN9DS9SAFlkMAm8fEAXgTvXfYbvo\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-01 09:07:44', '2021-11-01 09:07:44'),
(1313, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 09:07:45', '2021-11-01 09:07:45'),
(1314, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:07:54', '2021-11-01 09:07:54'),
(1315, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:07:56', '2021-11-01 09:07:56'),
(1316, 2, 'admin', 'GET', '::1', '[]', '2021-11-01 09:08:04', '2021-11-01 09:08:04'),
(1317, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:08:10', '2021-11-01 09:08:10'),
(1318, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:08:14', '2021-11-01 09:08:14'),
(1319, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:18:17', '2021-11-01 09:18:17'),
(1320, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:18:37', '2021-11-01 09:18:37'),
(1321, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:44:13', '2021-11-01 09:44:13'),
(1322, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:45:21', '2021-11-01 09:45:21'),
(1323, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 09:45:24', '2021-11-01 09:45:24'),
(1324, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 09:45:25', '2021-11-01 09:45:25'),
(1325, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:45:30', '2021-11-01 09:45:30'),
(1326, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:45:41', '2021-11-01 09:45:41'),
(1327, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:45:41', '2021-11-01 09:45:41'),
(1328, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 09:45:46', '2021-11-01 09:45:46'),
(1329, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 09:45:47', '2021-11-01 09:45:47'),
(1330, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:45:55', '2021-11-01 09:45:55'),
(1331, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:45:57', '2021-11-01 09:45:57'),
(1332, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-01 09:46:01', '2021-11-01 09:46:01'),
(1333, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 09:46:01', '2021-11-01 09:46:01'),
(1334, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:46:25', '2021-11-01 09:46:25'),
(1335, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 09:46:26', '2021-11-01 09:46:26'),
(1336, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 09:46:27', '2021-11-01 09:46:27'),
(1337, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 09:46:38', '2021-11-01 09:46:38'),
(1338, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:52:17', '2021-11-01 09:52:17'),
(1339, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 09:52:25', '2021-11-01 09:52:25'),
(1340, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:52:28', '2021-11-01 09:52:28'),
(1341, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:52:29', '2021-11-01 09:52:29'),
(1342, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\\/3\"}', '2021-11-01 09:52:33', '2021-11-01 09:52:33'),
(1343, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:52:34', '2021-11-01 09:52:34'),
(1344, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:52:35', '2021-11-01 09:52:35'),
(1345, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:52:56', '2021-11-01 09:52:56'),
(1346, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:52:58', '2021-11-01 09:52:58'),
(1347, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 09:52:59', '2021-11-01 09:52:59'),
(1348, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:53:48', '2021-11-01 09:53:48'),
(1349, 3, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"0779755798\",\"crop_id\":\"3\",\"lot_number\":\"1200\",\"size_of_land\":\"1900\",\"date_planted\":\"2021-11-01\",\"date_harvest\":\"2021-12-01\",\"previous_crops\":\"Details\",\"planting_return_crops\":{\"3\":{\"crop_variety_id\":\"3\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"crop_variety_id\":\"3\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"crop_variety_id\":\"4\",\"id\":\"5\",\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"registerd_dealer\":\"1222\",\"latitude\":\"0.3130291\",\"longitude\":\"32.5290854\",\"_token\":\"77V4BLiFMUEHFN9DS9SAFlkMAm8fEAXgTvXfYbvo\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-01 09:53:54', '2021-11-01 09:53:54'),
(1350, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:53:56', '2021-11-01 09:53:56'),
(1351, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:53:56', '2021-11-01 09:53:56'),
(1352, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 09:54:02', '2021-11-01 09:54:02'),
(1353, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:54:06', '2021-11-01 09:54:06'),
(1354, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:54:07', '2021-11-01 09:54:07'),
(1355, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:54:09', '2021-11-01 09:54:09'),
(1356, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\\/3\"}', '2021-11-01 09:54:13', '2021-11-01 09:54:13'),
(1357, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 09:56:32', '2021-11-01 09:56:32'),
(1358, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 09:56:53', '2021-11-01 09:56:53'),
(1359, 2, 'admin/planting-returns/3', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:57:18', '2021-11-01 09:57:18'),
(1360, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:57:19', '2021-11-01 09:57:19'),
(1361, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 09:57:21', '2021-11-01 09:57:21'),
(1362, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 09:57:24', '2021-11-01 09:57:24'),
(1363, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:00:32', '2021-11-01 10:00:32'),
(1364, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:00:39', '2021-11-01 10:00:39'),
(1365, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:00:43', '2021-11-01 10:00:43'),
(1366, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:05:49', '2021-11-01 10:05:49'),
(1367, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:06:08', '2021-11-01 10:06:08'),
(1368, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:06:12', '2021-11-01 10:06:12'),
(1369, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:06:35', '2021-11-01 10:06:35'),
(1370, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:06:38', '2021-11-01 10:06:38'),
(1371, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:07:34', '2021-11-01 10:07:34'),
(1372, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:07:36', '2021-11-01 10:07:36'),
(1373, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:07:40', '2021-11-01 10:07:40'),
(1374, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 10:07:40', '2021-11-01 10:07:40'),
(1375, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:07:45', '2021-11-01 10:07:45'),
(1376, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-01 10:07:48', '2021-11-01 10:07:48'),
(1377, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 10:07:48', '2021-11-01 10:07:48'),
(1378, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:08:18', '2021-11-01 10:08:18'),
(1379, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-01 10:08:20', '2021-11-01 10:08:20'),
(1380, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:10:32', '2021-11-01 10:10:32'),
(1381, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:10:34', '2021-11-01 10:10:34'),
(1382, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:10:37', '2021-11-01 10:10:37'),
(1383, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:11:13', '2021-11-01 10:11:13'),
(1384, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:11:14', '2021-11-01 10:11:14'),
(1385, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:11:17', '2021-11-01 10:11:17'),
(1386, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:12:17', '2021-11-01 10:12:17'),
(1387, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:12:18', '2021-11-01 10:12:18'),
(1388, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:12:21', '2021-11-01 10:12:21'),
(1389, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:13:54', '2021-11-01 10:13:54'),
(1390, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:13:56', '2021-11-01 10:13:56'),
(1391, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:13:58', '2021-11-01 10:13:58'),
(1392, 2, 'admin/planting-returns/3', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:14:41', '2021-11-01 10:14:41'),
(1393, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:14:42', '2021-11-01 10:14:42'),
(1394, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:14:50', '2021-11-01 10:14:50'),
(1395, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:15:12', '2021-11-01 10:15:12'),
(1396, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:15:14', '2021-11-01 10:15:14'),
(1397, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:15:16', '2021-11-01 10:15:16'),
(1398, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:28:56', '2021-11-01 10:28:56'),
(1399, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:28:58', '2021-11-01 10:28:58'),
(1400, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:29:01', '2021-11-01 10:29:01'),
(1401, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:29:14', '2021-11-01 10:29:14'),
(1402, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 10:31:07', '2021-11-01 10:31:07'),
(1403, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:34:26', '2021-11-01 10:34:26'),
(1404, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:34:27', '2021-11-01 10:34:27'),
(1405, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:34:30', '2021-11-01 10:34:30'),
(1406, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:41:23', '2021-11-01 10:41:23'),
(1407, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:41:25', '2021-11-01 10:41:25'),
(1408, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:41:27', '2021-11-01 10:41:27'),
(1409, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:41:53', '2021-11-01 10:41:53'),
(1410, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:41:55', '2021-11-01 10:41:55'),
(1411, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:42:37', '2021-11-01 10:42:37'),
(1412, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:42:46', '2021-11-01 10:42:46'),
(1413, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:42:58', '2021-11-01 10:42:58'),
(1414, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:44:52', '2021-11-01 10:44:52'),
(1415, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:44:55', '2021-11-01 10:44:55'),
(1416, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:45:55', '2021-11-01 10:45:55'),
(1417, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:45:56', '2021-11-01 10:45:56'),
(1418, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:45:58', '2021-11-01 10:45:58'),
(1419, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:45:58', '2021-11-01 10:45:58'),
(1420, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:46:19', '2021-11-01 10:46:19'),
(1421, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:46:21', '2021-11-01 10:46:21'),
(1422, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:46:21', '2021-11-01 10:46:21'),
(1423, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:46:32', '2021-11-01 10:46:32'),
(1424, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:46:51', '2021-11-01 10:46:51'),
(1425, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:46:53', '2021-11-01 10:46:53'),
(1426, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:46:55', '2021-11-01 10:46:55'),
(1427, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:47:14', '2021-11-01 10:47:14'),
(1428, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:47:15', '2021-11-01 10:47:15'),
(1429, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:47:17', '2021-11-01 10:47:17'),
(1430, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 10:48:32', '2021-11-01 10:48:32'),
(1431, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:48:34', '2021-11-01 10:48:34'),
(1432, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:48:37', '2021-11-01 10:48:37'),
(1433, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:49:40', '2021-11-01 10:49:40'),
(1434, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:49:42', '2021-11-01 10:49:42'),
(1435, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:51:58', '2021-11-01 10:51:58'),
(1436, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:52:01', '2021-11-01 10:52:01'),
(1437, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 10:52:01', '2021-11-01 10:52:01'),
(1438, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:53:30', '2021-11-01 10:53:30'),
(1439, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:53:34', '2021-11-01 10:53:34'),
(1440, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 10:55:07', '2021-11-01 10:55:07'),
(1441, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 10:55:08', '2021-11-01 10:55:08'),
(1442, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:04:11', '2021-11-01 11:04:11'),
(1443, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 11:04:14', '2021-11-01 11:04:14'),
(1444, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 11:05:36', '2021-11-01 11:05:36'),
(1445, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:05:38', '2021-11-01 11:05:38'),
(1446, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 11:05:40', '2021-11-01 11:05:40'),
(1447, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 11:05:41', '2021-11-01 11:05:41'),
(1448, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 11:10:05', '2021-11-01 11:10:05'),
(1449, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:10:15', '2021-11-01 11:10:15'),
(1450, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 11:10:18', '2021-11-01 11:10:18'),
(1451, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 11:10:18', '2021-11-01 11:10:18'),
(1452, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 11:10:44', '2021-11-01 11:10:44'),
(1453, 2, 'admin/planting-returns/3', 'GET', '::1', '[]', '2021-11-01 11:11:21', '2021-11-01 11:11:21'),
(1454, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:11:24', '2021-11-01 11:11:24'),
(1455, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\"}', '2021-11-01 11:11:28', '2021-11-01 11:11:28'),
(1456, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 11:11:28', '2021-11-01 11:11:28'),
(1457, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:11:37', '2021-11-01 11:11:37'),
(1458, 2, 'admin/planting-returns/3', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1Q7kp1fh06Z2kjSTrAE8X38JSDQgzFO2qiLgXjbc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-01 11:12:44', '2021-11-01 11:12:44'),
(1459, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-01 11:12:45', '2021-11-01 11:12:45'),
(1460, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:14:12', '2021-11-01 11:14:12'),
(1461, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 11:17:03', '2021-11-01 11:17:03'),
(1462, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:36:16', '2021-11-01 11:36:16'),
(1463, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:40:14', '2021-11-01 11:40:14'),
(1464, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:40:37', '2021-11-01 11:40:37'),
(1465, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:40:58', '2021-11-01 11:40:58'),
(1466, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:41:15', '2021-11-01 11:41:15'),
(1467, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:41:56', '2021-11-01 11:41:56'),
(1468, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:42:27', '2021-11-01 11:42:27'),
(1469, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:42:47', '2021-11-01 11:42:47'),
(1470, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:43:06', '2021-11-01 11:43:06'),
(1471, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:43:19', '2021-11-01 11:43:19'),
(1472, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:43:37', '2021-11-01 11:43:37'),
(1473, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:43:53', '2021-11-01 11:43:53'),
(1474, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:44:08', '2021-11-01 11:44:08'),
(1475, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:45:20', '2021-11-01 11:45:20'),
(1476, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:45:30', '2021-11-01 11:45:30'),
(1477, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:46:39', '2021-11-01 11:46:39'),
(1478, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:47:07', '2021-11-01 11:47:07'),
(1479, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:52:59', '2021-11-01 11:52:59'),
(1480, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:53:19', '2021-11-01 11:53:19'),
(1481, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:53:35', '2021-11-01 11:53:35'),
(1482, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:54:32', '2021-11-01 11:54:32'),
(1483, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 11:57:37', '2021-11-01 11:57:37'),
(1484, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 11:57:58', '2021-11-01 11:57:58'),
(1485, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 11:59:49', '2021-11-01 11:59:49'),
(1486, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:00:05', '2021-11-01 12:00:05'),
(1487, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:01:11', '2021-11-01 12:01:11'),
(1488, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:01:28', '2021-11-01 12:01:28'),
(1489, 2, 'admin/planting-returns/3/edit', 'GET', '::1', '[]', '2021-11-01 12:10:16', '2021-11-01 12:10:16'),
(1490, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:12:27', '2021-11-01 12:12:27'),
(1491, 1, 'admin', 'GET', '::1', '[]', '2021-11-01 12:12:39', '2021-11-01 12:12:39'),
(1492, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:12:49', '2021-11-01 12:12:49'),
(1493, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"SR10 - Plant inspection\",\"icon\":\"fa-adjust\",\"uri\":\"form-sr10s\",\"roles\":[null],\"permission\":null,\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\"}', '2021-11-01 12:14:10', '2021-11-01 12:14:10'),
(1494, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-01 12:14:11', '2021-11-01 12:14:11'),
(1495, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":31},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-11-01 12:14:23', '2021-11-01 12:14:23'),
(1496, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:14:24', '2021-11-01 12:14:24'),
(1497, 1, 'admin/auth/menu/31/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:14:26', '2021-11-01 12:14:26'),
(1498, 1, 'admin/auth/menu/31', 'PUT', '::1', '{\"parent_id\":\"25\",\"title\":\"SR10 - Plant inspection\",\"icon\":\"fa-wpforms\",\"uri\":\"form-sr10s\",\"roles\":[null],\"permission\":null,\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2021-11-01 12:14:42', '2021-11-01 12:14:42'),
(1499, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-01 12:14:42', '2021-11-01 12:14:42'),
(1500, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-01 12:14:45', '2021-11-01 12:14:45'),
(1501, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:15:01', '2021-11-01 12:15:01'),
(1502, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:15:09', '2021-11-01 12:15:09'),
(1503, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-11-01 12:15:17', '2021-11-01 12:15:17'),
(1504, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:16:19', '2021-11-01 12:16:19'),
(1505, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-11-01 12:16:30', '2021-11-01 12:16:30'),
(1506, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"16\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:16:43', '2021-11-01 12:16:43'),
(1507, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:16:44', '2021-11-01 12:16:44'),
(1508, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"14\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:16:48', '2021-11-01 12:16:48'),
(1509, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:16:49', '2021-11-01 12:16:49');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1510, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"11\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:16:53', '2021-11-01 12:16:53'),
(1511, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:16:54', '2021-11-01 12:16:54'),
(1512, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"7\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:16:58', '2021-11-01 12:16:58'),
(1513, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:16:59', '2021-11-01 12:16:59'),
(1514, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"17\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:17:04', '2021-11-01 12:17:04'),
(1515, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:17:04', '2021-11-01 12:17:04'),
(1516, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"13\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:17:08', '2021-11-01 12:17:08'),
(1517, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:17:09', '2021-11-01 12:17:09'),
(1518, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"10\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:17:12', '2021-11-01 12:17:12'),
(1519, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:17:13', '2021-11-01 12:17:13'),
(1520, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"9\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:17:16', '2021-11-01 12:17:16'),
(1521, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:17:16', '2021-11-01 12:17:16'),
(1522, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"5\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:17:22', '2021-11-01 12:17:22'),
(1523, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:17:22', '2021-11-01 12:17:22'),
(1524, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"19\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:17:29', '2021-11-01 12:17:29'),
(1525, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:17:29', '2021-11-01 12:17:29'),
(1526, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"15\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:17:34', '2021-11-01 12:17:34'),
(1527, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:17:35', '2021-11-01 12:17:35'),
(1528, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"12\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"aBoInc1nsQnZRMLwskwilwPlaUcYgmAah2hKZgR2\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-01 12:17:42', '2021-11-01 12:17:42'),
(1529, 1, 'admin/auth/users', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:17:42', '2021-11-01 12:17:42'),
(1530, 1, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:17:51', '2021-11-01 12:17:51'),
(1531, 1, 'admin/form-sr10s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 12:18:04', '2021-11-01 12:18:04'),
(1532, 3, 'admin/planting-returns/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 13:21:55', '2021-11-01 13:21:55'),
(1533, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 13:21:57', '2021-11-01 13:21:57'),
(1534, 1, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:05:54', '2021-11-01 15:05:54'),
(1535, 20, 'admin', 'GET', '::1', '[]', '2021-11-02 03:18:48', '2021-11-02 03:18:48'),
(1536, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:18:55', '2021-11-02 03:18:55'),
(1537, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:21:29', '2021-11-02 03:21:29'),
(1538, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:21:40', '2021-11-02 03:21:40'),
(1539, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:22:29', '2021-11-02 03:22:29'),
(1540, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:22:44', '2021-11-02 03:22:44'),
(1541, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:23:03', '2021-11-02 03:23:03'),
(1542, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:23:06', '2021-11-02 03:23:06'),
(1543, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:26:17', '2021-11-02 03:26:17'),
(1544, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:26:41', '2021-11-02 03:26:41'),
(1545, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:27:17', '2021-11-02 03:27:17'),
(1546, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:28:28', '2021-11-02 03:28:28'),
(1547, 20, 'admin/form-sr10s/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:29:01', '2021-11-02 03:29:01'),
(1548, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:29:03', '2021-11-02 03:29:03'),
(1549, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:30:08', '2021-11-02 03:30:08'),
(1550, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:30:08', '2021-11-02 03:30:08'),
(1551, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:30:14', '2021-11-02 03:30:14'),
(1552, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:30:20', '2021-11-02 03:30:20'),
(1553, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:33:38', '2021-11-02 03:33:38'),
(1554, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:34:34', '2021-11-02 03:34:34'),
(1555, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:35:17', '2021-11-02 03:35:17'),
(1556, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:36:46', '2021-11-02 03:36:46'),
(1557, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:36:56', '2021-11-02 03:36:56'),
(1558, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:36:56', '2021-11-02 03:36:56'),
(1559, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:36:57', '2021-11-02 03:36:57'),
(1560, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:36:58', '2021-11-02 03:36:58'),
(1561, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:36:59', '2021-11-02 03:36:59'),
(1562, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:37:00', '2021-11-02 03:37:00'),
(1563, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:37:00', '2021-11-02 03:37:00'),
(1564, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:37:01', '2021-11-02 03:37:01'),
(1565, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:37:02', '2021-11-02 03:37:02'),
(1566, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:37:03', '2021-11-02 03:37:03'),
(1567, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:38:41', '2021-11-02 03:38:41'),
(1568, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:38:50', '2021-11-02 03:38:50'),
(1569, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:39:01', '2021-11-02 03:39:01'),
(1570, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:39:01', '2021-11-02 03:39:01'),
(1571, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:39:02', '2021-11-02 03:39:02'),
(1572, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:39:02', '2021-11-02 03:39:02'),
(1573, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:39:03', '2021-11-02 03:39:03'),
(1574, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:39:04', '2021-11-02 03:39:04'),
(1575, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:39:05', '2021-11-02 03:39:05'),
(1576, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:41:49', '2021-11-02 03:41:49'),
(1577, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:41:57', '2021-11-02 03:41:57'),
(1578, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:42:08', '2021-11-02 03:42:08'),
(1579, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:46:02', '2021-11-02 03:46:02'),
(1580, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:49:36', '2021-11-02 03:49:36'),
(1581, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:50:39', '2021-11-02 03:50:39'),
(1582, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:51:26', '2021-11-02 03:51:26'),
(1583, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:52:06', '2021-11-02 03:52:06'),
(1584, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:52:10', '2021-11-02 03:52:10'),
(1585, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:52:30', '2021-11-02 03:52:30'),
(1586, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:52:33', '2021-11-02 03:52:33'),
(1587, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:52:37', '2021-11-02 03:52:37'),
(1588, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:52:41', '2021-11-02 03:52:41'),
(1589, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:53:01', '2021-11-02 03:53:01'),
(1590, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:53:05', '2021-11-02 03:53:05'),
(1591, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 03:55:06', '2021-11-02 03:55:06'),
(1592, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:07', '2021-11-02 03:55:07'),
(1593, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:07', '2021-11-02 03:55:07'),
(1594, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:08', '2021-11-02 03:55:08'),
(1595, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:09', '2021-11-02 03:55:09'),
(1596, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:09', '2021-11-02 03:55:09'),
(1597, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:10', '2021-11-02 03:55:10'),
(1598, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:10', '2021-11-02 03:55:10'),
(1599, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:11', '2021-11-02 03:55:11'),
(1600, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:11', '2021-11-02 03:55:11'),
(1601, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:11', '2021-11-02 03:55:11'),
(1602, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:12', '2021-11-02 03:55:12'),
(1603, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:12', '2021-11-02 03:55:12'),
(1604, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:14', '2021-11-02 03:55:14'),
(1605, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:15', '2021-11-02 03:55:15'),
(1606, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:15', '2021-11-02 03:55:15'),
(1607, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:16', '2021-11-02 03:55:16'),
(1608, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:16', '2021-11-02 03:55:16'),
(1609, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:17', '2021-11-02 03:55:17'),
(1610, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:18', '2021-11-02 03:55:18'),
(1611, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:19', '2021-11-02 03:55:19'),
(1612, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:20', '2021-11-02 03:55:20'),
(1613, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:55:42', '2021-11-02 03:55:42'),
(1614, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:56:00', '2021-11-02 03:56:00'),
(1615, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:56:48', '2021-11-02 03:56:48'),
(1616, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:57:14', '2021-11-02 03:57:14'),
(1617, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 03:57:34', '2021-11-02 03:57:34'),
(1618, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:01:58', '2021-11-02 04:01:58'),
(1619, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:02:07', '2021-11-02 04:02:07'),
(1620, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:02:34', '2021-11-02 04:02:34'),
(1621, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:02:43', '2021-11-02 04:02:43'),
(1622, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:03:01', '2021-11-02 04:03:01'),
(1623, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:03:11', '2021-11-02 04:03:11'),
(1624, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:07:50', '2021-11-02 04:07:50'),
(1625, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:08:14', '2021-11-02 04:08:14'),
(1626, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:08:22', '2021-11-02 04:08:22'),
(1627, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:09:00', '2021-11-02 04:09:00'),
(1628, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:09:09', '2021-11-02 04:09:09'),
(1629, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:11:20', '2021-11-02 04:11:20'),
(1630, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:12:06', '2021-11-02 04:12:06'),
(1631, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:12:26', '2021-11-02 04:12:26'),
(1632, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:12:36', '2021-11-02 04:12:36'),
(1633, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:12:47', '2021-11-02 04:12:47'),
(1634, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:12:57', '2021-11-02 04:12:57'),
(1635, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:13:19', '2021-11-02 04:13:19'),
(1636, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:13:48', '2021-11-02 04:13:48'),
(1637, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:14:10', '2021-11-02 04:14:10'),
(1638, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:19:31', '2021-11-02 04:19:31'),
(1639, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:21:34', '2021-11-02 04:21:34'),
(1640, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:21:49', '2021-11-02 04:21:49'),
(1641, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:23:14', '2021-11-02 04:23:14'),
(1642, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:23:24', '2021-11-02 04:23:24'),
(1643, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:23:31', '2021-11-02 04:23:31'),
(1644, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:23:52', '2021-11-02 04:23:52'),
(1645, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:24:33', '2021-11-02 04:24:33'),
(1646, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:24:42', '2021-11-02 04:24:42'),
(1647, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:25:34', '2021-11-02 04:25:34'),
(1648, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:26:10', '2021-11-02 04:26:10'),
(1649, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:26:23', '2021-11-02 04:26:23'),
(1650, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:26:43', '2021-11-02 04:26:43'),
(1651, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:27:31', '2021-11-02 04:27:31'),
(1652, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:27:57', '2021-11-02 04:27:57'),
(1653, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:30:06', '2021-11-02 04:30:06'),
(1654, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:31:32', '2021-11-02 04:31:32'),
(1655, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:32:16', '2021-11-02 04:32:16'),
(1656, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:34:38', '2021-11-02 04:34:38'),
(1657, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:34:52', '2021-11-02 04:34:52'),
(1658, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:35:55', '2021-11-02 04:35:55'),
(1659, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:36:00', '2021-11-02 04:36:00'),
(1660, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:37:27', '2021-11-02 04:37:27'),
(1661, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:38:01', '2021-11-02 04:38:01'),
(1662, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:40:32', '2021-11-02 04:40:32'),
(1663, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '[]', '2021-11-02 04:41:24', '2021-11-02 04:41:24'),
(1664, 20, 'admin/form-sr10s/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:42:22', '2021-11-02 04:42:22'),
(1665, 20, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:43:08', '2021-11-02 04:43:08'),
(1666, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:43:18', '2021-11-02 04:43:18'),
(1667, 2, 'admin', 'GET', '::1', '[]', '2021-11-02 04:43:49', '2021-11-02 04:43:49'),
(1668, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:44:00', '2021-11-02 04:44:00'),
(1669, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 04:44:37', '2021-11-02 04:44:37'),
(1670, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:44:41', '2021-11-02 04:44:41'),
(1671, 3, 'admin', 'GET', '::1', '[]', '2021-11-02 04:44:48', '2021-11-02 04:44:48'),
(1672, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:44:54', '2021-11-02 04:44:54'),
(1673, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:45:07', '2021-11-02 04:45:07'),
(1674, 3, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-02 04:51:01', '2021-11-02 04:51:01'),
(1675, 3, 'admin/planting-returns', 'POST', '::1', '{\"administrator_id\":\"3\",\"status\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"crop_id\":\"3\",\"lot_number\":\"1200\",\"size_of_land\":\"12\",\"date_planted\":\"2021-11-02\",\"date_harvest\":\"2022-03-05\",\"previous_crops\":\"Details\",\"planting_return_crops\":{\"new_1\":{\"crop_variety_id\":\"4\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"4\",\"id\":null,\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"amount_enclosed\":\"122\",\"registerd_dealer\":\"Isaac\",\"latitude\":\"0.3130291\",\"longitude\":\"Uganda\",\"_token\":\"qJEId4TxRztCw3h2gOSqoNhxv2i5YCfYOiT9wb73\"}', '2021-11-02 04:52:08', '2021-11-02 04:52:08'),
(1676, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 04:52:08', '2021-11-02 04:52:08'),
(1677, 1, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 04:52:30', '2021-11-02 04:52:30'),
(1678, 1, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:52:41', '2021-11-02 04:52:41'),
(1679, 1, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:52:46', '2021-11-02 04:52:46'),
(1680, 1, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 04:54:06', '2021-11-02 04:54:06'),
(1681, 1, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"svEev43WCQb2YsE3Cig52i3iGs9krmBcNGRN6Kpm\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-02 04:55:40', '2021-11-02 04:55:40'),
(1682, 1, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 04:55:40', '2021-11-02 04:55:40'),
(1683, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:55:47', '2021-11-02 04:55:47'),
(1684, 1, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:57:19', '2021-11-02 04:57:19'),
(1685, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:57:23', '2021-11-02 04:57:23'),
(1686, 3, 'admin/planting-returns/4', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:57:30', '2021-11-02 04:57:30'),
(1687, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:57:35', '2021-11-02 04:57:35'),
(1688, 3, 'admin/planting-returns/4', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:57:37', '2021-11-02 04:57:37'),
(1689, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:57:39', '2021-11-02 04:57:39'),
(1690, 1, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:57:43', '2021-11-02 04:57:43'),
(1691, 1, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:58:00', '2021-11-02 04:58:00'),
(1692, 1, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:58:25', '2021-11-02 04:58:25'),
(1693, 1, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:58:27', '2021-11-02 04:58:27'),
(1694, 1, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:58:29', '2021-11-02 04:58:29'),
(1695, 1, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 04:59:28', '2021-11-02 04:59:28'),
(1696, 1, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:01:45', '2021-11-02 05:01:45'),
(1697, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:02:31', '2021-11-02 05:02:31'),
(1698, 20, 'admin', 'GET', '::1', '[]', '2021-11-02 05:02:47', '2021-11-02 05:02:47'),
(1699, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:03:01', '2021-11-02 05:03:01'),
(1700, 20, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:03:03', '2021-11-02 05:03:03'),
(1701, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:03:12', '2021-11-02 05:03:12'),
(1702, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:03:37', '2021-11-02 05:03:37'),
(1703, 20, 'admin/form-sr10s/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:03:45', '2021-11-02 05:03:45'),
(1704, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:03:50', '2021-11-02 05:03:50'),
(1705, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:04:04', '2021-11-02 05:04:04'),
(1706, 20, 'admin/form-sr10s/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:04:19', '2021-11-02 05:04:19'),
(1707, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:04:21', '2021-11-02 05:04:21'),
(1708, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:04:30', '2021-11-02 05:04:30'),
(1709, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:05:32', '2021-11-02 05:05:32'),
(1710, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:05:33', '2021-11-02 05:05:33'),
(1711, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:05:35', '2021-11-02 05:05:35'),
(1712, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:06:30', '2021-11-02 05:06:30'),
(1713, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:06:33', '2021-11-02 05:06:33'),
(1714, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:06:40', '2021-11-02 05:06:40'),
(1715, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:08:12', '2021-11-02 05:08:12'),
(1716, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:08:15', '2021-11-02 05:08:15'),
(1717, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:14:33', '2021-11-02 05:14:33'),
(1718, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:15:23', '2021-11-02 05:15:23'),
(1719, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:15:25', '2021-11-02 05:15:25'),
(1720, 20, 'admin/form-sr10s/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:15:28', '2021-11-02 05:15:28'),
(1721, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:15:31', '2021-11-02 05:15:31'),
(1722, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:15:34', '2021-11-02 05:15:34'),
(1723, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:15:39', '2021-11-02 05:15:39'),
(1724, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:15:41', '2021-11-02 05:15:41'),
(1725, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:17:05', '2021-11-02 05:17:05'),
(1726, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:17:21', '2021-11-02 05:17:21'),
(1727, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:17:28', '2021-11-02 05:17:28'),
(1728, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:17:30', '2021-11-02 05:17:30'),
(1729, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:18:31', '2021-11-02 05:18:31'),
(1730, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:19:08', '2021-11-02 05:19:08'),
(1731, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:19:16', '2021-11-02 05:19:16'),
(1732, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 05:19:21', '2021-11-02 05:19:21'),
(1733, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:19:49', '2021-11-02 05:19:49'),
(1734, 2, 'admin', 'GET', '::1', '[]', '2021-11-02 05:19:57', '2021-11-02 05:19:57'),
(1735, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:20:05', '2021-11-02 05:20:05'),
(1736, 2, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:20:08', '2021-11-02 05:20:08'),
(1737, 2, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:21:07', '2021-11-02 05:21:07'),
(1738, 2, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:21:27', '2021-11-02 05:21:27'),
(1739, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:21:31', '2021-11-02 05:21:31'),
(1740, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:21:34', '2021-11-02 05:21:34'),
(1741, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:23:46', '2021-11-02 05:23:46'),
(1742, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"5\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-02\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-12-27\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"administrator_id\":\"20\",\"stage\":\"50% pod filling\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-21\",\"id\":\"7\",\"_remove_\":\"0\"}},\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\"}', '2021-11-02 05:24:05', '2021-11-02 05:24:05'),
(1743, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 05:24:05', '2021-11-02 05:24:05'),
(1744, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:24:09', '2021-11-02 05:24:09'),
(1745, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:24:16', '2021-11-02 05:24:16'),
(1746, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:24:22', '2021-11-02 05:24:22'),
(1747, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:24:38', '2021-11-02 05:24:38'),
(1748, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:25:00', '2021-11-02 05:25:00'),
(1749, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:25:08', '2021-11-02 05:25:08'),
(1750, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:25:11', '2021-11-02 05:25:11'),
(1751, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:25:41', '2021-11-02 05:25:41'),
(1752, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:26:21', '2021-11-02 05:26:21'),
(1753, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:26:57', '2021-11-02 05:26:57'),
(1754, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:27:14', '2021-11-02 05:27:14'),
(1755, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:27:17', '2021-11-02 05:27:17'),
(1756, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:27:27', '2021-11-02 05:27:27'),
(1757, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:29:33', '2021-11-02 05:29:33'),
(1758, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:29:49', '2021-11-02 05:29:49'),
(1759, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"5\",\"_model\":\"App_Models_FormSr10\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-02 05:29:55', '2021-11-02 05:29:55'),
(1760, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:29:56', '2021-11-02 05:29:56'),
(1761, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"6\",\"_model\":\"App_Models_FormSr10\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-02 05:30:01', '2021-11-02 05:30:01'),
(1762, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:30:01', '2021-11-02 05:30:01'),
(1763, 2, 'admin/form-sr10s/7', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\"}', '2021-11-02 05:30:08', '2021-11-02 05:30:08'),
(1764, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"7\",\"_model\":\"App_Models_FormSr10\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-02 05:30:20', '2021-11-02 05:30:20'),
(1765, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:30:21', '2021-11-02 05:30:21'),
(1766, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:30:26', '2021-11-02 05:30:26'),
(1767, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:30:30', '2021-11-02 05:30:30'),
(1768, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-02 05:30:37', '2021-11-02 05:30:37'),
(1769, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:30:38', '2021-11-02 05:30:38'),
(1770, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:32:21', '2021-11-02 05:32:21'),
(1771, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:21', '2021-11-02 05:32:21'),
(1772, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:21', '2021-11-02 05:32:21'),
(1773, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:22', '2021-11-02 05:32:22'),
(1774, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:22', '2021-11-02 05:32:22'),
(1775, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:23', '2021-11-02 05:32:23'),
(1776, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:24', '2021-11-02 05:32:24'),
(1777, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:25', '2021-11-02 05:32:25'),
(1778, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:26', '2021-11-02 05:32:26'),
(1779, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:35', '2021-11-02 05:32:35'),
(1780, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:32:42', '2021-11-02 05:32:42'),
(1781, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:33:35', '2021-11-02 05:33:35'),
(1782, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:34:10', '2021-11-02 05:34:10'),
(1783, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\"}', '2021-11-02 05:34:22', '2021-11-02 05:34:22'),
(1784, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:34:22', '2021-11-02 05:34:22'),
(1785, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '[]', '2021-11-02 05:34:55', '2021-11-02 05:34:55'),
(1786, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\"}', '2021-11-02 05:34:59', '2021-11-02 05:34:59'),
(1787, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 05:34:59', '2021-11-02 05:34:59'),
(1788, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:35:03', '2021-11-02 05:35:03'),
(1789, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:35:10', '2021-11-02 05:35:10'),
(1790, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:35:18', '2021-11-02 05:35:18'),
(1791, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:35:18', '2021-11-02 05:35:18'),
(1792, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:35:18', '2021-11-02 05:35:18'),
(1793, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:35:19', '2021-11-02 05:35:19'),
(1794, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:35:19', '2021-11-02 05:35:19'),
(1795, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:35:20', '2021-11-02 05:35:20'),
(1796, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:35:20', '2021-11-02 05:35:20'),
(1797, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:35:21', '2021-11-02 05:35:21'),
(1798, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:35:22', '2021-11-02 05:35:22'),
(1799, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-02 05:35:23', '2021-11-02 05:35:23'),
(1800, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:35:23', '2021-11-02 05:35:23'),
(1801, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:35:24', '2021-11-02 05:35:24'),
(1802, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:35:28', '2021-11-02 05:35:28'),
(1803, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"8\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-02\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-12-27\",\"id\":\"9\",\"_remove_\":\"0\"},\"10\":{\"administrator_id\":\"20\",\"stage\":\"50% pod filling\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-21\",\"id\":\"10\",\"_remove_\":\"0\"}},\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\"}', '2021-11-02 05:35:49', '2021-11-02 05:35:49'),
(1804, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 05:35:50', '2021-11-02 05:35:50'),
(1805, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:35:52', '2021-11-02 05:35:52'),
(1806, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:35:58', '2021-11-02 05:35:58'),
(1807, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"8\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-01\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-12-27\",\"id\":\"9\",\"_remove_\":\"0\"},\"10\":{\"administrator_id\":\"20\",\"stage\":\"50% pod filling\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-21\",\"id\":\"10\",\"_remove_\":\"0\"}},\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-02 05:36:06', '2021-11-02 05:36:06'),
(1808, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 05:36:06', '2021-11-02 05:36:06'),
(1809, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:36:09', '2021-11-02 05:36:09'),
(1810, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:36:12', '2021-11-02 05:36:12'),
(1811, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:36:16', '2021-11-02 05:36:16'),
(1812, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:38:47', '2021-11-02 05:38:47'),
(1813, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"8\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-01\",\"id\":\"8\",\"_remove_\":\"1\"},\"9\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-12-27\",\"id\":\"9\",\"_remove_\":\"1\"},\"10\":{\"administrator_id\":\"20\",\"stage\":\"50% pod filling\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-21\",\"id\":\"10\",\"_remove_\":\"1\"}},\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-02 05:38:52', '2021-11-02 05:38:52'),
(1814, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 05:38:53', '2021-11-02 05:38:53'),
(1815, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:38:56', '2021-11-02 05:38:56'),
(1816, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:39:26', '2021-11-02 05:39:26'),
(1817, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\"}', '2021-11-02 05:39:29', '2021-11-02 05:39:29'),
(1818, 2, 'admin/planting-returns/4', 'GET', '::1', '[]', '2021-11-02 05:41:21', '2021-11-02 05:41:21'),
(1819, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:41:26', '2021-11-02 05:41:26'),
(1820, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:41:28', '2021-11-02 05:41:28'),
(1821, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:41:52', '2021-11-02 05:41:52'),
(1822, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\"}', '2021-11-02 05:41:56', '2021-11-02 05:41:56'),
(1823, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 05:41:56', '2021-11-02 05:41:56'),
(1824, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:42:00', '2021-11-02 05:42:00'),
(1825, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:42:05', '2021-11-02 05:42:05'),
(1826, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:42:11', '2021-11-02 05:42:11'),
(1827, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:11', '2021-11-02 05:42:11'),
(1828, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:12', '2021-11-02 05:42:12'),
(1829, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:12', '2021-11-02 05:42:12'),
(1830, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:13', '2021-11-02 05:42:13'),
(1831, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:13', '2021-11-02 05:42:13'),
(1832, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:14', '2021-11-02 05:42:14'),
(1833, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:14', '2021-11-02 05:42:14'),
(1834, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:15', '2021-11-02 05:42:15'),
(1835, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:16', '2021-11-02 05:42:16'),
(1836, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:16', '2021-11-02 05:42:16'),
(1837, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:17', '2021-11-02 05:42:17'),
(1838, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:18', '2021-11-02 05:42:18'),
(1839, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:42:38', '2021-11-02 05:42:38'),
(1840, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:42:46', '2021-11-02 05:42:46'),
(1841, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:44:29', '2021-11-02 05:44:29'),
(1842, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\"}', '2021-11-02 05:44:32', '2021-11-02 05:44:32'),
(1843, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 05:44:33', '2021-11-02 05:44:33'),
(1844, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:44:53', '2021-11-02 05:44:53'),
(1845, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:45:04', '2021-11-02 05:45:04'),
(1846, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-02 05:45:20', '2021-11-02 05:45:20'),
(1847, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 05:45:31', '2021-11-02 05:45:31'),
(1848, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:45:34', '2021-11-02 05:45:34'),
(1849, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:45:37', '2021-11-02 05:45:37'),
(1850, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:45:40', '2021-11-02 05:45:40'),
(1851, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:45:42', '2021-11-02 05:45:42'),
(1852, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:45:45', '2021-11-02 05:45:45'),
(1853, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:45:48', '2021-11-02 05:45:48'),
(1854, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"11\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-02\",\"id\":\"11\",\"_remove_\":\"0\"},\"12\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-12-27\",\"id\":\"12\",\"_remove_\":\"0\"},\"13\":{\"administrator_id\":\"20\",\"stage\":\"50% pod filling\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-21\",\"id\":\"13\",\"_remove_\":\"0\"}},\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-02 05:46:02', '2021-11-02 05:46:02'),
(1855, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 05:46:02', '2021-11-02 05:46:02'),
(1856, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:46:05', '2021-11-02 05:46:05'),
(1857, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:46:07', '2021-11-02 05:46:07'),
(1858, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:46:13', '2021-11-02 05:46:13'),
(1859, 2, 'admin/planting-returns/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:46:18', '2021-11-02 05:46:18');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1860, 2, 'admin/planting-returns/4', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"11\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-02\",\"id\":\"11\",\"_remove_\":\"0\"},\"12\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-09-07\",\"id\":\"12\",\"_remove_\":\"0\"},\"13\":{\"administrator_id\":\"20\",\"stage\":\"50% pod filling\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-21\",\"id\":\"13\",\"_remove_\":\"0\"}},\"_token\":\"z3Zp6EdMoLLzWlzjI141fhAedsB6vvGojaYeJctX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-02 05:46:42', '2021-11-02 05:46:42'),
(1861, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 05:46:42', '2021-11-02 05:46:42'),
(1862, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:46:46', '2021-11-02 05:46:46'),
(1863, 20, 'admin/form-sr10s/12/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:46:48', '2021-11-02 05:46:48'),
(1864, 20, 'admin/form-sr10s/12/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:47:20', '2021-11-02 05:47:20'),
(1865, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:47:27', '2021-11-02 05:47:27'),
(1866, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:47:30', '2021-11-02 05:47:30'),
(1867, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:49:51', '2021-11-02 05:49:51'),
(1868, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 06:29:31', '2021-11-02 06:29:31'),
(1869, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:41:44', '2021-11-02 06:41:44'),
(1870, 3, 'admin', 'GET', '::1', '[]', '2021-11-02 06:42:05', '2021-11-02 06:42:05'),
(1871, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:42:17', '2021-11-02 06:42:17'),
(1872, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:42:29', '2021-11-02 06:42:29'),
(1873, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:42:32', '2021-11-02 06:42:32'),
(1874, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:43:09', '2021-11-02 06:43:09'),
(1875, 20, 'admin', 'GET', '::1', '[]', '2021-11-02 06:43:19', '2021-11-02 06:43:19'),
(1876, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:43:24', '2021-11-02 06:43:24'),
(1877, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:43:28', '2021-11-02 06:43:28'),
(1878, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 06:48:05', '2021-11-02 06:48:05'),
(1879, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 06:51:28', '2021-11-02 06:51:28'),
(1880, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 06:53:15', '2021-11-02 06:53:15'),
(1881, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:54:46', '2021-11-02 06:54:46'),
(1882, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 06:55:58', '2021-11-02 06:55:58'),
(1883, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:57:28', '2021-11-02 06:57:28'),
(1884, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:57:37', '2021-11-02 06:57:37'),
(1885, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 06:59:53', '2021-11-02 06:59:53'),
(1886, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 06:59:56', '2021-11-02 06:59:56'),
(1887, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:01:11', '2021-11-02 07:01:11'),
(1888, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:01:58', '2021-11-02 07:01:58'),
(1889, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:02:03', '2021-11-02 07:02:03'),
(1890, 20, 'admin/form-sr10s/11', 'GET', '::1', '[]', '2021-11-02 07:03:50', '2021-11-02 07:03:50'),
(1891, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:03:55', '2021-11-02 07:03:55'),
(1892, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:03:56', '2021-11-02 07:03:56'),
(1893, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:04:28', '2021-11-02 07:04:28'),
(1894, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:04:30', '2021-11-02 07:04:30'),
(1895, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:24:42', '2021-11-02 07:24:42'),
(1896, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:24:45', '2021-11-02 07:24:45'),
(1897, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:26:11', '2021-11-02 07:26:11'),
(1898, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:26:13', '2021-11-02 07:26:13'),
(1899, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:28:51', '2021-11-02 07:28:51'),
(1900, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:28:54', '2021-11-02 07:28:54'),
(1901, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:29:34', '2021-11-02 07:29:34'),
(1902, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:29:36', '2021-11-02 07:29:36'),
(1903, 20, 'admin/form-sr10s/11', 'GET', '::1', '[]', '2021-11-02 07:30:59', '2021-11-02 07:30:59'),
(1904, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:31:02', '2021-11-02 07:31:02'),
(1905, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:31:05', '2021-11-02 07:31:05'),
(1906, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:31:09', '2021-11-02 07:31:09'),
(1907, 20, 'admin/form-sr10s/11', 'GET', '::1', '[]', '2021-11-02 07:31:20', '2021-11-02 07:31:20'),
(1908, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:31:23', '2021-11-02 07:31:23'),
(1909, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:31:31', '2021-11-02 07:31:31'),
(1910, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:31:31', '2021-11-02 07:31:31'),
(1911, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:31:36', '2021-11-02 07:31:36'),
(1912, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 07:34:41', '2021-11-02 07:34:41'),
(1913, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:34:44', '2021-11-02 07:34:44'),
(1914, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:34:44', '2021-11-02 07:34:44'),
(1915, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:35:49', '2021-11-02 07:35:49'),
(1916, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-02 07:35:51', '2021-11-02 07:35:51'),
(1917, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:35:51', '2021-11-02 07:35:51'),
(1918, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:36:45', '2021-11-02 07:36:45'),
(1919, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-02 07:36:47', '2021-11-02 07:36:47'),
(1920, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:37:39', '2021-11-02 07:37:39'),
(1921, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:37:42', '2021-11-02 07:37:42'),
(1922, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:37:58', '2021-11-02 07:37:58'),
(1923, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:38:01', '2021-11-02 07:38:01'),
(1924, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:38:25', '2021-11-02 07:38:25'),
(1925, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:38:28', '2021-11-02 07:38:28'),
(1926, 20, 'admin/form-sr10s/11', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:38:44', '2021-11-02 07:38:44'),
(1927, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:38:47', '2021-11-02 07:38:47'),
(1928, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:38:52', '2021-11-02 07:38:52'),
(1929, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:39:29', '2021-11-02 07:39:29'),
(1930, 20, 'admin/form-sr10s/11', 'GET', '::1', '[]', '2021-11-02 07:40:07', '2021-11-02 07:40:07'),
(1931, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:40:09', '2021-11-02 07:40:09'),
(1932, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:40:11', '2021-11-02 07:40:11'),
(1933, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:40:40', '2021-11-02 07:40:40'),
(1934, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:40:42', '2021-11-02 07:40:42'),
(1935, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:41:07', '2021-11-02 07:41:07'),
(1936, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:41:10', '2021-11-02 07:41:10'),
(1937, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:41:30', '2021-11-02 07:41:30'),
(1938, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:41:33', '2021-11-02 07:41:33'),
(1939, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:41:55', '2021-11-02 07:41:55'),
(1940, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:41:58', '2021-11-02 07:41:58'),
(1941, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:42:23', '2021-11-02 07:42:23'),
(1942, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:42:24', '2021-11-02 07:42:24'),
(1943, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:42:25', '2021-11-02 07:42:25'),
(1944, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:42:29', '2021-11-02 07:42:29'),
(1945, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-02 07:42:33', '2021-11-02 07:42:33'),
(1946, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:42:33', '2021-11-02 07:42:33'),
(1947, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:42:35', '2021-11-02 07:42:35'),
(1948, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 07:42:40', '2021-11-02 07:42:40'),
(1949, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:42:40', '2021-11-02 07:42:40'),
(1950, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:43:52', '2021-11-02 07:43:52'),
(1951, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:43:54', '2021-11-02 07:43:54'),
(1952, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-02 07:43:57', '2021-11-02 07:43:57'),
(1953, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:43:57', '2021-11-02 07:43:57'),
(1954, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:45:28', '2021-11-02 07:45:28'),
(1955, 20, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:45:34', '2021-11-02 07:45:34'),
(1956, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:45:39', '2021-11-02 07:45:39'),
(1957, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:45:40', '2021-11-02 07:45:40'),
(1958, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:46:45', '2021-11-02 07:46:45'),
(1959, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:46:50', '2021-11-02 07:46:50'),
(1960, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-02 07:46:52', '2021-11-02 07:46:52'),
(1961, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:46:53', '2021-11-02 07:46:53'),
(1962, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:47:12', '2021-11-02 07:47:12'),
(1963, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:47:14', '2021-11-02 07:47:14'),
(1964, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-02 07:47:17', '2021-11-02 07:47:17'),
(1965, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 07:47:17', '2021-11-02 07:47:17'),
(1966, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:47:31', '2021-11-02 07:47:31'),
(1967, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:48:50', '2021-11-02 07:48:50'),
(1968, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 07:50:56', '2021-11-02 07:50:56'),
(1969, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 07:51:09', '2021-11-02 07:51:09'),
(1970, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 07:51:22', '2021-11-02 07:51:22'),
(1971, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:09:46', '2021-11-02 08:09:46'),
(1972, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:10:45', '2021-11-02 08:10:45'),
(1973, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:11:07', '2021-11-02 08:11:07'),
(1974, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:12:00', '2021-11-02 08:12:00'),
(1975, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:12:17', '2021-11-02 08:12:17'),
(1976, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 08:12:30', '2021-11-02 08:12:30'),
(1977, 20, 'admin/form-sr10s/11', 'GET', '::1', '[]', '2021-11-02 08:12:35', '2021-11-02 08:12:35'),
(1978, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 08:12:38', '2021-11-02 08:12:38'),
(1979, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 08:12:40', '2021-11-02 08:12:40'),
(1980, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 08:12:41', '2021-11-02 08:12:41'),
(1981, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 08:12:45', '2021-11-02 08:12:45'),
(1982, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-02 08:13:09', '2021-11-02 08:13:09'),
(1983, 20, 'admin/form-sr10s/11', 'GET', '::1', '[]', '2021-11-02 08:13:10', '2021-11-02 08:13:10'),
(1984, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 08:13:34', '2021-11-02 08:13:34'),
(1985, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 08:13:37', '2021-11-02 08:13:37'),
(1986, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:13:37', '2021-11-02 08:13:37'),
(1987, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 08:14:02', '2021-11-02 08:14:02'),
(1988, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:15:54', '2021-11-02 08:15:54'),
(1989, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:34:05', '2021-11-02 08:34:05'),
(1990, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:35:20', '2021-11-02 08:35:20'),
(1991, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:35:41', '2021-11-02 08:35:41'),
(1992, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 08:36:11', '2021-11-02 08:36:11'),
(1993, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:36:17', '2021-11-02 08:36:17'),
(1994, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:36:29', '2021-11-02 08:36:29'),
(1995, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 08:38:46', '2021-11-02 08:38:46'),
(1996, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 08:41:02', '2021-11-02 08:41:02'),
(1997, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:41:05', '2021-11-02 08:41:05'),
(1998, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:41:24', '2021-11-02 08:41:24'),
(1999, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:41:51', '2021-11-02 08:41:51'),
(2000, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:42:50', '2021-11-02 08:42:50'),
(2001, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:44:33', '2021-11-02 08:44:33'),
(2002, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 08:46:59', '2021-11-02 08:46:59'),
(2003, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 08:47:31', '2021-11-02 08:47:31'),
(2004, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 08:52:43', '2021-11-02 08:52:43'),
(2005, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:12:33', '2021-11-02 09:12:33'),
(2006, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:12:44', '2021-11-02 09:12:44'),
(2007, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:12:54', '2021-11-02 09:12:54'),
(2008, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:14:17', '2021-11-02 09:14:17'),
(2009, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:15:48', '2021-11-02 09:15:48'),
(2010, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:15:56', '2021-11-02 09:15:56'),
(2011, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:17:15', '2021-11-02 09:17:15'),
(2012, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:17:31', '2021-11-02 09:17:31'),
(2013, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:17:58', '2021-11-02 09:17:58'),
(2014, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:18:11', '2021-11-02 09:18:11'),
(2015, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:18:31', '2021-11-02 09:18:31'),
(2016, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:18:39', '2021-11-02 09:18:39'),
(2017, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:18:49', '2021-11-02 09:18:49'),
(2018, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:19:14', '2021-11-02 09:19:14'),
(2019, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:19:29', '2021-11-02 09:19:29'),
(2020, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:19:37', '2021-11-02 09:19:37'),
(2021, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:20:26', '2021-11-02 09:20:26'),
(2022, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:21:17', '2021-11-02 09:21:17'),
(2023, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:21:19', '2021-11-02 09:21:19'),
(2024, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:22:15', '2021-11-02 09:22:15'),
(2025, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:22:38', '2021-11-02 09:22:38'),
(2026, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:23:09', '2021-11-02 09:23:09'),
(2027, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:23:15', '2021-11-02 09:23:15'),
(2028, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:23:42', '2021-11-02 09:23:42'),
(2029, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:24:13', '2021-11-02 09:24:13'),
(2030, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:24:45', '2021-11-02 09:24:45'),
(2031, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:25:15', '2021-11-02 09:25:15'),
(2032, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:25:22', '2021-11-02 09:25:22'),
(2033, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:25:33', '2021-11-02 09:25:33'),
(2034, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:26:25', '2021-11-02 09:26:25'),
(2035, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:26:39', '2021-11-02 09:26:39'),
(2036, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:26:44', '2021-11-02 09:26:44'),
(2037, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '[]', '2021-11-02 09:33:45', '2021-11-02 09:33:45'),
(2038, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 09:41:33', '2021-11-02 09:41:33'),
(2039, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:41:38', '2021-11-02 09:41:38'),
(2040, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-02 09:41:40', '2021-11-02 09:41:40'),
(2041, 20, 'admin/form-sr10s/11', 'GET', '::1', '[]', '2021-11-02 09:42:13', '2021-11-02 09:42:13'),
(2042, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:42:16', '2021-11-02 09:42:16'),
(2043, 20, 'admin/form-sr10s/11', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"UHhjOcYNijqPZXycxteqPJSJCciJJ6WjRYZHDjUC\",\"_method\":\"PUT\"}', '2021-11-02 09:42:18', '2021-11-02 09:42:18'),
(2044, 20, 'admin', 'GET', '::1', '[]', '2021-11-02 09:42:58', '2021-11-02 09:42:58'),
(2045, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:43:04', '2021-11-02 09:43:04'),
(2046, 2, 'admin', 'GET', '::1', '[]', '2021-11-02 09:43:12', '2021-11-02 09:43:12'),
(2047, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:43:17', '2021-11-02 09:43:17'),
(2048, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"4\",\"_model\":\"App_Models_PlantingReturn\",\"_token\":\"mx9YLLr2qrmTbTklpOe6PH0B2C2ZIfoIB9Gf1zpW\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-02 09:43:23', '2021-11-02 09:43:23'),
(2049, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:43:24', '2021-11-02 09:43:24'),
(2050, 2, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:43:27', '2021-11-02 09:43:27'),
(2051, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 09:43:28', '2021-11-02 09:43:28'),
(2052, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:43:36', '2021-11-02 09:43:36'),
(2053, 3, 'admin', 'GET', '::1', '[]', '2021-11-02 09:43:45', '2021-11-02 09:43:45'),
(2054, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:44:00', '2021-11-02 09:44:00'),
(2055, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:44:02', '2021-11-02 09:44:02'),
(2056, 3, 'admin/planting-returns', 'POST', '::1', '{\"administrator_id\":\"3\",\"status\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"crop_id\":\"3\",\"lot_number\":\"1200\",\"size_of_land\":\"12\",\"date_planted\":\"2021-11-02\",\"date_harvest\":\"2022-02-03\",\"previous_crops\":\"Details\",\"planting_return_crops\":{\"new_1\":{\"crop_variety_id\":\"3\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"4\",\"id\":null,\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"amount_enclosed\":\"22\",\"registerd_dealer\":\"Muhindo\",\"latitude\":\"0.313522619081599\",\"longitude\":\"32.529600384130845\",\"_token\":\"ynjI3X54hvZpzbiilriharCoIcWTDZ7eS0xF4CCz\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-02 09:45:05', '2021-11-02 09:45:05'),
(2057, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 09:45:05', '2021-11-02 09:45:05'),
(2058, 3, 'admin/planting-returns/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:45:08', '2021-11-02 09:45:08'),
(2059, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:45:15', '2021-11-02 09:45:15'),
(2060, 3, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:45:19', '2021-11-02 09:45:19'),
(2061, 3, 'admin/planting-returns/5/edit', 'GET', '::1', '[]', '2021-11-02 09:47:17', '2021-11-02 09:47:17'),
(2062, 3, 'admin/form-sr10s/11', 'GET', '::1', '[]', '2021-11-02 09:47:24', '2021-11-02 09:47:24'),
(2063, 3, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:47:27', '2021-11-02 09:47:27'),
(2064, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:47:43', '2021-11-02 09:47:43'),
(2065, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:47:46', '2021-11-02 09:47:46'),
(2066, 3, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:47:52', '2021-11-02 09:47:52'),
(2067, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:47:57', '2021-11-02 09:47:57'),
(2068, 3, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:48:00', '2021-11-02 09:48:00'),
(2069, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:48:05', '2021-11-02 09:48:05'),
(2070, 2, 'admin', 'GET', '::1', '[]', '2021-11-02 09:48:13', '2021-11-02 09:48:13'),
(2071, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:49:41', '2021-11-02 09:49:41'),
(2072, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:49:43', '2021-11-02 09:49:43'),
(2073, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:49:48', '2021-11-02 09:49:48'),
(2074, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:50:05', '2021-11-02 09:50:05'),
(2075, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:50:06', '2021-11-02 09:50:06'),
(2076, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '[]', '2021-11-02 09:50:14', '2021-11-02 09:50:14'),
(2077, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '[]', '2021-11-02 09:51:22', '2021-11-02 09:51:22'),
(2078, 2, 'admin/planting-returns/5', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"2fbUYXobjt2nuyfvOgirmklUwbHejqGbRxjxq6HP\",\"_method\":\"PUT\"}', '2021-11-02 09:51:32', '2021-11-02 09:51:32'),
(2079, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 09:51:32', '2021-11-02 09:51:32'),
(2080, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:51:37', '2021-11-02 09:51:37'),
(2081, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:51:41', '2021-11-02 09:51:41'),
(2082, 2, 'admin/planting-returns/5', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"2fbUYXobjt2nuyfvOgirmklUwbHejqGbRxjxq6HP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-02 09:52:50', '2021-11-02 09:52:50'),
(2083, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 09:52:51', '2021-11-02 09:52:51'),
(2084, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:53:07', '2021-11-02 09:53:07'),
(2085, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:53:21', '2021-11-02 09:53:21'),
(2086, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"status\",\"type\":\"desc\"}}', '2021-11-02 09:53:27', '2021-11-02 09:53:27'),
(2087, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"status\",\"type\":\"asc\"}}', '2021-11-02 09:53:29', '2021-11-02 09:53:29'),
(2088, 2, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:53:37', '2021-11-02 09:53:37'),
(2089, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:53:44', '2021-11-02 09:53:44'),
(2090, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:53:55', '2021-11-02 09:53:55'),
(2091, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:54:00', '2021-11-02 09:54:00'),
(2092, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:55:12', '2021-11-02 09:55:12'),
(2093, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '[]', '2021-11-02 09:55:44', '2021-11-02 09:55:44'),
(2094, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '[]', '2021-11-02 09:55:52', '2021-11-02 09:55:52'),
(2095, 2, 'admin/planting-returns/5', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"14\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-02\",\"id\":\"14\",\"_remove_\":\"0\"},\"15\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-12-27\",\"id\":\"15\",\"_remove_\":\"0\"},\"16\":{\"administrator_id\":\"20\",\"stage\":\"50% pod filling\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-21\",\"id\":\"16\",\"_remove_\":\"0\"}},\"_token\":\"2fbUYXobjt2nuyfvOgirmklUwbHejqGbRxjxq6HP\",\"_method\":\"PUT\"}', '2021-11-02 09:56:05', '2021-11-02 09:56:05'),
(2096, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 09:56:06', '2021-11-02 09:56:06'),
(2097, 2, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:56:08', '2021-11-02 09:56:08'),
(2098, 2, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:56:09', '2021-11-02 09:56:09'),
(2099, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:56:15', '2021-11-02 09:56:15'),
(2100, 2, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:56:23', '2021-11-02 09:56:23'),
(2101, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:56:32', '2021-11-02 09:56:32'),
(2102, 20, 'admin', 'GET', '::1', '[]', '2021-11-02 09:56:39', '2021-11-02 09:56:39'),
(2103, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:56:44', '2021-11-02 09:56:44'),
(2104, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:56:48', '2021-11-02 09:56:48'),
(2105, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"ZYLbyjTb76ybmaS8x6EtXEsSARC7spqh6xAMFTwj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-02 09:58:58', '2021-11-02 09:58:58'),
(2106, 20, 'admin/form-sr10s/14', 'GET', '::1', '[]', '2021-11-02 09:59:08', '2021-11-02 09:59:08'),
(2107, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 09:59:11', '2021-11-02 09:59:11'),
(2108, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"ZYLbyjTb76ybmaS8x6EtXEsSARC7spqh6xAMFTwj\",\"_method\":\"PUT\"}', '2021-11-02 09:59:17', '2021-11-02 09:59:17'),
(2109, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 10:01:46', '2021-11-02 10:01:46'),
(2110, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"ZYLbyjTb76ybmaS8x6EtXEsSARC7spqh6xAMFTwj\",\"_method\":\"PUT\"}', '2021-11-02 10:01:54', '2021-11-02 10:01:54'),
(2111, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 10:02:27', '2021-11-02 10:02:27'),
(2112, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"ZYLbyjTb76ybmaS8x6EtXEsSARC7spqh6xAMFTwj\",\"_method\":\"PUT\"}', '2021-11-02 10:02:31', '2021-11-02 10:02:31'),
(2113, 20, 'admin/form-sr10s/14', 'GET', '::1', '[]', '2021-11-02 10:04:58', '2021-11-02 10:04:58'),
(2114, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 10:05:00', '2021-11-02 10:05:00'),
(2115, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"ZYLbyjTb76ybmaS8x6EtXEsSARC7spqh6xAMFTwj\",\"_method\":\"PUT\"}', '2021-11-02 10:05:04', '2021-11-02 10:05:04'),
(2116, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-02 10:05:04', '2021-11-02 10:05:04'),
(2117, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"ZYLbyjTb76ybmaS8x6EtXEsSARC7spqh6xAMFTwj\",\"_method\":\"PUT\"}', '2021-11-02 10:05:09', '2021-11-02 10:05:09'),
(2118, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-02 10:05:09', '2021-11-02 10:05:09'),
(2119, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 10:05:17', '2021-11-02 10:05:17'),
(2120, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 10:05:45', '2021-11-02 10:05:45'),
(2121, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-02 10:06:01', '2021-11-02 10:06:01'),
(2122, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-02 10:06:18', '2021-11-02 10:06:18'),
(2123, 20, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-02 12:10:29', '2021-11-02 12:10:29'),
(2124, 2, 'admin', 'GET', '::1', '[]', '2021-11-04 04:01:20', '2021-11-04 04:01:20'),
(2125, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:01:28', '2021-11-04 04:01:28'),
(2126, 20, 'admin', 'GET', '::1', '[]', '2021-11-04 04:01:42', '2021-11-04 04:01:42'),
(2127, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:02:13', '2021-11-04 04:02:13'),
(2128, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:02:50', '2021-11-04 04:02:50'),
(2129, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:09:15', '2021-11-04 04:09:15'),
(2130, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:10:24', '2021-11-04 04:10:24'),
(2131, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:10:53', '2021-11-04 04:10:53'),
(2132, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:11:58', '2021-11-04 04:11:58'),
(2133, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:12:05', '2021-11-04 04:12:05'),
(2134, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:12:45', '2021-11-04 04:12:45'),
(2135, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:13:23', '2021-11-04 04:13:23'),
(2136, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:13:29', '2021-11-04 04:13:29'),
(2137, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:13:39', '2021-11-04 04:13:39'),
(2138, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:13:54', '2021-11-04 04:13:54'),
(2139, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:14:12', '2021-11-04 04:14:12'),
(2140, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:14:40', '2021-11-04 04:14:40'),
(2141, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:15:03', '2021-11-04 04:15:03'),
(2142, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:15:14', '2021-11-04 04:15:14'),
(2143, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:15:22', '2021-11-04 04:15:22'),
(2144, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:19:57', '2021-11-04 04:19:57'),
(2145, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:20:09', '2021-11-04 04:20:09'),
(2146, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:20:29', '2021-11-04 04:20:29'),
(2147, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:21:14', '2021-11-04 04:21:14'),
(2148, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:22:23', '2021-11-04 04:22:23'),
(2149, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:22:42', '2021-11-04 04:22:42'),
(2150, 2, 'admin', 'GET', '::1', '[]', '2021-11-04 04:23:17', '2021-11-04 04:23:17'),
(2151, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:23:25', '2021-11-04 04:23:25'),
(2152, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:23:26', '2021-11-04 04:23:26'),
(2153, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:23:31', '2021-11-04 04:23:31'),
(2154, 2, 'admin/planting-returns/5', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"14\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-02\",\"id\":\"14\",\"_remove_\":\"0\"},\"15\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-12-27\",\"id\":\"15\",\"_remove_\":\"0\"},\"16\":{\"administrator_id\":\"20\",\"stage\":\"50% pod filling\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-03\",\"id\":\"16\",\"_remove_\":\"0\"}},\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 04:23:45', '2021-11-04 04:23:45'),
(2155, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 04:23:46', '2021-11-04 04:23:46'),
(2156, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 04:23:59', '2021-11-04 04:23:59'),
(2157, 20, 'admin/form-sr10s/16/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:24:05', '2021-11-04 04:24:05'),
(2158, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:24:54', '2021-11-04 04:24:54'),
(2159, 20, 'admin/form-sr10s/16/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:24:58', '2021-11-04 04:24:58'),
(2160, 20, 'admin/form-sr10s/16', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-04 04:25:08', '2021-11-04 04:25:08'),
(2161, 20, 'admin/form-sr10s/16/edit', 'GET', '::1', '[]', '2021-11-04 04:25:08', '2021-11-04 04:25:08'),
(2162, 20, 'admin/form-sr10s/16', 'PUT', '::1', '{\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 04:25:12', '2021-11-04 04:25:12'),
(2163, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 04:25:13', '2021-11-04 04:25:13'),
(2164, 20, 'admin/form-sr10s/16/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:25:17', '2021-11-04 04:25:17'),
(2165, 20, 'admin/form-sr10s/16/edit', 'GET', '::1', '[]', '2021-11-04 04:27:30', '2021-11-04 04:27:30'),
(2166, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:27:41', '2021-11-04 04:27:41'),
(2167, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:27:44', '2021-11-04 04:27:44'),
(2168, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:28:51', '2021-11-04 04:28:51'),
(2169, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:29:00', '2021-11-04 04:29:00'),
(2170, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:30:02', '2021-11-04 04:30:02'),
(2171, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:30:20', '2021-11-04 04:30:20'),
(2172, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:30:33', '2021-11-04 04:30:33'),
(2173, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:30:51', '2021-11-04 04:30:51'),
(2174, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:31:01', '2021-11-04 04:31:01'),
(2175, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:31:23', '2021-11-04 04:31:23'),
(2176, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:31:32', '2021-11-04 04:31:32'),
(2177, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:31:39', '2021-11-04 04:31:39'),
(2178, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:32:17', '2021-11-04 04:32:17'),
(2179, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:32:25', '2021-11-04 04:32:25'),
(2180, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:33:16', '2021-11-04 04:33:16'),
(2181, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:33:33', '2021-11-04 04:33:33'),
(2182, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:33:34', '2021-11-04 04:33:34'),
(2183, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:33:36', '2021-11-04 04:33:36'),
(2184, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:33:53', '2021-11-04 04:33:53'),
(2185, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:35:29', '2021-11-04 04:35:29'),
(2186, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:35:38', '2021-11-04 04:35:38'),
(2187, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:35:44', '2021-11-04 04:35:44'),
(2188, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:36:55', '2021-11-04 04:36:55'),
(2189, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:37:32', '2021-11-04 04:37:32'),
(2190, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:38:01', '2021-11-04 04:38:01'),
(2191, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:46:28', '2021-11-04 04:46:28'),
(2192, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 04:47:10', '2021-11-04 04:47:10'),
(2193, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":\"Simple data...\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 04:47:37', '2021-11-04 04:47:37'),
(2194, 20, 'admin/form-sr10s/14', 'GET', '::1', '[]', '2021-11-04 04:52:09', '2021-11-04 04:52:09'),
(2195, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:52:13', '2021-11-04 04:52:13'),
(2196, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 04:52:20', '2021-11-04 04:52:20'),
(2197, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:53:28', '2021-11-04 04:53:28'),
(2198, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 04:53:31', '2021-11-04 04:53:31'),
(2199, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:55:08', '2021-11-04 04:55:08'),
(2200, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 04:55:11', '2021-11-04 04:55:11'),
(2201, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:55:39', '2021-11-04 04:55:39'),
(2202, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 04:55:43', '2021-11-04 04:55:43'),
(2203, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 04:58:03', '2021-11-04 04:58:03'),
(2204, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 04:58:09', '2021-11-04 04:58:09'),
(2205, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:02:03', '2021-11-04 05:02:03'),
(2206, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:02:09', '2021-11-04 05:02:09'),
(2207, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:02:47', '2021-11-04 05:02:47'),
(2208, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:02:52', '2021-11-04 05:02:52'),
(2209, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:03:58', '2021-11-04 05:03:58'),
(2210, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:04:02', '2021-11-04 05:04:02');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(2211, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:04:15', '2021-11-04 05:04:15'),
(2212, 20, 'admin/form-sr10s/14', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:04:18', '2021-11-04 05:04:18'),
(2213, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:04:20', '2021-11-04 05:04:20'),
(2214, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:04:25', '2021-11-04 05:04:25'),
(2215, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:05:56', '2021-11-04 05:05:56'),
(2216, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:06:05', '2021-11-04 05:06:05'),
(2217, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:06:07', '2021-11-04 05:06:07'),
(2218, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:07:05', '2021-11-04 05:07:05'),
(2219, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:07:08', '2021-11-04 05:07:08'),
(2220, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:07:12', '2021-11-04 05:07:12'),
(2221, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:08:40', '2021-11-04 05:08:40'),
(2222, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:08:45', '2021-11-04 05:08:45'),
(2223, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:11:27', '2021-11-04 05:11:27'),
(2224, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:11:32', '2021-11-04 05:11:32'),
(2225, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 05:12:03', '2021-11-04 05:12:03'),
(2226, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_done\":\"0\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:12:39', '2021-11-04 05:12:39'),
(2227, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:13:19', '2021-11-04 05:13:19'),
(2228, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_done\":\"0\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:13:22', '2021-11-04 05:13:22'),
(2229, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:14:17', '2021-11-04 05:14:17'),
(2230, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_done\":\"0\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:14:21', '2021-11-04 05:14:21'),
(2231, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:14:58', '2021-11-04 05:14:58'),
(2232, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_done\":\"0\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:15:02', '2021-11-04 05:15:02'),
(2233, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 05:15:02', '2021-11-04 05:15:02'),
(2234, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:15:26', '2021-11-04 05:15:26'),
(2235, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 05:15:39', '2021-11-04 05:15:39'),
(2236, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_done\":\"0\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":\"simple reason\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:15:51', '2021-11-04 05:15:51'),
(2237, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 05:15:51', '2021-11-04 05:15:51'),
(2238, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:15:56', '2021-11-04 05:15:56'),
(2239, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:16:06', '2021-11-04 05:16:06'),
(2240, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:16:28', '2021-11-04 05:16:28'),
(2241, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 05:16:46', '2021-11-04 05:16:46'),
(2242, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_done\":\"0\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:16:58', '2021-11-04 05:16:58'),
(2243, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 05:16:58', '2021-11-04 05:16:58'),
(2244, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:17:31', '2021-11-04 05:17:31'),
(2245, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:18:38', '2021-11-04 05:18:38'),
(2246, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 05:19:26', '2021-11-04 05:19:26'),
(2247, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 05:19:50', '2021-11-04 05:19:50'),
(2248, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 05:20:33', '2021-11-04 05:20:33'),
(2249, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:20:36', '2021-11-04 05:20:36'),
(2250, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 05:20:37', '2021-11-04 05:20:37'),
(2251, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 05:23:21', '2021-11-04 05:23:21'),
(2252, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:24:16', '2021-11-04 05:24:16'),
(2253, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:24:22', '2021-11-04 05:24:22'),
(2254, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:24:24', '2021-11-04 05:24:24'),
(2255, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 05:24:37', '2021-11-04 05:24:37'),
(2256, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:24:41', '2021-11-04 05:24:41'),
(2257, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:24:42', '2021-11-04 05:24:42'),
(2258, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:24:43', '2021-11-04 05:24:43'),
(2259, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:24:48', '2021-11-04 05:24:48'),
(2260, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:24:50', '2021-11-04 05:24:50'),
(2261, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:24:55', '2021-11-04 05:24:55'),
(2262, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:25:02', '2021-11-04 05:25:02'),
(2263, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:25:04', '2021-11-04 05:25:04'),
(2264, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:25:08', '2021-11-04 05:25:08'),
(2265, 20, 'admin/form-sr10s/14', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-02\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s?_sort%5Bcolumn%5D=is_active&_sort%5Btype%5D=desc\"}', '2021-11-04 05:25:12', '2021-11-04 05:25:12'),
(2266, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"desc\"}}', '2021-11-04 05:25:12', '2021-11-04 05:25:12'),
(2267, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:25:23', '2021-11-04 05:25:23'),
(2268, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:25:28', '2021-11-04 05:25:28'),
(2269, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:25:32', '2021-11-04 05:25:32'),
(2270, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:25:57', '2021-11-04 05:25:57'),
(2271, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_sort\":{\"column\":\"is_active\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:26:00', '2021-11-04 05:26:00'),
(2272, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:26:04', '2021-11-04 05:26:04'),
(2273, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:26:12', '2021-11-04 05:26:12'),
(2274, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:26:13', '2021-11-04 05:26:13'),
(2275, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:26:17', '2021-11-04 05:26:17'),
(2276, 2, 'admin/planting-returns/5', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"14\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"7\",\"status_comment\":\"simple reason\",\"min_date\":\"2021-11-02\",\"id\":\"14\",\"_remove_\":\"0\"},\"15\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-03\",\"id\":\"15\",\"_remove_\":\"0\"},\"16\":{\"administrator_id\":\"20\",\"stage\":\"50% pod filling\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-03\",\"id\":\"16\",\"_remove_\":\"0\"}},\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 05:26:30', '2021-11-04 05:26:30'),
(2277, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 05:26:31', '2021-11-04 05:26:31'),
(2278, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:26:33', '2021-11-04 05:26:33'),
(2279, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '[]', '2021-11-04 05:26:37', '2021-11-04 05:26:37'),
(2280, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:26:45', '2021-11-04 05:26:45'),
(2281, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '[]', '2021-11-04 05:26:46', '2021-11-04 05:26:46'),
(2282, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:26:50', '2021-11-04 05:26:50'),
(2283, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 05:26:50', '2021-11-04 05:26:50'),
(2284, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:26:59', '2021-11-04 05:26:59'),
(2285, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 05:29:20', '2021-11-04 05:29:20'),
(2286, 20, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 05:30:02', '2021-11-04 05:30:02'),
(2287, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:30:11', '2021-11-04 05:30:11'),
(2288, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:30:14', '2021-11-04 05:30:14'),
(2289, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:30:25', '2021-11-04 05:30:25'),
(2290, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '[]', '2021-11-04 05:30:38', '2021-11-04 05:30:38'),
(2291, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:30:41', '2021-11-04 05:30:41'),
(2292, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:32:58', '2021-11-04 05:32:58'),
(2293, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:33:09', '2021-11-04 05:33:09'),
(2294, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:33:12', '2021-11-04 05:33:12'),
(2295, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:35:05', '2021-11-04 05:35:05'),
(2296, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:35:09', '2021-11-04 05:35:09'),
(2297, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:35:21', '2021-11-04 05:35:21'),
(2298, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:35:25', '2021-11-04 05:35:25'),
(2299, 20, 'admin/form-sr10s/15', 'GET', '::1', '[]', '2021-11-04 05:40:29', '2021-11-04 05:40:29'),
(2300, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:40:32', '2021-11-04 05:40:32'),
(2301, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:40:34', '2021-11-04 05:40:34'),
(2302, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:41:33', '2021-11-04 05:41:33'),
(2303, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:41:38', '2021-11-04 05:41:38'),
(2304, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:41:55', '2021-11-04 05:41:55'),
(2305, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '[]', '2021-11-04 05:41:58', '2021-11-04 05:41:58'),
(2306, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:42:07', '2021-11-04 05:42:07'),
(2307, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '[]', '2021-11-04 05:42:07', '2021-11-04 05:42:07'),
(2308, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '[]', '2021-11-04 05:45:33', '2021-11-04 05:45:33'),
(2309, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '[]', '2021-11-04 05:45:43', '2021-11-04 05:45:43'),
(2310, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:46:27', '2021-11-04 05:46:27'),
(2311, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '[]', '2021-11-04 05:46:28', '2021-11-04 05:46:28'),
(2312, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:46:39', '2021-11-04 05:46:39'),
(2313, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:46:47', '2021-11-04 05:46:47'),
(2314, 20, 'admin/form-sr10s/15/edit', 'GET', '::1', '[]', '2021-11-04 05:47:18', '2021-11-04 05:47:18'),
(2315, 20, 'admin/form-sr10s/15', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-03\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\"}', '2021-11-04 05:47:24', '2021-11-04 05:47:24'),
(2316, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 05:47:24', '2021-11-04 05:47:24'),
(2317, 20, 'admin/form-sr10s/16/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:47:33', '2021-11-04 05:47:33'),
(2318, 20, 'admin/form-sr10s/16', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"50% pod filling\",\"min_date\":\"2021-11-03\",\"submited_date\":\"2021-11-04\",\"status\":\"5\",\"_token\":\"KUbkuyUEIUpI8MHNxXcc7rYMVwUkPAkKVpOgx7Ar\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-04 05:47:42', '2021-11-04 05:47:42'),
(2319, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 05:47:42', '2021-11-04 05:47:42'),
(2320, 2, 'admin/planting-returns/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:48:09', '2021-11-04 05:48:09'),
(2321, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 05:48:11', '2021-11-04 05:48:11'),
(2322, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 06:05:11', '2021-11-04 06:05:11'),
(2323, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 06:25:35', '2021-11-04 06:25:35'),
(2324, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:25:44', '2021-11-04 06:25:44'),
(2325, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:26:14', '2021-11-04 06:26:14'),
(2326, 3, 'admin', 'GET', '::1', '[]', '2021-11-04 06:26:23', '2021-11-04 06:26:23'),
(2327, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:26:28', '2021-11-04 06:26:28'),
(2328, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:26:30', '2021-11-04 06:26:30'),
(2329, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:29:49', '2021-11-04 06:29:49'),
(2330, 3, 'admin/planting-returns/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:29:56', '2021-11-04 06:29:56'),
(2331, 3, 'admin/planting-returns/5', 'GET', '::1', '[]', '2021-11-04 06:30:19', '2021-11-04 06:30:19'),
(2332, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 06:30:22', '2021-11-04 06:30:22'),
(2333, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:30:35', '2021-11-04 06:30:35'),
(2334, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:30:46', '2021-11-04 06:30:46'),
(2335, 3, 'admin/planting-returns/create', 'GET', '::1', '[]', '2021-11-04 06:30:53', '2021-11-04 06:30:53'),
(2336, 3, 'admin/planting-returns', 'POST', '::1', '{\"administrator_id\":\"3\",\"status\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"crop_id\":\"3\",\"lot_number\":\"1200\",\"size_of_land\":\"12\",\"date_planted\":\"2021-11-04\",\"date_harvest\":\"2022-01-14\",\"previous_crops\":\"Details\",\"planting_return_crops\":{\"new_1\":{\"crop_variety_id\":\"3\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"4\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"crop_variety_id\":\"5\",\"id\":null,\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"amount_enclosed\":\"122\",\"registerd_dealer\":\"1222\",\"latitude\":\"Uganda\",\"longitude\":\"Uganda\",\"_token\":\"4ZEMiRPBE4RIqrjZxzX1w0zxjHlJv4uzakMW9heZ\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 06:32:13', '2021-11-04 06:32:13'),
(2337, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 06:32:13', '2021-11-04 06:32:13'),
(2338, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:32:24', '2021-11-04 06:32:24'),
(2339, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:32:31', '2021-11-04 06:32:31'),
(2340, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:34:08', '2021-11-04 06:34:08'),
(2341, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:34:17', '2021-11-04 06:34:17'),
(2342, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 06:34:44', '2021-11-04 06:34:44'),
(2343, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 06:35:23', '2021-11-04 06:35:23'),
(2344, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 06:37:50', '2021-11-04 06:37:50'),
(2345, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 06:38:51', '2021-11-04 06:38:51'),
(2346, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:39:11', '2021-11-04 06:39:11'),
(2347, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 06:39:12', '2021-11-04 06:39:12'),
(2348, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:39:15', '2021-11-04 06:39:15'),
(2349, 3, 'admin/form-sr10s/14/edit', 'GET', '::1', '[]', '2021-11-04 06:39:43', '2021-11-04 06:39:43'),
(2350, 3, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 06:39:46', '2021-11-04 06:39:46'),
(2351, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:39:52', '2021-11-04 06:39:52'),
(2352, 20, 'admin', 'GET', '::1', '[]', '2021-11-04 06:40:02', '2021-11-04 06:40:02'),
(2353, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:40:06', '2021-11-04 06:40:06'),
(2354, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 06:41:30', '2021-11-04 06:41:30'),
(2355, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:42:44', '2021-11-04 06:42:44'),
(2356, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:42:47', '2021-11-04 06:42:47'),
(2357, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 06:42:47', '2021-11-04 06:42:47'),
(2358, 20, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:43:13', '2021-11-04 06:43:13'),
(2359, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:43:18', '2021-11-04 06:43:18'),
(2360, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 06:44:26', '2021-11-04 06:44:26'),
(2361, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:44:40', '2021-11-04 06:44:40'),
(2362, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:44:42', '2021-11-04 06:44:42'),
(2363, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:45:11', '2021-11-04 06:45:11'),
(2364, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:45:14', '2021-11-04 06:45:14'),
(2365, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:45:31', '2021-11-04 06:45:31'),
(2366, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:45:34', '2021-11-04 06:45:34'),
(2367, 20, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:46:34', '2021-11-04 06:46:34'),
(2368, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:46:36', '2021-11-04 06:46:36'),
(2369, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:46:39', '2021-11-04 06:46:39'),
(2370, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:46:41', '2021-11-04 06:46:41'),
(2371, 2, 'admin/planting-returns/6', 'GET', '::1', '[]', '2021-11-04 06:47:51', '2021-11-04 06:47:51'),
(2372, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:47:52', '2021-11-04 06:47:52'),
(2373, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"status_comment\":null,\"valid_from\":null,\"valid_until\":null,\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:47:55', '2021-11-04 06:47:55'),
(2374, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:48:21', '2021-11-04 06:48:21'),
(2375, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"status_comment\":null,\"valid_from\":null,\"valid_until\":null,\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:48:24', '2021-11-04 06:48:24'),
(2376, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:49:12', '2021-11-04 06:49:12'),
(2377, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"status_comment\":null,\"valid_from\":null,\"valid_until\":null,\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:49:13', '2021-11-04 06:49:13'),
(2378, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:49:27', '2021-11-04 06:49:27'),
(2379, 2, 'admin/planting-returns/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:49:29', '2021-11-04 06:49:29'),
(2380, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:49:32', '2021-11-04 06:49:32'),
(2381, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"status_comment\":null,\"valid_from\":null,\"valid_until\":null,\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:49:50', '2021-11-04 06:49:50'),
(2382, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:50:03', '2021-11-04 06:50:03'),
(2383, 2, 'admin/planting-returns/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:50:04', '2021-11-04 06:50:04'),
(2384, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:50:06', '2021-11-04 06:50:06'),
(2385, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"status_comment\":null,\"valid_from\":null,\"valid_until\":null,\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:50:08', '2021-11-04 06:50:08'),
(2386, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:50:34', '2021-11-04 06:50:34'),
(2387, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:50:39', '2021-11-04 06:50:39'),
(2388, 20, 'admin', 'GET', '::1', '[]', '2021-11-04 06:50:44', '2021-11-04 06:50:44'),
(2389, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:50:50', '2021-11-04 06:50:50'),
(2390, 2, 'admin', 'GET', '::1', '[]', '2021-11-04 06:51:58', '2021-11-04 06:51:58'),
(2391, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:53:53', '2021-11-04 06:53:53'),
(2392, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:54:36', '2021-11-04 06:54:36'),
(2393, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:54:47', '2021-11-04 06:54:47'),
(2394, 1, 'admin', 'GET', '::1', '[]', '2021-11-04 06:54:58', '2021-11-04 06:54:58'),
(2395, 1, 'admin/crops', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:55:04', '2021-11-04 06:55:04'),
(2396, 1, 'admin/crops/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:55:11', '2021-11-04 06:55:11'),
(2397, 1, 'admin/crops/3', 'PUT', '::1', '{\"name\":\"Bush Beans\",\"number_of_days_before_submision\":\"15\",\"crop_inspection_types\":{\"new_1\":{\"inspection_stage\":\"Pre-flowering\",\"period_after_planting\":\"30\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"inspection_stage\":\"Flowering\",\"period_after_planting\":\"45\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"inspection_stage\":\"Pre-harvest\",\"period_after_planting\":\"60\",\"id\":null,\"_remove_\":\"0\"}},\"crop_varieties\":{\"3\":{\"name\":\"NABE1\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"name\":\"NABE2\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"name\":\"NABE15\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"name\":\"NABE16\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"name\":\"NABE17\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"name\":\"NABE18\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"name\":\"NABE19\",\"id\":\"9\",\"_remove_\":\"0\"}},\"_token\":\"wRIPzZH6WhaGKU5vkqVUQNCbVLYP0YyCsyjEWcCu\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/crops\"}', '2021-11-04 06:56:29', '2021-11-04 06:56:29'),
(2398, 1, 'admin/crops/3/edit', 'GET', '::1', '[]', '2021-11-04 06:56:29', '2021-11-04 06:56:29'),
(2399, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:56:44', '2021-11-04 06:56:44'),
(2400, 2, 'admin/planting-returns/6', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:56:46', '2021-11-04 06:56:46'),
(2401, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:56:47', '2021-11-04 06:56:47'),
(2402, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"status_comment\":null,\"valid_from\":null,\"valid_until\":null,\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:56:49', '2021-11-04 06:56:49'),
(2403, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 06:58:34', '2021-11-04 06:58:34'),
(2404, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"status_comment\":null,\"valid_from\":null,\"valid_until\":null,\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 06:59:00', '2021-11-04 06:59:00'),
(2405, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 06:59:00', '2021-11-04 06:59:00'),
(2406, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"status_comment\":null,\"valid_from\":null,\"valid_until\":null,\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 07:00:56', '2021-11-04 07:00:56'),
(2407, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 07:00:57', '2021-11-04 07:00:57'),
(2408, 2, 'admin/planting-returns/6', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"status_comment\":null,\"valid_from\":null,\"valid_until\":null,\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_method\":\"PUT\"}', '2021-11-04 07:02:48', '2021-11-04 07:02:48'),
(2409, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 07:02:48', '2021-11-04 07:02:48'),
(2410, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:02:51', '2021-11-04 07:02:51'),
(2411, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 07:03:29', '2021-11-04 07:03:29'),
(2412, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 07:04:24', '2021-11-04 07:04:24'),
(2413, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 07:04:30', '2021-11-04 07:04:30'),
(2414, 2, 'admin/planting-returns/6/edit', 'GET', '::1', '[]', '2021-11-04 07:05:06', '2021-11-04 07:05:06'),
(2415, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:05:14', '2021-11-04 07:05:14'),
(2416, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"6\",\"_model\":\"App_Models_PlantingReturn\",\"_token\":\"swz6jQa7CHS8f2Z6pCHyHYPqfYRnVCXx6ZubRzSl\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-04 07:05:18', '2021-11-04 07:05:18'),
(2417, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:05:18', '2021-11-04 07:05:18'),
(2418, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:05:33', '2021-11-04 07:05:33'),
(2419, 20, 'admin', 'GET', '::1', '[]', '2021-11-04 07:05:40', '2021-11-04 07:05:40'),
(2420, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:05:44', '2021-11-04 07:05:44'),
(2421, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:05:54', '2021-11-04 07:05:54'),
(2422, 3, 'admin', 'GET', '::1', '[]', '2021-11-04 07:06:02', '2021-11-04 07:06:02'),
(2423, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:06:07', '2021-11-04 07:06:07'),
(2424, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:06:09', '2021-11-04 07:06:09'),
(2425, 3, 'admin/planting-returns', 'POST', '::1', '{\"administrator_id\":\"3\",\"status\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kibuli, Kampala, Uganda\",\"telephone\":\"+256706638494\",\"crop_id\":\"3\",\"lot_number\":\"1200\",\"size_of_land\":\"122\",\"date_planted\":\"2021-11-04\",\"date_harvest\":\"2022-02-02\",\"previous_crops\":\"Details\",\"planting_return_crops\":{\"new_1\":{\"crop_variety_id\":\"3\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"4\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"crop_variety_id\":\"5\",\"id\":null,\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"amount_enclosed\":\"1200\",\"registerd_dealer\":\"details,....\",\"latitude\":\"Uganda\",\"longitude\":\"Uganda\",\"_token\":\"hHG6jgybpqpR3QlXhVw3iqMz7jZfXWXbhzie2ves\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 07:07:04', '2021-11-04 07:07:04'),
(2426, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 07:07:04', '2021-11-04 07:07:04'),
(2427, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:07:11', '2021-11-04 07:07:11'),
(2428, 2, 'admin', 'GET', '::1', '[]', '2021-11-04 07:07:23', '2021-11-04 07:07:23'),
(2429, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:07:29', '2021-11-04 07:07:29'),
(2430, 2, 'admin/planting-returns/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:07:34', '2021-11-04 07:07:34'),
(2431, 2, 'admin/planting-returns/7', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"qU2V57SpYL4IDEaPQapvL8t6Rt7xOKEkWD77HByy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 07:07:44', '2021-11-04 07:07:44'),
(2432, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 07:07:44', '2021-11-04 07:07:44'),
(2433, 2, 'admin/planting-returns/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:07:48', '2021-11-04 07:07:48'),
(2434, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:08:33', '2021-11-04 07:08:33'),
(2435, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:08:51', '2021-11-04 07:08:51'),
(2436, 2, 'admin/form-sr10s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:09:00', '2021-11-04 07:09:00'),
(2437, 2, 'admin/planting-returns/7', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"4\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-04\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-12-19\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"administrator_id\":\"20\",\"stage\":\"Pre-harvest\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-03\",\"id\":\"6\",\"_remove_\":\"0\"}},\"_token\":\"qU2V57SpYL4IDEaPQapvL8t6Rt7xOKEkWD77HByy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 07:09:23', '2021-11-04 07:09:23'),
(2438, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 07:09:23', '2021-11-04 07:09:23'),
(2439, 2, 'admin/form-sr10s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:09:28', '2021-11-04 07:09:28'),
(2440, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:09:41', '2021-11-04 07:09:41'),
(2441, 2, 'admin/form-sr10s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:09:45', '2021-11-04 07:09:45'),
(2442, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:09:48', '2021-11-04 07:09:48'),
(2443, 20, 'admin', 'GET', '::1', '[]', '2021-11-04 07:10:02', '2021-11-04 07:10:02'),
(2444, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:10:07', '2021-11-04 07:10:07'),
(2445, 20, 'admin/form-sr10s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:10:10', '2021-11-04 07:10:10'),
(2446, 20, 'admin/form-sr10s/4', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-04 07:10:31', '2021-11-04 07:10:31'),
(2447, 20, 'admin/form-sr10s/4/edit', 'GET', '::1', '[]', '2021-11-04 07:10:31', '2021-11-04 07:10:31'),
(2448, 20, 'admin/form-sr10s/4', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 07:11:32', '2021-11-04 07:11:32'),
(2449, 20, 'admin/form-sr10s/4/edit', 'GET', '::1', '[]', '2021-11-04 07:11:32', '2021-11-04 07:11:32'),
(2450, 20, 'admin/form-sr10s/4', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 07:12:16', '2021-11-04 07:12:16'),
(2451, 20, 'admin/form-sr10s/4/edit', 'GET', '::1', '[]', '2021-11-04 07:12:16', '2021-11-04 07:12:16'),
(2452, 20, 'admin/form-sr10s/4', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 07:13:16', '2021-11-04 07:13:16'),
(2453, 20, 'admin/form-sr10s/4/edit', 'GET', '::1', '[]', '2021-11-04 07:13:16', '2021-11-04 07:13:16'),
(2454, 20, 'admin/form-sr10s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:13:56', '2021-11-04 07:13:56'),
(2455, 20, 'admin/form-sr10s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:14:51', '2021-11-04 07:14:51'),
(2456, 20, 'admin/form-sr10s/4', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 07:14:57', '2021-11-04 07:14:57'),
(2457, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 07:14:57', '2021-11-04 07:14:57'),
(2458, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:15:08', '2021-11-04 07:15:08'),
(2459, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:15:29', '2021-11-04 07:15:29'),
(2460, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:15:30', '2021-11-04 07:15:30'),
(2461, 2, 'admin/planting-returns/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:15:33', '2021-11-04 07:15:33'),
(2462, 2, 'admin/planting-returns/7', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"4\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"7\",\"status_comment\":null,\"min_date\":\"2021-11-04\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-03\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"administrator_id\":\"20\",\"stage\":\"Pre-harvest\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-03\",\"id\":\"6\",\"_remove_\":\"0\"}},\"_token\":\"qU2V57SpYL4IDEaPQapvL8t6Rt7xOKEkWD77HByy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 07:15:43', '2021-11-04 07:15:43'),
(2463, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 07:15:43', '2021-11-04 07:15:43'),
(2464, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:15:46', '2021-11-04 07:15:46'),
(2465, 20, 'admin/form-sr10s/5', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 07:15:56', '2021-11-04 07:15:56'),
(2466, 20, 'admin/form-sr10s/5/edit', 'GET', '::1', '[]', '2021-11-04 07:15:56', '2021-11-04 07:15:56'),
(2467, 20, 'admin/form-sr10s/5', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-03\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 07:16:03', '2021-11-04 07:16:03'),
(2468, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 07:16:03', '2021-11-04 07:16:03'),
(2469, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:16:08', '2021-11-04 07:16:08'),
(2470, 2, 'admin/planting-returns/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:16:13', '2021-11-04 07:16:13'),
(2471, 2, 'admin/planting-returns/7', 'PUT', '::1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"4\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"7\",\"status_comment\":null,\"min_date\":\"2021-11-04\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"7\",\"status_comment\":null,\"min_date\":\"2021-11-03\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"administrator_id\":\"20\",\"stage\":\"Pre-harvest\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-04\",\"id\":\"6\",\"_remove_\":\"0\"}},\"_token\":\"qU2V57SpYL4IDEaPQapvL8t6Rt7xOKEkWD77HByy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 07:16:20', '2021-11-04 07:16:20'),
(2472, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 07:16:21', '2021-11-04 07:16:21'),
(2473, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:16:23', '2021-11-04 07:16:23'),
(2474, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:16:24', '2021-11-04 07:16:24'),
(2475, 20, 'admin/form-sr10s/6', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 07:16:29', '2021-11-04 07:16:29'),
(2476, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '[]', '2021-11-04 07:16:29', '2021-11-04 07:16:29'),
(2477, 20, 'admin/form-sr10s/6', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Pre-harvest\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"5\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 07:17:31', '2021-11-04 07:17:31'),
(2478, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 07:17:31', '2021-11-04 07:17:31'),
(2479, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:55:44', '2021-11-04 07:55:44'),
(2480, 2, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:55:57', '2021-11-04 07:55:57'),
(2481, 2, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 07:55:58', '2021-11-04 07:55:58'),
(2482, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:56:29', '2021-11-04 07:56:29'),
(2483, 3, 'admin', 'GET', '::1', '[]', '2021-11-04 07:56:38', '2021-11-04 07:56:38'),
(2484, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:56:50', '2021-11-04 07:56:50'),
(2485, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:56:53', '2021-11-04 07:56:53'),
(2486, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:56:58', '2021-11-04 07:56:58'),
(2487, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:57:03', '2021-11-04 07:57:03'),
(2488, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 07:58:13', '2021-11-04 07:58:13'),
(2489, 3, 'admin/planting-returns', 'POST', '::1', '{\"administrator_id\":\"3\",\"status\":\"1\",\"name\":\"Muhindo Mubaraka\",\"address\":\"Kasese, Uganda\",\"telephone\":\"+256706638494\",\"crop_id\":\"3\",\"lot_number\":\"1200\",\"size_of_land\":\"12\",\"date_planted\":\"2021-11-04\",\"date_harvest\":\"2022-02-04\",\"previous_crops\":\"Details\",\"planting_return_crops\":{\"new_1\":{\"crop_variety_id\":\"3\",\"id\":null,\"_remove_\":\"0\"}},\"seed_rate\":\"10\",\"amount_enclosed\":\"11\",\"registerd_dealer\":\"1222\",\"latitude\":\"0.31249266618931454\",\"longitude\":\"32.52842021216429\",\"_token\":\"nH4ZJ5DpLfTPDhMBjbMCysl3ncApIzxV6fqVQ3T1\"}', '2021-11-04 07:59:05', '2021-11-04 07:59:05'),
(2490, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 07:59:05', '2021-11-04 07:59:05'),
(2491, 2, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-04 08:00:17', '2021-11-04 08:00:17'),
(2492, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:00:40', '2021-11-04 08:00:40'),
(2493, 2, 'admin/planting-returns/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:00:49', '2021-11-04 08:00:49'),
(2494, 2, 'admin/planting-returns/8', 'PUT', '127.0.0.1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"NsOLDceBZ2LmbKfK68DfKIki3RJFIBaTlnQsw8XT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 08:01:01', '2021-11-04 08:01:01'),
(2495, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '[]', '2021-11-04 08:01:01', '2021-11-04 08:01:01'),
(2496, 2, 'admin/planting-returns/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:01:05', '2021-11-04 08:01:05'),
(2497, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:01:17', '2021-11-04 08:01:17'),
(2498, 3, 'admin/planting-returns/8', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:01:22', '2021-11-04 08:01:22');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(2499, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:01:23', '2021-11-04 08:01:23'),
(2500, 3, 'admin/planting-returns/8', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:01:26', '2021-11-04 08:01:26'),
(2501, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:01:29', '2021-11-04 08:01:29'),
(2502, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:01:46', '2021-11-04 08:01:46'),
(2503, 20, 'admin/form-sr10s/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:01:54', '2021-11-04 08:01:54'),
(2504, 2, 'admin/planting-returns/8', 'PUT', '127.0.0.1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"7\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-04\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-12-19\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"administrator_id\":\"20\",\"stage\":\"Pre-harvest\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-03\",\"id\":\"9\",\"_remove_\":\"0\"}},\"_token\":\"NsOLDceBZ2LmbKfK68DfKIki3RJFIBaTlnQsw8XT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 08:02:08', '2021-11-04 08:02:08'),
(2505, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '[]', '2021-11-04 08:02:09', '2021-11-04 08:02:09'),
(2506, 20, 'admin/form-sr10s/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:02:15', '2021-11-04 08:02:15'),
(2507, 20, 'admin/form-sr10s/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:02:16', '2021-11-04 08:02:16'),
(2508, 20, 'admin/form-sr10s/7', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:02:24', '2021-11-04 08:02:24'),
(2509, 20, 'admin/form-sr10s/7/edit', 'GET', '::1', '[]', '2021-11-04 08:02:24', '2021-11-04 08:02:24'),
(2510, 20, 'admin/form-sr10s/7', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Pre-flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"form_sr10_has_variety_inspections\":{\"10\":{\"planting_return_crop_name\":\"NABE1\",\"seed_class\":\"Pre-Basic seed\",\"size_of_field\":\"11\",\"off_types\":\"simple\",\"diseases\":\"test\",\"noxious_weeds\":\"11\",\"other_features\":\"121\",\"other_weeds\":\"2322\",\"isolation_distance\":\"121\",\"proposed_distance\":\"Adequate\",\"general_conditions_of_crop\":\"asas\",\"estimated_yield\":\"121\",\"futher_remarks\":\"asas\",\"variety_status\":\"5\",\"id\":\"10\",\"_remove_\":\"0\"}},\"status\":\"7\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:03:17', '2021-11-04 08:03:17'),
(2511, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 08:03:17', '2021-11-04 08:03:17'),
(2512, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:03:34', '2021-11-04 08:03:34'),
(2513, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:03:38', '2021-11-04 08:03:38'),
(2514, 2, 'admin/planting-returns/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:03:50', '2021-11-04 08:03:50'),
(2515, 2, 'admin/planting-returns/8', 'PUT', '127.0.0.1', '{\"administrator_id\":\"3\",\"crop_id\":\"3\",\"form_sr10s\":{\"7\":{\"administrator_id\":\"20\",\"stage\":\"Pre-flowering\",\"status\":\"7\",\"status_comment\":null,\"min_date\":\"2021-11-04\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"administrator_id\":\"20\",\"stage\":\"Flowering\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2021-11-04\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"administrator_id\":\"20\",\"stage\":\"Pre-harvest\",\"status\":\"1\",\"status_comment\":null,\"min_date\":\"2022-01-03\",\"id\":\"9\",\"_remove_\":\"0\"}},\"_token\":\"NsOLDceBZ2LmbKfK68DfKIki3RJFIBaTlnQsw8XT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/planting-returns\"}', '2021-11-04 08:04:15', '2021-11-04 08:04:15'),
(2516, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '[]', '2021-11-04 08:04:15', '2021-11-04 08:04:15'),
(2517, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:04:19', '2021-11-04 08:04:19'),
(2518, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:04:21', '2021-11-04 08:04:21'),
(2519, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-04 08:04:25', '2021-11-04 08:04:25'),
(2520, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '[]', '2021-11-04 08:04:25', '2021-11-04 08:04:25'),
(2521, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:05:15', '2021-11-04 08:05:15'),
(2522, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"form_sr10_has_variety_inspections\":{\"11\":{\"planting_return_crop_name\":\"NABE1\",\"seed_class\":\"Basic seed\",\"size_of_field\":\"12\",\"off_types\":\"11\",\"diseases\":\"11\",\"noxious_weeds\":\"asas\",\"other_features\":\"assas\",\"other_weeds\":\"numberas\",\"isolation_distance\":null,\"proposed_distance\":null,\"general_conditions_of_crop\":null,\"estimated_yield\":null,\"futher_remarks\":null,\"id\":\"11\",\"_remove_\":\"0\"}},\"status\":\"4\",\"status_comment\":\"Simple reason\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:09:52', '2021-11-04 08:09:52'),
(2523, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:10:21', '2021-11-04 08:10:21'),
(2524, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:10:43', '2021-11-04 08:10:43'),
(2525, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":\"simple reason\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:10:53', '2021-11-04 08:10:53'),
(2526, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:11:53', '2021-11-04 08:11:53'),
(2527, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:11:57', '2021-11-04 08:11:57'),
(2528, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:12:47', '2021-11-04 08:12:47'),
(2529, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:12:55', '2021-11-04 08:12:55'),
(2530, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 08:12:55', '2021-11-04 08:12:55'),
(2531, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:13:11', '2021-11-04 08:13:11'),
(2532, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:13:18', '2021-11-04 08:13:18'),
(2533, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:13:28', '2021-11-04 08:13:28'),
(2534, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:14:37', '2021-11-04 08:14:37'),
(2535, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:14:57', '2021-11-04 08:14:57'),
(2536, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:15:02', '2021-11-04 08:15:02'),
(2537, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:15:05', '2021-11-04 08:15:05'),
(2538, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:15:18', '2021-11-04 08:15:18'),
(2539, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:15:36', '2021-11-04 08:15:36'),
(2540, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:15:48', '2021-11-04 08:15:48'),
(2541, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:15:53', '2021-11-04 08:15:53'),
(2542, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:16:00', '2021-11-04 08:16:00'),
(2543, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:16:31', '2021-11-04 08:16:31'),
(2544, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:16:34', '2021-11-04 08:16:34'),
(2545, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":\"simpe...\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:16:57', '2021-11-04 08:16:57'),
(2546, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:17:16', '2021-11-04 08:17:16'),
(2547, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":null,\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:17:20', '2021-11-04 08:17:20'),
(2548, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:17:55', '2021-11-04 08:17:55'),
(2549, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":null,\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:17:59', '2021-11-04 08:17:59'),
(2550, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:18:37', '2021-11-04 08:18:37'),
(2551, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":\"simple\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:18:42', '2021-11-04 08:18:42'),
(2552, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:20:50', '2021-11-04 08:20:50'),
(2553, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:27:54', '2021-11-04 08:27:54'),
(2554, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":null,\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:27:59', '2021-11-04 08:27:59'),
(2555, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:28:50', '2021-11-04 08:28:50'),
(2556, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":null,\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:28:54', '2021-11-04 08:28:54'),
(2557, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:30:58', '2021-11-04 08:30:58'),
(2558, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":null,\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:31:01', '2021-11-04 08:31:01'),
(2559, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:31:32', '2021-11-04 08:31:32'),
(2560, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"4\",\"status_comment\":\"simple reason\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:31:55', '2021-11-04 08:31:55'),
(2561, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 08:31:55', '2021-11-04 08:31:55'),
(2562, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:32:03', '2021-11-04 08:32:03'),
(2563, 2, 'admin/planting-returns/8', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:32:14', '2021-11-04 08:32:14'),
(2564, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:32:24', '2021-11-04 08:32:24'),
(2565, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:33:06', '2021-11-04 08:33:06'),
(2566, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 08:36:48', '2021-11-04 08:36:48'),
(2567, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:38:06', '2021-11-04 08:38:06'),
(2568, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:40:16', '2021-11-04 08:40:16'),
(2569, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:40:59', '2021-11-04 08:40:59'),
(2570, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:41:14', '2021-11-04 08:41:14'),
(2571, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:42:54', '2021-11-04 08:42:54'),
(2572, 2, 'admin/form-sr10s', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:43:06', '2021-11-04 08:43:06'),
(2573, 2, 'admin/planting-returns', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:46:47', '2021-11-04 08:46:47'),
(2574, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:50:59', '2021-11-04 08:50:59'),
(2575, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:51:03', '2021-11-04 08:51:03'),
(2576, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:52:13', '2021-11-04 08:52:13'),
(2577, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:52:26', '2021-11-04 08:52:26'),
(2578, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:52:34', '2021-11-04 08:52:34'),
(2579, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:52:54', '2021-11-04 08:52:54'),
(2580, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:52:57', '2021-11-04 08:52:57'),
(2581, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:53:07', '2021-11-04 08:53:07'),
(2582, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:53:21', '2021-11-04 08:53:21'),
(2583, 20, 'admin/form-sr10s/8', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Flowering\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"7\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:53:28', '2021-11-04 08:53:28'),
(2584, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 08:53:28', '2021-11-04 08:53:28'),
(2585, 20, 'admin/form-sr10s/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:53:32', '2021-11-04 08:53:32'),
(2586, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:53:44', '2021-11-04 08:53:44'),
(2587, 20, 'admin/form-sr10s/9/edit', 'GET', '::1', '[]', '2021-11-04 08:54:06', '2021-11-04 08:54:06'),
(2588, 20, 'admin/form-sr10s/9/edit', 'GET', '::1', '[]', '2021-11-04 08:54:09', '2021-11-04 08:54:09'),
(2589, 20, 'admin/form-sr10s/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:54:59', '2021-11-04 08:54:59'),
(2590, 20, 'admin/form-sr10s/9', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"is_initialized\":\"1\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:55:12', '2021-11-04 08:55:12'),
(2591, 20, 'admin/form-sr10s/9/edit', 'GET', '::1', '[]', '2021-11-04 08:55:12', '2021-11-04 08:55:12'),
(2592, 20, 'admin/form-sr10s/9', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Pre-harvest\",\"min_date\":\"2022-01-03\",\"submited_date\":\"2021-11-04\",\"status\":\"5\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:55:22', '2021-11-04 08:55:22'),
(2593, 20, 'admin/form-sr10s/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:56:02', '2021-11-04 08:56:02'),
(2594, 20, 'admin/form-sr10s/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:56:15', '2021-11-04 08:56:15'),
(2595, 20, 'admin/form-sr10s/9', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Pre-harvest\",\"min_date\":\"2022-01-03\",\"submited_date\":\"2021-11-04\",\"status\":\"5\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:56:19', '2021-11-04 08:56:19'),
(2596, 20, 'admin/form-sr10s/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:58:01', '2021-11-04 08:58:01'),
(2597, 20, 'admin/form-sr10s/9', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Pre-harvest\",\"min_date\":\"2022-01-03\",\"submited_date\":\"2021-11-04\",\"status\":\"5\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\"}', '2021-11-04 08:58:06', '2021-11-04 08:58:06'),
(2598, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 08:58:06', '2021-11-04 08:58:06'),
(2599, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:58:12', '2021-11-04 08:58:12'),
(2600, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:58:22', '2021-11-04 08:58:22'),
(2601, 20, 'admin/form-sr10s/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:59:03', '2021-11-04 08:59:03'),
(2602, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:59:07', '2021-11-04 08:59:07'),
(2603, 20, 'admin/form-sr10s/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:59:11', '2021-11-04 08:59:11'),
(2604, 20, 'admin/form-sr10s/9', 'PUT', '::1', '{\"is_done\":\"1\",\"is_active\":\"0\",\"stage\":\"Pre-harvest\",\"min_date\":\"2022-01-03\",\"submited_date\":\"2021-11-04\",\"status\":\"5\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-sr10s\"}', '2021-11-04 08:59:14', '2021-11-04 08:59:14'),
(2605, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 08:59:14', '2021-11-04 08:59:14'),
(2606, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 08:59:31', '2021-11-04 08:59:31'),
(2607, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:00:30', '2021-11-04 09:00:30'),
(2608, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 09:00:45', '2021-11-04 09:00:45'),
(2609, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:23:23', '2021-11-04 09:23:23'),
(2610, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-04 09:23:31', '2021-11-04 09:23:31'),
(2611, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:23:40', '2021-11-04 09:23:40'),
(2612, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"25\",\"title\":\"QDS - Crop declarations\",\"icon\":\"fa-wpforms\",\"uri\":\"form-crop-declarations\",\"roles\":[null],\"permission\":null,\"_token\":\"2tTdleHjwJAprkMBVqFEvKoPG616RqrBhem9uVjA\"}', '2021-11-04 09:24:52', '2021-11-04 09:24:52'),
(2613, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-11-04 09:24:52', '2021-11-04 09:24:52'),
(2614, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"2tTdleHjwJAprkMBVqFEvKoPG616RqrBhem9uVjA\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":31},{\\\"id\\\":32},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-11-04 09:25:11', '2021-11-04 09:25:11'),
(2615, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:25:12', '2021-11-04 09:25:12'),
(2616, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 09:25:16', '2021-11-04 09:25:16'),
(2617, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:25:22', '2021-11-04 09:25:22'),
(2618, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:25:53', '2021-11-04 09:25:53'),
(2619, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:30:47', '2021-11-04 09:30:47'),
(2620, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:30:56', '2021-11-04 09:30:56'),
(2621, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-04 09:37:11', '2021-11-04 09:37:11'),
(2622, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-04 09:37:26', '2021-11-04 09:37:26'),
(2623, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-04 09:37:45', '2021-11-04 09:37:45'),
(2624, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-04 09:38:04', '2021-11-04 09:38:04'),
(2625, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-04 09:39:40', '2021-11-04 09:39:40'),
(2626, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:41:00', '2021-11-04 09:41:00'),
(2627, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:42:02', '2021-11-04 09:42:02'),
(2628, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 09:42:07', '2021-11-04 09:42:07'),
(2629, 3, 'admin/planting-returns/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:42:46', '2021-11-04 09:42:46'),
(2630, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:42:57', '2021-11-04 09:42:57'),
(2631, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:43:00', '2021-11-04 09:43:00'),
(2632, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:43:13', '2021-11-04 09:43:13'),
(2633, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:47:19', '2021-11-04 09:47:19'),
(2634, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:49:41', '2021-11-04 09:49:41'),
(2635, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-04 09:51:45', '2021-11-04 09:51:45'),
(2636, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:53:05', '2021-11-04 09:53:05'),
(2637, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:55:13', '2021-11-04 09:55:13'),
(2638, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:57:26', '2021-11-04 09:57:26'),
(2639, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 09:59:59', '2021-11-04 09:59:59'),
(2640, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:02:07', '2021-11-04 10:02:07'),
(2641, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-04 10:02:11', '2021-11-04 10:02:11'),
(2642, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-04 10:03:46', '2021-11-04 10:03:46'),
(2643, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 10:03:48', '2021-11-04 10:03:48'),
(2644, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:10:27', '2021-11-04 10:10:27'),
(2645, 3, 'admin/form-qds/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:10:31', '2021-11-04 10:10:31'),
(2646, 3, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:10:34', '2021-11-04 10:10:34'),
(2647, 20, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:10:54', '2021-11-04 10:10:54'),
(2648, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:11:01', '2021-11-04 10:11:01'),
(2649, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:11:14', '2021-11-04 10:11:14'),
(2650, 2, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-04 10:11:23', '2021-11-04 10:11:23'),
(2651, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:11:29', '2021-11-04 10:11:29'),
(2652, 2, 'admin/form-qds', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:11:33', '2021-11-04 10:11:33'),
(2653, 2, 'admin/form-qds/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:11:37', '2021-11-04 10:11:37'),
(2654, 2, 'admin/form-qds/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:11:37', '2021-11-04 10:11:37'),
(2655, 2, 'admin/form-qds/2', 'PUT', '127.0.0.1', '{\"administrator_id\":\"3\",\"dealers_in\":\"[{\\\"crop\\\":\\\"12\\\",\\\"variety\\\":\\\"222\\\",\\\"ha\\\":\\\"2222\\\",\\\"origin\\\":\\\"2222\\\"}]\",\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Magdalene Lane Opposite Ndere Cultural Centre, Ntinda - Kisaasi Rd, Kampala\",\"company_initials\":null,\"premises_location\":\"11\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"iQiiPO24pjCkeIDo57XOSeoq4a1hoM9eorFkEbAo\",\"_method\":\"PUT\"}', '2021-11-04 10:11:42', '2021-11-04 10:11:42'),
(2656, 2, 'admin/form-qds', 'GET', '127.0.0.1', '[]', '2021-11-04 10:11:42', '2021-11-04 10:11:42'),
(2657, 20, 'admin/form-qds', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:11:46', '2021-11-04 10:11:46'),
(2658, 20, 'admin/form-qds/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:11:50', '2021-11-04 10:11:50'),
(2659, 20, 'admin/form-qds/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:11:50', '2021-11-04 10:11:50'),
(2660, 20, 'admin/form-qds/2', 'PUT', '::1', '{\"administrator_id\":\"3\",\"dealers_in\":\"[]\",\"name_of_applicant\":\"Betty Namagembe\",\"address\":\"Magdalene Lane Opposite Ndere Cultural Centre, Ntinda - Kisaasi Rd, Kampala\",\"company_initials\":null,\"premises_location\":\"11\",\"status\":\"5\",\"grower_number\":\"171717\",\"registration_number\":\"1918282\",\"valid_from\":\"2021-11-04\",\"valid_until\":\"2023-04-24\",\"_token\":\"O12nWCKx5X7hFeDzPgjT8GsHnVAH0f6DgRVJa7qK\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-04 10:12:19', '2021-11-04 10:12:19'),
(2661, 20, 'admin/form-qds/2/edit', 'GET', '::1', '[]', '2021-11-04 10:12:20', '2021-11-04 10:12:20'),
(2662, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:12:28', '2021-11-04 10:12:28'),
(2663, 3, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:12:32', '2021-11-04 10:12:32'),
(2664, 3, 'admin/planting-returns', 'GET', '::1', '[]', '2021-11-04 10:12:39', '2021-11-04 10:12:39'),
(2665, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:13:02', '2021-11-04 10:13:02'),
(2666, 3, 'admin/form-sr10s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:13:04', '2021-11-04 10:13:04'),
(2667, 3, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 10:13:05', '2021-11-04 10:13:05'),
(2668, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:13:31', '2021-11-04 10:13:31'),
(2669, 3, 'admin/form-sr10s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:13:37', '2021-11-04 10:13:37'),
(2670, 3, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 10:13:38', '2021-11-04 10:13:38'),
(2671, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:13:41', '2021-11-04 10:13:41'),
(2672, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:13:42', '2021-11-04 10:13:42'),
(2673, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:13:51', '2021-11-04 10:13:51'),
(2674, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:14:06', '2021-11-04 10:14:06'),
(2675, 3, 'admin/form-sr10s/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:14:08', '2021-11-04 10:14:08'),
(2676, 3, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 10:14:08', '2021-11-04 10:14:08'),
(2677, 3, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-04 10:14:39', '2021-11-04 10:14:39'),
(2678, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:14:45', '2021-11-04 10:14:45'),
(2679, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:14:47', '2021-11-04 10:14:47'),
(2680, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:15:31', '2021-11-04 10:15:31'),
(2681, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-04 10:20:54', '2021-11-04 10:20:54'),
(2682, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:21:15', '2021-11-04 10:21:15'),
(2683, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 10:21:55', '2021-11-04 10:21:55'),
(2684, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 11:09:38', '2021-11-04 11:09:38'),
(2685, 20, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-04 16:06:05', '2021-11-04 16:06:05'),
(2686, 3, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-04 16:06:18', '2021-11-04 16:06:18'),
(2687, 3, 'admin', 'GET', '::1', '[]', '2021-11-05 04:59:57', '2021-11-05 04:59:57'),
(2688, 3, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 05:00:09', '2021-11-05 05:00:09'),
(2689, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 05:03:58', '2021-11-05 05:03:58'),
(2690, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 05:08:56', '2021-11-05 05:08:56'),
(2691, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:14:13', '2021-11-05 05:14:13'),
(2692, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:16:39', '2021-11-05 05:16:39'),
(2693, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:21:49', '2021-11-05 05:21:49'),
(2694, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:23:58', '2021-11-05 05:23:58'),
(2695, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:24:25', '2021-11-05 05:24:25'),
(2696, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:25:27', '2021-11-05 05:25:27'),
(2697, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:25:39', '2021-11-05 05:25:39'),
(2698, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:28:19', '2021-11-05 05:28:19'),
(2699, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:29:16', '2021-11-05 05:29:16'),
(2700, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:30:31', '2021-11-05 05:30:31'),
(2701, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:30:38', '2021-11-05 05:30:38'),
(2702, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:33:27', '2021-11-05 05:33:27'),
(2703, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 05:34:30', '2021-11-05 05:34:30'),
(2704, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:34:47', '2021-11-05 05:34:47'),
(2705, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:49:43', '2021-11-05 05:49:43'),
(2706, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:50:19', '2021-11-05 05:50:19'),
(2707, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:57:39', '2021-11-05 05:57:39'),
(2708, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 05:59:11', '2021-11-05 05:59:11'),
(2709, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 06:01:31', '2021-11-05 06:01:31'),
(2710, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:02:01', '2021-11-05 06:02:01'),
(2711, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 06:02:48', '2021-11-05 06:02:48'),
(2712, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 06:04:54', '2021-11-05 06:04:54'),
(2713, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:05:47', '2021-11-05 06:05:47'),
(2714, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:06:32', '2021-11-05 06:06:32'),
(2715, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:06:47', '2021-11-05 06:06:47'),
(2716, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:07:03', '2021-11-05 06:07:03'),
(2717, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:07:40', '2021-11-05 06:07:40'),
(2718, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:07:59', '2021-11-05 06:07:59'),
(2719, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 06:08:27', '2021-11-05 06:08:27'),
(2720, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 06:08:36', '2021-11-05 06:08:36'),
(2721, 3, 'admin/form-crop-declarations', 'POST', '::1', '{\"administrator_id\":\"3\",\"form_qd_id\":\"2\",\"source_of_seed\":\"Simple\",\"field_size\":\"120\",\"seed_rate\":\"11\",\"form_crop_declarations_has_crop_varieties\":{\"new_1\":{\"crop_variety_id\":\"3\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"4\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"crop_variety_id\":\"5\",\"id\":null,\"_remove_\":\"0\"}},\"amount\":\"1000000\",\"status\":\"1\",\"_token\":\"zo3yeHy5Wzc5A5UtQMnSgAy2rI1ndNZrwwFj4QZq\"}', '2021-11-05 06:09:14', '2021-11-05 06:09:14'),
(2722, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 06:09:15', '2021-11-05 06:09:15'),
(2723, 3, 'admin/form-crop-declarations', 'POST', '::1', '{\"administrator_id\":\"3\",\"form_qd_id\":\"2\",\"source_of_seed\":\"Simple\",\"field_size\":\"120\",\"seed_rate\":\"11\",\"form_crop_declarations_has_crop_varieties\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"5\",\"id\":null,\"_remove_\":\"0\"}},\"amount\":\"1000000\",\"status\":\"1\",\"_token\":\"zo3yeHy5Wzc5A5UtQMnSgAy2rI1ndNZrwwFj4QZq\"}', '2021-11-05 06:10:52', '2021-11-05 06:10:52'),
(2724, 3, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 06:10:52', '2021-11-05 06:10:52'),
(2725, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:11:16', '2021-11-05 06:11:16'),
(2726, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:11:27', '2021-11-05 06:11:27'),
(2727, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:11:55', '2021-11-05 06:11:55'),
(2728, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:13:15', '2021-11-05 06:13:15'),
(2729, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:15:25', '2021-11-05 06:15:25'),
(2730, 3, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 06:17:04', '2021-11-05 06:17:04'),
(2731, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:17:27', '2021-11-05 06:17:27'),
(2732, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:18:18', '2021-11-05 06:18:18'),
(2733, 3, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 06:19:23', '2021-11-05 06:19:23'),
(2734, 3, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 06:19:37', '2021-11-05 06:19:37'),
(2735, 3, 'admin/form-crop-declarations/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:19:46', '2021-11-05 06:19:46'),
(2736, 3, 'admin/form-crop-declarations/1', 'GET', '::1', '[]', '2021-11-05 06:20:37', '2021-11-05 06:20:37'),
(2737, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:20:40', '2021-11-05 06:20:40'),
(2738, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:20:58', '2021-11-05 06:20:58'),
(2739, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:22:42', '2021-11-05 06:22:42'),
(2740, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:22:49', '2021-11-05 06:22:49'),
(2741, 3, 'admin/form-crop-declarations/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:23:17', '2021-11-05 06:23:17'),
(2742, 3, 'admin/form-crop-declarations/1', 'GET', '::1', '[]', '2021-11-05 06:23:38', '2021-11-05 06:23:38'),
(2743, 3, 'admin/form-crop-declarations/1', 'GET', '::1', '[]', '2021-11-05 06:23:50', '2021-11-05 06:23:50'),
(2744, 2, 'admin/form-crop-declarations/1', 'GET', '127.0.0.1', '[]', '2021-11-05 06:24:18', '2021-11-05 06:24:18'),
(2745, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:24:27', '2021-11-05 06:24:27'),
(2746, 2, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-05 06:24:34', '2021-11-05 06:24:34'),
(2747, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:25:33', '2021-11-05 06:25:33'),
(2748, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:25:37', '2021-11-05 06:25:37'),
(2749, 3, 'admin/form-crop-declarations/1', 'GET', '::1', '[]', '2021-11-05 06:30:17', '2021-11-05 06:30:17'),
(2750, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:30:22', '2021-11-05 06:30:22'),
(2751, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:30:58', '2021-11-05 06:30:58'),
(2752, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:32:19', '2021-11-05 06:32:19'),
(2753, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:33:11', '2021-11-05 06:33:11'),
(2754, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:35:53', '2021-11-05 06:35:53'),
(2755, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:36:07', '2021-11-05 06:36:07'),
(2756, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:36:48', '2021-11-05 06:36:48'),
(2757, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:37:04', '2021-11-05 06:37:04'),
(2758, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:37:19', '2021-11-05 06:37:19'),
(2759, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:37:40', '2021-11-05 06:37:40'),
(2760, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:39:09', '2021-11-05 06:39:09'),
(2761, 2, 'admin/form-crop-declarations/1', 'PUT', '127.0.0.1', '{\"administrator_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"pmUTIxCJ5u3Y4Jik4bQUstIx3QQJlD21IHkWS2pH\",\"after-save\":\"3\",\"_method\":\"PUT\"}', '2021-11-05 06:40:05', '2021-11-05 06:40:05'),
(2762, 2, 'admin/form-crop-declarations/1', 'GET', '127.0.0.1', '[]', '2021-11-05 06:40:06', '2021-11-05 06:40:06'),
(2763, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:40:09', '2021-11-05 06:40:09'),
(2764, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:40:49', '2021-11-05 06:40:49'),
(2765, 2, 'admin/form-crop-declarations/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:40:52', '2021-11-05 06:40:52'),
(2766, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:41:02', '2021-11-05 06:41:02'),
(2767, 2, 'admin/form-crop-declarations/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:41:06', '2021-11-05 06:41:06'),
(2768, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:41:09', '2021-11-05 06:41:09'),
(2769, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:41:11', '2021-11-05 06:41:11'),
(2770, 2, 'admin/form-crop-declarations/1', 'PUT', '127.0.0.1', '{\"administrator_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"pmUTIxCJ5u3Y4Jik4bQUstIx3QQJlD21IHkWS2pH\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-crop-declarations\"}', '2021-11-05 06:41:32', '2021-11-05 06:41:32'),
(2771, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:41:32', '2021-11-05 06:41:32'),
(2772, 2, 'admin/form-crop-declarations/1', 'PUT', '127.0.0.1', '{\"administrator_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"pmUTIxCJ5u3Y4Jik4bQUstIx3QQJlD21IHkWS2pH\",\"_method\":\"PUT\"}', '2021-11-05 06:41:37', '2021-11-05 06:41:37'),
(2773, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '[]', '2021-11-05 06:41:37', '2021-11-05 06:41:37'),
(2774, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:41:44', '2021-11-05 06:41:44'),
(2775, 20, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 06:42:29', '2021-11-05 06:42:29'),
(2776, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:42:36', '2021-11-05 06:42:36'),
(2777, 20, 'admin', 'GET', '::1', '[]', '2021-11-05 06:42:42', '2021-11-05 06:42:42'),
(2778, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:42:51', '2021-11-05 06:42:51'),
(2779, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:43:33', '2021-11-05 06:43:33'),
(2780, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:43:47', '2021-11-05 06:43:47'),
(2781, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:43:48', '2021-11-05 06:43:48'),
(2782, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 06:44:37', '2021-11-05 06:44:37'),
(2783, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '[]', '2021-11-05 06:45:37', '2021-11-05 06:45:37'),
(2784, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:46:26', '2021-11-05 06:46:26'),
(2785, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:48:11', '2021-11-05 06:48:11'),
(2786, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:48:26', '2021-11-05 06:48:26'),
(2787, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:48:50', '2021-11-05 06:48:50'),
(2788, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:49:11', '2021-11-05 06:49:11'),
(2789, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 06:49:57', '2021-11-05 06:49:57'),
(2790, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:50:05', '2021-11-05 06:50:05'),
(2791, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:50:11', '2021-11-05 06:50:11'),
(2792, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:50:42', '2021-11-05 06:50:42'),
(2793, 20, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:50:43', '2021-11-05 06:50:43'),
(2794, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:50:46', '2021-11-05 06:50:46'),
(2795, 20, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 06:51:29', '2021-11-05 06:51:29'),
(2796, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:52:55', '2021-11-05 06:52:55'),
(2797, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:55:29', '2021-11-05 06:55:29'),
(2798, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:55:55', '2021-11-05 06:55:55'),
(2799, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:56:55', '2021-11-05 06:56:55'),
(2800, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 06:57:13', '2021-11-05 06:57:13'),
(2801, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 06:57:22', '2021-11-05 06:57:22'),
(2802, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:58:18', '2021-11-05 06:58:18'),
(2803, 20, 'admin/form-crop-declarations/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:58:21', '2021-11-05 06:58:21'),
(2804, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:58:26', '2021-11-05 06:58:26'),
(2805, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:58:32', '2021-11-05 06:58:32'),
(2806, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 06:58:54', '2021-11-05 06:58:54'),
(2807, 20, 'admin/form-crop-declarations/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"status\":\"3\",\"status_comment\":\"Simple reason\",\"_token\":\"a9pOHDlaTNe5wzOjnH5NbBApGNIEfWfICjiVN77L\",\"_method\":\"PUT\"}', '2021-11-05 06:59:08', '2021-11-05 06:59:08'),
(2808, 20, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 06:59:08', '2021-11-05 06:59:08'),
(2809, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 06:59:23', '2021-11-05 06:59:23'),
(2810, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:00:35', '2021-11-05 07:00:35'),
(2811, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:01:16', '2021-11-05 07:01:16'),
(2812, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:01:50', '2021-11-05 07:01:50'),
(2813, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:02:02', '2021-11-05 07:02:02'),
(2814, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:02:11', '2021-11-05 07:02:11'),
(2815, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:02:31', '2021-11-05 07:02:31');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(2816, 3, 'admin/form-crop-declarations/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"form_qd_id\":\"2\",\"source_of_seed\":\"Simple\",\"field_size\":\"120\",\"seed_rate\":\"11\",\"form_crop_declarations_has_crop_varieties\":{\"1\":{\"crop_variety_id\":\"5\",\"id\":\"1\",\"_remove_\":\"0\"}},\"amount\":\"1000000\",\"status\":\"3\",\"_token\":\"zo3yeHy5Wzc5A5UtQMnSgAy2rI1ndNZrwwFj4QZq\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-crop-declarations\"}', '2021-11-05 07:02:38', '2021-11-05 07:02:38'),
(2817, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 07:02:39', '2021-11-05 07:02:39'),
(2818, 3, 'admin/form-crop-declarations/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"form_qd_id\":\"2\",\"source_of_seed\":\"Simple\",\"field_size\":\"120\",\"seed_rate\":\"11\",\"form_crop_declarations_has_crop_varieties\":{\"1\":{\"crop_variety_id\":\"5\",\"id\":\"1\",\"_remove_\":\"0\"}},\"amount\":\"1000000\",\"status\":\"3\",\"_token\":\"zo3yeHy5Wzc5A5UtQMnSgAy2rI1ndNZrwwFj4QZq\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 07:02:47', '2021-11-05 07:02:47'),
(2819, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 07:02:47', '2021-11-05 07:02:47'),
(2820, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:02:57', '2021-11-05 07:02:57'),
(2821, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:03:00', '2021-11-05 07:03:00'),
(2822, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 07:03:37', '2021-11-05 07:03:37'),
(2823, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 07:04:24', '2021-11-05 07:04:24'),
(2824, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:04:57', '2021-11-05 07:04:57'),
(2825, 3, 'admin/form-crop-declarations/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"form_qd_id\":\"2\",\"source_of_seed\":\"Simple\",\"field_size\":\"120\",\"seed_rate\":\"11\",\"form_crop_declarations_has_crop_varieties\":{\"1\":{\"crop_variety_id\":\"5\",\"id\":\"1\",\"_remove_\":\"0\"}},\"amount\":\"1000000\",\"status\":\"3\",\"_token\":\"zo3yeHy5Wzc5A5UtQMnSgAy2rI1ndNZrwwFj4QZq\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 07:05:03', '2021-11-05 07:05:03'),
(2826, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 07:05:03', '2021-11-05 07:05:03'),
(2827, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:05:10', '2021-11-05 07:05:10'),
(2828, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:05:12', '2021-11-05 07:05:12'),
(2829, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:05:22', '2021-11-05 07:05:22'),
(2830, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:05:23', '2021-11-05 07:05:23'),
(2831, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:05:26', '2021-11-05 07:05:26'),
(2832, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:05:29', '2021-11-05 07:05:29'),
(2833, 3, 'admin/form-crop-declarations/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"form_qd_id\":\"2\",\"source_of_seed\":\"Simple\",\"field_size\":\"120\",\"seed_rate\":\"11\",\"form_crop_declarations_has_crop_varieties\":{\"1\":{\"crop_variety_id\":\"5\",\"id\":\"1\",\"_remove_\":\"0\"},\"new_1\":{\"crop_variety_id\":\"4\",\"id\":null,\"_remove_\":\"0\"}},\"amount\":\"1000000\",\"status\":\"1\",\"_token\":\"zo3yeHy5Wzc5A5UtQMnSgAy2rI1ndNZrwwFj4QZq\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 07:05:50', '2021-11-05 07:05:50'),
(2834, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 07:05:51', '2021-11-05 07:05:51'),
(2835, 3, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 07:07:32', '2021-11-05 07:07:32'),
(2836, 3, 'admin/form-crop-declarations/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"form_qd_id\":\"2\",\"source_of_seed\":\"Simple\",\"field_size\":\"120\",\"seed_rate\":\"11\",\"form_crop_declarations_has_crop_varieties\":{\"1\":{\"crop_variety_id\":\"5\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"crop_variety_id\":\"4\",\"id\":\"2\",\"_remove_\":\"0\"}},\"amount\":\"1000000\",\"status\":\"1\",\"_token\":\"zo3yeHy5Wzc5A5UtQMnSgAy2rI1ndNZrwwFj4QZq\",\"_method\":\"PUT\"}', '2021-11-05 07:07:34', '2021-11-05 07:07:34'),
(2837, 3, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 07:07:35', '2021-11-05 07:07:35'),
(2838, 3, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 08:27:06', '2021-11-05 08:27:06'),
(2839, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:27:23', '2021-11-05 08:27:23'),
(2840, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:27:35', '2021-11-05 08:27:35'),
(2841, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:28:47', '2021-11-05 08:28:47'),
(2842, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"status\",\"type\":\"desc\"}}', '2021-11-05 08:29:01', '2021-11-05 08:29:01'),
(2843, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"status\",\"type\":\"asc\"}}', '2021-11-05 08:29:04', '2021-11-05 08:29:04'),
(2844, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:29:09', '2021-11-05 08:29:09'),
(2845, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:29:27', '2021-11-05 08:29:27'),
(2846, 2, 'admin/form-crop-declarations/1', 'PUT', '127.0.0.1', '{\"administrator_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"pmUTIxCJ5u3Y4Jik4bQUstIx3QQJlD21IHkWS2pH\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-crop-declarations\"}', '2021-11-05 08:29:33', '2021-11-05 08:29:33'),
(2847, 2, 'admin/form-crop-declarations/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 08:29:34', '2021-11-05 08:29:34'),
(2848, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:29:38', '2021-11-05 08:29:38'),
(2849, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:29:41', '2021-11-05 08:29:41'),
(2850, 20, 'admin/form-crop-declarations/1', 'PUT', '::1', '{\"administrator_id\":\"3\",\"status\":\"5\",\"_token\":\"a9pOHDlaTNe5wzOjnH5NbBApGNIEfWfICjiVN77L\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-crop-declarations\"}', '2021-11-05 08:29:46', '2021-11-05 08:29:46'),
(2851, 20, 'admin/form-crop-declarations/1/edit', 'GET', '::1', '[]', '2021-11-05 08:29:46', '2021-11-05 08:29:46'),
(2852, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:29:51', '2021-11-05 08:29:51'),
(2853, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:30:00', '2021-11-05 08:30:00'),
(2854, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:30:17', '2021-11-05 08:30:17'),
(2855, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:30:21', '2021-11-05 08:30:21'),
(2856, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:30:25', '2021-11-05 08:30:25'),
(2857, 3, 'admin/form-crop-declarations', 'GET', '::1', '[]', '2021-11-05 08:31:00', '2021-11-05 08:31:00'),
(2858, 3, 'admin', 'GET', '::1', '[]', '2021-11-05 10:44:13', '2021-11-05 10:44:13'),
(2859, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 10:44:39', '2021-11-05 10:44:39'),
(2860, 1, 'admin', 'GET', '::1', '[]', '2021-11-05 10:44:56', '2021-11-05 10:44:56'),
(2861, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 10:45:04', '2021-11-05 10:45:04'),
(2862, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Seed stock\",\"icon\":\"fa-archive\",\"uri\":\"#\",\"roles\":[null],\"permission\":null,\"_token\":\"5kDIQZok0FlqhtDiFeRi90klYFJ5bEJHhNBDdt8F\"}', '2021-11-05 10:45:53', '2021-11-05 10:45:53'),
(2863, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-05 10:45:53', '2021-11-05 10:45:53'),
(2864, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Examination\",\"icon\":\"fa-wpforms\",\"uri\":\"#\",\"roles\":[null],\"permission\":null,\"_token\":\"5kDIQZok0FlqhtDiFeRi90klYFJ5bEJHhNBDdt8F\"}', '2021-11-05 10:47:45', '2021-11-05 10:47:45'),
(2865, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-05 10:47:46', '2021-11-05 10:47:46'),
(2866, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"5kDIQZok0FlqhtDiFeRi90klYFJ5bEJHhNBDdt8F\",\"_order\":\"[{\\\"id\\\":33,\\\"children\\\":[{\\\"id\\\":34}]},{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":31},{\\\"id\\\":32},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-11-05 10:47:54', '2021-11-05 10:47:54'),
(2867, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 10:47:55', '2021-11-05 10:47:55'),
(2868, 1, 'admin/auth/menu/34/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 10:48:01', '2021-11-05 10:48:01'),
(2869, 1, 'admin/auth/menu/34', 'PUT', '::1', '{\"parent_id\":\"33\",\"title\":\"Stock examination\",\"icon\":\"fa-wpforms\",\"uri\":\"#\",\"roles\":[null],\"permission\":null,\"_token\":\"5kDIQZok0FlqhtDiFeRi90klYFJ5bEJHhNBDdt8F\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2021-11-05 10:48:13', '2021-11-05 10:48:13'),
(2870, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-05 10:48:13', '2021-11-05 10:48:13'),
(2871, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"My stock\",\"icon\":\"fa-archive\",\"uri\":\"#\",\"roles\":[null],\"permission\":null,\"_token\":\"5kDIQZok0FlqhtDiFeRi90klYFJ5bEJHhNBDdt8F\"}', '2021-11-05 10:49:04', '2021-11-05 10:49:04'),
(2872, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-05 10:49:05', '2021-11-05 10:49:05'),
(2873, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"5kDIQZok0FlqhtDiFeRi90klYFJ5bEJHhNBDdt8F\",\"_order\":\"[{\\\"id\\\":33,\\\"children\\\":[{\\\"id\\\":34},{\\\"id\\\":35}]},{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":31},{\\\"id\\\":32},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-11-05 10:49:12', '2021-11-05 10:49:12'),
(2874, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 10:49:13', '2021-11-05 10:49:13'),
(2875, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:03:47', '2021-11-05 11:03:47'),
(2876, 1, 'admin/auth/menu/34/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:03:50', '2021-11-05 11:03:50'),
(2877, 1, 'admin/auth/menu/34', 'PUT', '::1', '{\"parent_id\":\"33\",\"title\":\"Stock examination\",\"icon\":\"fa-wpforms\",\"uri\":\"form-stock-examination-requests\",\"roles\":[null],\"permission\":null,\"_token\":\"5kDIQZok0FlqhtDiFeRi90klYFJ5bEJHhNBDdt8F\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2021-11-05 11:03:57', '2021-11-05 11:03:57'),
(2878, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-05 11:03:57', '2021-11-05 11:03:57'),
(2879, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:04:08', '2021-11-05 11:04:08'),
(2880, 1, 'admin', 'GET', '::1', '[]', '2021-11-05 11:04:13', '2021-11-05 11:04:13'),
(2881, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:04:21', '2021-11-05 11:04:21'),
(2882, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"5kDIQZok0FlqhtDiFeRi90klYFJ5bEJHhNBDdt8F\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":31},{\\\"id\\\":32},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":33,\\\"children\\\":[{\\\"id\\\":34},{\\\"id\\\":35}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-11-05 11:05:07', '2021-11-05 11:05:07'),
(2883, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"5kDIQZok0FlqhtDiFeRi90klYFJ5bEJHhNBDdt8F\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":31},{\\\"id\\\":32},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":33,\\\"children\\\":[{\\\"id\\\":34},{\\\"id\\\":35}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]}]\"}', '2021-11-05 11:05:07', '2021-11-05 11:05:07'),
(2884, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:05:08', '2021-11-05 11:05:08'),
(2885, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:05:08', '2021-11-05 11:05:08'),
(2886, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:05:13', '2021-11-05 11:05:13'),
(2887, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:05:17', '2021-11-05 11:05:17'),
(2888, 3, 'admin', 'GET', '::1', '[]', '2021-11-05 11:05:27', '2021-11-05 11:05:27'),
(2889, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:05:34', '2021-11-05 11:05:34'),
(2890, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-05 11:06:22', '2021-11-05 11:06:22'),
(2891, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:07:33', '2021-11-05 11:07:33'),
(2892, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:12:12', '2021-11-05 11:12:12'),
(2893, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:12:28', '2021-11-05 11:12:28'),
(2894, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:13:45', '2021-11-05 11:13:45'),
(2895, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:15:13', '2021-11-05 11:15:13'),
(2896, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:15:33', '2021-11-05 11:15:33'),
(2897, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:16:08', '2021-11-05 11:16:08'),
(2898, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:20:43', '2021-11-05 11:20:43'),
(2899, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:20:57', '2021-11-05 11:20:57'),
(2900, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:21:22', '2021-11-05 11:21:22'),
(2901, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:21:31', '2021-11-05 11:21:31'),
(2902, 3, 'admin', 'GET', '::1', '[]', '2021-11-05 11:21:54', '2021-11-05 11:21:54'),
(2903, 3, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:22:05', '2021-11-05 11:22:05'),
(2904, 3, 'admin/import-export-permits/8', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:22:11', '2021-11-05 11:22:11'),
(2905, 20, 'admin/import-export-permits/8', 'GET', '::1', '[]', '2021-11-05 11:22:44', '2021-11-05 11:22:44'),
(2906, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:22:47', '2021-11-05 11:22:47'),
(2907, 20, 'admin/import-export-permits/8', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:22:51', '2021-11-05 11:22:51'),
(2908, 2, 'admin/import-export-permits/8', 'GET', '127.0.0.1', '[]', '2021-11-05 11:22:59', '2021-11-05 11:22:59'),
(2909, 2, 'admin/import-export-permits', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:23:01', '2021-11-05 11:23:01'),
(2910, 2, 'admin/import-export-permits/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:23:04', '2021-11-05 11:23:04'),
(2911, 2, 'admin/import-export-permits/8/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 11:23:18', '2021-11-05 11:23:18'),
(2912, 2, 'admin/import-export-permits/8', 'PUT', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"VUiY3iL3gBBVXGkV8DyN2BMfJnRSS9xMqnUZbbvX\",\"_method\":\"PUT\"}', '2021-11-05 11:23:26', '2021-11-05 11:23:26'),
(2913, 2, 'admin/import-export-permits', 'GET', '127.0.0.1', '[]', '2021-11-05 11:23:26', '2021-11-05 11:23:26'),
(2914, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:23:31', '2021-11-05 11:23:31'),
(2915, 20, 'admin/import-export-permits/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:23:35', '2021-11-05 11:23:35'),
(2916, 20, 'admin/import-export-permits/8', 'PUT', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Muhindo Mubaraka\",\"telephone\":\"+256706638494\",\"address\":\"Kibuli, Kampala, Uganda\",\"store_location\":\"aasas\",\"status\":\"5\",\"permit_number\":\"386342\",\"valid_from\":\"2021-10-28\",\"valid_until\":\"2022-09-01\",\"_token\":\"kXmwoG0X5WKXTa9BD6mz7UDmv7WKms1oJiThKsmu\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-11-05 11:23:48', '2021-11-05 11:23:48'),
(2917, 20, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-11-05 11:23:48', '2021-11-05 11:23:48'),
(2918, 2, 'admin/import-export-permits', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 11:23:59', '2021-11-05 11:23:59'),
(2919, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:24:09', '2021-11-05 11:24:09'),
(2920, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:25:56', '2021-11-05 11:25:56'),
(2921, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:26:31', '2021-11-05 11:26:31'),
(2922, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:26:53', '2021-11-05 11:26:53'),
(2923, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:27:21', '2021-11-05 11:27:21'),
(2924, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:27:35', '2021-11-05 11:27:35'),
(2925, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:27:46', '2021-11-05 11:27:46'),
(2926, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:28:03', '2021-11-05 11:28:03'),
(2927, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:28:14', '2021-11-05 11:28:14'),
(2928, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:30:11', '2021-11-05 11:30:11'),
(2929, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:30:30', '2021-11-05 11:30:30'),
(2930, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:31:46', '2021-11-05 11:31:46'),
(2931, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:32:24', '2021-11-05 11:32:24'),
(2932, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:36:43', '2021-11-05 11:36:43'),
(2933, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:37:34', '2021-11-05 11:37:34'),
(2934, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:37:44', '2021-11-05 11:37:44'),
(2935, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:38:13', '2021-11-05 11:38:13'),
(2936, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:38:16', '2021-11-05 11:38:16'),
(2937, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:38:39', '2021-11-05 11:38:39'),
(2938, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:39:33', '2021-11-05 11:39:33'),
(2939, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:42:14', '2021-11-05 11:42:14'),
(2940, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:44:07', '2021-11-05 11:44:07'),
(2941, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:44:09', '2021-11-05 11:44:09'),
(2942, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:44:36', '2021-11-05 11:44:36'),
(2943, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:46:07', '2021-11-05 11:46:07'),
(2944, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 11:46:17', '2021-11-05 11:46:17'),
(2945, 20, 'admin/import-export-permits/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 13:15:30', '2021-11-05 13:15:30'),
(2946, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-05 13:17:20', '2021-11-05 13:17:20'),
(2947, 3, 'admin', 'GET', '::1', '[]', '2021-11-05 18:39:10', '2021-11-05 18:39:10'),
(2948, 3, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 18:39:35', '2021-11-05 18:39:35'),
(2949, 3, 'admin/auth/setting', 'PUT', '::1', '{\"name\":\"Betty Namagembe\",\"password\":\"$2y$10$cBUNI05M8a7AUXSEgLr4cudiDW3nFZ2McpfuAQOf4HIfjUF.6Viha\",\"password_confirmation\":\"$2y$10$cBUNI05M8a7AUXSEgLr4cudiDW3nFZ2McpfuAQOf4HIfjUF.6Viha\",\"_token\":\"LoKNpwFk6EvMz4SnLCgOWpppAqHMO4TYtKSMaUro\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\"}', '2021-11-05 18:40:15', '2021-11-05 18:40:15'),
(2950, 3, 'admin/auth/setting', 'GET', '::1', '[]', '2021-11-05 18:40:15', '2021-11-05 18:40:15'),
(2951, 3, 'admin/auth/setting', 'PUT', '::1', '{\"name\":\"Betty Namagembe\",\"password\":\"$2y$10$cBUNI05M8a7AUXSEgLr4cudiDW3nFZ2McpfuAQOf4HIfjUF.6Viha\",\"password_confirmation\":\"$2y$10$cBUNI05M8a7AUXSEgLr4cudiDW3nFZ2McpfuAQOf4HIfjUF.6Viha\",\"_token\":\"LoKNpwFk6EvMz4SnLCgOWpppAqHMO4TYtKSMaUro\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 18:45:40', '2021-11-05 18:45:40'),
(2952, 3, 'admin/auth/setting', 'GET', '::1', '[]', '2021-11-05 18:45:40', '2021-11-05 18:45:40'),
(2953, 3, 'admin', 'GET', '::1', '[]', '2021-11-08 05:22:55', '2021-11-08 05:22:55'),
(2954, 3, 'admin', 'GET', '::1', '[]', '2021-11-08 05:23:27', '2021-11-08 05:23:27'),
(2955, 3, 'admin', 'GET', '::1', '[]', '2021-11-08 05:25:35', '2021-11-08 05:25:35'),
(2956, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:27:06', '2021-11-08 05:27:06'),
(2957, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:30:24', '2021-11-08 05:30:24'),
(2958, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 05:30:26', '2021-11-08 05:30:26'),
(2959, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:30:30', '2021-11-08 05:30:30'),
(2960, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 05:37:30', '2021-11-08 05:37:30'),
(2961, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 05:37:43', '2021-11-08 05:37:43'),
(2962, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 05:37:56', '2021-11-08 05:37:56'),
(2963, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 05:43:19', '2021-11-08 05:43:19'),
(2964, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 05:51:10', '2021-11-08 05:51:10'),
(2965, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 05:58:26', '2021-11-08 05:58:26'),
(2966, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 05:58:35', '2021-11-08 05:58:35'),
(2967, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 05:58:44', '2021-11-08 05:58:44'),
(2968, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 05:58:59', '2021-11-08 05:58:59'),
(2969, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 06:12:02', '2021-11-08 06:12:02'),
(2970, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 06:12:31', '2021-11-08 06:12:31'),
(2971, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:13:22', '2021-11-08 06:13:22'),
(2972, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 06:14:26', '2021-11-08 06:14:26'),
(2973, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 06:17:47', '2021-11-08 06:17:47'),
(2974, 3, 'admin/form-stock-examination-requests', 'POST', '::1', '{\"examination_category\":\"1\",\"import_export_permit_id\":\"8\",\"remarks\":\"Simple remarks\",\"_token\":\"Dn7APIDmWzUkc6AjFxtc8b4rPVC4yJNUZaAiCdk7\"}', '2021-11-08 06:18:10', '2021-11-08 06:18:10'),
(2975, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 06:18:11', '2021-11-08 06:18:11'),
(2976, 3, 'admin/form-stock-examination-requests', 'POST', '::1', '{\"examination_category\":\"1\",\"import_export_permit_id\":\"8\",\"remarks\":\"Simple remarks\",\"_token\":\"Dn7APIDmWzUkc6AjFxtc8b4rPVC4yJNUZaAiCdk7\"}', '2021-11-08 06:18:41', '2021-11-08 06:18:41'),
(2977, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 06:18:41', '2021-11-08 06:18:41'),
(2978, 3, 'admin/form-stock-examination-requests', 'POST', '::1', '{\"examination_category\":\"1\",\"import_export_permit_id\":\"8\",\"remarks\":\"Simple remarks\",\"_token\":\"Dn7APIDmWzUkc6AjFxtc8b4rPVC4yJNUZaAiCdk7\"}', '2021-11-08 06:19:16', '2021-11-08 06:19:16'),
(2979, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 06:19:16', '2021-11-08 06:19:16'),
(2980, 3, 'admin/form-stock-examination-requests', 'POST', '::1', '{\"examination_category\":\"1\",\"import_export_permit_id\":\"8\",\"remarks\":\"Simple remarks\",\"_token\":\"Dn7APIDmWzUkc6AjFxtc8b4rPVC4yJNUZaAiCdk7\"}', '2021-11-08 06:19:43', '2021-11-08 06:19:43'),
(2981, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 06:19:43', '2021-11-08 06:19:43'),
(2982, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:19:49', '2021-11-08 06:19:49'),
(2983, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:19:54', '2021-11-08 06:19:54'),
(2984, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:19:57', '2021-11-08 06:19:57'),
(2985, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:19:58', '2021-11-08 06:19:58'),
(2986, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:19:59', '2021-11-08 06:19:59'),
(2987, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:19:59', '2021-11-08 06:19:59'),
(2988, 3, 'admin/form-stock-examination-requests/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:20:04', '2021-11-08 06:20:04'),
(2989, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:20:40', '2021-11-08 06:20:40'),
(2990, 3, 'admin/form-stock-examination-requests/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:21:36', '2021-11-08 06:21:36'),
(2991, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:22:31', '2021-11-08 06:22:31'),
(2992, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:23:44', '2021-11-08 06:23:44'),
(2993, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 06:31:16', '2021-11-08 06:31:16'),
(2994, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 06:31:41', '2021-11-08 06:31:41'),
(2995, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 06:31:45', '2021-11-08 06:31:45'),
(2996, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 06:32:18', '2021-11-08 06:32:18'),
(2997, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 06:34:35', '2021-11-08 06:34:35'),
(2998, 3, 'admin/form-stock-examination-requests/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:34:38', '2021-11-08 06:34:38'),
(2999, 3, 'admin/form-stock-examination-requests/1/edit', 'GET', '::1', '[]', '2021-11-08 06:35:39', '2021-11-08 06:35:39'),
(3000, 3, 'admin/form-stock-examination-requests/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:36:31', '2021-11-08 06:36:31'),
(3001, 3, 'admin/form-stock-examination-requests/1', 'PUT', '::1', '{\"examination_category\":\"1\",\"import_export_permit_id\":\"8\",\"remarks\":\"Simple remarks\",\"administrator_id\":\"1\",\"_token\":\"Dn7APIDmWzUkc6AjFxtc8b4rPVC4yJNUZaAiCdk7\",\"_method\":\"PUT\"}', '2021-11-08 06:36:37', '2021-11-08 06:36:37'),
(3002, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 06:36:38', '2021-11-08 06:36:38'),
(3003, 3, 'admin/form-stock-examination-requests/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:36:48', '2021-11-08 06:36:48'),
(3004, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:36:54', '2021-11-08 06:36:54'),
(3005, 3, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"1\",\"_model\":\"App_Models_FormStockExaminationRequest\",\"_token\":\"Dn7APIDmWzUkc6AjFxtc8b4rPVC4yJNUZaAiCdk7\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-08 06:37:20', '2021-11-08 06:37:20'),
(3006, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:37:20', '2021-11-08 06:37:20'),
(3007, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:37:22', '2021-11-08 06:37:22'),
(3008, 3, 'admin/form-stock-examination-requests', 'POST', '::1', '{\"examination_category\":\"1\",\"import_export_permit_id\":\"8\",\"remarks\":\"test\",\"administrator_id\":\"3\",\"_token\":\"Dn7APIDmWzUkc6AjFxtc8b4rPVC4yJNUZaAiCdk7\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-stock-examination-requests\"}', '2021-11-08 06:37:29', '2021-11-08 06:37:29'),
(3009, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 06:37:29', '2021-11-08 06:37:29'),
(3010, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:37:42', '2021-11-08 06:37:42'),
(3011, 3, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:37:45', '2021-11-08 06:37:45'),
(3012, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:37:49', '2021-11-08 06:37:49'),
(3013, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:40:39', '2021-11-08 06:40:39'),
(3014, 3, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:40:46', '2021-11-08 06:40:46'),
(3015, 3, 'admin/form-stock-examination-requests/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:40:50', '2021-11-08 06:40:50'),
(3016, 3, 'admin/form-stock-examination-requests/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:41:15', '2021-11-08 06:41:15'),
(3017, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:41:17', '2021-11-08 06:41:17'),
(3018, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:41:40', '2021-11-08 06:41:40'),
(3019, 3, 'admin', 'GET', '::1', '[]', '2021-11-08 06:41:57', '2021-11-08 06:41:57'),
(3020, 20, 'admin', 'GET', '::1', '[]', '2021-11-08 06:42:26', '2021-11-08 06:42:26'),
(3021, 2, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-08 06:43:03', '2021-11-08 06:43:03'),
(3022, 2, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:43:41', '2021-11-08 06:43:41'),
(3023, 2, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:44:36', '2021-11-08 06:44:36'),
(3024, 2, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:45:01', '2021-11-08 06:45:01'),
(3025, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:45:22', '2021-11-08 06:45:22'),
(3026, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:45:33', '2021-11-08 06:45:33'),
(3027, 2, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:45:42', '2021-11-08 06:45:42'),
(3028, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:45:50', '2021-11-08 06:45:50'),
(3029, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:46:38', '2021-11-08 06:46:38'),
(3030, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 06:47:47', '2021-11-08 06:47:47'),
(3031, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:47', '2021-11-08 06:47:47'),
(3032, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:48', '2021-11-08 06:47:48'),
(3033, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:48', '2021-11-08 06:47:48'),
(3034, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:49', '2021-11-08 06:47:49'),
(3035, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:50', '2021-11-08 06:47:50'),
(3036, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:51', '2021-11-08 06:47:51'),
(3037, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:52', '2021-11-08 06:47:52'),
(3038, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:52', '2021-11-08 06:47:52'),
(3039, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:53', '2021-11-08 06:47:53'),
(3040, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:53', '2021-11-08 06:47:53'),
(3041, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:53', '2021-11-08 06:47:53'),
(3042, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:54', '2021-11-08 06:47:54'),
(3043, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:54', '2021-11-08 06:47:54'),
(3044, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:54', '2021-11-08 06:47:54'),
(3045, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:55', '2021-11-08 06:47:55'),
(3046, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:55', '2021-11-08 06:47:55'),
(3047, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:56', '2021-11-08 06:47:56'),
(3048, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:56', '2021-11-08 06:47:56'),
(3049, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:56', '2021-11-08 06:47:56'),
(3050, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:57', '2021-11-08 06:47:57'),
(3051, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:47:57', '2021-11-08 06:47:57'),
(3052, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:48:31', '2021-11-08 06:48:31'),
(3053, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:51:15', '2021-11-08 06:51:15'),
(3054, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:51:31', '2021-11-08 06:51:31'),
(3055, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:51:48', '2021-11-08 06:51:48'),
(3056, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:52:02', '2021-11-08 06:52:02'),
(3057, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 06:59:39', '2021-11-08 06:59:39'),
(3058, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:02:51', '2021-11-08 07:02:51'),
(3059, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:03:59', '2021-11-08 07:03:59'),
(3060, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:04:10', '2021-11-08 07:04:10'),
(3061, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:04:31', '2021-11-08 07:04:31'),
(3062, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:04:43', '2021-11-08 07:04:43'),
(3063, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:05:33', '2021-11-08 07:05:33'),
(3064, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:05:50', '2021-11-08 07:05:50'),
(3065, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:06:03', '2021-11-08 07:06:03'),
(3066, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:06:23', '2021-11-08 07:06:23'),
(3067, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:06:45', '2021-11-08 07:06:45'),
(3068, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:06:55', '2021-11-08 07:06:55'),
(3069, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:08:19', '2021-11-08 07:08:19'),
(3070, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:08:42', '2021-11-08 07:08:42'),
(3071, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:08:56', '2021-11-08 07:08:56'),
(3072, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:09:25', '2021-11-08 07:09:25'),
(3073, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:10:06', '2021-11-08 07:10:06'),
(3074, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:10:16', '2021-11-08 07:10:16'),
(3075, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:10:33', '2021-11-08 07:10:33'),
(3076, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:10:49', '2021-11-08 07:10:49'),
(3077, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:10:58', '2021-11-08 07:10:58'),
(3078, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:14:19', '2021-11-08 07:14:19'),
(3079, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:14:38', '2021-11-08 07:14:38'),
(3080, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:15:52', '2021-11-08 07:15:52'),
(3081, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:16:12', '2021-11-08 07:16:12'),
(3082, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:16:27', '2021-11-08 07:16:27'),
(3083, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:17:15', '2021-11-08 07:17:15'),
(3084, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:19:11', '2021-11-08 07:19:11'),
(3085, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:19:30', '2021-11-08 07:19:30'),
(3086, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:19:54', '2021-11-08 07:19:54'),
(3087, 2, 'admin/form-stock-examination-requests/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-08 07:20:04', '2021-11-08 07:20:04'),
(3088, 2, 'admin/form-stock-examination-requests/2', 'PUT', '127.0.0.1', '{\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"PkF7kq4ZJxgQuditVTjotkDgB6dVL0eCDMpSpB5u\",\"_method\":\"PUT\"}', '2021-11-08 07:20:10', '2021-11-08 07:20:10'),
(3089, 2, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '[]', '2021-11-08 07:20:11', '2021-11-08 07:20:11'),
(3090, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 07:21:04', '2021-11-08 07:21:04'),
(3091, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:21:26', '2021-11-08 07:21:26'),
(3092, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 07:23:52', '2021-11-08 07:23:52'),
(3093, 3, 'admin/form-stock-examination-requests/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:24:01', '2021-11-08 07:24:01'),
(3094, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:24:04', '2021-11-08 07:24:04'),
(3095, 20, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:24:30', '2021-11-08 07:24:30'),
(3096, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:24:33', '2021-11-08 07:24:33'),
(3097, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:24:35', '2021-11-08 07:24:35'),
(3098, 2, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:24:48', '2021-11-08 07:24:48'),
(3099, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:24:57', '2021-11-08 07:24:57'),
(3100, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:25:21', '2021-11-08 07:25:21'),
(3101, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:25:25', '2021-11-08 07:25:25'),
(3102, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 07:30:38', '2021-11-08 07:30:38'),
(3103, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 07:37:05', '2021-11-08 07:37:05'),
(3104, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:37:08', '2021-11-08 07:37:08'),
(3105, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:37:10', '2021-11-08 07:37:10'),
(3106, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:37:13', '2021-11-08 07:37:13'),
(3107, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:37:25', '2021-11-08 07:37:25'),
(3108, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:37:26', '2021-11-08 07:37:26'),
(3109, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 07:37:45', '2021-11-08 07:37:45'),
(3110, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 08:09:45', '2021-11-08 08:09:45'),
(3111, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 08:11:12', '2021-11-08 08:11:12'),
(3112, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 08:11:34', '2021-11-08 08:11:34'),
(3113, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 08:12:10', '2021-11-08 08:12:10'),
(3114, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 08:13:11', '2021-11-08 08:13:11'),
(3115, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 08:13:38', '2021-11-08 08:13:38'),
(3116, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 08:13:42', '2021-11-08 08:13:42'),
(3117, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 08:45:58', '2021-11-08 08:45:58'),
(3118, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 08:46:11', '2021-11-08 08:46:11'),
(3119, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 08:53:20', '2021-11-08 08:53:20'),
(3120, 20, 'admin/import-export-permits/8/edit', 'GET', '::1', '[]', '2021-11-08 08:53:47', '2021-11-08 08:53:47'),
(3121, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 08:55:37', '2021-11-08 08:55:37'),
(3122, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:04:20', '2021-11-08 09:04:20'),
(3123, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:09:55', '2021-11-08 09:09:55'),
(3124, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 09:12:42', '2021-11-08 09:12:42'),
(3125, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 09:12:54', '2021-11-08 09:12:54'),
(3126, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:13:32', '2021-11-08 09:13:32'),
(3127, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 09:13:35', '2021-11-08 09:13:35'),
(3128, 20, 'admin/import-export-permits/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:13:52', '2021-11-08 09:13:52'),
(3129, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:13:57', '2021-11-08 09:13:57'),
(3130, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:14:00', '2021-11-08 09:14:00'),
(3131, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"crop_variety_id\":\"3\",\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"DGYxOG1z61SMgW4Bhnj4H06zGkvUtxT3ZGZXQg5Y\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-stock-examination-requests\"}', '2021-11-08 09:14:20', '2021-11-08 09:14:20');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(3132, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 09:14:20', '2021-11-08 09:14:20'),
(3133, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:14:24', '2021-11-08 09:14:24'),
(3134, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:16:11', '2021-11-08 09:16:11'),
(3135, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:26:39', '2021-11-08 09:26:39'),
(3136, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:26:53', '2021-11-08 09:26:53'),
(3137, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:27:21', '2021-11-08 09:27:21'),
(3138, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:29:18', '2021-11-08 09:29:18'),
(3139, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:29:23', '2021-11-08 09:29:23'),
(3140, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:24', '2021-11-08 09:29:24'),
(3141, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:25', '2021-11-08 09:29:25'),
(3142, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:25', '2021-11-08 09:29:25'),
(3143, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:26', '2021-11-08 09:29:26'),
(3144, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:27', '2021-11-08 09:29:27'),
(3145, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:29', '2021-11-08 09:29:29'),
(3146, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:29', '2021-11-08 09:29:29'),
(3147, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:30', '2021-11-08 09:29:30'),
(3148, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:48', '2021-11-08 09:29:48'),
(3149, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:29:57', '2021-11-08 09:29:57'),
(3150, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:30:01', '2021-11-08 09:30:01'),
(3151, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 09:30:14', '2021-11-08 09:30:14'),
(3152, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:30:20', '2021-11-08 09:30:20'),
(3153, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 09:30:21', '2021-11-08 09:30:21'),
(3154, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:31:04', '2021-11-08 09:31:04'),
(3155, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:31:08', '2021-11-08 09:31:08'),
(3156, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 09:31:09', '2021-11-08 09:31:09'),
(3157, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:31:49', '2021-11-08 09:31:49'),
(3158, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:31:53', '2021-11-08 09:31:53'),
(3159, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 09:31:53', '2021-11-08 09:31:53'),
(3160, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:32:17', '2021-11-08 09:32:17'),
(3161, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:33:05', '2021-11-08 09:33:05'),
(3162, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 09:33:05', '2021-11-08 09:33:05'),
(3163, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:33:23', '2021-11-08 09:33:23'),
(3164, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 09:36:51', '2021-11-08 09:36:51'),
(3165, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-08 09:37:17', '2021-11-08 09:37:17'),
(3166, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:51:40', '2021-11-08 09:51:40'),
(3167, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:52:17', '2021-11-08 09:52:17'),
(3168, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-08 09:55:22', '2021-11-08 09:55:22'),
(3169, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 09:56:34', '2021-11-08 09:56:34'),
(3170, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"DGYxOG1z61SMgW4Bhnj4H06zGkvUtxT3ZGZXQg5Y\",\"_method\":\"PUT\"}', '2021-11-08 10:06:38', '2021-11-08 10:06:38'),
(3171, 20, 'admin/form-stock-examination-requests/2', 'GET', '::1', '[]', '2021-11-08 11:17:41', '2021-11-08 11:17:41'),
(3172, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 11:17:47', '2021-11-08 11:17:47'),
(3173, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 11:17:53', '2021-11-08 11:17:53'),
(3174, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 11:17:55', '2021-11-08 11:17:55'),
(3175, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 11:17:56', '2021-11-08 11:17:56'),
(3176, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"DGYxOG1z61SMgW4Bhnj4H06zGkvUtxT3ZGZXQg5Y\",\"_method\":\"PUT\"}', '2021-11-08 11:18:00', '2021-11-08 11:18:00'),
(3177, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 11:18:35', '2021-11-08 11:18:35'),
(3178, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"DGYxOG1z61SMgW4Bhnj4H06zGkvUtxT3ZGZXQg5Y\",\"_method\":\"PUT\"}', '2021-11-08 11:18:39', '2021-11-08 11:18:39'),
(3179, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 11:29:07', '2021-11-08 11:29:07'),
(3180, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"DGYxOG1z61SMgW4Bhnj4H06zGkvUtxT3ZGZXQg5Y\",\"_method\":\"PUT\"}', '2021-11-08 11:29:10', '2021-11-08 11:29:10'),
(3181, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 11:29:50', '2021-11-08 11:29:50'),
(3182, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"DGYxOG1z61SMgW4Bhnj4H06zGkvUtxT3ZGZXQg5Y\",\"_method\":\"PUT\"}', '2021-11-08 11:29:53', '2021-11-08 11:29:53'),
(3183, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-08 11:43:14', '2021-11-08 11:43:14'),
(3184, 20, 'admin', 'GET', '::1', '[]', '2021-11-09 02:45:43', '2021-11-09 02:45:43'),
(3185, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 02:45:48', '2021-11-09 02:45:48'),
(3186, 20, 'admin/form-stock-examination-requests/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 02:45:55', '2021-11-09 02:45:55'),
(3187, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 02:45:59', '2021-11-09 02:45:59'),
(3188, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 02:46:12', '2021-11-09 02:46:12'),
(3189, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-stock-examination-requests\"}', '2021-11-09 02:46:17', '2021-11-09 02:46:17'),
(3190, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 03:04:44', '2021-11-09 03:04:44'),
(3191, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:04:48', '2021-11-09 03:04:48'),
(3192, 20, 'admin/form-stock-examination-requests/2', 'GET', '::1', '[]', '2021-11-09 03:05:08', '2021-11-09 03:05:08'),
(3193, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:05:10', '2021-11-09 03:05:10'),
(3194, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:05:12', '2021-11-09 03:05:12'),
(3195, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:05:29', '2021-11-09 03:05:29'),
(3196, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:05:32', '2021-11-09 03:05:32'),
(3197, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 03:05:32', '2021-11-09 03:05:32'),
(3198, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:05:36', '2021-11-09 03:05:36'),
(3199, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:05:42', '2021-11-09 03:05:42'),
(3200, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:16:19', '2021-11-09 03:16:19'),
(3201, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:16:33', '2021-11-09 03:16:33'),
(3202, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 03:16:34', '2021-11-09 03:16:34'),
(3203, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:18:01', '2021-11-09 03:18:01'),
(3204, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 03:18:01', '2021-11-09 03:18:01'),
(3205, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:19:01', '2021-11-09 03:19:01'),
(3206, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:19:51', '2021-11-09 03:19:51'),
(3207, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"127500\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:20:15', '2021-11-09 03:20:15'),
(3208, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:21:00', '2021-11-09 03:21:00'),
(3209, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:21:10', '2021-11-09 03:21:10'),
(3210, 3, 'admin', 'GET', '::1', '[]', '2021-11-09 03:24:28', '2021-11-09 03:24:28'),
(3211, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:24:46', '2021-11-09 03:24:46'),
(3212, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:24:50', '2021-11-09 03:24:50'),
(3213, 20, 'admin/form-stock-examination-requests/2', 'GET', '::1', '[]', '2021-11-09 03:28:59', '2021-11-09 03:28:59'),
(3214, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:29:08', '2021-11-09 03:29:08'),
(3215, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:29:36', '2021-11-09 03:29:36'),
(3216, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 03:29:37', '2021-11-09 03:29:37'),
(3217, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:31:19', '2021-11-09 03:31:19'),
(3218, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:31:29', '2021-11-09 03:31:29'),
(3219, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 03:31:29', '2021-11-09 03:31:29'),
(3220, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:31:40', '2021-11-09 03:31:40'),
(3221, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-stock-examination-requests\"}', '2021-11-09 03:31:52', '2021-11-09 03:31:52'),
(3222, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 03:31:53', '2021-11-09 03:31:53'),
(3223, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:32:04', '2021-11-09 03:32:04'),
(3224, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 03:33:36', '2021-11-09 03:33:36'),
(3225, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:35:50', '2021-11-09 03:35:50'),
(3226, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 03:35:50', '2021-11-09 03:35:50'),
(3227, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:35:54', '2021-11-09 03:35:54'),
(3228, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:36:03', '2021-11-09 03:36:03'),
(3229, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 03:36:03', '2021-11-09 03:36:03'),
(3230, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:36:06', '2021-11-09 03:36:06'),
(3231, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:36:11', '2021-11-09 03:36:11'),
(3232, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:37:24', '2021-11-09 03:37:24'),
(3233, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 03:37:25', '2021-11-09 03:37:25'),
(3234, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:37:32', '2021-11-09 03:37:32'),
(3235, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:42:01', '2021-11-09 03:42:01'),
(3236, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-stock-examination-requests\"}', '2021-11-09 03:42:07', '2021-11-09 03:42:07'),
(3237, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 03:42:07', '2021-11-09 03:42:07'),
(3238, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:42:14', '2021-11-09 03:42:14'),
(3239, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:42:17', '2021-11-09 03:42:17'),
(3240, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 03:42:18', '2021-11-09 03:42:18'),
(3241, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:42:30', '2021-11-09 03:42:30'),
(3242, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-stock-examination-requests\"}', '2021-11-09 03:42:34', '2021-11-09 03:42:34'),
(3243, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:42:52', '2021-11-09 03:42:52'),
(3244, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:42:57', '2021-11-09 03:42:57'),
(3245, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:43:08', '2021-11-09 03:43:08'),
(3246, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:43:11', '2021-11-09 03:43:11'),
(3247, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:43:18', '2021-11-09 03:43:18'),
(3248, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:45:17', '2021-11-09 03:45:17'),
(3249, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:45:20', '2021-11-09 03:45:20'),
(3250, 20, 'admin/form-stock-examination-requests/2', 'GET', '::1', '[]', '2021-11-09 03:47:33', '2021-11-09 03:47:33'),
(3251, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:47:36', '2021-11-09 03:47:36'),
(3252, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:48:12', '2021-11-09 03:48:12'),
(3253, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:50:25', '2021-11-09 03:50:25'),
(3254, 20, 'admin/form-stock-examination-requests/2', 'PUT', '::1', '{\"yield\":\"12000\",\"seed_class\":\"Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"Be8yriv23DjWlBv3vVDpbLr9jZh4zCKcR8Ti4Oq8\",\"_method\":\"PUT\"}', '2021-11-09 03:50:29', '2021-11-09 03:50:29'),
(3255, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 03:50:29', '2021-11-09 03:50:29'),
(3256, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 03:56:34', '2021-11-09 03:56:34'),
(3257, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 03:57:27', '2021-11-09 03:57:27'),
(3258, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 04:00:07', '2021-11-09 04:00:07'),
(3259, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 04:01:58', '2021-11-09 04:01:58'),
(3260, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '[]', '2021-11-09 04:02:42', '2021-11-09 04:02:42'),
(3261, 20, 'admin/form-stock-examination-requests/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:02:56', '2021-11-09 04:02:56'),
(3262, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:03:07', '2021-11-09 04:03:07'),
(3263, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:03:10', '2021-11-09 04:03:10'),
(3264, 20, 'admin/form-sr4s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:05:01', '2021-11-09 04:05:01'),
(3265, 20, 'admin/form-sr6s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:05:02', '2021-11-09 04:05:02'),
(3266, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:05:08', '2021-11-09 04:05:08'),
(3267, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:05:22', '2021-11-09 04:05:22'),
(3268, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:05:25', '2021-11-09 04:05:25'),
(3269, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:07:41', '2021-11-09 04:07:41'),
(3270, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:07:44', '2021-11-09 04:07:44'),
(3271, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:14:10', '2021-11-09 04:14:10'),
(3272, 20, 'admin', 'GET', '::1', '[]', '2021-11-09 04:14:20', '2021-11-09 04:14:20'),
(3273, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:14:25', '2021-11-09 04:14:25'),
(3274, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:14:29', '2021-11-09 04:14:29'),
(3275, 20, 'admin/form-sr10s/6/edit', 'GET', '::1', '[]', '2021-11-09 04:15:06', '2021-11-09 04:15:06'),
(3276, 20, 'admin/form-sr10s/6', 'PUT', '::1', '{\"is_done\":\"0\",\"is_active\":\"1\",\"stage\":\"Pre-harvest\",\"min_date\":\"2021-11-04\",\"submited_date\":\"2021-11-04\",\"status\":\"5\",\"valid_from\":\"2021-01-05\",\"valid_until\":\"2022-01-05\",\"_token\":\"ej0wQvmCxFgZ0lExjgCXuSLWnP3fpxqjfFVYMEFz\",\"_method\":\"PUT\"}', '2021-11-09 04:16:27', '2021-11-09 04:16:27'),
(3277, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-09 04:16:28', '2021-11-09 04:16:28'),
(3278, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:17:52', '2021-11-09 04:17:52'),
(3279, 3, 'admin', 'GET', '::1', '[]', '2021-11-09 04:18:31', '2021-11-09 04:18:31'),
(3280, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:18:39', '2021-11-09 04:18:39'),
(3281, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:18:41', '2021-11-09 04:18:41'),
(3282, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 04:18:42', '2021-11-09 04:18:42'),
(3283, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:23:21', '2021-11-09 04:23:21'),
(3284, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 04:23:21', '2021-11-09 04:23:21'),
(3285, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:26:20', '2021-11-09 04:26:20'),
(3286, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 04:26:20', '2021-11-09 04:26:20'),
(3287, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:28:45', '2021-11-09 04:28:45'),
(3288, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 04:28:45', '2021-11-09 04:28:45'),
(3289, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:29:01', '2021-11-09 04:29:01'),
(3290, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 04:29:01', '2021-11-09 04:29:01'),
(3291, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:29:22', '2021-11-09 04:29:22'),
(3292, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 04:29:23', '2021-11-09 04:29:23'),
(3293, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:31:11', '2021-11-09 04:31:11'),
(3294, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 04:31:12', '2021-11-09 04:31:12'),
(3295, 3, 'admin/form-stock-examination-requests/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:31:19', '2021-11-09 04:31:19'),
(3296, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:31:22', '2021-11-09 04:31:22'),
(3297, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:32:11', '2021-11-09 04:32:11'),
(3298, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:43:13', '2021-11-09 04:43:13'),
(3299, 20, 'admin/form-sr10s/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:43:19', '2021-11-09 04:43:19'),
(3300, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:43:23', '2021-11-09 04:43:23'),
(3301, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-09 04:52:39', '2021-11-09 04:52:39'),
(3302, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:55:47', '2021-11-09 04:55:47'),
(3303, 20, 'admin/form-crop-declarations/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 04:56:31', '2021-11-09 04:56:31'),
(3304, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-09 05:01:03', '2021-11-09 05:01:03'),
(3305, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-09 05:02:03', '2021-11-09 05:02:03'),
(3306, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-09 05:08:02', '2021-11-09 05:08:02'),
(3307, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '[]', '2021-11-09 05:08:13', '2021-11-09 05:08:13'),
(3308, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:09:17', '2021-11-09 05:09:17'),
(3309, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:13:44', '2021-11-09 05:13:44'),
(3310, 20, 'admin/form-crop-declarations/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:13:50', '2021-11-09 05:13:50'),
(3311, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:14:07', '2021-11-09 05:14:07'),
(3312, 20, 'admin/form-crop-declarations/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:15:20', '2021-11-09 05:15:20'),
(3313, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:15:25', '2021-11-09 05:15:25'),
(3314, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 05:15:31', '2021-11-09 05:15:31'),
(3315, 2, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:15:43', '2021-11-09 05:15:43'),
(3316, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"1\",\"_model\":\"App_Models_FormCropDeclaration\",\"_token\":\"mNCXK5CLaIvtzJ35lhPuC6CuUWfeiaCMFIyt9Ei7\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-09 05:15:47', '2021-11-09 05:15:47'),
(3317, 2, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:15:48', '2021-11-09 05:15:48'),
(3318, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 05:16:04', '2021-11-09 05:16:04'),
(3319, 3, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:16:07', '2021-11-09 05:16:07'),
(3320, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:16:14', '2021-11-09 05:16:14'),
(3321, 3, 'admin/form-crop-declarations/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:16:16', '2021-11-09 05:16:16'),
(3322, 3, 'admin/form-crop-declarations', 'POST', '::1', '{\"administrator_id\":\"3\",\"form_qd_id\":\"2\",\"source_of_seed\":\"Simple test\",\"field_size\":\"12\",\"seed_rate\":\"150\",\"form_crop_declarations_has_crop_varieties\":{\"new_1\":{\"crop_variety_id\":\"3\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"4\",\"id\":null,\"_remove_\":\"0\"}},\"amount\":\"3\",\"status\":\"1\",\"_token\":\"hLOwpQTjyeib06dR7wlIwm8nADK8fSeW8715yS8J\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-crop-declarations\"}', '2021-11-09 05:19:34', '2021-11-09 05:19:34'),
(3323, 3, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '[]', '2021-11-09 05:19:35', '2021-11-09 05:19:35'),
(3324, 3, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:21:13', '2021-11-09 05:21:13'),
(3325, 3, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:21:18', '2021-11-09 05:21:18'),
(3326, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '[]', '2021-11-09 05:21:41', '2021-11-09 05:21:41'),
(3327, 2, 'admin/form-crop-declarations/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:21:46', '2021-11-09 05:21:46'),
(3328, 2, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:21:56', '2021-11-09 05:21:56'),
(3329, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:22:00', '2021-11-09 05:22:00'),
(3330, 20, 'admin', 'GET', '::1', '[]', '2021-11-09 05:22:08', '2021-11-09 05:22:08'),
(3331, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:22:15', '2021-11-09 05:22:15'),
(3332, 2, 'admin/form-crop-declarations/2', 'PUT', '127.0.0.1', '{\"administrator_id\":\"3\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"1MupNOx3sxIWuXAeA2nKBZjJYelNODX8MYsNA6cg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-crop-declarations\"}', '2021-11-09 05:22:19', '2021-11-09 05:22:19'),
(3333, 2, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '[]', '2021-11-09 05:22:19', '2021-11-09 05:22:19'),
(3334, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:22:23', '2021-11-09 05:22:23'),
(3335, 20, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:22:25', '2021-11-09 05:22:25'),
(3336, 20, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:23:15', '2021-11-09 05:23:15'),
(3337, 20, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:23:17', '2021-11-09 05:23:17'),
(3338, 20, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:23:37', '2021-11-09 05:23:37'),
(3339, 20, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:24:36', '2021-11-09 05:24:36'),
(3340, 20, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:25:53', '2021-11-09 05:25:53'),
(3341, 20, 'admin/form-crop-declarations/2', 'PUT', '::1', '{\"administrator_id\":\"3\",\"status\":\"5\",\"valid_from\":\"2021-11-09\",\"valid_until\":\"2022-05-31\",\"_token\":\"grngauL2rDUAXhpjP9VO3re6CYcnh1mjGa9HRXp0\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 05:31:33', '2021-11-09 05:31:33'),
(3342, 20, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '[]', '2021-11-09 05:31:34', '2021-11-09 05:31:34'),
(3343, 20, 'admin/form-crop-declarations/2', 'PUT', '::1', '{\"administrator_id\":\"3\",\"status\":\"5\",\"valid_from\":\"2021-11-09\",\"valid_until\":\"2022-05-31\",\"_token\":\"grngauL2rDUAXhpjP9VO3re6CYcnh1mjGa9HRXp0\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 05:31:40', '2021-11-09 05:31:40'),
(3344, 20, 'admin/form-crop-declarations/2/edit', 'GET', '::1', '[]', '2021-11-09 05:31:40', '2021-11-09 05:31:40'),
(3345, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:31:42', '2021-11-09 05:31:42'),
(3346, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:32:44', '2021-11-09 05:32:44'),
(3347, 3, 'admin', 'GET', '::1', '[]', '2021-11-09 05:32:53', '2021-11-09 05:32:53'),
(3348, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:32:58', '2021-11-09 05:32:58'),
(3349, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:33:00', '2021-11-09 05:33:00'),
(3350, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:34:47', '2021-11-09 05:34:47'),
(3351, 3, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-09 05:35:17', '2021-11-09 05:35:17'),
(3352, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:35:27', '2021-11-09 05:35:27'),
(3353, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 05:35:29', '2021-11-09 05:35:29'),
(3354, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:43:21', '2021-11-09 05:43:21'),
(3355, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:44:56', '2021-11-09 05:44:56'),
(3356, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:45:36', '2021-11-09 05:45:36'),
(3357, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:47:36', '2021-11-09 05:47:36'),
(3358, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:49:11', '2021-11-09 05:49:11'),
(3359, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:49:42', '2021-11-09 05:49:42'),
(3360, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:49:55', '2021-11-09 05:49:55'),
(3361, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:50:15', '2021-11-09 05:50:15'),
(3362, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:50:28', '2021-11-09 05:50:28'),
(3363, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:54:12', '2021-11-09 05:54:12'),
(3364, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:54:31', '2021-11-09 05:54:31'),
(3365, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:55:42', '2021-11-09 05:55:42'),
(3366, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:57:36', '2021-11-09 05:57:36'),
(3367, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:58:24', '2021-11-09 05:58:24'),
(3368, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 05:59:45', '2021-11-09 05:59:45'),
(3369, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:00:52', '2021-11-09 06:00:52'),
(3370, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:11:23', '2021-11-09 06:11:23'),
(3371, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:12:42', '2021-11-09 06:12:42'),
(3372, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:13:48', '2021-11-09 06:13:48'),
(3373, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:14:08', '2021-11-09 06:14:08'),
(3374, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:14:36', '2021-11-09 06:14:36'),
(3375, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:14:57', '2021-11-09 06:14:57'),
(3376, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:14:59', '2021-11-09 06:14:59'),
(3377, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:15:24', '2021-11-09 06:15:24'),
(3378, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:15:56', '2021-11-09 06:15:56'),
(3379, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:16:07', '2021-11-09 06:16:07'),
(3380, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:16:50', '2021-11-09 06:16:50'),
(3381, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:17:04', '2021-11-09 06:17:04'),
(3382, 20, 'admin/form-sr10s', 'GET', '::1', '[]', '2021-11-09 06:17:07', '2021-11-09 06:17:07'),
(3383, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:17:19', '2021-11-09 06:17:19'),
(3384, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:17:20', '2021-11-09 06:17:20'),
(3385, 20, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:17:25', '2021-11-09 06:17:25'),
(3386, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:17:30', '2021-11-09 06:17:30'),
(3387, 20, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:17:30', '2021-11-09 06:17:30'),
(3388, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:17:32', '2021-11-09 06:17:32'),
(3389, 20, 'admin/form-crop-declarations/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:17:34', '2021-11-09 06:17:34'),
(3390, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:18:22', '2021-11-09 06:18:22'),
(3391, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:18:23', '2021-11-09 06:18:23'),
(3392, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:18:39', '2021-11-09 06:18:39'),
(3393, 3, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-09 06:18:43', '2021-11-09 06:18:43'),
(3394, 3, 'admin/form-sr4s', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:18:55', '2021-11-09 06:18:55'),
(3395, 3, 'admin/import-export-permits', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:18:58', '2021-11-09 06:18:58'),
(3396, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:19:01', '2021-11-09 06:19:01'),
(3397, 3, 'admin/import-export-permits', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:19:09', '2021-11-09 06:19:09'),
(3398, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:19:17', '2021-11-09 06:19:17'),
(3399, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 06:19:24', '2021-11-09 06:19:24'),
(3400, 2, 'admin/form-sr10s', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:19:33', '2021-11-09 06:19:33'),
(3401, 2, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:19:40', '2021-11-09 06:19:40'),
(3402, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"2\",\"_model\":\"App_Models_FormCropDeclaration\",\"_token\":\"p3JttYJP7h9eDpigf2rBTA6lhMdKOT7h7dSHQPBt\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-09 06:19:45', '2021-11-09 06:19:45'),
(3403, 2, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:19:46', '2021-11-09 06:19:46'),
(3404, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:19:49', '2021-11-09 06:19:49'),
(3405, 3, 'admin/import-export-permits', 'POST', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Test\",\"telephone\":\"7826817623\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"Kampala\",\"quantiry_of_seed\":\"122\",\"name_address_of_origin\":\"Mubahood\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_variety_id\":\"4\",\"category\":\"Test\",\"weight\":\"just\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"crop_variety_id\":\"4\",\"category\":\"Simple\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jZ2Ql5HTfRupnH3vqApPAQQ2xN29KKY9Qap7NCny\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-11-09 06:20:39', '2021-11-09 06:20:39'),
(3406, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:20:39', '2021-11-09 06:20:39'),
(3407, 3, 'admin/import-export-permits', 'POST', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Test\",\"telephone\":\"7826817623\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"Kampala\",\"quantiry_of_seed\":\"122\",\"name_address_of_origin\":\"Mubahood\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"4\",\"category\":\"Simple\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jZ2Ql5HTfRupnH3vqApPAQQ2xN29KKY9Qap7NCny\"}', '2021-11-09 06:21:57', '2021-11-09 06:21:57'),
(3408, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:21:57', '2021-11-09 06:21:57'),
(3409, 3, 'admin/import-export-permits', 'POST', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Test\",\"telephone\":\"7826817623\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"Kampala\",\"quantiry_of_seed\":\"122\",\"name_address_of_origin\":\"Mubahood\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"4\",\"category\":\"Simple\",\"weight\":\"1200\",\"id\":null,\"_remove_\":\"0\"},\"new_1\":{\"crop_variety_id\":\"3\",\"category\":\"Test\",\"weight\":\"1299\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jZ2Ql5HTfRupnH3vqApPAQQ2xN29KKY9Qap7NCny\"}', '2021-11-09 06:23:11', '2021-11-09 06:23:11'),
(3410, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:23:12', '2021-11-09 06:23:12'),
(3411, 3, 'admin/import-export-permits', 'POST', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Test\",\"telephone\":\"7826817623\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"Kampala\",\"quantiry_of_seed\":\"122\",\"name_address_of_origin\":\"Mubahood\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"3\",\"category\":\"Test\",\"weight\":\"1299\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jZ2Ql5HTfRupnH3vqApPAQQ2xN29KKY9Qap7NCny\"}', '2021-11-09 06:23:56', '2021-11-09 06:23:56'),
(3412, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:23:56', '2021-11-09 06:23:56');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(3413, 3, 'admin/import-export-permits', 'POST', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"Test\",\"telephone\":\"7826817623\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"Kampala\",\"quantiry_of_seed\":\"122\",\"name_address_of_origin\":\"Mubahood\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"3\",\"category\":\"Test\",\"weight\":\"1299\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jZ2Ql5HTfRupnH3vqApPAQQ2xN29KKY9Qap7NCny\"}', '2021-11-09 06:25:15', '2021-11-09 06:25:15'),
(3414, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:25:16', '2021-11-09 06:25:16'),
(3415, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:27:34', '2021-11-09 06:27:34'),
(3416, 3, 'admin/import-export-permits', 'POST', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"ljas\",\"telephone\":\"ojabskkjs\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"jslnblj\",\"quantiry_of_seed\":\"122\",\"name_address_of_origin\":\"jkabsubkas\",\"import_export_permits_has_crops\":{\"new_1\":{\"crop_variety_id\":\"3\",\"category\":\"jkabsl\",\"weight\":\"1299\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jZ2Ql5HTfRupnH3vqApPAQQ2xN29KKY9Qap7NCny\"}', '2021-11-09 06:29:10', '2021-11-09 06:29:10'),
(3417, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:29:10', '2021-11-09 06:29:10'),
(3418, 3, 'admin/import-export-permits', 'POST', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"ljas\",\"telephone\":\"ojabskkjs\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"jslnblj\",\"quantiry_of_seed\":\"122\",\"name_address_of_origin\":\"jkabsubkas\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"3\",\"category\":\"jkabsl\",\"weight\":\"1299\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jZ2Ql5HTfRupnH3vqApPAQQ2xN29KKY9Qap7NCny\"}', '2021-11-09 06:31:51', '2021-11-09 06:31:51'),
(3419, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:31:51', '2021-11-09 06:31:51'),
(3420, 3, 'admin/import-export-permits', 'POST', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"ljas\",\"telephone\":\"ojabskkjs\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"jslnblj\",\"quantiry_of_seed\":\"122\",\"name_address_of_origin\":\"jkabsubkas\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"3\",\"category\":\"jkabsl\",\"weight\":\"1299\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jZ2Ql5HTfRupnH3vqApPAQQ2xN29KKY9Qap7NCny\"}', '2021-11-09 06:33:16', '2021-11-09 06:33:16'),
(3421, 3, 'admin/import-export-permits/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:33:17', '2021-11-09 06:33:17'),
(3422, 3, 'admin/import-export-permits', 'POST', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"address\":\"ljas\",\"telephone\":\"ojabskkjs\",\"national_seed_board_reg_num\":\"120001000\",\"store_location\":\"jslnblj\",\"quantiry_of_seed\":\"122\",\"name_address_of_origin\":\"jkabsubkas\",\"import_export_permits_has_crops\":{\"new___LA_KEY__\":{\"crop_variety_id\":\"3\",\"category\":\"jkabsl\",\"weight\":\"1299\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jZ2Ql5HTfRupnH3vqApPAQQ2xN29KKY9Qap7NCny\"}', '2021-11-09 06:34:07', '2021-11-09 06:34:07'),
(3423, 3, 'admin/import-export-permits', 'GET', '127.0.0.1', '[]', '2021-11-09 06:34:07', '2021-11-09 06:34:07'),
(3424, 3, 'admin/import-export-permits/18', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:34:13', '2021-11-09 06:34:13'),
(3425, 3, 'admin/import-export-permits', 'GET', '127.0.0.1', '[]', '2021-11-09 06:34:13', '2021-11-09 06:34:13'),
(3426, 3, 'admin/import-export-permits', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:34:19', '2021-11-09 06:34:19'),
(3427, 2, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:34:42', '2021-11-09 06:34:42'),
(3428, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:34:50', '2021-11-09 06:34:50'),
(3429, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 06:34:56', '2021-11-09 06:34:56'),
(3430, 2, 'admin/planting-returns', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:35:04', '2021-11-09 06:35:04'),
(3431, 2, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:35:06', '2021-11-09 06:35:06'),
(3432, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:35:13', '2021-11-09 06:35:13'),
(3433, 2, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"8\",\"_model\":\"App_Models_ImportExportPermit\",\"_token\":\"JVYsNe6xypWYf3KR29ScoxhwVC4pElnYQejGjvXC\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-09 06:35:19', '2021-11-09 06:35:19'),
(3434, 2, 'admin/import-export-permits', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:35:19', '2021-11-09 06:35:19'),
(3435, 2, 'admin/import-export-permits/18/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:35:24', '2021-11-09 06:35:24'),
(3436, 2, 'admin/import-export-permits/18', 'PUT', '::1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"telephone\":\"ojabskkjs\",\"address\":\"ljas\",\"store_location\":\"jslnblj\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"JVYsNe6xypWYf3KR29ScoxhwVC4pElnYQejGjvXC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-11-09 06:35:30', '2021-11-09 06:35:30'),
(3437, 2, 'admin/import-export-permits', 'GET', '::1', '[]', '2021-11-09 06:35:30', '2021-11-09 06:35:30'),
(3438, 3, 'admin/import-export-permits', 'GET', '127.0.0.1', '[]', '2021-11-09 06:35:36', '2021-11-09 06:35:36'),
(3439, 3, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:35:39', '2021-11-09 06:35:39'),
(3440, 20, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-09 06:35:48', '2021-11-09 06:35:48'),
(3441, 20, 'admin/form-crop-declarations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:35:54', '2021-11-09 06:35:54'),
(3442, 20, 'admin/import-export-permits', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:35:59', '2021-11-09 06:35:59'),
(3443, 20, 'admin/import-export-permits/18/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:36:02', '2021-11-09 06:36:02'),
(3444, 20, 'admin/import-export-permits/18', 'PUT', '127.0.0.1', '{\"is_import\":\"1\",\"administrator_id\":\"3\",\"name\":\"Betty Namagembe\",\"telephone\":\"ojabskkjs\",\"address\":\"ljas\",\"store_location\":\"jslnblj\",\"status\":\"5\",\"permit_number\":\"81302\",\"valid_from\":\"2021-11-01\",\"valid_until\":\"2022-04-08\",\"_token\":\"yXeQwWwk9ZB9IqrYITrqObqtFIRUEoYgljVoI1XU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/import-export-permits\"}', '2021-11-09 06:36:14', '2021-11-09 06:36:14'),
(3445, 20, 'admin/import-export-permits', 'GET', '127.0.0.1', '[]', '2021-11-09 06:36:14', '2021-11-09 06:36:14'),
(3446, 20, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:36:17', '2021-11-09 06:36:17'),
(3447, 20, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '[]', '2021-11-09 06:36:19', '2021-11-09 06:36:19'),
(3448, 20, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:36:21', '2021-11-09 06:36:21'),
(3449, 3, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-09 06:36:48', '2021-11-09 06:36:48'),
(3450, 3, 'admin/import-export-permits', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:36:53', '2021-11-09 06:36:53'),
(3451, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:37:02', '2021-11-09 06:37:02'),
(3452, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:37:04', '2021-11-09 06:37:04'),
(3453, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:38:03', '2021-11-09 06:38:03'),
(3454, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:38:46', '2021-11-09 06:38:46'),
(3455, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:38:59', '2021-11-09 06:38:59'),
(3456, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:39:16', '2021-11-09 06:39:16'),
(3457, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:39:55', '2021-11-09 06:39:55'),
(3458, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:40:00', '2021-11-09 06:40:00'),
(3459, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:40:26', '2021-11-09 06:40:26'),
(3460, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:40:27', '2021-11-09 06:40:27'),
(3461, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:40:43', '2021-11-09 06:40:43'),
(3462, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:41:14', '2021-11-09 06:41:14'),
(3463, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:41:15', '2021-11-09 06:41:15'),
(3464, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:41:23', '2021-11-09 06:41:23'),
(3465, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:41:31', '2021-11-09 06:41:31'),
(3466, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:41:47', '2021-11-09 06:41:47'),
(3467, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:41:56', '2021-11-09 06:41:56'),
(3468, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:42:02', '2021-11-09 06:42:02'),
(3469, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:42:08', '2021-11-09 06:42:08'),
(3470, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:42:23', '2021-11-09 06:42:23'),
(3471, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:43:01', '2021-11-09 06:43:01'),
(3472, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:43:33', '2021-11-09 06:43:33'),
(3473, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:43:53', '2021-11-09 06:43:53'),
(3474, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:44:07', '2021-11-09 06:44:07'),
(3475, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:44:47', '2021-11-09 06:44:47'),
(3476, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:46:07', '2021-11-09 06:46:07'),
(3477, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:46:52', '2021-11-09 06:46:52'),
(3478, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:47:11', '2021-11-09 06:47:11'),
(3479, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:47:39', '2021-11-09 06:47:39'),
(3480, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:48:30', '2021-11-09 06:48:30'),
(3481, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '[]', '2021-11-09 06:49:07', '2021-11-09 06:49:07'),
(3482, 3, 'admin/form-stock-examination-requests/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:49:54', '2021-11-09 06:49:54'),
(3483, 3, 'admin/form-stock-examination-requests', 'POST', '127.0.0.1', '{\"examination_category\":\"1\",\"import_export_permit_id\":\"18\",\"crop_variety_id\":\"4\",\"remarks\":\"test\",\"administrator_id\":\"3\",\"_token\":\"NLB9rY6U9GNeCiaQhf1UmSIgh2Pa0SPFToBzRGVL\"}', '2021-11-09 06:50:29', '2021-11-09 06:50:29'),
(3484, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '[]', '2021-11-09 06:50:29', '2021-11-09 06:50:29'),
(3485, 3, 'admin/form-stock-examination-requests/3', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:50:35', '2021-11-09 06:50:35'),
(3486, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:50:36', '2021-11-09 06:50:36'),
(3487, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '[]', '2021-11-09 06:51:11', '2021-11-09 06:51:11'),
(3488, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '[]', '2021-11-09 06:51:44', '2021-11-09 06:51:44'),
(3489, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '[]', '2021-11-09 06:52:09', '2021-11-09 06:52:09'),
(3490, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:53:02', '2021-11-09 06:53:02'),
(3491, 3, 'admin/form-stock-examination-requests/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:53:04', '2021-11-09 06:53:04'),
(3492, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:53:13', '2021-11-09 06:53:13'),
(3493, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:53:25', '2021-11-09 06:53:25'),
(3494, 20, 'admin', 'GET', '::1', '[]', '2021-11-09 06:53:33', '2021-11-09 06:53:33'),
(3495, 20, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:53:40', '2021-11-09 06:53:40'),
(3496, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:53:50', '2021-11-09 06:53:50'),
(3497, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 06:53:54', '2021-11-09 06:53:54'),
(3498, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 06:54:04', '2021-11-09 06:54:04'),
(3499, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:54:06', '2021-11-09 06:54:06'),
(3500, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:54:09', '2021-11-09 06:54:09'),
(3501, 20, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:54:11', '2021-11-09 06:54:11'),
(3502, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:54:13', '2021-11-09 06:54:13'),
(3503, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 06:54:16', '2021-11-09 06:54:16'),
(3504, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:54:34', '2021-11-09 06:54:34'),
(3505, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 06:54:37', '2021-11-09 06:54:37'),
(3506, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:54:43', '2021-11-09 06:54:43'),
(3507, 20, 'admin/form-stock-examination-requests/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:54:53', '2021-11-09 06:54:53'),
(3508, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:54:59', '2021-11-09 06:54:59'),
(3509, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:55:08', '2021-11-09 06:55:08'),
(3510, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:55:13', '2021-11-09 06:55:13'),
(3511, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:55:14', '2021-11-09 06:55:14'),
(3512, 3, 'admin/form-stock-examination-requests/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:55:18', '2021-11-09 06:55:18'),
(3513, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:55:35', '2021-11-09 06:55:35'),
(3514, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:55:42', '2021-11-09 06:55:42'),
(3515, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 06:55:51', '2021-11-09 06:55:51'),
(3516, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:56:00', '2021-11-09 06:56:00'),
(3517, 2, 'admin/form-stock-examination-requests/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:56:11', '2021-11-09 06:56:11'),
(3518, 2, 'admin/form-stock-examination-requests/3', 'PUT', '::1', '{\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"3bExQpWYwHRRtZqHB6g64a3pfX0PkTkkESvkeeaa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-stock-examination-requests\"}', '2021-11-09 06:56:17', '2021-11-09 06:56:17'),
(3519, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 06:56:17', '2021-11-09 06:56:17'),
(3520, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:56:27', '2021-11-09 06:56:27'),
(3521, 20, 'admin/form-stock-examination-requests/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:56:29', '2021-11-09 06:56:29'),
(3522, 20, 'admin/form-stock-examination-requests/3', 'PUT', '::1', '{\"yield\":\"500\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"sKpauZJWGSBXGw4ZNRMFvlTgft1E0oCl477j3mdX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-stock-examination-requests\"}', '2021-11-09 06:56:50', '2021-11-09 06:56:50'),
(3523, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 06:56:50', '2021-11-09 06:56:50'),
(3524, 20, 'admin/form-stock-examination-requests/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:56:57', '2021-11-09 06:56:57'),
(3525, 20, 'admin/form-stock-examination-requests/3', 'PUT', '::1', '{\"yield\":\"500\",\"seed_class\":\"Pre-Basic seed\",\"field_size\":null,\"date\":null,\"purity\":null,\"germination\":null,\"moisture_content\":null,\"insect_damage\":null,\"moldiness\":null,\"noxious_weeds\":null,\"status\":\"5\",\"_token\":\"sKpauZJWGSBXGw4ZNRMFvlTgft1E0oCl477j3mdX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/form-stock-examination-requests\"}', '2021-11-09 06:57:01', '2021-11-09 06:57:01'),
(3526, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 06:57:02', '2021-11-09 06:57:02'),
(3527, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:57:09', '2021-11-09 06:57:09'),
(3528, 2, 'admin/form-stock-examination-requests/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:57:14', '2021-11-09 06:57:14'),
(3529, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:57:16', '2021-11-09 06:57:16'),
(3530, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 06:57:21', '2021-11-09 06:57:21'),
(3531, 20, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 07:01:45', '2021-11-09 07:01:45'),
(3532, 20, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 07:02:30', '2021-11-09 07:02:30'),
(3533, 1, 'admin', 'GET', '::1', '[]', '2021-11-09 07:02:44', '2021-11-09 07:02:44'),
(3534, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 07:02:52', '2021-11-09 07:02:52'),
(3535, 1, 'admin/auth/menu/35/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 07:03:03', '2021-11-09 07:03:03'),
(3536, 1, 'admin/auth/menu/35', 'PUT', '::1', '{\"parent_id\":\"33\",\"title\":\"My stock\",\"icon\":\"fa-archive\",\"uri\":\"stock-records\",\"roles\":[null],\"permission\":null,\"_token\":\"nxqjHtkTLLxAPf7JuZYQkCWyLEHR8ATgqRG9KAQ5\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2021-11-09 07:03:16', '2021-11-09 07:03:16'),
(3537, 1, 'admin/auth/menu/35/edit', 'GET', '::1', '[]', '2021-11-09 07:03:16', '2021-11-09 07:03:16'),
(3538, 3, 'admin/form-stock-examination-requests/3/edit', 'GET', '127.0.0.1', '[]', '2021-11-09 07:03:26', '2021-11-09 07:03:26'),
(3539, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 07:03:33', '2021-11-09 07:03:33'),
(3540, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 07:04:50', '2021-11-09 07:04:50'),
(3541, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 07:05:03', '2021-11-09 07:05:03'),
(3542, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 08:11:59', '2021-11-09 08:11:59'),
(3543, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 08:12:14', '2021-11-09 08:12:14'),
(3544, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 08:12:21', '2021-11-09 08:12:21'),
(3545, 3, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 08:13:38', '2021-11-09 08:13:38'),
(3546, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 08:14:18', '2021-11-09 08:14:18'),
(3547, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 08:53:56', '2021-11-09 08:53:56'),
(3548, 3, 'admin/stock-records', 'GET', '127.0.0.1', '[]', '2021-11-09 08:54:11', '2021-11-09 08:54:11'),
(3549, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 08:55:27', '2021-11-09 08:55:27'),
(3550, 3, 'admin/stock-records', 'GET', '127.0.0.1', '[]', '2021-11-09 08:59:50', '2021-11-09 08:59:50'),
(3551, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 09:00:56', '2021-11-09 09:00:56'),
(3552, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 09:03:40', '2021-11-09 09:03:40'),
(3553, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 09:04:08', '2021-11-09 09:04:08'),
(3554, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:05:41', '2021-11-09 09:05:41'),
(3555, 3, 'admin/stock-records', 'GET', '127.0.0.1', '[]', '2021-11-09 09:05:55', '2021-11-09 09:05:55'),
(3556, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 09:05:58', '2021-11-09 09:05:58'),
(3557, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:06:40', '2021-11-09 09:06:40'),
(3558, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:07:25', '2021-11-09 09:07:25'),
(3559, 1, 'admin/auth/menu/35/edit', 'GET', '::1', '[]', '2021-11-09 09:33:15', '2021-11-09 09:33:15'),
(3560, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:33:22', '2021-11-09 09:33:22'),
(3561, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:33:47', '2021-11-09 09:33:47'),
(3562, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:34:03', '2021-11-09 09:34:03'),
(3563, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:34:48', '2021-11-09 09:34:48'),
(3564, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:34:59', '2021-11-09 09:34:59'),
(3565, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:35:11', '2021-11-09 09:35:11'),
(3566, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:36:18', '2021-11-09 09:36:18'),
(3567, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:36:28', '2021-11-09 09:36:28'),
(3568, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:39:47', '2021-11-09 09:39:47'),
(3569, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:40:01', '2021-11-09 09:40:01'),
(3570, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:40:34', '2021-11-09 09:40:34'),
(3571, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:43:32', '2021-11-09 09:43:32'),
(3572, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:48:02', '2021-11-09 09:48:02'),
(3573, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-09 09:55:18', '2021-11-09 09:55:18'),
(3574, 2, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 09:55:22', '2021-11-09 09:55:22'),
(3575, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:55:38', '2021-11-09 09:55:38'),
(3576, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:59:26', '2021-11-09 09:59:26'),
(3577, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 09:59:40', '2021-11-09 09:59:40'),
(3578, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:03:30', '2021-11-09 10:03:30'),
(3579, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:03:39', '2021-11-09 10:03:39'),
(3580, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:12:33', '2021-11-09 10:12:33'),
(3581, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:12:50', '2021-11-09 10:12:50'),
(3582, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:13:02', '2021-11-09 10:13:02'),
(3583, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:13:13', '2021-11-09 10:13:13'),
(3584, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:13:34', '2021-11-09 10:13:34'),
(3585, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:13:47', '2021-11-09 10:13:47'),
(3586, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:13:54', '2021-11-09 10:13:54'),
(3587, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:14:24', '2021-11-09 10:14:24'),
(3588, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:14:35', '2021-11-09 10:14:35'),
(3589, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:14:58', '2021-11-09 10:14:58'),
(3590, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:15:53', '2021-11-09 10:15:53'),
(3591, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:16:30', '2021-11-09 10:16:30'),
(3592, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 10:21:52', '2021-11-09 10:21:52'),
(3593, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:21:52', '2021-11-09 10:21:52'),
(3594, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:21:53', '2021-11-09 10:21:53'),
(3595, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:21:53', '2021-11-09 10:21:53'),
(3596, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:21:54', '2021-11-09 10:21:54'),
(3597, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:21:54', '2021-11-09 10:21:54'),
(3598, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:21:55', '2021-11-09 10:21:55'),
(3599, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:22:33', '2021-11-09 10:22:33'),
(3600, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:23:10', '2021-11-09 10:23:10'),
(3601, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 10:23:39', '2021-11-09 10:23:39'),
(3602, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:24:01', '2021-11-09 10:24:01'),
(3603, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:24:18', '2021-11-09 10:24:18'),
(3604, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:24:46', '2021-11-09 10:24:46'),
(3605, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:25:17', '2021-11-09 10:25:17'),
(3606, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:25:24', '2021-11-09 10:25:24'),
(3607, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:25:58', '2021-11-09 10:25:58'),
(3608, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:26:42', '2021-11-09 10:26:42'),
(3609, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:27:18', '2021-11-09 10:27:18'),
(3610, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 10:29:36', '2021-11-09 10:29:36'),
(3611, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:29:56', '2021-11-09 10:29:56'),
(3612, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:30:13', '2021-11-09 10:30:13'),
(3613, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:30:20', '2021-11-09 10:30:20'),
(3614, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:35:10', '2021-11-09 10:35:10'),
(3615, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:35:57', '2021-11-09 10:35:57'),
(3616, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:36:34', '2021-11-09 10:36:34'),
(3617, 3, 'admin/stock-records', 'GET', '127.0.0.1', '[]', '2021-11-09 10:37:03', '2021-11-09 10:37:03'),
(3618, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 10:37:10', '2021-11-09 10:37:10'),
(3619, 3, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 10:37:16', '2021-11-09 10:37:16'),
(3620, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 10:37:19', '2021-11-09 10:37:19'),
(3621, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 10:39:23', '2021-11-09 10:39:23'),
(3622, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:48:23', '2021-11-09 10:48:23'),
(3623, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:49:33', '2021-11-09 10:49:33'),
(3624, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 10:49:51', '2021-11-09 10:49:51'),
(3625, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:08:44', '2021-11-09 11:08:44'),
(3626, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:11:21', '2021-11-09 11:11:21'),
(3627, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:12:59', '2021-11-09 11:12:59'),
(3628, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:14:21', '2021-11-09 11:14:21'),
(3629, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:16:42', '2021-11-09 11:16:42'),
(3630, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:17:41', '2021-11-09 11:17:41'),
(3631, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:18:18', '2021-11-09 11:18:18'),
(3632, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:18:57', '2021-11-09 11:18:57'),
(3633, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:20:21', '2021-11-09 11:20:21'),
(3634, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:22:52', '2021-11-09 11:22:52'),
(3635, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:23:22', '2021-11-09 11:23:22'),
(3636, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:24:51', '2021-11-09 11:24:51'),
(3637, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:24:59', '2021-11-09 11:24:59'),
(3638, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:25:01', '2021-11-09 11:25:01'),
(3639, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:27:02', '2021-11-09 11:27:02'),
(3640, 3, 'admin/stock-records/create', 'GET', '127.0.0.1', '[]', '2021-11-09 11:27:54', '2021-11-09 11:27:54'),
(3641, 3, 'admin/form-stock-examination-requests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 11:28:51', '2021-11-09 11:28:51'),
(3642, 2, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}', '2021-11-09 12:19:14', '2021-11-09 12:19:14'),
(3643, 2, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:19:34', '2021-11-09 12:19:34'),
(3644, 2, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2021-11-09 12:19:50', '2021-11-09 12:19:50'),
(3645, 2, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"asc\"}}', '2021-11-09 12:19:51', '2021-11-09 12:19:51'),
(3646, 2, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:20:31', '2021-11-09 12:20:31'),
(3647, 2, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:20:34', '2021-11-09 12:20:34'),
(3648, 2, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:20:37', '2021-11-09 12:20:37'),
(3649, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:20:42', '2021-11-09 12:20:42'),
(3650, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 12:27:54', '2021-11-09 12:27:54'),
(3651, 1, 'admin/auth/menu/35/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 13:23:50', '2021-11-09 13:23:50'),
(3652, 2, 'admin', 'GET', '::1', '[]', '2021-11-10 03:42:22', '2021-11-10 03:42:22'),
(3653, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:42:30', '2021-11-10 03:42:30'),
(3654, 3, 'admin', 'GET', '::1', '[]', '2021-11-10 03:42:47', '2021-11-10 03:42:47'),
(3655, 3, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:42:50', '2021-11-10 03:42:50'),
(3656, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:42:57', '2021-11-10 03:42:57'),
(3657, 3, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:43:00', '2021-11-10 03:43:00'),
(3658, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:43:06', '2021-11-10 03:43:06'),
(3659, 3, 'admin', 'GET', '::1', '[]', '2021-11-10 03:47:57', '2021-11-10 03:47:57'),
(3660, 3, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:48:04', '2021-11-10 03:48:04'),
(3661, 3, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:48:06', '2021-11-10 03:48:06'),
(3662, 3, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:48:08', '2021-11-10 03:48:08'),
(3663, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:50:21', '2021-11-10 03:50:21'),
(3664, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:50:21', '2021-11-10 03:50:21'),
(3665, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 03:51:00', '2021-11-10 03:51:00'),
(3666, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 03:51:07', '2021-11-10 03:51:07'),
(3667, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 03:52:21', '2021-11-10 03:52:21'),
(3668, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:52:27', '2021-11-10 03:52:27'),
(3669, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:52:38', '2021-11-10 03:52:38'),
(3670, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 03:53:13', '2021-11-10 03:53:13'),
(3671, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 03:55:58', '2021-11-10 03:55:58'),
(3672, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 03:57:12', '2021-11-10 03:57:12'),
(3673, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:57:59', '2021-11-10 03:57:59'),
(3674, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:58:20', '2021-11-10 03:58:20'),
(3675, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:58:20', '2021-11-10 03:58:20'),
(3676, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 03:58:38', '2021-11-10 03:58:38'),
(3677, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:58:51', '2021-11-10 03:58:51'),
(3678, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:58:51', '2021-11-10 03:58:51'),
(3679, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:59:08', '2021-11-10 03:59:08'),
(3680, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 03:59:21', '2021-11-10 03:59:21'),
(3681, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 03:59:31', '2021-11-10 03:59:31'),
(3682, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:00:04', '2021-11-10 04:00:04'),
(3683, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:00:58', '2021-11-10 04:00:58'),
(3684, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:01:21', '2021-11-10 04:01:21'),
(3685, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:01:27', '2021-11-10 04:01:27'),
(3686, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:03:36', '2021-11-10 04:03:36'),
(3687, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:03:39', '2021-11-10 04:03:39'),
(3688, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:03:40', '2021-11-10 04:03:40'),
(3689, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:03:59', '2021-11-10 04:03:59'),
(3690, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:12:25', '2021-11-10 04:12:25'),
(3691, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\",\"after-save\":\"1\"}', '2021-11-10 04:12:30', '2021-11-10 04:12:30'),
(3692, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:12:31', '2021-11-10 04:12:31'),
(3693, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:13:12', '2021-11-10 04:13:12'),
(3694, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:13:15', '2021-11-10 04:13:15'),
(3695, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:13:22', '2021-11-10 04:13:22'),
(3696, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:13:24', '2021-11-10 04:13:24'),
(3697, 3, 'admin/stock-records', 'GET', '::1', '[]', '2021-11-10 04:16:36', '2021-11-10 04:16:36'),
(3698, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:16:39', '2021-11-10 04:16:39'),
(3699, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:16:42', '2021-11-10 04:16:42'),
(3700, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:17:29', '2021-11-10 04:17:29'),
(3701, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:17:30', '2021-11-10 04:17:30'),
(3702, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:17:31', '2021-11-10 04:17:31'),
(3703, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:17:59', '2021-11-10 04:17:59'),
(3704, 3, 'admin/stock-records', 'GET', '::1', '[]', '2021-11-10 04:18:08', '2021-11-10 04:18:08'),
(3705, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:18:11', '2021-11-10 04:18:11'),
(3706, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:18:14', '2021-11-10 04:18:14'),
(3707, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:19:15', '2021-11-10 04:19:15'),
(3708, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:23:04', '2021-11-10 04:23:04'),
(3709, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:23:04', '2021-11-10 04:23:04'),
(3710, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:23:49', '2021-11-10 04:23:49'),
(3711, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:23:52', '2021-11-10 04:23:52'),
(3712, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:23:53', '2021-11-10 04:23:53'),
(3713, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"1000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:24:17', '2021-11-10 04:24:17'),
(3714, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:26:35', '2021-11-10 04:26:35'),
(3715, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:26:37', '2021-11-10 04:26:37'),
(3716, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:26:38', '2021-11-10 04:26:38'),
(3717, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"10000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:26:45', '2021-11-10 04:26:45'),
(3718, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:31:55', '2021-11-10 04:31:55'),
(3719, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:31:57', '2021-11-10 04:31:57'),
(3720, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:31:57', '2021-11-10 04:31:57'),
(3721, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"5000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:32:04', '2021-11-10 04:32:04'),
(3722, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:32:43', '2021-11-10 04:32:43'),
(3723, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:32:47', '2021-11-10 04:32:47'),
(3724, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:32:47', '2021-11-10 04:32:47'),
(3725, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:32:52', '2021-11-10 04:32:52'),
(3726, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:33:00', '2021-11-10 04:33:00'),
(3727, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:33:06', '2021-11-10 04:33:06'),
(3728, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 04:33:06', '2021-11-10 04:33:06'),
(3729, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:33:18', '2021-11-10 04:33:18'),
(3730, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:43:27', '2021-11-10 04:43:27'),
(3731, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:43:30', '2021-11-10 04:43:30'),
(3732, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:44:04', '2021-11-10 04:44:04'),
(3733, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:44:07', '2021-11-10 04:44:07'),
(3734, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:45:39', '2021-11-10 04:45:39'),
(3735, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:45:42', '2021-11-10 04:45:42'),
(3736, 3, 'admin/stock-records', 'GET', '::1', '[]', '2021-11-10 04:45:42', '2021-11-10 04:45:42'),
(3737, 3, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:45:54', '2021-11-10 04:45:54'),
(3738, 3, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:46:13', '2021-11-10 04:46:13'),
(3739, 3, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-11-10 04:46:16', '2021-11-10 04:46:16'),
(3740, 3, 'admin/stock-records/20,21,22,23,24,25', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 04:46:41', '2021-11-10 04:46:41'),
(3741, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:46:41', '2021-11-10 04:46:41'),
(3742, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:46:46', '2021-11-10 04:46:46'),
(3743, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:47:05', '2021-11-10 04:47:05'),
(3744, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"500\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/stock-records?&_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc\"}', '2021-11-10 04:47:11', '2021-11-10 04:47:11'),
(3745, 3, 'admin/stock-records', 'GET', '::1', '[]', '2021-11-10 04:47:11', '2021-11-10 04:47:11');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(3746, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:47:19', '2021-11-10 04:47:19'),
(3747, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:49:00', '2021-11-10 04:49:00'),
(3748, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:49:42', '2021-11-10 04:49:42'),
(3749, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:49:56', '2021-11-10 04:49:56'),
(3750, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:52:52', '2021-11-10 04:52:52'),
(3751, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:52:53', '2021-11-10 04:52:53'),
(3752, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"crop_variety_id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:55:31', '2021-11-10 04:55:31'),
(3753, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"crop_variety_id\",\"type\":\"desc\"}}', '2021-11-10 04:56:12', '2021-11-10 04:56:12'),
(3754, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"crop_variety_id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:57:01', '2021-11-10 04:57:01'),
(3755, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"crop_variety_id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:58:17', '2021-11-10 04:58:17'),
(3756, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"is_deposit\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:58:57', '2021-11-10 04:58:57'),
(3757, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"is_deposit\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 04:59:45', '2021-11-10 04:59:45'),
(3758, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"is_deposit\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:00:03', '2021-11-10 05:00:03'),
(3759, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"is_deposit\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:01:10', '2021-11-10 05:01:10'),
(3760, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:01:23', '2021-11-10 05:01:23'),
(3761, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"}}', '2021-11-10 05:02:16', '2021-11-10 05:02:16'),
(3762, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"}}', '2021-11-10 05:02:43', '2021-11-10 05:02:43'),
(3763, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"}}', '2021-11-10 05:04:11', '2021-11-10 05:04:11'),
(3764, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"}}', '2021-11-10 05:04:50', '2021-11-10 05:04:50'),
(3765, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"}}', '2021-11-10 05:05:01', '2021-11-10 05:05:01'),
(3766, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"}}', '2021-11-10 05:05:49', '2021-11-10 05:05:49'),
(3767, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"}}', '2021-11-10 05:06:18', '2021-11-10 05:06:18'),
(3768, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"}}', '2021-11-10 05:07:33', '2021-11-10 05:07:33'),
(3769, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"}}', '2021-11-10 05:08:06', '2021-11-10 05:08:06'),
(3770, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:08:11', '2021-11-10 05:08:11'),
(3771, 3, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:08:40', '2021-11-10 05:08:40'),
(3772, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:09:29', '2021-11-10 05:09:29'),
(3773, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:10:38', '2021-11-10 05:10:38'),
(3774, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"800000\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 05:11:12', '2021-11-10 05:11:12'),
(3775, 3, 'admin/stock-records/create', 'GET', '::1', '[]', '2021-11-10 05:11:12', '2021-11-10 05:11:12'),
(3776, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"10210\",\"is_transfer\":\"1\",\"seed_class\":\"18\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\"}', '2021-11-10 05:12:13', '2021-11-10 05:12:13'),
(3777, 3, 'admin/stock-records', 'GET', '::1', '[]', '2021-11-10 05:12:14', '2021-11-10 05:12:14'),
(3778, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:12:23', '2021-11-10 05:12:23'),
(3779, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:13:07', '2021-11-10 05:13:07'),
(3780, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:13:31', '2021-11-10 05:13:31'),
(3781, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:13:33', '2021-11-10 05:13:33'),
(3782, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:13:50', '2021-11-10 05:13:50'),
(3783, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:14:02', '2021-11-10 05:14:02'),
(3784, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"crop_variety_id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:14:09', '2021-11-10 05:14:09'),
(3785, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"crop_variety_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:14:12', '2021-11-10 05:14:12'),
(3786, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:14:15', '2021-11-10 05:14:15'),
(3787, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2021-11-10 05:14:23', '2021-11-10 05:14:23'),
(3788, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"crop_variety_id\":\"3\",\"is_deposit\":null}', '2021-11-10 05:15:50', '2021-11-10 05:15:50'),
(3789, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:16:08', '2021-11-10 05:16:08'),
(3790, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"id\":null,\"crop_variety_id\":\"3\",\"is_deposit\":null,\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:16:10', '2021-11-10 05:16:10'),
(3791, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:16:12', '2021-11-10 05:16:12'),
(3792, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"crop_variety_id\":\"3\",\"is_deposit\":null}', '2021-11-10 05:16:22', '2021-11-10 05:16:22'),
(3793, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"crop_variety_id\":\"3\",\"is_deposit\":\"0\"}', '2021-11-10 05:17:19', '2021-11-10 05:17:19'),
(3794, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"crop_variety_id\":null,\"is_deposit\":\"0\"}', '2021-11-10 05:17:33', '2021-11-10 05:17:33'),
(3795, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:17:38', '2021-11-10 05:17:38'),
(3796, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"crop_variety_id\":\"5\",\"is_deposit\":null}', '2021-11-10 05:17:55', '2021-11-10 05:17:55'),
(3797, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"quantity\",\"type\":\"desc\"},\"id\":null,\"crop_variety_id\":\"5\",\"is_deposit\":null}', '2021-11-10 05:18:21', '2021-11-10 05:18:21'),
(3798, 3, 'admin/stock-records/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:18:29', '2021-11-10 05:18:29'),
(3799, 3, 'admin/stock-records', 'POST', '::1', '{\"crop_variety_id\":\"3\",\"is_deposit\":null,\"quantity\":\"800\",\"is_transfer\":\"0\",\"detail\":\"sTOLEN\",\"_token\":\"cZbJdxhxEM7Sda0G9yqCUV0irJQh535Ew5JnopWl\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/stock-records?_sort%5Bcolumn%5D=quantity&_sort%5Btype%5D=desc&id=&crop_variety_id=5&is_deposit=\"}', '2021-11-10 05:18:44', '2021-11-10 05:18:44'),
(3800, 3, 'admin/stock-records', 'GET', '::1', '[]', '2021-11-10 05:18:44', '2021-11-10 05:18:44'),
(3801, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:18:49', '2021-11-10 05:18:49'),
(3802, 3, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:19:15', '2021-11-10 05:19:15'),
(3803, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:19:30', '2021-11-10 05:19:30'),
(3804, 1, 'admin', 'GET', '::1', '[]', '2021-11-10 05:19:39', '2021-11-10 05:19:39'),
(3805, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:19:49', '2021-11-10 05:19:49'),
(3806, 1, 'admin', 'GET', '::1', '[]', '2021-11-10 05:19:55', '2021-11-10 05:19:55'),
(3807, 1, 'admin/auth/users', 'GET', '::1', '[]', '2021-11-10 05:20:11', '2021-11-10 05:20:11'),
(3808, 1, 'admin/auth/users/18/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:21:13', '2021-11-10 05:21:13'),
(3809, 1, 'admin/auth/users/18', 'PUT', '::1', '{\"username\":\"john1@gmail.com4998\",\"name\":\"John Doe\",\"password\":\"4321\",\"password_confirmation\":\"4321\",\"roles\":[\"3\",null],\"permissions\":[null],\"_token\":\"dY6y853h6vNDJNjJwjFNlucwY3009GvvGm2GozUr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/users\"}', '2021-11-10 05:21:21', '2021-11-10 05:21:21'),
(3810, 1, 'admin/auth/users', 'GET', '::1', '[]', '2021-11-10 05:21:22', '2021-11-10 05:21:22'),
(3811, 18, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-10 05:21:29', '2021-11-10 05:21:29'),
(3812, 18, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:21:34', '2021-11-10 05:21:34'),
(3813, 18, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"crop_variety_id\":\"5\",\"is_deposit\":null}', '2021-11-10 05:22:05', '2021-11-10 05:22:05'),
(3814, 18, 'admin/stock-records', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"crop_variety_id\":\"3\",\"is_deposit\":null}', '2021-11-10 05:22:10', '2021-11-10 05:22:10'),
(3815, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:22:22', '2021-11-10 05:22:22'),
(3816, 2, 'admin', 'GET', '::1', '[]', '2021-11-10 05:22:31', '2021-11-10 05:22:31'),
(3817, 2, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:22:36', '2021-11-10 05:22:36'),
(3818, 2, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2021-11-10 05:23:18', '2021-11-10 05:23:18'),
(3819, 2, 'admin/stock-records', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\",\"per_page\":\"10\"}', '2021-11-10 05:23:24', '2021-11-10 05:23:24'),
(3820, 2, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:25:42', '2021-11-10 05:25:42'),
(3821, 2, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"administrator_id\":\"18\",\"crop_variety_id\":null,\"is_deposit\":null}', '2021-11-10 05:25:55', '2021-11-10 05:25:55'),
(3822, 2, 'admin/stock-records', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"administrator_id\":\"3\",\"crop_variety_id\":null,\"is_deposit\":null}', '2021-11-10 05:26:00', '2021-11-10 05:26:00'),
(3823, 2, 'admin/stock-records', 'GET', '::1', '{\"page\":\"2\",\"per_page\":\"10\",\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:26:08', '2021-11-10 05:26:08'),
(3824, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:26:51', '2021-11-10 05:26:51'),
(3825, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:49:18', '2021-11-10 05:49:18'),
(3826, 2, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:49:27', '2021-11-10 05:49:27'),
(3827, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:49:39', '2021-11-10 05:49:39'),
(3828, 3, 'admin', 'GET', '::1', '[]', '2021-11-10 05:49:47', '2021-11-10 05:49:47'),
(3829, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:49:53', '2021-11-10 05:49:53'),
(3830, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:49:59', '2021-11-10 05:49:59'),
(3831, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:50:49', '2021-11-10 05:50:49'),
(3832, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-10 05:52:18', '2021-11-10 05:52:18'),
(3833, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:58:15', '2021-11-10 05:58:15'),
(3834, 3, 'admin/form-stock-examination-requests/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:58:24', '2021-11-10 05:58:24'),
(3835, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:58:28', '2021-11-10 05:58:28'),
(3836, 3, 'admin/form-stock-examination-requests/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:58:36', '2021-11-10 05:58:36'),
(3837, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 05:58:38', '2021-11-10 05:58:38'),
(3838, 18, 'admin/stock-records', 'GET', '127.0.0.1', '{\"id\":null,\"crop_variety_id\":\"3\",\"is_deposit\":null,\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:40:29', '2021-11-10 06:40:29'),
(3839, 18, 'admin/stock-records', 'GET', '127.0.0.1', '{\"crop_variety_id\":\"3\",\"_pjax\":\"#pjax-container\",\"per_page\":\"50\"}', '2021-11-10 06:40:38', '2021-11-10 06:40:38'),
(3840, 18, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:40:42', '2021-11-10 06:40:42'),
(3841, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-10 06:40:52', '2021-11-10 06:40:52'),
(3842, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:41:13', '2021-11-10 06:41:13'),
(3843, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"e8Ct5Ykhx1RhDFonB7TQLAiCLfS3rkTZwalK7nWg\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":25,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":30},{\\\"id\\\":27},{\\\"id\\\":31},{\\\"id\\\":32},{\\\"id\\\":28},{\\\"id\\\":29}]},{\\\"id\\\":33,\\\"children\\\":[{\\\"id\\\":34},{\\\"id\\\":35}]},{\\\"id\\\":18,\\\"children\\\":[{\\\"id\\\":19}]},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":20,\\\"children\\\":[{\\\"id\\\":21},{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-11-10 06:41:42', '2021-11-10 06:41:42'),
(3844, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:41:43', '2021-11-10 06:41:43'),
(3845, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:41:46', '2021-11-10 06:41:46'),
(3846, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-10 06:41:47', '2021-11-10 06:41:47'),
(3847, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:42:06', '2021-11-10 06:42:06'),
(3848, 1, 'admin/auth/menu/29/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:42:42', '2021-11-10 06:42:42'),
(3849, 1, 'admin/auth/menu/29', 'PUT', '127.0.0.1', '{\"parent_id\":\"25\",\"title\":\"Seed labels\",\"icon\":\"fa-adjust\",\"uri\":\"seed-labs\",\"roles\":[null],\"permission\":null,\"_token\":\"e8Ct5Ykhx1RhDFonB7TQLAiCLfS3rkTZwalK7nWg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2021-11-10 06:42:51', '2021-11-10 06:42:51'),
(3850, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-11-10 06:42:51', '2021-11-10 06:42:51'),
(3851, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-10 06:43:11', '2021-11-10 06:43:11'),
(3852, 1, 'admin/auth/menu/28/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:43:21', '2021-11-10 06:43:21'),
(3853, 1, 'admin/auth/menu/28', 'PUT', '127.0.0.1', '{\"parent_id\":\"25\",\"title\":\"Seed lab\",\"icon\":\"fa-adjust\",\"uri\":\"seed-labs\",\"roles\":[null],\"permission\":null,\"_token\":\"e8Ct5Ykhx1RhDFonB7TQLAiCLfS3rkTZwalK7nWg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/auth\\/menu\"}', '2021-11-10 06:43:27', '2021-11-10 06:43:27'),
(3854, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-11-10 06:43:28', '2021-11-10 06:43:28'),
(3855, 3, 'admin/form-stock-examination-requests', 'GET', '::1', '[]', '2021-11-10 06:43:32', '2021-11-10 06:43:32'),
(3856, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:43:40', '2021-11-10 06:43:40'),
(3857, 3, 'admin/seed-labs/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 06:44:15', '2021-11-10 06:44:15'),
(3858, 3, 'admin/stock-records', 'GET', '::1', '{\"page\":\"2\",\"per_page\":\"10\"}', '2021-11-10 07:15:58', '2021-11-10 07:15:58'),
(3859, 3, 'admin/stock-records', 'GET', '::1', '{\"page\":\"2\",\"per_page\":\"10\"}', '2021-11-10 07:15:59', '2021-11-10 07:15:59'),
(3860, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 07:16:14', '2021-11-10 07:16:14'),
(3861, 3, 'admin/seed-labs/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 07:16:17', '2021-11-10 07:16:17'),
(3862, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 07:19:27', '2021-11-10 07:19:27'),
(3863, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 07:19:55', '2021-11-10 07:19:55'),
(3864, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 07:22:25', '2021-11-10 07:22:25'),
(3865, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 07:24:12', '2021-11-10 07:24:12'),
(3866, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 07:24:24', '2021-11-10 07:24:24'),
(3867, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 07:25:16', '2021-11-10 07:25:16'),
(3868, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 07:26:50', '2021-11-10 07:26:50'),
(3869, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-11-10 07:30:13', '2021-11-10 07:30:13'),
(3870, 3, 'admin/seed-labs/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 07:59:23', '2021-11-10 07:59:23'),
(3871, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:33:19', '2021-11-10 08:33:19'),
(3872, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:33:38', '2021-11-10 08:33:38'),
(3873, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:35:05', '2021-11-10 08:35:05'),
(3874, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:45:08', '2021-11-10 08:45:08'),
(3875, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:45:10', '2021-11-10 08:45:10'),
(3876, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:45:57', '2021-11-10 08:45:57'),
(3877, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:45:58', '2021-11-10 08:45:58'),
(3878, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:46:20', '2021-11-10 08:46:20'),
(3879, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:46:41', '2021-11-10 08:46:41'),
(3880, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:49:04', '2021-11-10 08:49:04'),
(3881, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:53:18', '2021-11-10 08:53:18'),
(3882, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:53:44', '2021-11-10 08:53:44'),
(3883, 3, 'admin/seed-labs/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 08:54:01', '2021-11-10 08:54:01'),
(3884, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 08:57:25', '2021-11-10 08:57:25'),
(3885, 3, 'admin/seed-labs/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 08:58:44', '2021-11-10 08:58:44'),
(3886, 3, 'admin/seed-labs/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 08:58:56', '2021-11-10 08:58:56'),
(3887, 3, 'admin/seed-labs', 'POST', '::1', '{\"administrator_id\":\"3\",\"crop_variety_id\":null,\"form_stock_examination_request_id\":\"2\",\"collection_date\":\"2021-11-12\",\"applicant_remarks\":\"Simple remarks\",\"_token\":\"jEcHZP3BA7IyaXkaSVyYQn6agJs7fFjeTwpC2zro\"}', '2021-11-10 09:00:06', '2021-11-10 09:00:06'),
(3888, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 09:00:06', '2021-11-10 09:00:06'),
(3889, 3, 'admin/seed-labs/create', 'GET', '::1', '[]', '2021-11-10 09:01:34', '2021-11-10 09:01:34'),
(3890, 3, 'admin/seed-labs', 'POST', '::1', '{\"administrator_id\":\"3\",\"crop_variety_id\":null,\"form_stock_examination_request_id\":\"2\",\"collection_date\":\"2021-11-10\",\"applicant_remarks\":\"as\",\"_token\":\"jEcHZP3BA7IyaXkaSVyYQn6agJs7fFjeTwpC2zro\"}', '2021-11-10 09:02:23', '2021-11-10 09:02:23'),
(3891, 3, 'admin/seed-labs/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:04:40', '2021-11-10 09:04:40'),
(3892, 3, 'admin/seed-labs', 'POST', '::1', '{\"administrator_id\":\"3\",\"crop_variety_id\":null,\"form_stock_examination_request_id\":\"2\",\"collection_date\":\"2021-11-11\",\"applicant_remarks\":\"Simple\",\"_token\":\"jEcHZP3BA7IyaXkaSVyYQn6agJs7fFjeTwpC2zro\"}', '2021-11-10 09:05:03', '2021-11-10 09:05:03'),
(3893, 3, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 09:05:03', '2021-11-10 09:05:03'),
(3894, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:06:14', '2021-11-10 09:06:14'),
(3895, 3, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 09:06:20', '2021-11-10 09:06:20'),
(3896, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:07:00', '2021-11-10 09:07:00'),
(3897, 3, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 09:10:14', '2021-11-10 09:10:14'),
(3898, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:11:55', '2021-11-10 09:11:55'),
(3899, 3, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 09:16:37', '2021-11-10 09:16:37'),
(3900, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-11-10 09:35:14', '2021-11-10 09:35:14'),
(3901, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:35:24', '2021-11-10 09:35:24'),
(3902, 3, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 09:37:12', '2021-11-10 09:37:12'),
(3903, 3, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 09:37:29', '2021-11-10 09:37:29'),
(3904, 3, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 09:37:47', '2021-11-10 09:37:47'),
(3905, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:37:59', '2021-11-10 09:37:59'),
(3906, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:38:30', '2021-11-10 09:38:30'),
(3907, 3, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:38:36', '2021-11-10 09:38:36'),
(3908, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:38:41', '2021-11-10 09:38:41'),
(3909, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:40:26', '2021-11-10 09:40:26'),
(3910, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:40:47', '2021-11-10 09:40:47'),
(3911, 1, 'admin/auth/menu/28/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:41:09', '2021-11-10 09:41:09'),
(3912, 3, 'admin/seed-labs/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:41:14', '2021-11-10 09:41:14'),
(3913, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:41:41', '2021-11-10 09:41:41'),
(3914, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:42:10', '2021-11-10 09:42:10'),
(3915, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:42:19', '2021-11-10 09:42:19'),
(3916, 3, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 09:42:22', '2021-11-10 09:42:22'),
(3917, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:42:46', '2021-11-10 09:42:46'),
(3918, 3, 'admin/seed-labs/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:43:02', '2021-11-10 09:43:02'),
(3919, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:43:14', '2021-11-10 09:43:14'),
(3920, 1, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:43:35', '2021-11-10 09:43:35'),
(3921, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:43:42', '2021-11-10 09:43:42'),
(3922, 1, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:46:54', '2021-11-10 09:46:54'),
(3923, 1, 'admin/seed-labs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:46:57', '2021-11-10 09:46:57'),
(3924, 1, 'admin/seed-labs', 'GET', '127.0.0.1', '[]', '2021-11-10 09:46:57', '2021-11-10 09:46:57'),
(3925, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:47:04', '2021-11-10 09:47:04'),
(3926, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 09:50:39', '2021-11-10 09:50:39'),
(3927, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 09:54:29', '2021-11-10 09:54:29'),
(3928, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 09:54:54', '2021-11-10 09:54:54'),
(3929, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:57:50', '2021-11-10 09:57:50'),
(3930, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:58:21', '2021-11-10 09:58:21'),
(3931, 1, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:58:32', '2021-11-10 09:58:32'),
(3932, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:58:37', '2021-11-10 09:58:37'),
(3933, 1, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:58:38', '2021-11-10 09:58:38'),
(3934, 1, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 09:59:44', '2021-11-10 09:59:44'),
(3935, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:00:27', '2021-11-10 10:00:27'),
(3936, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:01:48', '2021-11-10 10:01:48'),
(3937, 1, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:02:38', '2021-11-10 10:02:38'),
(3938, 1, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"NH2PbKAewzTo7zeytv8S8eflF52JuGM6Lq1qZkz3\",\"_method\":\"PUT\"}', '2021-11-10 10:02:46', '2021-11-10 10:02:46'),
(3939, 1, 'admin/seed-labs', 'GET', '127.0.0.1', '[]', '2021-11-10 10:02:46', '2021-11-10 10:02:46'),
(3940, 1, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:04:16', '2021-11-10 10:04:16'),
(3941, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:05:01', '2021-11-10 10:05:01'),
(3942, 3, 'admin/seed-labs/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:05:13', '2021-11-10 10:05:13'),
(3943, 3, 'admin/seed-labs/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:06:25', '2021-11-10 10:06:25'),
(3944, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:06:28', '2021-11-10 10:06:28'),
(3945, 3, 'admin/seed-labs/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:06:34', '2021-11-10 10:06:34'),
(3946, 3, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:06:36', '2021-11-10 10:06:36'),
(3947, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:06:59', '2021-11-10 10:06:59'),
(3948, 20, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-10 10:07:19', '2021-11-10 10:07:19'),
(3949, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:07:36', '2021-11-10 10:07:36'),
(3950, 20, 'admin/seed-labs/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:07:43', '2021-11-10 10:07:43'),
(3951, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:07:44', '2021-11-10 10:07:44'),
(3952, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:07:49', '2021-11-10 10:07:49'),
(3953, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:08:25', '2021-11-10 10:08:25'),
(3954, 20, 'admin/seed-labs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:08:36', '2021-11-10 10:08:36'),
(3955, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '[]', '2021-11-10 10:08:37', '2021-11-10 10:08:37'),
(3956, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:08:47', '2021-11-10 10:08:47'),
(3957, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:09:27', '2021-11-10 10:09:27'),
(3958, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:09:31', '2021-11-10 10:09:31'),
(3959, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:09:34', '2021-11-10 10:09:34'),
(3960, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:09:37', '2021-11-10 10:09:37'),
(3961, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:11:47', '2021-11-10 10:11:47'),
(3962, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:14:21', '2021-11-10 10:14:21'),
(3963, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:14:58', '2021-11-10 10:14:58'),
(3964, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:15:51', '2021-11-10 10:15:51'),
(3965, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:17:17', '2021-11-10 10:17:17'),
(3966, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:19:43', '2021-11-10 10:19:43'),
(3967, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:23:37', '2021-11-10 10:23:37'),
(3968, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:24:33', '2021-11-10 10:24:33'),
(3969, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:24:49', '2021-11-10 10:24:49'),
(3970, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:25:08', '2021-11-10 10:25:08'),
(3971, 3, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 10:31:51', '2021-11-10 10:31:51'),
(3972, 3, 'admin/seed-labs/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:31:56', '2021-11-10 10:31:56'),
(3973, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:32:00', '2021-11-10 10:32:00'),
(3974, 3, 'admin/seed-labs/1', 'GET', '::1', '[]', '2021-11-10 10:33:14', '2021-11-10 10:33:14'),
(3975, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:33:18', '2021-11-10 10:33:18'),
(3976, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:34:18', '2021-11-10 10:34:18'),
(3977, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:34:26', '2021-11-10 10:34:26'),
(3978, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:34:27', '2021-11-10 10:34:27'),
(3979, 3, 'admin/seed-labs/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:37:14', '2021-11-10 10:37:14'),
(3980, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:37:17', '2021-11-10 10:37:17'),
(3981, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:37:26', '2021-11-10 10:37:26'),
(3982, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:37:50', '2021-11-10 10:37:50'),
(3983, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:51', '2021-11-10 10:37:51'),
(3984, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:52', '2021-11-10 10:37:52'),
(3985, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:52', '2021-11-10 10:37:52'),
(3986, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:53', '2021-11-10 10:37:53'),
(3987, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:54', '2021-11-10 10:37:54'),
(3988, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:54', '2021-11-10 10:37:54'),
(3989, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:55', '2021-11-10 10:37:55'),
(3990, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:56', '2021-11-10 10:37:56'),
(3991, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:56', '2021-11-10 10:37:56'),
(3992, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:57', '2021-11-10 10:37:57'),
(3993, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:58', '2021-11-10 10:37:58'),
(3994, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:58', '2021-11-10 10:37:58'),
(3995, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:59', '2021-11-10 10:37:59'),
(3996, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:37:59', '2021-11-10 10:37:59'),
(3997, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:00', '2021-11-10 10:38:00'),
(3998, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:00', '2021-11-10 10:38:00'),
(3999, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:01', '2021-11-10 10:38:01'),
(4000, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:02', '2021-11-10 10:38:02'),
(4001, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:05', '2021-11-10 10:38:05'),
(4002, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:38:14', '2021-11-10 10:38:14'),
(4003, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:14', '2021-11-10 10:38:14'),
(4004, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:15', '2021-11-10 10:38:15'),
(4005, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:15', '2021-11-10 10:38:15'),
(4006, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:16', '2021-11-10 10:38:16'),
(4007, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:17', '2021-11-10 10:38:17'),
(4008, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:17', '2021-11-10 10:38:17'),
(4009, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:18', '2021-11-10 10:38:18'),
(4010, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:18', '2021-11-10 10:38:18'),
(4011, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:18', '2021-11-10 10:38:18'),
(4012, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:19', '2021-11-10 10:38:19'),
(4013, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:20', '2021-11-10 10:38:20'),
(4014, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:38:21', '2021-11-10 10:38:21'),
(4015, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:38:29', '2021-11-10 10:38:29'),
(4016, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:32', '2021-11-10 10:38:32'),
(4017, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:41', '2021-11-10 10:38:41'),
(4018, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:38:56', '2021-11-10 10:38:56'),
(4019, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:39:01', '2021-11-10 10:39:01'),
(4020, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:41:45', '2021-11-10 10:41:45'),
(4021, 20, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"sampling_date\":\"2021-11-10\",\"sample_weight\":\"11\",\"quantity\":\"1200000\",\"packaging\":\"11\",\"number_of_units\":null,\"mother_lot\":\"5395860\",\"sample_condition\":\"Processed seed\",\"inspector_remarks\":null,\"tests_required\":[\"Purity\",\"Seed health\",null],\"inspector_is_done\":\"1\",\"_token\":\"NFrjHzMqmlSQyn5Tpx1mse7SkoudJMMSPJDeyH7j\",\"_method\":\"PUT\"}', '2021-11-10 10:42:47', '2021-11-10 10:42:47'),
(4022, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:42:50', '2021-11-10 10:42:50'),
(4023, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:43:39', '2021-11-10 10:43:39'),
(4024, 20, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"sampling_date\":\"2021-11-10\",\"sample_weight\":\"-1000\",\"quantity\":\"0\",\"packaging\":null,\"number_of_units\":null,\"mother_lot\":\"7166696\",\"sample_condition\":\"Raw seed\",\"tests_required\":[\"Moisture content\",null],\"inspector_is_done\":\"1\",\"_token\":\"NFrjHzMqmlSQyn5Tpx1mse7SkoudJMMSPJDeyH7j\",\"_method\":\"PUT\"}', '2021-11-10 10:50:24', '2021-11-10 10:50:24'),
(4025, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:51:18', '2021-11-10 10:51:18'),
(4026, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 10:51:46', '2021-11-10 10:51:46'),
(4027, 20, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"sampling_date\":\"2021-11-10\",\"sample_weight\":\"10000\",\"quantity\":\"1000000\",\"packaging\":null,\"number_of_units\":null,\"mother_lot\":\"5235029\",\"sample_condition\":\"Raw seed\",\"tests_required\":[\"Purity\",\"Germination\",null],\"inspector_is_done\":\"2\",\"inspector_remarks\":\"ajsbjkas\",\"_token\":\"NFrjHzMqmlSQyn5Tpx1mse7SkoudJMMSPJDeyH7j\",\"_method\":\"PUT\"}', '2021-11-10 10:52:16', '2021-11-10 10:52:16'),
(4028, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:54:42', '2021-11-10 10:54:42'),
(4029, 20, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"sampling_date\":\"2021-11-10\",\"sample_weight\":\"120\",\"quantity\":\"1000000\",\"packaging\":null,\"number_of_units\":null,\"mother_lot\":\"9987182\",\"sample_condition\":\"Raw seed\",\"tests_required\":[\"Purity\",\"Germination\",null],\"inspector_is_done\":\"1\",\"_token\":\"NFrjHzMqmlSQyn5Tpx1mse7SkoudJMMSPJDeyH7j\",\"_method\":\"PUT\"}', '2021-11-10 10:55:41', '2021-11-10 10:55:41'),
(4030, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '[]', '2021-11-10 10:55:42', '2021-11-10 10:55:42'),
(4031, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:56:18', '2021-11-10 10:56:18'),
(4032, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 10:56:21', '2021-11-10 10:56:21'),
(4033, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:01:37', '2021-11-10 11:01:37'),
(4034, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:01:52', '2021-11-10 11:01:52'),
(4035, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:02:24', '2021-11-10 11:02:24'),
(4036, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:03:05', '2021-11-10 11:03:05'),
(4037, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:03:56', '2021-11-10 11:03:56'),
(4038, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:04:01', '2021-11-10 11:04:01'),
(4039, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:05:41', '2021-11-10 11:05:41'),
(4040, 20, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"inspector_is_done\":\"0\",\"sampling_date\":\"2021-11-11\",\"sample_weight\":\"200\",\"quantity\":\"1200\",\"packaging\":\"SImple\",\"number_of_units\":\"Kgs\",\"mother_lot\":\"5481479\",\"sample_condition\":\"Raw seed\",\"tests_required\":[\"Purity\",\"Seed health\",null],\"status\":\"4\",\"_token\":\"NFrjHzMqmlSQyn5Tpx1mse7SkoudJMMSPJDeyH7j\",\"_method\":\"PUT\"}', '2021-11-10 11:06:54', '2021-11-10 11:06:54'),
(4041, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '[]', '2021-11-10 11:06:55', '2021-11-10 11:06:55'),
(4042, 20, 'admin/seed-labs/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:07:21', '2021-11-10 11:07:21'),
(4043, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:07:23', '2021-11-10 11:07:23'),
(4044, 3, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:07:33', '2021-11-10 11:07:33'),
(4045, 2, 'admin', 'GET', '::1', '[]', '2021-11-10 11:07:42', '2021-11-10 11:07:42'),
(4046, 2, 'admin/form-crop-declarations', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:07:49', '2021-11-10 11:07:49'),
(4047, 2, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:07:51', '2021-11-10 11:07:51'),
(4048, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:07:54', '2021-11-10 11:07:54'),
(4049, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:09:19', '2021-11-10 11:09:19'),
(4050, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:09:48', '2021-11-10 11:09:48'),
(4051, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:09:49', '2021-11-10 11:09:49'),
(4052, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:10:08', '2021-11-10 11:10:08'),
(4053, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:10:21', '2021-11-10 11:10:21'),
(4054, 2, 'admin/seed-labs/1', 'PUT', '::1', '{\"inspector_is_done\":\"0\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"aaT1YORI1RheJLbscCJ6GqIrq0q2guHME5sHD19C\",\"_method\":\"PUT\"}', '2021-11-10 11:10:27', '2021-11-10 11:10:27'),
(4055, 2, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 11:10:28', '2021-11-10 11:10:28'),
(4056, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:10:33', '2021-11-10 11:10:33'),
(4057, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:10:36', '2021-11-10 11:10:36'),
(4058, 20, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"inspector_is_done\":\"0\",\"sampling_date\":\"2021-11-11\",\"sample_weight\":\"200\",\"quantity\":\"1200\",\"packaging\":\"SImple\",\"number_of_units\":\"Kgs\",\"mother_lot\":\"5481479\",\"sample_condition\":\"Raw seed\",\"tests_required\":[\"Purity\",\"Seed health\",null],\"status\":\"4\",\"_token\":\"NFrjHzMqmlSQyn5Tpx1mse7SkoudJMMSPJDeyH7j\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/seed-labs\"}', '2021-11-10 11:11:13', '2021-11-10 11:11:13'),
(4059, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '[]', '2021-11-10 11:11:13', '2021-11-10 11:11:13'),
(4060, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:11:17', '2021-11-10 11:11:17'),
(4061, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:11:23', '2021-11-10 11:11:23'),
(4062, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:11:36', '2021-11-10 11:11:36'),
(4063, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:11:37', '2021-11-10 11:11:37'),
(4064, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:11:41', '2021-11-10 11:11:41'),
(4065, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:12:18', '2021-11-10 11:12:18'),
(4066, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:13:14', '2021-11-10 11:13:14'),
(4067, 2, 'admin/seed-labs/1', 'PUT', '::1', '{\"inspector_is_done\":\"1\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"aaT1YORI1RheJLbscCJ6GqIrq0q2guHME5sHD19C\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/seed-labs\"}', '2021-11-10 11:13:18', '2021-11-10 11:13:18'),
(4068, 2, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 11:13:18', '2021-11-10 11:13:18'),
(4069, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:13:27', '2021-11-10 11:13:27'),
(4070, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:13:33', '2021-11-10 11:13:33'),
(4071, 20, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"inspector_is_done\":\"1\",\"sampling_date\":\"2021-11-11\",\"sample_weight\":\"200\",\"quantity\":\"1200\",\"packaging\":\"SImple\",\"number_of_units\":\"Kgs\",\"mother_lot\":\"5481479\",\"sample_condition\":\"Raw seed\",\"tests_required\":[\"Purity\",\"Seed health\",null],\"status\":\"9\",\"_token\":\"NFrjHzMqmlSQyn5Tpx1mse7SkoudJMMSPJDeyH7j\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/seed-labs\"}', '2021-11-10 11:13:56', '2021-11-10 11:13:56'),
(4072, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '[]', '2021-11-10 11:13:56', '2021-11-10 11:13:56'),
(4073, 20, 'admin/seed-labs/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:14:31', '2021-11-10 11:14:31'),
(4074, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:14:34', '2021-11-10 11:14:34'),
(4075, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:16:52', '2021-11-10 11:16:52'),
(4076, 2, 'admin/seed-labs/1', 'PUT', '::1', '{\"inspector_is_done\":\"1\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"aaT1YORI1RheJLbscCJ6GqIrq0q2guHME5sHD19C\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/seed-labs\"}', '2021-11-10 11:16:56', '2021-11-10 11:16:56'),
(4077, 2, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 11:16:56', '2021-11-10 11:16:56'),
(4078, 2, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:16:59', '2021-11-10 11:16:59'),
(4079, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:17:03', '2021-11-10 11:17:03'),
(4080, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:17:10', '2021-11-10 11:17:10'),
(4081, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:17:12', '2021-11-10 11:17:12');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(4082, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:21:40', '2021-11-10 11:21:40'),
(4083, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:21:57', '2021-11-10 11:21:57'),
(4084, 20, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"inspector_is_done\":\"1\",\"sampling_date\":\"2021-11-11\",\"sample_weight\":\"200\",\"quantity\":\"1200\",\"packaging\":\"SImple\",\"number_of_units\":\"Kgs\",\"mother_lot\":\"5481479\",\"lot_number\":\"30789083\",\"sample_condition\":\"Raw seed\",\"tests_required\":[\"Purity\",\"Seed health\",null],\"status\":\"9\",\"_token\":\"NFrjHzMqmlSQyn5Tpx1mse7SkoudJMMSPJDeyH7j\",\"_method\":\"PUT\"}', '2021-11-10 11:24:35', '2021-11-10 11:24:35'),
(4085, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:36', '2021-11-10 11:24:36'),
(4086, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:36', '2021-11-10 11:24:36'),
(4087, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:36', '2021-11-10 11:24:36'),
(4088, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:37', '2021-11-10 11:24:37'),
(4089, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:37', '2021-11-10 11:24:37'),
(4090, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:38', '2021-11-10 11:24:38'),
(4091, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:38', '2021-11-10 11:24:38'),
(4092, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:39', '2021-11-10 11:24:39'),
(4093, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:39', '2021-11-10 11:24:39'),
(4094, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:39', '2021-11-10 11:24:39'),
(4095, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:40', '2021-11-10 11:24:40'),
(4096, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:40', '2021-11-10 11:24:40'),
(4097, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:41', '2021-11-10 11:24:41'),
(4098, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:41', '2021-11-10 11:24:41'),
(4099, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:42', '2021-11-10 11:24:42'),
(4100, 20, 'admin/seed-labs/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:24:42', '2021-11-10 11:24:42'),
(4101, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:24:54', '2021-11-10 11:24:54'),
(4102, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:24:58', '2021-11-10 11:24:58'),
(4103, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '[]', '2021-11-10 11:24:58', '2021-11-10 11:24:58'),
(4104, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:25:23', '2021-11-10 11:25:23'),
(4105, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:25:44', '2021-11-10 11:25:44'),
(4106, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:25:53', '2021-11-10 11:25:53'),
(4107, 2, 'admin/seed-labs/1', 'PUT', '::1', '{\"inspector_is_done\":\"1\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"aaT1YORI1RheJLbscCJ6GqIrq0q2guHME5sHD19C\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/seed-labs\"}', '2021-11-10 11:26:04', '2021-11-10 11:26:04'),
(4108, 2, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 11:26:04', '2021-11-10 11:26:04'),
(4109, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:26:10', '2021-11-10 11:26:10'),
(4110, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:27:21', '2021-11-10 11:27:21'),
(4111, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:29:22', '2021-11-10 11:29:22'),
(4112, 2, 'admin/seed-labs/1', 'PUT', '::1', '{\"inspector_is_done\":\"1\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"aaT1YORI1RheJLbscCJ6GqIrq0q2guHME5sHD19C\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/seed-labs\"}', '2021-11-10 11:29:28', '2021-11-10 11:29:28'),
(4113, 2, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 11:29:29', '2021-11-10 11:29:29'),
(4114, 2, 'admin/seed-labs/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:29:33', '2021-11-10 11:29:33'),
(4115, 2, 'admin/seed-labs/1', 'PUT', '::1', '{\"inspector_is_done\":\"0\",\"status\":\"2\",\"inspector\":\"20\",\"_token\":\"aaT1YORI1RheJLbscCJ6GqIrq0q2guHME5sHD19C\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/stts\\/admin\\/seed-labs\"}', '2021-11-10 11:29:45', '2021-11-10 11:29:45'),
(4116, 2, 'admin/seed-labs', 'GET', '::1', '[]', '2021-11-10 11:29:46', '2021-11-10 11:29:46'),
(4117, 20, 'admin/seed-labs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:29:50', '2021-11-10 11:29:50'),
(4118, 20, 'admin/seed-labs/1', 'PUT', '127.0.0.1', '{\"inspector_is_done\":\"0\",\"sampling_date\":\"2021-11-11\",\"sample_weight\":\"200\",\"quantity\":\"1200\",\"packaging\":\"SImple\",\"number_of_units\":\"Kgs\",\"mother_lot\":\"5481479\",\"lot_number\":\"10338378\",\"sample_condition\":\"Raw seed\",\"tests_required\":[\"Purity\",\"Seed health\",null],\"status\":\"9\",\"_token\":\"NFrjHzMqmlSQyn5Tpx1mse7SkoudJMMSPJDeyH7j\",\"_method\":\"PUT\"}', '2021-11-10 11:30:00', '2021-11-10 11:30:00'),
(4119, 20, 'admin/seed-labs', 'GET', '127.0.0.1', '[]', '2021-11-10 11:30:00', '2021-11-10 11:30:00'),
(4120, 2, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:31:05', '2021-11-10 11:31:05'),
(4121, 2, 'admin/seed-labs', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 11:32:10', '2021-11-10 11:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'Media manager', 'ext.media-manager', '', '/media*', '2021-10-20 12:28:29', '2021-10-20 12:28:29'),
(7, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2021-10-27 05:50:02', '2021-10-27 05:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super-admin', '2021-10-20 08:50:00', '2021-10-20 12:56:12'),
(2, 'Admin', 'admin', '2021-10-20 12:53:35', '2021-10-20 12:53:35'),
(3, 'Basic User', 'basic-user', '2021-10-20 13:02:58', '2021-10-20 13:02:58'),
(4, 'Inspector', 'inspector', '2021-10-21 13:02:29', '2021-10-21 13:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(2, 8, NULL, NULL),
(1, 18, NULL, NULL),
(1, 19, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 1, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(2, 5, NULL, NULL),
(2, 6, NULL, NULL),
(3, 3, NULL, NULL),
(3, 2, NULL, NULL),
(3, 1, NULL, NULL),
(4, 1, NULL, NULL),
(4, 2, NULL, NULL),
(4, 3, NULL, NULL),
(4, 4, NULL, NULL),
(4, 5, NULL, NULL),
(4, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(3, 3, NULL, NULL),
(2, 1, NULL, NULL),
(3, 18, NULL, NULL),
(4, 20, NULL, NULL),
(3, 21, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `email`) VALUES
(1, 'super-admin', '$2y$10$H6GEBthh.w0f7hTAiIPGReseT8KJRsPqCE2AtGvvRczN2OGmawONa', 'Administrator', NULL, '1EtvtxmOsyUD91qyQwAR7TSPf0afF8V5YdQeSscNXFyMuHrCFaSkkgzDJr1I', '2021-10-20 08:50:00', '2021-10-22 02:20:54', '', '', ''),
(2, 'admin', '$2y$10$JnOG.x2fFxqp3g/sfxaQou7rr7QRrhhQxHF.JRgXyv6eAlecjtOiO', 'Muhindo Mubaraka', 'muhind mubaraka.jpeg', 'a6VytLE7ggCCpndKJoWaAqEzY5d5wuhSFIdtu9TJSFHUVkt8brZKGQc64hmO', '2021-10-20 13:09:43', '2021-10-20 13:20:46', '', '', ''),
(3, 'basic-user', '$2y$10$cBUNI05M8a7AUXSEgLr4cudiDW3nFZ2McpfuAQOf4HIfjUF.6Viha', 'Betty Namagembe', '1705787-Linus-Torvalds-Quote-Talk-is-cheap-Show-me-the-code.jpeg', 'RX7mi0sP1E00HUcPw1swyJkYFTVYY8ddn2NXA2r8l7nqM6RTl4DEof3jUlZA', '2021-10-20 13:21:48', '2021-11-05 18:45:40', '', '', ''),
(18, 'john1@gmail.com4998', '$2y$10$KFXQO6uMd4oaapJ6KdJMYOqQ2zWgFUT9S4NaQQE5UeaeK4BxSOTWa', 'John Doe', NULL, 'D4QAHDbt5IwphC254MLFEUlOwNhnFAG6iStX8ptSgp7XfHtjzdUo09GigscJ', '2021-10-24 14:44:31', '2021-11-10 05:21:22', 'John', 'Doe', 'john1@gmail.com4998'),
(20, 'inspector', '$2y$10$xGq48MAYBM7ThjM/pLqeCu8Q3QOziQtuCQSW0Kz0I2dD8eA4oe0Oe', 'Thembo Akisam', '245863543_931529574441067_8414242258604896822_n.jpg', 'fJdEfvqj56iIlsddrNbzy4JM9PVuR0Yag3hYgl7z0Ba3LgUiXzku4s9Um7HB', '2021-10-25 03:43:02', '2021-10-25 03:43:02', NULL, NULL, NULL),
(21, 'basic-user@gmail.com', '$2y$10$q4kgzYEs.EfsFwX9Lj7CUeADqzCmkozFn5ipyVQCz2NEorxOyH5Lq', 'John Doe', NULL, 'T51bxD4QM0blrnI9QmXBoWBvFwm5uAa7LVSAtJhFiSVz1F4f56dLUOd38n92', '2021-10-25 06:42:33', '2021-10-25 06:42:33', 'John', 'Doe', 'basic-user@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `is_required` tinyint(4) DEFAULT NULL,
  `units` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `sender` bigint(20) UNSIGNED NOT NULL,
  `receiver` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `thread` text COLLATE utf8mb4_unicode_ci,
  `received` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crops`
--

CREATE TABLE `crops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `number_of_inspection` int(11) DEFAULT NULL,
  `number_of_days_before_submision` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crops`
--

INSERT INTO `crops` (`id`, `created_at`, `updated_at`, `name`, `number_of_inspection`, `number_of_days_before_submision`) VALUES
(3, '2021-10-27 04:30:25', '2021-10-27 05:00:02', 'Bush Beans', 3, 15),
(4, '2021-10-27 05:01:26', '2021-10-27 05:01:26', 'Climbing Beans', 3, 15),
(5, '2021-10-27 05:02:56', '2021-10-27 05:02:56', 'Ground Nuts', 2, 30),
(6, '2021-10-27 05:04:44', '2021-10-27 05:04:44', 'Maize (OPV)', 6, 45),
(7, '2021-10-27 05:05:47', '2021-10-27 05:05:47', 'Sim sim', 3, 20),
(8, '2021-10-27 05:06:44', '2021-10-27 05:06:44', 'Soybeans', 2, 30),
(9, '2021-10-27 05:07:42', '2021-10-27 08:33:52', 'Maize (Hybrid)', 5, 30),
(10, '2021-10-27 05:08:39', '2021-10-27 05:08:39', 'Sorghum', 3, 20),
(11, '2021-10-27 05:09:21', '2021-10-27 05:09:21', 'Rice', 3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `crop_inspection_types`
--

CREATE TABLE `crop_inspection_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `crop_id` bigint(20) UNSIGNED NOT NULL,
  `inspection_stage` text COLLATE utf8mb4_unicode_ci,
  `period_after_planting` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crop_inspection_types`
--

INSERT INTO `crop_inspection_types` (`id`, `created_at`, `updated_at`, `crop_id`, `inspection_stage`, `period_after_planting`) VALUES
(1, '2021-11-04 06:56:29', '2021-11-04 06:56:29', 3, 'Pre-flowering', '30'),
(2, '2021-11-04 06:56:29', '2021-11-04 06:56:29', 3, 'Flowering', '45'),
(3, '2021-11-04 06:56:29', '2021-11-04 06:56:29', 3, 'Pre-harvest', '60');

-- --------------------------------------------------------

--
-- Table structure for table `crop_types`
--

CREATE TABLE `crop_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `crop_id` bigint(20) UNSIGNED NOT NULL,
  `inspection_stage` text COLLATE utf8mb4_unicode_ci,
  `period_after_planting` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crop_varieties`
--

CREATE TABLE `crop_varieties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `crop_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crop_varieties`
--

INSERT INTO `crop_varieties` (`id`, `created_at`, `updated_at`, `crop_id`, `name`) VALUES
(3, '2021-10-27 05:00:02', '2021-10-27 05:00:02', 3, 'NABE1'),
(4, '2021-10-27 05:00:02', '2021-10-27 05:00:02', 3, 'NABE2'),
(5, '2021-10-27 05:00:02', '2021-10-27 05:00:02', 3, 'NABE15'),
(6, '2021-10-27 05:00:02', '2021-10-27 05:00:02', 3, 'NABE16'),
(7, '2021-10-27 05:00:02', '2021-10-27 05:00:02', 3, 'NABE17'),
(8, '2021-10-27 05:00:02', '2021-10-27 05:00:02', 3, 'NABE18'),
(9, '2021-10-27 05:00:02', '2021-10-27 05:00:02', 3, 'NABE19'),
(10, '2021-10-27 05:01:26', '2021-10-27 05:01:26', 4, 'NABE7C'),
(11, '2021-10-27 05:01:26', '2021-10-27 05:01:26', 4, 'NABE8C'),
(12, '2021-10-27 05:02:56', '2021-10-27 05:02:56', 5, 'BUKENE (OBSE LET)'),
(13, '2021-10-27 05:02:56', '2021-10-27 05:02:56', 5, 'IGORA'),
(14, '2021-10-27 05:04:44', '2021-10-27 05:04:44', 6, 'Bazooka'),
(15, '2021-10-27 05:04:44', '2021-10-27 05:04:44', 6, 'Dk8051'),
(16, '2021-10-27 05:05:47', '2021-10-27 05:05:47', 7, 'SESAME 1'),
(17, '2021-10-27 05:05:47', '2021-10-27 05:05:47', 7, 'SESAME 2'),
(18, '2021-10-27 05:05:47', '2021-10-27 05:05:47', 7, 'SESAME 3'),
(19, '2021-10-27 05:06:44', '2021-10-27 05:06:44', 8, 'Buakalasa 4'),
(20, '2021-10-27 05:06:44', '2021-10-27 05:06:44', 8, 'Congo 72'),
(21, '2021-10-27 05:07:42', '2021-10-27 05:07:42', 9, 'FH5160'),
(22, '2021-10-27 05:07:43', '2021-10-27 05:07:43', 9, 'F86150'),
(23, '2021-10-27 05:08:39', '2021-10-27 05:08:39', 10, 'Sekedo'),
(24, '2021-10-27 05:08:39', '2021-10-27 05:08:39', 10, 'Seso 3'),
(25, '2021-10-27 05:09:21', '2021-10-27 05:09:21', 11, 'Namche 1'),
(26, '2021-10-27 05:09:21', '2021-10-27 05:09:21', 11, 'Namche 2'),
(27, '2021-10-27 05:09:21', '2021-10-27 05:09:21', 11, 'Namche 3');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_crop_declarations`
--

CREATE TABLE `form_crop_declarations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `form_qd_id` bigint(20) UNSIGNED NOT NULL,
  `source_of_seed` text COLLATE utf8mb4_unicode_ci,
  `field_size` text COLLATE utf8mb4_unicode_ci,
  `seed_rate` text COLLATE utf8mb4_unicode_ci,
  `amount` text COLLATE utf8mb4_unicode_ci,
  `payment_receipt` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector` int(11) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `valid_from` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT '2021-01-01',
  `valid_until` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2021-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_crop_declarations_has_crop_varieties`
--

CREATE TABLE `form_crop_declarations_has_crop_varieties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_crop_declaration_id` bigint(20) UNSIGNED NOT NULL,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_crop_declarations_has_crop_varieties`
--

INSERT INTO `form_crop_declarations_has_crop_varieties` (`id`, `created_at`, `updated_at`, `form_crop_declaration_id`, `crop_variety_id`) VALUES
(1, '2021-11-05 06:10:52', '2021-11-05 06:10:52', 1, 5),
(2, '2021-11-05 07:05:50', '2021-11-05 07:05:50', 1, 4),
(3, '2021-11-09 05:19:35', '2021-11-09 05:19:35', 2, 3),
(4, '2021-11-09 05:19:35', '2021-11-09 05:19:35', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `form_qds`
--

CREATE TABLE `form_qds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `name_of_applicant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_initials` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `premises_location` text COLLATE utf8mb4_unicode_ci,
  `years_of_expirience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealers_in` text COLLATE utf8mb4_unicode_ci,
  `previous_grower_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cropping_histroy` text COLLATE utf8mb4_unicode_ci,
  `have_adequate_isolation` tinyint(4) DEFAULT NULL,
  `have_adequate_labor` tinyint(4) DEFAULT NULL,
  `aware_of_minimum_standards` tinyint(4) DEFAULT NULL,
  `signature_of_applicant` text COLLATE utf8mb4_unicode_ci,
  `grower_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector` int(11) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `have_been_qds` tinyint(4) DEFAULT NULL,
  `isolation_distance` int(11) DEFAULT NULL,
  `number_of_labors` int(11) DEFAULT NULL,
  `have_adequate_storage_facility` tinyint(4) DEFAULT NULL,
  `is_not_used` tinyint(4) DEFAULT NULL,
  `examination_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_qds`
--

INSERT INTO `form_qds` (`id`, `created_at`, `updated_at`, `administrator_id`, `name_of_applicant`, `address`, `company_initials`, `premises_location`, `years_of_expirience`, `dealers_in`, `previous_grower_number`, `cropping_histroy`, `have_adequate_isolation`, `have_adequate_labor`, `aware_of_minimum_standards`, `signature_of_applicant`, `grower_number`, `registration_number`, `valid_from`, `valid_until`, `status`, `inspector`, `status_comment`, `have_been_qds`, `isolation_distance`, `number_of_labors`, `have_adequate_storage_facility`, `is_not_used`, `examination_category`) VALUES
(2, '2021-10-28 07:43:06', '2021-11-04 10:12:19', 3, 'Betty Namagembe', 'Magdalene Lane Opposite Ndere Cultural Centre, Ntinda - Kisaasi Rd, Kampala', NULL, '11', '11', '[]', '21122', 'aasasas', 0, 0, 1, 'files/f23f5ecd96296a2ac8e54c27e2e85590.png', '171717', '1918282', '2021-11-03 21:00:00', '2023-04-23 21:00:00', '5', 20, NULL, 1, NULL, NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `form_sr4s`
--

CREATE TABLE `form_sr4s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `name_of_applicant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_initials` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `premises_location` text COLLATE utf8mb4_unicode_ci,
  `years_of_expirience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expirience_in` text COLLATE utf8mb4_unicode_ci,
  `dealers_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_of` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketing_of` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_land` tinyint(4) DEFAULT NULL,
  `land_size` int(11) DEFAULT NULL,
  `eqipment` text COLLATE utf8mb4_unicode_ci,
  `have_adequate_equipment` tinyint(4) DEFAULT NULL,
  `have_contractual_agreement` tinyint(4) DEFAULT NULL,
  `have_adequate_field_officers` tinyint(4) DEFAULT NULL,
  `have_conversant_seed_matters` tinyint(4) DEFAULT NULL,
  `souce_of_seed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_land_for_production` tinyint(4) DEFAULT NULL,
  `have_internal_quality_program` tinyint(4) DEFAULT NULL,
  `receipt` text COLLATE utf8mb4_unicode_ci,
  `accept_declaration` tinyint(4) DEFAULT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `inspector` int(11) DEFAULT NULL,
  `dealers_in_other` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_of_other` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketing_of_other` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `souce_of_seed_other` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_storage` tinyint(4) DEFAULT NULL,
  `seed_board_registration_number` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_sr4s`
--

INSERT INTO `form_sr4s` (`id`, `created_at`, `updated_at`, `administrator_id`, `name_of_applicant`, `address`, `company_initials`, `premises_location`, `years_of_expirience`, `expirience_in`, `dealers_in`, `processing_of`, `marketing_of`, `have_adequate_land`, `land_size`, `eqipment`, `have_adequate_equipment`, `have_contractual_agreement`, `have_adequate_field_officers`, `have_conversant_seed_matters`, `souce_of_seed`, `have_adequate_land_for_production`, `have_internal_quality_program`, `receipt`, `accept_declaration`, `valid_from`, `valid_until`, `status`, `status_comment`, `inspector`, `dealers_in_other`, `processing_of_other`, `marketing_of_other`, `souce_of_seed_other`, `have_adequate_storage`, `seed_board_registration_number`) VALUES
(5, '2021-10-28 05:58:26', '2021-10-28 06:08:54', 3, 'Muhindo Mubaraka', 'Kibuli, Kampala, Uganda', 'IUT', '11', '1', '1', 'Agricultural crops', 'Agricultural crops', 'Horticultural crops', 1, 11, NULL, 0, 0, 0, 0, '2', 0, 0, NULL, 1, '2021-10-27 21:00:00', '2023-05-10 21:00:00', '5', NULL, 20, NULL, NULL, NULL, NULL, 0, '120001000');

-- --------------------------------------------------------

--
-- Table structure for table `form_sr6s`
--

CREATE TABLE `form_sr6s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `name_of_applicant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_initials` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `premises_location` text COLLATE utf8mb4_unicode_ci,
  `years_of_expirience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealers_in` text COLLATE utf8mb4_unicode_ci,
  `previous_grower_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cropping_histroy` text COLLATE utf8mb4_unicode_ci,
  `have_adequate_isolation` tinyint(4) DEFAULT NULL,
  `have_adequate_labor` tinyint(4) DEFAULT NULL,
  `aware_of_minimum_standards` tinyint(4) DEFAULT NULL,
  `signature_of_applicant` text COLLATE utf8mb4_unicode_ci,
  `grower_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector` int(11) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `have_adequate_storage` tinyint(4) DEFAULT NULL,
  `seed_grower_in_past` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_sr6s`
--

INSERT INTO `form_sr6s` (`id`, `created_at`, `updated_at`, `administrator_id`, `name_of_applicant`, `address`, `company_initials`, `premises_location`, `years_of_expirience`, `dealers_in`, `previous_grower_number`, `cropping_histroy`, `have_adequate_isolation`, `have_adequate_labor`, `aware_of_minimum_standards`, `signature_of_applicant`, `grower_number`, `registration_number`, `valid_from`, `valid_until`, `status`, `inspector`, `status_comment`, `have_adequate_storage`, `seed_grower_in_past`) VALUES
(1, '2021-11-01 06:03:37', '2021-11-01 06:09:10', 3, 'Betty Namagembe', 'Kibuli, Kampala, Uganda', NULL, '11', '12', '[]', '2112', 'SIMPLE DETAILL...', 1, 1, 1, 'files/7b25be774b5ef80398cbc715368c45a9.png', '171717', NULL, '2019-04-04 21:00:00', '2022-11-30 21:00:00', '5', 20, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `form_sr6_has_crops`
--

CREATE TABLE `form_sr6_has_crops` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_sr6_id` bigint(20) NOT NULL,
  `crop_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_sr6_has_crops`
--

INSERT INTO `form_sr6_has_crops` (`id`, `form_sr6_id`, `crop_id`, `created_at`, `updated_at`) VALUES
(1, 11, 4, '2021-10-27 07:02:52', '2021-10-27 08:26:25'),
(2, 11, 6, '2021-10-27 07:03:32', '2021-10-27 08:26:25'),
(3, 11, 5, '2021-10-27 08:26:25', '2021-10-27 08:26:25'),
(4, 12, 3, '2021-10-27 08:27:20', '2021-10-27 08:27:20'),
(5, 12, 6, '2021-10-27 08:27:20', '2021-10-27 08:27:20'),
(6, 1, 4, '2021-11-01 06:03:37', '2021-11-01 06:03:37');

-- --------------------------------------------------------

--
-- Table structure for table `form_sr10s`
--

CREATE TABLE `form_sr10s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `planting_return_id` bigint(20) UNSIGNED NOT NULL,
  `stage` text COLLATE utf8mb4_unicode_ci,
  `status` text COLLATE utf8mb4_unicode_ci,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `submited_date` text COLLATE utf8mb4_unicode_ci,
  `min_date` text COLLATE utf8mb4_unicode_ci,
  `max_date` text COLLATE utf8mb4_unicode_ci,
  `administrator_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `is_done` tinyint(4) NOT NULL DEFAULT '0',
  `is_initialized` tinyint(4) DEFAULT NULL,
  `valid_from` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT '2021-01-01',
  `valid_until` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2021-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_sr10s`
--

INSERT INTO `form_sr10s` (`id`, `created_at`, `updated_at`, `planting_return_id`, `stage`, `status`, `status_comment`, `submited_date`, `min_date`, `max_date`, `administrator_id`, `is_active`, `is_done`, `is_initialized`, `valid_from`, `valid_until`) VALUES
(4, '2021-11-04 07:07:44', '2021-11-04 07:14:57', 7, 'Pre-flowering', '7', '', '2021-11-04', '2021-11-04', NULL, 20, 0, 0, 1, '1-1-2021', '1-1-2021'),
(5, '2021-11-04 07:07:44', '2021-11-04 07:16:03', 7, 'Flowering', '7', '', '2021-11-04', '2021-11-03', NULL, 20, 0, 1, 1, '1-1-2021', '1-1-2021'),
(6, '2021-11-04 07:07:44', '2021-11-09 04:16:28', 7, 'Pre-harvest', '5', '', '2021-11-04', '2021-11-04', NULL, 20, 0, 1, 1, '2021-01-05', '2022-01-05'),
(7, '2021-11-04 08:01:01', '2021-11-04 08:03:17', 8, 'Pre-flowering', '7', '', '2021-11-04', '2021-11-04', NULL, 20, 0, 1, 1, '1-1-2021', '1-1-2021'),
(8, '2021-11-04 08:01:01', '2021-11-04 08:53:28', 8, 'Flowering', '7', 'simple reason', '2021-11-04', '2021-11-04', NULL, 20, 0, 1, 1, '1-1-2021', '1-1-2021'),
(9, '2021-11-04 08:01:01', '2021-11-04 08:58:06', 8, 'Pre-harvest', '5', 'simple reason', '2021-11-04', '2022-01-03', NULL, 20, 0, 1, 1, '1-1-2021', '1-1-2021');

-- --------------------------------------------------------

--
-- Table structure for table `form_sr10_has_variety_inspections`
--

CREATE TABLE `form_sr10_has_variety_inspections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_sr10_id` bigint(20) UNSIGNED NOT NULL,
  `planting_return_crop_id` bigint(20) UNSIGNED NOT NULL,
  `seed_class` text COLLATE utf8mb4_unicode_ci,
  `size_of_field` text COLLATE utf8mb4_unicode_ci,
  `off_types` text COLLATE utf8mb4_unicode_ci,
  `diseases` text COLLATE utf8mb4_unicode_ci,
  `noxious_weeds` text COLLATE utf8mb4_unicode_ci,
  `other_features` text COLLATE utf8mb4_unicode_ci,
  `other_weeds` text COLLATE utf8mb4_unicode_ci,
  `isolation_distance` text COLLATE utf8mb4_unicode_ci,
  `proposed_distance` text COLLATE utf8mb4_unicode_ci,
  `general_conditions_of_crop` text COLLATE utf8mb4_unicode_ci,
  `estimated_yield` text COLLATE utf8mb4_unicode_ci,
  `futher_remarks` text COLLATE utf8mb4_unicode_ci,
  `status` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_stock_examination_requests`
--

CREATE TABLE `form_stock_examination_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `import_export_permit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `planting_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `form_qds_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_size` text COLLATE utf8mb4_unicode_ci,
  `yield` text COLLATE utf8mb4_unicode_ci,
  `date` text COLLATE utf8mb4_unicode_ci,
  `purity` text COLLATE utf8mb4_unicode_ci,
  `germination` text COLLATE utf8mb4_unicode_ci,
  `moisture_content` text COLLATE utf8mb4_unicode_ci,
  `insect_damage` text COLLATE utf8mb4_unicode_ci,
  `moldiness` text COLLATE utf8mb4_unicode_ci,
  `noxious_weeds` text COLLATE utf8mb4_unicode_ci,
  `recommendation` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `inspector` bigint(20) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `examination_category` int(11) NOT NULL DEFAULT '1',
  `administrator_id` bigint(20) NOT NULL DEFAULT '1',
  `crop_variety_id` bigint(20) DEFAULT '1',
  `seed_class` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_stock_examination_requests`
--

INSERT INTO `form_stock_examination_requests` (`id`, `created_at`, `updated_at`, `import_export_permit_id`, `planting_return_id`, `form_qds_id`, `field_size`, `yield`, `date`, `purity`, `germination`, `moisture_content`, `insect_damage`, `moldiness`, `noxious_weeds`, `recommendation`, `status`, `inspector`, `status_comment`, `remarks`, `examination_category`, `administrator_id`, `crop_variety_id`, `seed_class`) VALUES
(2, '2021-11-08 06:37:29', '2021-11-09 03:50:29', 8, NULL, NULL, NULL, '12000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 20, NULL, 'test', 1, 3, 3, 'Basic seed'),
(3, '2021-11-09 06:50:29', '2021-11-09 06:57:02', 18, NULL, NULL, NULL, '500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 20, NULL, 'test', 1, 3, 4, 'Pre-Basic seed');

-- --------------------------------------------------------

--
-- Table structure for table `form_test1s`
--

CREATE TABLE `form_test1s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size` double(8,2) DEFAULT NULL,
  `width` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_export_permits`
--

CREATE TABLE `import_export_permits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `telephone` text COLLATE utf8mb4_unicode_ci,
  `national_seed_board_reg_num` text COLLATE utf8mb4_unicode_ci,
  `store_location` text COLLATE utf8mb4_unicode_ci,
  `quantiry_of_seed` text COLLATE utf8mb4_unicode_ci,
  `name_address_of_origin` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `ista_certificate` text COLLATE utf8mb4_unicode_ci,
  `valid_from` text COLLATE utf8mb4_unicode_ci,
  `valid_until` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `inspector` bigint(20) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `permit_number` text COLLATE utf8mb4_unicode_ci,
  `is_import` tinyint(4) DEFAULT NULL,
  `phytosanitary_certificate` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_export_permits`
--

INSERT INTO `import_export_permits` (`id`, `created_at`, `updated_at`, `administrator_id`, `name`, `address`, `telephone`, `national_seed_board_reg_num`, `store_location`, `quantiry_of_seed`, `name_address_of_origin`, `details`, `ista_certificate`, `valid_from`, `valid_until`, `status`, `inspector`, `status_comment`, `permit_number`, `is_import`, `phytosanitary_certificate`, `category`) VALUES
(9, '2021-10-28 06:49:42', '2021-10-28 06:51:42', 3, 'Muhindo Mubaraka', 'Kibuli, Kampala, Uganda', '+256706638494', '120001000', '1200,0000', '1222', 'Kibuli, Kampala, Uganda', NULL, 'files/132edf48919ec180bb9aba707bb1c26f.jpeg', '2021-10-28', '2022-01-08', 5, 20, NULL, '482530', 0, 'files/1eeca0ef3a7b4c64ff87a64ccaad452f.jpg', NULL),
(18, '2021-11-09 06:34:07', '2021-11-09 06:36:14', 3, 'Betty Namagembe', 'ljas', 'ojabskkjs', '120001000', 'jslnblj', '122', 'jkabsubkas', NULL, NULL, '2021-11-01', '2022-04-08', 5, 20, NULL, '81302', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `import_export_permits_has_crops`
--

CREATE TABLE `import_export_permits_has_crops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `import_export_permit_id` bigint(20) UNSIGNED NOT NULL,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL,
  `varieties` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` bigint(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_export_permits_has_crops`
--

INSERT INTO `import_export_permits_has_crops` (`id`, `created_at`, `updated_at`, `import_export_permit_id`, `crop_variety_id`, `varieties`, `category`, `weight`) VALUES
(1, '2021-11-09 06:34:07', '2021-11-09 06:34:07', 18, 3, NULL, 'jkabsl', 1299);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_09_05_180305_create_categories_table', 1),
(7, '2021_09_05_180411_create_attributes_table', 1),
(8, '2021_09_05_211930_create_products_table', 1),
(9, '2021_09_15_220048_create_profiles_table', 1),
(10, '2021_09_18_100139_create_images_table', 1),
(11, '2021_09_23_091308_create_countries_table', 1),
(12, '2021_09_23_092138_create_cities_table', 1),
(13, '2021_10_16_021622_create_chats_table', 1),
(15, '2021_10_20_172350_create_sr4s_table', 2),
(17, '2021_10_20_173006_create_form_sr4s_table', 3),
(18, '2021_10_22_061845_create_form_sr6s_table', 4),
(20, '2021_10_25_080908_create_form_qdss_table', 5),
(23, '2021_10_26_151932_create_form_tests1_table', 6),
(24, '2021_10_26_152147_create_form_tests2_table', 6),
(25, '2021_10_26_151932_create_tests1_table', 7),
(27, '2021_10_26_152147_create_tests2_table', 8),
(28, '2021_10_27_070621_create_crops_table', 9),
(29, '2021_10_27_071243_create_crop_varieties_table', 9),
(30, '2021_10_27_090208_create_form_sr6_has_crops_table', 10),
(32, '2021_10_27_115610_create_import_export_permits_table', 12),
(35, '2021_10_27_114216_create_import_export_permit_table', 14),
(38, '2021_11_01_114958_create_crop_types_table', 17),
(44, '2021_10_27_122445_create_import_export_permits_has_crops_table.php', 21),
(45, '2021_10_27_122445_create_import_export_permits_has_crops_table', 22),
(47, '2021_11_01_122354_create_form_sr10s_table', 23),
(48, '2021_11_01_073508_create_planting_return_crops_table', 24),
(49, '2021_11_01_115242_create_crop_inspection_types_table', 25),
(50, '2021_11_01_072949_create_planting_returns_table', 24),
(51, '2021_11_01_123908_create_form_sr10_has_variety_inspections_table', 26),
(53, '2021_11_04_120830_create_form_crop_declarations_table', 27),
(54, '2021_11_05_083948_create_form_crop_declarations_has_crop_varieties_table', 28),
(55, '2021_11_05_135323_create_form_stock_examination_requests_table', 29),
(56, '2021_11_08_111520_create_stock_records_table', 30),
(57, '2021_11_10_085620_create_seed_labs_table', 31);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `planting_returns`
--

CREATE TABLE `planting_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `telephone` text COLLATE utf8mb4_unicode_ci,
  `seed_rate` text COLLATE utf8mb4_unicode_ci,
  `registerd_dealer` text COLLATE utf8mb4_unicode_ci,
  `longitude` text COLLATE utf8mb4_unicode_ci,
  `latitude` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `inspector` bigint(20) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `previous_crops` text COLLATE utf8mb4_unicode_ci,
  `date_harvest` text COLLATE utf8mb4_unicode_ci,
  `date_planted` text COLLATE utf8mb4_unicode_ci,
  `size_of_land` text COLLATE utf8mb4_unicode_ci,
  `lot_number` text COLLATE utf8mb4_unicode_ci,
  `crop_id` bigint(20) DEFAULT NULL,
  `amount_enclosed` bigint(20) DEFAULT NULL,
  `payment_receipt` text COLLATE utf8mb4_unicode_ci,
  `valid_from` text COLLATE utf8mb4_unicode_ci,
  `valid_until` text COLLATE utf8mb4_unicode_ci,
  `is_not_used` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `planting_returns`
--

INSERT INTO `planting_returns` (`id`, `created_at`, `updated_at`, `administrator_id`, `name`, `address`, `telephone`, `seed_rate`, `registerd_dealer`, `longitude`, `latitude`, `status`, `inspector`, `status_comment`, `previous_crops`, `date_harvest`, `date_planted`, `size_of_land`, `lot_number`, `crop_id`, `amount_enclosed`, `payment_receipt`, `valid_from`, `valid_until`, `is_not_used`) VALUES
(7, '2021-11-04 07:07:04', '2021-11-04 07:07:44', 3, 'Muhindo Mubaraka', 'Kibuli, Kampala, Uganda', '+256706638494', '10', 'details,....', 'Uganda', 'Uganda', 5, 20, NULL, 'Details', '2022-02-02', '2021-11-04', '122', '1200', 3, 1200, 'files/e7c5103ae6e62a6d0dda3dc4286253d8.docx', NULL, NULL, 1),
(8, '2021-11-04 07:59:05', '2021-11-04 08:59:14', 3, 'Muhindo Mubaraka', 'Kasese, Uganda', '+256706638494', '10', '1222', '32.52842021216429', '0.31249266618931454', 5, 20, 'simple reason', 'Details', '2022-02-04', '2021-11-04', '12', '1200', 3, 11, 'files/1638cf154c2c52480386424aeb1e7fb8.docx', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `planting_return_crops`
--

CREATE TABLE `planting_return_crops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `planting_return_id` bigint(20) UNSIGNED NOT NULL,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL,
  `lot_number` text COLLATE utf8mb4_unicode_ci,
  `size_of_land` text COLLATE utf8mb4_unicode_ci,
  `date_planted` text COLLATE utf8mb4_unicode_ci,
  `date_harvest` text COLLATE utf8mb4_unicode_ci,
  `previous_crops` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `planting_return_crops`
--

INSERT INTO `planting_return_crops` (`id`, `created_at`, `updated_at`, `planting_return_id`, `crop_variety_id`, `lot_number`, `size_of_land`, `date_planted`, `date_harvest`, `previous_crops`) VALUES
(4, '2021-11-04 07:07:04', '2021-11-04 07:07:04', 7, 3, NULL, NULL, NULL, NULL, NULL),
(5, '2021-11-04 07:07:04', '2021-11-04 07:07:04', 7, 4, NULL, NULL, NULL, NULL, NULL),
(6, '2021-11-04 07:07:04', '2021-11-04 07:07:04', 7, 5, NULL, NULL, NULL, NULL, NULL),
(7, '2021-11-04 07:59:05', '2021-11-04 07:59:05', 8, 3, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` text COLLATE utf8mb4_unicode_ci,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `sub_category_id` int(11) DEFAULT NULL,
  `fixed_price` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `services` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_hours` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seed_labs`
--

CREATE TABLE `seed_labs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `form_stock_examination_request_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `collection_date` date DEFAULT NULL,
  `payment_receipt` text COLLATE utf8mb4_unicode_ci,
  `applicant_remarks` text COLLATE utf8mb4_unicode_ci,
  `sampling_date` text COLLATE utf8mb4_unicode_ci,
  `sample_weight` text COLLATE utf8mb4_unicode_ci,
  `packaging` text COLLATE utf8mb4_unicode_ci,
  `number_of_units` text COLLATE utf8mb4_unicode_ci,
  `mother_lot` text COLLATE utf8mb4_unicode_ci,
  `sample_condition` text COLLATE utf8mb4_unicode_ci,
  `inspector_remarks` text COLLATE utf8mb4_unicode_ci,
  `tests_required` text COLLATE utf8mb4_unicode_ci,
  `lab_technician_id` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT '0',
  `purity` text COLLATE utf8mb4_unicode_ci,
  `germination_capacity` text COLLATE utf8mb4_unicode_ci,
  `abnormal_sprouts` text COLLATE utf8mb4_unicode_ci,
  `broken_germs` text COLLATE utf8mb4_unicode_ci,
  `report_recommendation` text COLLATE utf8mb4_unicode_ci,
  `inspector` bigint(20) DEFAULT NULL,
  `inspector_is_done` tinyint(4) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `lot_number` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seed_labs`
--

INSERT INTO `seed_labs` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `form_stock_examination_request_id`, `collection_date`, `payment_receipt`, `applicant_remarks`, `sampling_date`, `sample_weight`, `packaging`, `number_of_units`, `mother_lot`, `sample_condition`, `inspector_remarks`, `tests_required`, `lab_technician_id`, `quantity`, `purity`, `germination_capacity`, `abnormal_sprouts`, `broken_germs`, `report_recommendation`, `inspector`, `inspector_is_done`, `status`, `status_comment`, `lot_number`) VALUES
(1, '2021-11-10 09:05:03', '2021-11-10 11:30:00', 3, 3, 2, '2021-11-11', 'files/bcc82be5cf06449118b48e510df46177.png', 'Simple', '2021-11-11', '200', 'SImple', 'Kgs', '5481479', 'Raw seed', NULL, 'Purity,Seed health', NULL, 1200, NULL, NULL, NULL, NULL, NULL, 20, 1, 9, NULL, '10338378');

-- --------------------------------------------------------

--
-- Table structure for table `stock_records`
--

CREATE TABLE `stock_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `seed_class` text COLLATE utf8mb4_unicode_ci,
  `source` text COLLATE utf8mb4_unicode_ci,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `quantity` bigint(20) DEFAULT '0',
  `is_deposit` tinyint(4) DEFAULT NULL,
  `is_transfer` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_records`
--

INSERT INTO `stock_records` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `seed_class`, `source`, `detail`, `quantity`, `is_deposit`, `is_transfer`) VALUES
(1, '2021-11-09 03:19:01', '2021-11-09 03:19:01', 3, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 10, 1, 0),
(2, '2021-11-09 03:20:15', '2021-11-09 03:20:15', 3, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 0, 1, 0),
(3, '2021-11-09 03:21:10', '2021-11-09 03:21:10', 3, 3, 'Basic seed', 'Stock examination', 'From stock exanination ID: 2', 12000, 1, 0),
(4, '2021-11-09 00:19:01', '2021-11-09 00:19:01', 3, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1200, 1, 0),
(5, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 4, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1220, 1, 0),
(6, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 4, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 2120, 1, 0),
(7, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 4, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 2220, 1, 0),
(8, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 5, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 3200, 1, 0),
(9, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 5, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 2000, 1, 0),
(10, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 6, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1200, 1, 0),
(11, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 6, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1000, 1, 0),
(12, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 7, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 3450, 1, 0),
(13, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 8, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 440, 1, 0),
(14, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 20, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 340, 1, 0),
(15, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 22, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1110, 1, 0),
(16, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 22, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1200, 1, 0),
(17, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 23, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1260, 1, 0),
(18, '2021-11-09 00:20:15', '2021-11-09 00:20:15', 3, 9, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1900, 1, 0),
(19, '2021-11-09 00:21:10', '2021-11-09 00:21:10', 3, 5, 'Basic seed', 'Stock examination', 'From stock exanination ID: 2', 12000, 1, 0),
(26, '2021-11-10 04:45:42', '2021-11-10 04:45:42', 3, 3, '-', 'Stock transfer to John Doe, ID: 18', 'Stock transfer to John Doe, ID: 18', -500, 0, 1),
(27, '2021-11-10 04:47:11', '2021-11-10 04:47:11', 18, 3, '-', 'Stock transfer from Betty Namagembe, ID: 3', 'Stock transfer from Betty Namagembe, ID: 3', 500, 1, 1),
(28, '2021-11-10 04:47:11', '2021-11-10 04:47:11', 3, 3, '-', 'Stock transfer to John Doe, ID: 18', 'Stock transfer to John Doe, ID: 18', -500, 0, 1),
(29, '2021-11-10 05:12:13', '2021-11-10 05:12:13', 18, 3, '-', 'Stock transfer from Betty Namagembe, ID: 3', 'Stock transfer from Betty Namagembe, ID: 3', 10210, 1, 1),
(30, '2021-11-10 05:12:13', '2021-11-10 05:12:13', 3, 3, '-', 'Stock transfer to John Doe, ID: 18', 'Stock transfer to John Doe, ID: 18', -10210, 0, 1),
(31, '2021-11-10 05:18:44', '2021-11-10 05:18:44', 3, 3, '-', 'sTOLEN', 'sTOLEN', -800, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `test1s`
--

CREATE TABLE `test1s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test1s`
--

INSERT INTO `test1s` (`id`, `created_at`, `updated_at`, `name`, `details`) VALUES
(3, '2021-10-26 13:50:18', '2021-10-26 13:50:18', 'Mugamba Shahali', 'Uganda is a landlocked country in'),
(4, '2021-10-27 03:52:09', '2021-10-27 03:52:09', 'Mugamba Shahali', 'Uganda is a landlocked country in East Africa whose');

-- --------------------------------------------------------

--
-- Table structure for table `test2s`
--

CREATE TABLE `test2s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `test1_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test2s`
--

INSERT INTO `test2s` (`id`, `created_at`, `updated_at`, `test1_id`, `name`, `details`) VALUES
(1, '2021-10-26 13:50:18', '2021-10-26 13:50:18', 3, 'Romina', 'Loves m2'),
(2, '2021-10-26 13:50:44', '2021-10-26 13:50:44', 3, 'Romina', 'asuumbuwa'),
(3, '2021-10-27 03:52:09', '2021-10-27 03:52:09', 4, 'asasas', 'asasasas'),
(4, '2021-10-27 03:52:55', '2021-10-27 03:52:55', 4, 'Somple love', 'sdsdsd'),
(5, '2021-10-27 03:52:55', '2021-10-27 03:52:55', 4, 'sdsdsdssdd', 'sasas');

-- --------------------------------------------------------

--
-- Table structure for table `tests2`
--

CREATE TABLE `tests2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `test1_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crops`
--
ALTER TABLE `crops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crop_inspection_types`
--
ALTER TABLE `crop_inspection_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crop_inspection_types_crop_id_foreign` (`crop_id`);

--
-- Indexes for table `crop_types`
--
ALTER TABLE `crop_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crop_varieties`
--
ALTER TABLE `crop_varieties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `form_crop_declarations`
--
ALTER TABLE `form_crop_declarations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_crop_declarations_has_crop_varieties`
--
ALTER TABLE `form_crop_declarations_has_crop_varieties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_qds`
--
ALTER TABLE `form_qds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_sr4s`
--
ALTER TABLE `form_sr4s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_sr6s`
--
ALTER TABLE `form_sr6s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_sr6_has_crops`
--
ALTER TABLE `form_sr6_has_crops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_sr10s`
--
ALTER TABLE `form_sr10s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_sr10s_planting_return_id_foreign` (`planting_return_id`);

--
-- Indexes for table `form_sr10_has_variety_inspections`
--
ALTER TABLE `form_sr10_has_variety_inspections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_stock_examination_requests`
--
ALTER TABLE `form_stock_examination_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_test1s`
--
ALTER TABLE `form_test1s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_export_permits`
--
ALTER TABLE `import_export_permits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_export_permits_has_crops`
--
ALTER TABLE `import_export_permits_has_crops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `planting_returns`
--
ALTER TABLE `planting_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planting_return_crops`
--
ALTER TABLE `planting_return_crops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `planting_return_crops_planting_return_id_foreign` (`planting_return_id`),
  ADD KEY `planting_return_crops_crop_variety_id_foreign` (`crop_variety_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seed_labs`
--
ALTER TABLE `seed_labs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_records`
--
ALTER TABLE `stock_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test1s`
--
ALTER TABLE `test1s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test2s`
--
ALTER TABLE `test2s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests2`
--
ALTER TABLE `tests2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4122;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crops`
--
ALTER TABLE `crops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `crop_inspection_types`
--
ALTER TABLE `crop_inspection_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crop_types`
--
ALTER TABLE `crop_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crop_varieties`
--
ALTER TABLE `crop_varieties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_crop_declarations`
--
ALTER TABLE `form_crop_declarations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `form_crop_declarations_has_crop_varieties`
--
ALTER TABLE `form_crop_declarations_has_crop_varieties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `form_qds`
--
ALTER TABLE `form_qds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `form_sr4s`
--
ALTER TABLE `form_sr4s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `form_sr6s`
--
ALTER TABLE `form_sr6s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `form_sr6_has_crops`
--
ALTER TABLE `form_sr6_has_crops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `form_sr10s`
--
ALTER TABLE `form_sr10s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `form_sr10_has_variety_inspections`
--
ALTER TABLE `form_sr10_has_variety_inspections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_stock_examination_requests`
--
ALTER TABLE `form_stock_examination_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `form_test1s`
--
ALTER TABLE `form_test1s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_export_permits`
--
ALTER TABLE `import_export_permits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `import_export_permits_has_crops`
--
ALTER TABLE `import_export_permits_has_crops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planting_returns`
--
ALTER TABLE `planting_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `planting_return_crops`
--
ALTER TABLE `planting_return_crops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seed_labs`
--
ALTER TABLE `seed_labs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_records`
--
ALTER TABLE `stock_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `test1s`
--
ALTER TABLE `test1s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test2s`
--
ALTER TABLE `test2s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tests2`
--
ALTER TABLE `tests2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `crop_inspection_types`
--
ALTER TABLE `crop_inspection_types`
  ADD CONSTRAINT `crop_inspection_types_crop_id_foreign` FOREIGN KEY (`crop_id`) REFERENCES `crops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form_sr10s`
--
ALTER TABLE `form_sr10s`
  ADD CONSTRAINT `form_sr10s_planting_return_id_foreign` FOREIGN KEY (`planting_return_id`) REFERENCES `planting_returns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `planting_return_crops`
--
ALTER TABLE `planting_return_crops`
  ADD CONSTRAINT `planting_return_crops_crop_variety_id_foreign` FOREIGN KEY (`crop_variety_id`) REFERENCES `crop_varieties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planting_return_crops_planting_return_id_foreign` FOREIGN KEY (`planting_return_id`) REFERENCES `planting_returns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
