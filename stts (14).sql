-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 23, 2021 at 05:19 PM
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
(1, 0, 4, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2021-11-22 09:08:00'),
(2, 0, 31, 'Admin', 'fa-tasks', '', NULL, NULL, '2021-11-22 09:08:00'),
(3, 2, 32, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2021-11-22 09:08:00'),
(4, 2, 33, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2021-11-22 09:08:00'),
(5, 2, 34, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-11-22 09:08:00'),
(6, 2, 35, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2021-11-22 09:08:00'),
(7, 2, 36, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2021-11-22 09:08:00'),
(8, 0, 25, 'Media manager', 'fa-file', 'media', NULL, '2021-10-20 12:28:29', '2021-11-22 09:08:00'),
(10, 0, 24, 'My Profile', 'fa-user-md', 'auth/setting', NULL, '2021-10-20 13:29:13', '2021-11-22 09:08:00'),
(12, 0, 5, 'Application Forms', 'fa-wpforms', NULL, NULL, '2021-10-20 17:41:29', '2021-11-22 09:08:00'),
(13, 12, 6, 'SR4 - Seed Merchant', 'fa-wpforms', 'form-sr4s', NULL, '2021-10-20 17:42:02', '2021-11-22 09:08:00'),
(15, 12, 7, 'SR6 - Seed grower', 'fa-wpforms', 'form-sr6s', NULL, '2021-10-22 03:47:14', '2021-11-22 09:08:00'),
(16, 12, 8, 'QDS - Producer', 'fa-wpforms', 'form-qds', NULL, '2021-10-25 05:25:04', '2021-11-22 09:08:00'),
(18, 0, 21, 'System Configuration', 'fa-cogs', 'configuration', NULL, '2021-10-27 04:22:36', '2021-11-22 09:08:00'),
(19, 18, 22, 'Crops', 'fa-yelp', 'crops', NULL, '2021-10-27 04:24:09', '2021-11-22 09:08:00'),
(25, 0, 9, 'Quality Assurance', 'fa-check', 'import-export-permits', NULL, '2021-10-27 08:48:57', '2021-11-22 09:08:00'),
(26, 25, 10, 'Import permit', 'fa-wpforms', 'import-export-permits', NULL, '2021-10-27 08:50:08', '2021-11-22 09:08:00'),
(27, 25, 12, 'Planting returns', 'fa-archive', 'planting-returns', NULL, '2021-10-27 08:51:32', '2021-11-22 09:08:00'),
(28, 25, 15, 'Seed lab', 'fa-adjust', 'seed-labs', NULL, '2021-10-27 08:52:30', '2021-11-22 09:08:00'),
(29, 25, 16, 'Seed labels', 'fa-credit-card', 'seed-labels', NULL, '2021-10-27 08:53:14', '2021-11-22 09:08:00'),
(30, 25, 11, 'Export permit', 'fa-wpforms', 'import-export-permits-2', NULL, '2020-12-31 21:06:05', '2021-11-22 09:08:00'),
(31, 25, 13, 'SR10 - Plant inspection', 'fa-wpforms', 'form-sr10s', NULL, '2021-11-01 12:14:10', '2021-11-22 09:08:00'),
(32, 25, 14, 'QDS - Crop declarations', 'fa-wpforms', 'form-crop-declarations', NULL, '2021-11-04 09:24:52', '2021-11-22 09:08:00'),
(33, 0, 17, 'Seed stock', 'fa-archive', '#', NULL, '2021-11-05 10:45:53', '2021-11-22 09:08:00'),
(34, 33, 18, 'Stock examination', 'fa-wpforms', 'form-stock-examination-requests', NULL, '2021-11-05 10:47:45', '2021-11-22 09:08:00'),
(35, 33, 19, 'My stock', 'fa-archive', 'stock-records', NULL, '2021-11-05 10:49:04', '2021-11-22 09:08:00'),
(36, 18, 23, 'Seed label packages', 'fa-money', 'seed-label-packages', NULL, '2021-11-15 05:54:18', '2021-11-22 09:08:00'),
(37, 33, 20, 'Marketable seed', 'fa-money', 'marketable-seeds', NULL, '2021-11-16 19:10:17', '2021-11-22 09:08:00'),
(38, 0, 1, 'Market place', 'fa-shopping-cart', 'products', NULL, '2021-11-22 03:42:16', '2021-11-22 03:42:22'),
(39, 38, 3, 'Orders', 'fa-list-alt', 'orders', NULL, '2021-11-22 09:07:06', '2021-11-22 09:08:00'),
(40, 38, 2, 'Market place', 'fa-shopping-basket', 'products', NULL, '2021-11-22 09:07:53', '2021-11-22 09:08:23');

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
(4, 'Inspector', 'inspector', '2021-10-21 13:02:29', '2021-10-21 13:02:29'),
(5, 'Lab receptionist', 'lab-reception', '2021-11-12 08:24:03', '2021-11-12 08:24:03'),
(6, 'Lab technician', 'lab-technician', '2021-11-12 08:56:36', '2021-11-12 08:56:36'),
(7, 'USTA', 'usta', '2021-11-16 06:53:13', '2021-11-16 08:50:49');

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
(1, 19, NULL, NULL),
(1, 36, NULL, NULL),
(2, 36, NULL, NULL);

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
(4, 6, NULL, NULL),
(5, 1, NULL, NULL),
(5, 2, NULL, NULL),
(5, 3, NULL, NULL),
(5, 4, NULL, NULL),
(5, 5, NULL, NULL),
(5, 6, NULL, NULL),
(5, 7, NULL, NULL),
(6, 1, NULL, NULL),
(6, 2, NULL, NULL),
(6, 3, NULL, NULL),
(6, 4, NULL, NULL),
(6, 5, NULL, NULL),
(6, 6, NULL, NULL),
(6, 7, NULL, NULL),
(7, 1, NULL, NULL);

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
(3, 21, NULL, NULL),
(5, 22, NULL, NULL),
(6, 23, NULL, NULL),
(7, 24, NULL, NULL);

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
(1, 'super-admin', '$2y$10$H6GEBthh.w0f7hTAiIPGReseT8KJRsPqCE2AtGvvRczN2OGmawONa', 'Administrator', NULL, 'lHGeLJDspauD3Ls7OwHXlclETYsiYsad4jSmeUQOtxVT6l5gany6ElTimSb0', '2021-10-20 08:50:00', '2021-10-22 02:20:54', '', '', ''),
(2, 'admin', '$2y$10$Xfk6Uop0crN0QaSFOfSa.ukJ5/FSiwlNchDf6trFnHoyvw2GjZfKy', 'Muhindo Mubaraka', 'NUW_Mgt_ProfJude-350x350-removebg-preview.png', 'rhXqAtmo0FYEtqlbgZTKMbhWJBH2unPbffwBESq1JGIWc3EJRngf1fJvebRJ', '2021-10-20 13:09:43', '2021-11-22 21:09:17', '', '', ''),
(3, 'basic-user', '$2y$10$cBUNI05M8a7AUXSEgLr4cudiDW3nFZ2McpfuAQOf4HIfjUF.6Viha', 'Betty Namagembe', '1705787-Linus-Torvalds-Quote-Talk-is-cheap-Show-me-the-code.jpeg', 'JOyma9m9qXmYaQILNoAzINrX2rTJshe9QKTxfpPciBAQLxeLyWomFAQH2jyz', '2021-10-20 13:21:48', '2021-11-05 18:45:40', '', '', ''),
(18, 'john1@gmail.com4998', '$2y$10$KFXQO6uMd4oaapJ6KdJMYOqQ2zWgFUT9S4NaQQE5UeaeK4BxSOTWa', 'John Doe', NULL, 'D4QAHDbt5IwphC254MLFEUlOwNhnFAG6iStX8ptSgp7XfHtjzdUo09GigscJ', '2021-10-24 14:44:31', '2021-11-10 05:21:22', 'John', 'Doe', 'john1@gmail.com4998'),
(20, 'inspector', '$2y$10$xGq48MAYBM7ThjM/pLqeCu8Q3QOziQtuCQSW0Kz0I2dD8eA4oe0Oe', 'Thembo Akisam', '245863543_931529574441067_8414242258604896822_n.jpg', 'TeRbwC4zClb1YSKGmgxNzIYHGGly5CAcPUqZMOHvbiLQdVBKdgECMfUJ3gxu', '2021-10-25 03:43:02', '2021-10-25 03:43:02', NULL, NULL, NULL),
(21, 'basic-user@gmail.com', '$2y$10$q4kgzYEs.EfsFwX9Lj7CUeADqzCmkozFn5ipyVQCz2NEorxOyH5Lq', 'John Doe', NULL, 'T51bxD4QM0blrnI9QmXBoWBvFwm5uAa7LVSAtJhFiSVz1F4f56dLUOd38n92', '2021-10-25 06:42:33', '2021-10-25 06:42:33', 'John', 'Doe', 'basic-user@gmail.com'),
(22, 'lab-reception', '$2y$10$iPiL4vUv2bQqIZhQ3dcRqONL4EuXOlMunIL97vADdLyOR..OkdkQ2', 'Musa Rahim', NULL, 'gXAcRiO5f1RWGQV5mZ8SH80SZIaOqNuIogExCY8qACCzPLapRDtRgmsZdtk7', '2021-11-12 08:25:49', '2021-11-12 08:25:49', NULL, NULL, NULL),
(23, 'lab-technician', '$2y$10$l.6rACtWrpA7B.vd4OzDo.Nlss7smhGjkQNwFBuMVi3DotXYzAGr2', 'Tusiime Bob', NULL, 'l3wPu96jbOcyvvWHpxDRsjmgDjqX2dUa6cKJpfGcvhkh775FZxxUTx4EsVkm', '2021-11-12 09:15:32', '2021-11-12 09:15:32', NULL, NULL, NULL),
(24, 'usta', '$2y$10$v/FSc69swhxmu.eRIwaWQugkbGyD9T6MHdlH9STWrqhj0UpQccntu', 'Phiona', NULL, 'GorMy5XDTNlMLK1aDt0fA7dvDoTTVd3kMwmEuhl8Fg0ywIa9PjTd5muyCAg7', '2021-11-16 06:54:54', '2021-11-16 06:54:54', NULL, NULL, NULL);

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
-- Table structure for table `marketable_seeds`
--

CREATE TABLE `marketable_seeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `seed_label_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `lot_number` bigint(20) DEFAULT '0',
  `quantity` bigint(20) DEFAULT '0',
  `seed_class` int(11) DEFAULT NULL,
  `source` text COLLATE utf8mb4_unicode_ci,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `is_deposit` tinyint(4) DEFAULT NULL,
  `seed_label_package_id` bigint(20) DEFAULT NULL,
  `lab_test_number` text COLLATE utf8mb4_unicode_ci,
  `price` bigint(20) DEFAULT '0',
  `image` text COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `is_counted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marketable_seeds`
--

INSERT INTO `marketable_seeds` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `seed_label_id`, `lot_number`, `quantity`, `seed_class`, `source`, `detail`, `is_deposit`, `seed_label_package_id`, `lab_test_number`, `price`, `image`, `images`, `is_counted`) VALUES
(13, '2021-11-23 07:22:42', '2021-11-23 07:23:01', 3, 3, 3, 89806835, 1000, NULL, 'From seedlab test number: A000120C', 'From seedlab ID: 3', 1, 2, 'A000120C', 0, NULL, NULL, 1);

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
(57, '2021_11_10_085620_create_seed_labs_table', 31),
(58, '2021_11_15_083454_create_seed_label_packages_table', 32),
(59, '2021_11_15_092834_create_seed_labels_table', 33),
(60, '2021_11_15_082027_create_seed_label_table', 34),
(62, '2021_11_16_111020_create_marketable_seeds_table', 35),
(64, '2021_11_22_054404_create_product_table', 36),
(65, '2021_11_22_114654_create_orders_table', 37);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `order_by` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `product_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `quantity` bigint(20) DEFAULT '0',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `payment_type` text COLLATE utf8mb4_unicode_ci,
  `receipt` text COLLATE utf8mb4_unicode_ci,
  `status` text COLLATE utf8mb4_unicode_ci,
  `total_price` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `seed_label_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `quantity` bigint(20) DEFAULT '0',
  `lab_test_number` text COLLATE utf8mb4_unicode_ci,
  `lot_number` bigint(20) DEFAULT '0',
  `seed_class` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `wholesale_price` int(11) DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `source` text COLLATE utf8mb4_unicode_ci,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `name` text COLLATE utf8mb4_unicode_ci,
  `total_price` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `seed_label_id`, `quantity`, `lab_test_number`, `lot_number`, `seed_class`, `price`, `wholesale_price`, `image`, `images`, `source`, `detail`, `name`, `total_price`) VALUES
(3, '2021-11-23 07:23:01', '2021-11-23 14:14:51', 3, 3, 3, 1000, 'A000120C', 89806835, NULL, 900, 0, '36ab37fe8c1376999c43da5cd029bed3.jpg', NULL, 'From seedlab test number: A000120C', 'From seedlab ID: 3', 'Bush Beans - NABE1', 0);

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
-- Table structure for table `seed_label`
--

CREATE TABLE `seed_label` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `seed_lab_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `quantity` text COLLATE utf8mb4_unicode_ci,
  `package_quantity` text COLLATE utf8mb4_unicode_ci,
  `applicant_remarks` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT '1',
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `price` bigint(20) DEFAULT '0',
  `image` text COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seed_labels`
--

CREATE TABLE `seed_labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `seed_lab_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `seed_label_package_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `quantity` text COLLATE utf8mb4_unicode_ci,
  `applicant_remarks` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT '1',
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `receipt` text COLLATE utf8mb4_unicode_ci,
  `is_processed` int(11) DEFAULT '0',
  `price` bigint(20) DEFAULT '0',
  `image` text COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seed_labels`
--

INSERT INTO `seed_labels` (`id`, `created_at`, `updated_at`, `administrator_id`, `seed_lab_id`, `crop_variety_id`, `seed_label_package_id`, `quantity`, `applicant_remarks`, `status`, `status_comment`, `receipt`, `is_processed`, `price`, `image`, `images`) VALUES
(2, '2021-11-17 03:44:56', '2021-11-17 03:48:21', 3, 1, 3, 2, '7000', 'test', 14, NULL, 'files/Sandboxing.pptx', 1, 0, NULL, NULL),
(3, '2021-11-23 07:20:48', '2021-11-23 07:22:42', 3, 3, 3, 2, '1000', 'detail..', 14, NULL, '017f0660b583f8feaa039da7030a631a.png', 1, 800, 'beans.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seed_label_packages`
--

CREATE TABLE `seed_label_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `package_size` int(11) DEFAULT '0',
  `package_price` int(11) DEFAULT '0',
  `seed_label_package_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seed_label_packages`
--

INSERT INTO `seed_label_packages` (`id`, `created_at`, `updated_at`, `crop_variety_id`, `package_size`, `package_price`, `seed_label_package_id`) VALUES
(1, '2021-11-15 06:22:43', '2021-11-15 06:23:34', 3, 1, 1000, NULL),
(2, '2021-11-15 06:23:21', '2021-11-15 06:23:21', 3, 5, 5000, NULL),
(3, '2021-11-15 06:23:53', '2021-11-15 06:23:53', 3, 10, 10000, NULL);

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
  `quantity` bigint(20) DEFAULT NULL,
  `purity` text COLLATE utf8mb4_unicode_ci,
  `germination_capacity` text COLLATE utf8mb4_unicode_ci,
  `abnormal_sprouts` text COLLATE utf8mb4_unicode_ci,
  `broken_germs` text COLLATE utf8mb4_unicode_ci,
  `report_recommendation` text COLLATE utf8mb4_unicode_ci,
  `inspector` bigint(20) DEFAULT NULL,
  `inspector_is_done` tinyint(4) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `status_comment` text COLLATE utf8mb4_unicode_ci,
  `lot_number` text COLLATE utf8mb4_unicode_ci,
  `receptionist_is_done` tinyint(4) DEFAULT '0',
  `receptionist_remarks` text COLLATE utf8mb4_unicode_ci,
  `lab_test_number` text COLLATE utf8mb4_unicode_ci,
  `lab_technician` int(11) DEFAULT '1',
  `p_x_g` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seed_labs`
--

INSERT INTO `seed_labs` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `form_stock_examination_request_id`, `collection_date`, `payment_receipt`, `applicant_remarks`, `sampling_date`, `sample_weight`, `packaging`, `number_of_units`, `mother_lot`, `sample_condition`, `inspector_remarks`, `tests_required`, `lab_technician_id`, `quantity`, `purity`, `germination_capacity`, `abnormal_sprouts`, `broken_germs`, `report_recommendation`, `inspector`, `inspector_is_done`, `status`, `status_comment`, `lot_number`, `receptionist_is_done`, `receptionist_remarks`, `lab_test_number`, `lab_technician`, `p_x_g`) VALUES
(3, '2021-11-23 05:06:55', '2021-11-23 07:22:42', 3, 3, 2, '2021-11-23', 'bae25cbea1b073156f7b2d4d61dabc75.png', 'details...', '2021-11-23', '10', 'SImple', '12', '130003', 'Processed seed', NULL, 'Moisture content,Purity', NULL, 200, '90', '50', '30', '50', '11', 20, 1, 5, NULL, '89806835', 1, NULL, 'A000120C', 23, 45);

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
-- Indexes for table `marketable_seeds`
--
ALTER TABLE `marketable_seeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
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
-- Indexes for table `seed_label`
--
ALTER TABLE `seed_label`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seed_labels`
--
ALTER TABLE `seed_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seed_label_packages`
--
ALTER TABLE `seed_label_packages`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `marketable_seeds`
--
ALTER TABLE `marketable_seeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seed_label`
--
ALTER TABLE `seed_label`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seed_labels`
--
ALTER TABLE `seed_labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seed_label_packages`
--
ALTER TABLE `seed_label_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seed_labs`
--
ALTER TABLE `seed_labs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
