-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 02, 2021 at 09:03 AM
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
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2021-10-27 08:49:25'),
(2, 0, 13, 'Admin', 'fa-tasks', '', NULL, NULL, '2021-11-01 12:14:23'),
(3, 2, 14, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2021-11-01 12:14:23'),
(4, 2, 15, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2021-11-01 12:14:23'),
(5, 2, 16, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-11-01 12:14:23'),
(6, 2, 17, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2021-11-01 12:14:23'),
(7, 2, 18, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2021-11-01 12:14:23'),
(8, 0, 22, 'Media manager', 'fa-file', 'media', NULL, '2021-10-20 12:28:29', '2021-11-01 12:14:23'),
(10, 0, 21, 'My Profile', 'fa-user-md', 'auth/setting', NULL, '2021-10-20 13:29:13', '2021-11-01 12:14:23'),
(12, 0, 2, 'Application Forms', 'fa-wpforms', NULL, NULL, '2021-10-20 17:41:29', '2021-10-27 08:49:25'),
(13, 12, 3, 'SR4 - Seed Merchant', 'fa-wpforms', 'form-sr4s', NULL, '2021-10-20 17:42:02', '2021-10-27 08:49:25'),
(15, 12, 4, 'SR6 - Seed grower', 'fa-wpforms', 'form-sr6s', NULL, '2021-10-22 03:47:14', '2021-10-27 08:49:25'),
(16, 12, 5, 'QDS - Producer', 'fa-wpforms', 'form-qds', NULL, '2021-10-25 05:25:04', '2021-10-27 08:49:25'),
(18, 0, 19, 'System Configuration', 'fa-cogs', 'configuration', NULL, '2021-10-27 04:22:36', '2021-11-01 12:14:23'),
(19, 18, 20, 'Crops', 'fa-yelp', 'crops', NULL, '2021-10-27 04:24:09', '2021-11-01 12:14:23'),
(20, 0, 23, 'Helpers', 'fa-gears', '', NULL, '2021-10-27 05:50:02', '2021-11-01 12:14:23'),
(21, 20, 24, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2021-10-27 05:50:02', '2021-11-01 12:14:23'),
(22, 20, 25, 'Database terminal', 'fa-database', 'helpers/terminal/database', NULL, '2021-10-27 05:50:02', '2021-11-01 12:14:23'),
(23, 20, 26, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2021-10-27 05:50:02', '2021-11-01 12:14:23'),
(24, 20, 27, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2021-10-27 05:50:02', '2021-11-01 12:14:23'),
(25, 0, 6, 'Quality Assurance', 'fa-check', 'import-export-permits', NULL, '2021-10-27 08:48:57', '2021-10-27 08:49:25'),
(26, 25, 7, 'Import permit', 'fa-wpforms', 'import-export-permits', NULL, '2021-10-27 08:50:08', '2021-10-28 06:38:15'),
(27, 25, 9, 'Planting returns', 'fa-archive', 'planting-returns', NULL, '2021-10-27 08:51:32', '2021-11-01 04:53:57'),
(28, 25, 11, 'Seed lab', 'fa-adjust', '#', NULL, '2021-10-27 08:52:30', '2021-11-01 12:14:23'),
(29, 25, 12, 'Seed labels', 'fa-adjust', '#', NULL, '2021-10-27 08:53:14', '2021-11-01 12:14:23'),
(30, 25, 8, 'Export permit', 'fa-wpforms', 'import-export-permits-2', NULL, '2020-12-31 21:06:05', '2021-10-28 06:38:15'),
(31, 25, 10, 'SR10 - Plant inspection', 'fa-wpforms', 'form-sr10s', NULL, '2021-11-01 12:14:10', '2021-11-01 12:14:42');

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
(1867, 20, 'admin/form-sr10s/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 05:49:51', '2021-11-02 05:49:51');

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
(1, 'super-admin', '$2y$10$H6GEBthh.w0f7hTAiIPGReseT8KJRsPqCE2AtGvvRczN2OGmawONa', 'Administrator', NULL, '8PhOOQNKrOfXUDVDB3SoogWADs9ZNAOsVtblaUuq8DGk3YZmb9WMzaHDHkPP', '2021-10-20 08:50:00', '2021-10-22 02:20:54', '', '', ''),
(2, 'admin', '$2y$10$JnOG.x2fFxqp3g/sfxaQou7rr7QRrhhQxHF.JRgXyv6eAlecjtOiO', 'Muhindo Mubaraka', 'muhind mubaraka.jpeg', 'I5TB0J3XLQAl6PNLyOrVQumOfaaDj86MxTrM8zftV2nlUY3SOVdSjKgNPcBh', '2021-10-20 13:09:43', '2021-10-20 13:20:46', '', '', ''),
(3, 'basic-user', '$2y$10$cBUNI05M8a7AUXSEgLr4cudiDW3nFZ2McpfuAQOf4HIfjUF.6Viha', 'Betty Namagembe', 'muhind mubaraka (1).jpeg', 'ucmIUR8tNp0SfVEQammZFg0fnaiSBOpNFfIr8l0HqmAi8Q50RTJaEh23Any9', '2021-10-20 13:21:48', '2021-10-21 11:10:00', '', '', ''),
(18, 'john1@gmail.com4998', '$2y$10$8.0SIdbiBfg/pJNviTK32uk3jt1jP.MJDPMYyDVCwRvdCRmUwSEVK', 'John Doe', NULL, NULL, '2021-10-24 14:44:31', '2021-10-24 14:44:31', 'John', 'Doe', 'john1@gmail.com4998'),
(20, 'inspector', '$2y$10$xGq48MAYBM7ThjM/pLqeCu8Q3QOziQtuCQSW0Kz0I2dD8eA4oe0Oe', 'Thembo Akisam', '245863543_931529574441067_8414242258604896822_n.jpg', 'AhiEgKiQvWpjUCNwCIgG6ciEKnUSBM0i5kyka4fIZW3GztYIcCR5c5cGwmon', '2021-10-25 03:43:02', '2021-10-25 03:43:02', NULL, NULL, NULL),
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
(1, '2021-11-01 09:06:23', '2021-11-01 09:06:23', 3, 'Pre-flowering', '30'),
(2, '2021-11-01 09:06:23', '2021-11-01 09:06:23', 3, 'Flowering', '55'),
(3, '2021-11-01 09:06:23', '2021-11-01 09:06:23', 3, '50% pod filling', '80');

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
  `have_adequate_storage_facility` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_qds`
--

INSERT INTO `form_qds` (`id`, `created_at`, `updated_at`, `administrator_id`, `name_of_applicant`, `address`, `company_initials`, `premises_location`, `years_of_expirience`, `dealers_in`, `previous_grower_number`, `cropping_histroy`, `have_adequate_isolation`, `have_adequate_labor`, `aware_of_minimum_standards`, `signature_of_applicant`, `grower_number`, `registration_number`, `valid_from`, `valid_until`, `status`, `inspector`, `status_comment`, `have_been_qds`, `isolation_distance`, `number_of_labors`, `have_adequate_storage_facility`) VALUES
(2, '2021-10-28 07:43:06', '2021-10-28 07:43:06', 3, 'Betty Namagembe', 'Magdalene Lane Opposite Ndere Cultural Centre, Ntinda - Kisaasi Rd, Kampala', NULL, '11', '11', '[{\"crop\":\"12\",\"variety\":\"222\",\"ha\":\"2222\",\"origin\":\"2222\"}]', '21122', 'aasasas', 0, 0, 1, 'files/f23f5ecd96296a2ac8e54c27e2e85590.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1);

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
  `administrator_id` bigint(20) DEFAULT NULL,
  `submited_date` text COLLATE utf8mb4_unicode_ci,
  `min_date` text COLLATE utf8mb4_unicode_ci,
  `max_date` text COLLATE utf8mb4_unicode_ci,
  `is_done` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_sr10s`
--

INSERT INTO `form_sr10s` (`id`, `created_at`, `updated_at`, `planting_return_id`, `stage`, `status`, `status_comment`, `administrator_id`, `submited_date`, `min_date`, `max_date`, `is_done`, `is_active`) VALUES
(11, '2021-11-02 05:41:56', '2021-11-02 05:46:02', 4, 'Pre-flowering', '1', '', 20, NULL, '2021-11-02', NULL, 0, 1),
(12, '2021-11-02 05:41:56', '2021-11-02 05:46:42', 4, 'Flowering', '1', '', 20, NULL, '2021-09-07', NULL, 0, 0),
(13, '2021-11-02 05:41:56', '2021-11-02 05:41:56', 4, '50% pod filling', '1', '', 20, NULL, '2022-01-21', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `form_sr10_has_variety_inspections`
--

CREATE TABLE `form_sr10_has_variety_inspections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_sr10_id` bigint(20) UNSIGNED NOT NULL,
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
  `phytosanitary_certificate` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_export_permits`
--

INSERT INTO `import_export_permits` (`id`, `created_at`, `updated_at`, `administrator_id`, `name`, `address`, `telephone`, `national_seed_board_reg_num`, `store_location`, `quantiry_of_seed`, `name_address_of_origin`, `details`, `ista_certificate`, `valid_from`, `valid_until`, `status`, `inspector`, `status_comment`, `permit_number`, `is_import`, `phytosanitary_certificate`) VALUES
(8, '2021-10-28 06:30:52', '2021-10-28 06:31:41', 3, 'Muhindo Mubaraka', 'Kibuli, Kampala, Uganda', '+256706638494', '120001000', 'aasas', '112', 'Kibuli, Kampala, Uganda', NULL, NULL, '2021-10-28', '2021-10-28', 5, 20, NULL, '386342', 1, NULL),
(9, '2021-10-28 06:49:42', '2021-10-28 06:51:42', 3, 'Muhindo Mubaraka', 'Kibuli, Kampala, Uganda', '+256706638494', '120001000', '1200,0000', '1222', 'Kibuli, Kampala, Uganda', NULL, 'files/132edf48919ec180bb9aba707bb1c26f.jpeg', '2021-10-28', '2022-01-08', 5, 20, NULL, '482530', 0, 'files/1eeca0ef3a7b4c64ff87a64ccaad452f.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `import_export_permits_has_crops`
--

CREATE TABLE `import_export_permits_has_crops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `import_export_permit_id` bigint(20) UNSIGNED NOT NULL,
  `crop_variety_id` bigint(20) UNSIGNED DEFAULT NULL,
  `crop_id` bigint(20) DEFAULT NULL,
  `weight` text COLLATE utf8mb4_unicode_ci,
  `category` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_export_permits_has_crops`
--

INSERT INTO `import_export_permits_has_crops` (`id`, `created_at`, `updated_at`, `import_export_permit_id`, `crop_variety_id`, `crop_id`, `weight`, `category`) VALUES
(4, '2021-10-28 03:36:17', '2021-10-28 03:36:17', 6, NULL, NULL, '122', '3112'),
(5, '2021-10-28 03:36:48', '2021-10-28 03:36:48', 6, NULL, NULL, '1222', '1122'),
(6, '2021-10-28 06:21:14', '2021-10-28 06:21:14', 7, NULL, NULL, '1200', 'Maize'),
(7, '2021-10-28 06:30:52', '2021-10-28 06:30:52', 8, NULL, NULL, '12000', '1122'),
(8, '2021-10-28 06:30:52', '2021-10-28 06:30:52', 8, NULL, NULL, '1200', 'Category test'),
(9, '2021-10-28 06:49:42', '2021-10-28 06:49:42', 9, NULL, NULL, '12000', 'Beans'),
(10, '2021-10-28 06:49:42', '2021-10-28 06:49:42', 9, NULL, NULL, '122', 'qwqw');

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
(33, '2021_10_27_122445_create_import_export_permits_has_crops_table', 13),
(35, '2021_10_27_114216_create_import_export_permit_table', 14),
(36, '2021_11_01_072949_create_planting_returns_table', 15),
(37, '2021_11_01_073508_create_planting_return_crops_table', 16),
(38, '2021_11_01_114958_create_crop_types_table', 17),
(39, '2021_11_01_115242_create_crop_inspection_types_table', 18),
(42, '2021_11_01_122354_create_form_sr10s_table', 20),
(43, '2021_11_01_123908_create_form_sr10_has_variety_inspections_table', 21);

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
  `payment_receipt` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `planting_returns`
--

INSERT INTO `planting_returns` (`id`, `created_at`, `updated_at`, `administrator_id`, `name`, `address`, `telephone`, `seed_rate`, `registerd_dealer`, `longitude`, `latitude`, `status`, `inspector`, `status_comment`, `previous_crops`, `date_harvest`, `date_planted`, `size_of_land`, `lot_number`, `crop_id`, `amount_enclosed`, `payment_receipt`) VALUES
(4, '2021-11-02 04:52:08', '2021-11-02 05:34:59', 3, 'Muhindo Mubaraka', 'Kibuli, Kampala, Uganda', '+256706638494', '10', 'Isaac', 'Uganda', '0.3130291', 2, 20, NULL, 'Details', '2022-03-05', '2021-11-02', '12', '1200', 3, 122, 'files/C19-vaccination-sites-by-district-in-Uganda.pdf');

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
(6, '2021-11-02 04:52:08', '2021-11-02 04:52:08', 4, 4, NULL, NULL, NULL, NULL, NULL),
(7, '2021-11-02 04:52:08', '2021-11-02 04:52:08', 4, 4, NULL, NULL, NULL, NULL, NULL);

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
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_sr10_has_variety_inspections`
--
ALTER TABLE `form_sr10_has_variety_inspections`
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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1868;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `form_sr10_has_variety_inspections`
--
ALTER TABLE `form_sr10_has_variety_inspections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `import_export_permits_has_crops`
--
ALTER TABLE `import_export_permits_has_crops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planting_returns`
--
ALTER TABLE `planting_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
