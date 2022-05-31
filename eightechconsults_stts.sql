-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 31, 2022 at 08:09 AM
-- Server version: 10.3.34-MariaDB-log-cll-lve
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eightechconsults_stts`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2022-02-23 06:03:17'),
(2, 0, 30, 'Admin', 'fa-tasks', '', NULL, NULL, '2022-02-23 06:02:31'),
(3, 2, 31, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2022-02-23 06:02:31'),
(4, 2, 32, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2022-02-23 06:02:31'),
(5, 2, 33, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2022-02-23 06:02:31'),
(6, 2, 34, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2022-02-23 06:02:31'),
(7, 2, 35, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2022-02-23 06:02:31'),
(8, 0, 29, 'Media manager', 'fa-file', 'media', NULL, '2021-10-20 12:28:29', '2022-02-23 06:02:31'),
(10, 0, 28, 'My Profile', 'fa-user-md', 'auth/setting', NULL, '2021-10-20 13:29:13', '2022-02-23 06:02:31'),
(12, 0, 3, 'Application Forms', 'fa-wpforms', NULL, NULL, '2021-10-20 17:41:29', '2022-02-23 06:03:17'),
(13, 12, 4, 'SR4 - Seed Merchant/Producer/Stockist/Importer/Exporter/Processor', 'fa-wpforms', 'form-sr4s', NULL, '2021-10-20 17:42:02', '2022-02-23 06:03:17'),
(15, 12, 5, 'SR6 - Seed grower/Company/Breeders', 'fa-wpforms', 'form-sr6s', NULL, '2021-10-22 03:47:14', '2022-05-17 12:59:39'),
(16, 12, 6, 'QDS - Producer', 'fa-wpforms', 'form-qds', NULL, '2021-10-25 05:25:04', '2022-02-23 06:03:17'),
(18, 0, 25, 'System Configuration', 'fa-cogs', 'configuration', NULL, '2021-10-27 04:22:36', '2022-02-23 06:02:31'),
(19, 18, 26, 'Crops', 'fa-yelp', 'crops', NULL, '2021-10-27 04:24:09', '2022-02-23 06:02:31'),
(25, 0, 7, 'Quality Assurance', 'fa-check', 'import-export-permits', NULL, '2021-10-27 08:48:57', '2022-02-23 06:03:17'),
(26, 25, 8, 'Import permit', 'fa-wpforms', 'import-export-permits', NULL, '2021-10-27 08:50:08', '2022-02-23 06:03:17'),
(27, 25, 10, 'Planting returns - Company', 'fa-archive', 'planting-returns', NULL, '2021-10-27 08:51:32', '2022-02-24 05:06:14'),
(28, 25, 14, 'Seed lab', 'fa-adjust', 'seed-labs', NULL, '2021-10-27 08:52:30', '2022-02-23 06:02:31'),
(29, 25, 15, 'Seed labels', 'fa-credit-card', 'seed-labels', NULL, '2021-10-27 08:53:14', '2022-02-23 06:02:31'),
(30, 25, 9, 'Export permit', 'fa-wpforms', 'import-export-permits-2', NULL, '2020-12-31 21:06:05', '2022-02-23 06:03:17'),
(31, 25, 12, 'SR10 - Plant inspection', 'fa-wpforms', 'form-sr10s', NULL, '2021-11-01 12:14:10', '2022-02-23 06:02:31'),
(32, 25, 13, 'QDS - Crop declarations', 'fa-wpforms', 'form-crop-declarations', NULL, '2021-11-04 09:24:52', '2022-02-23 06:02:31'),
(33, 0, 16, 'Seed stock', 'fa-archive', '#', NULL, '2021-11-05 10:45:53', '2022-02-23 06:02:31'),
(34, 33, 17, 'Stock examination', 'fa-wpforms', 'form-stock-examination-requests', NULL, '2021-11-05 10:47:45', '2022-02-23 06:02:31'),
(35, 33, 18, 'My stock', 'fa-archive', 'stock-records', NULL, '2021-11-05 10:49:04', '2022-02-23 06:02:31'),
(36, 18, 27, 'Seed label packages', 'fa-money', 'seed-label-packages', NULL, '2021-11-15 05:54:18', '2022-02-23 06:02:31'),
(37, 33, 19, 'Marketable seed', 'fa-money', 'marketable-seeds', NULL, '2021-11-16 19:10:17', '2022-02-23 06:02:31'),
(38, 0, 20, 'Market place', 'fa-shopping-cart', 'products', NULL, '2021-11-22 03:42:16', '2022-02-23 06:02:31'),
(39, 38, 22, 'Orders', 'fa-list-alt', 'orders', NULL, '2021-11-22 09:07:06', '2022-02-23 06:02:31'),
(40, 38, 21, 'Market place', 'fa-shopping-basket', 'products', NULL, '2021-11-22 09:07:53', '2022-02-23 06:02:31'),
(41, 38, 23, 'Pre-orders', 'fa-opencart', 'pre-orders', NULL, '2021-11-24 02:42:28', '2022-02-23 06:02:31'),
(42, 38, 24, 'Quotations', 'fa-wpforms', 'quotations', NULL, '2021-11-24 04:35:22', '2022-02-23 06:02:31'),
(43, 0, 2, 'Track and trace', 'fa-anchor', 'track-and-trace', NULL, '2021-11-24 08:54:28', '2022-02-23 06:03:17'),
(44, 25, 11, 'Planting returns - Grower', 'fa-users', 'sub-growers', NULL, '2022-02-23 06:02:16', '2022-02-24 05:08:26');

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
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(7, 24, NULL, NULL),
(3, 25, NULL, NULL),
(3, 26, NULL, NULL),
(4, 27, NULL, NULL),
(3, 28, NULL, NULL),
(4, 34, NULL, NULL),
(4, 30, NULL, NULL),
(2, 32, NULL, NULL),
(3, 35, NULL, NULL),
(3, 36, NULL, NULL),
(3, 37, NULL, NULL),
(3, 38, NULL, NULL),
(3, 39, NULL, NULL),
(3, 40, NULL, NULL),
(3, 41, NULL, NULL),
(3, 42, NULL, NULL),
(3, 43, NULL, NULL),
(3, 44, NULL, NULL),
(3, 45, NULL, NULL),
(3, 46, NULL, NULL),
(3, 47, NULL, NULL),
(3, 48, NULL, NULL),
(3, 49, NULL, NULL),
(3, 50, NULL, NULL),
(3, 51, NULL, NULL),
(3, 52, NULL, NULL),
(3, 53, NULL, NULL),
(3, 54, NULL, NULL),
(3, 55, NULL, NULL),
(3, 56, NULL, NULL),
(3, 57, NULL, NULL),
(3, 58, NULL, NULL),
(3, 59, NULL, NULL),
(3, 60, NULL, NULL),
(3, 61, NULL, NULL),
(3, 62, NULL, NULL),
(3, 63, NULL, NULL),
(3, 64, NULL, NULL),
(3, 65, NULL, NULL),
(3, 66, NULL, NULL),
(3, 67, NULL, NULL),
(3, 68, NULL, NULL),
(3, 69, NULL, NULL),
(3, 70, NULL, NULL),
(3, 71, NULL, NULL),
(3, 73, NULL, NULL),
(3, 74, NULL, NULL),
(3, 75, NULL, NULL),
(3, 76, NULL, NULL),
(3, 77, NULL, NULL),
(3, 78, NULL, NULL),
(3, 79, NULL, NULL),
(3, 80, NULL, NULL),
(3, 81, NULL, NULL),
(3, 82, NULL, NULL),
(3, 83, NULL, NULL),
(3, 84, NULL, NULL),
(3, 85, NULL, NULL),
(3, 86, NULL, NULL),
(3, 87, NULL, NULL),
(3, 88, NULL, NULL),
(3, 89, NULL, NULL),
(3, 90, NULL, NULL),
(3, 91, NULL, NULL),
(3, 92, NULL, NULL),
(3, 93, NULL, NULL),
(3, 94, NULL, NULL),
(3, 95, NULL, NULL),
(3, 96, NULL, NULL),
(3, 97, NULL, NULL),
(3, 98, NULL, NULL),
(3, 99, NULL, NULL),
(3, 100, NULL, NULL),
(3, 101, NULL, NULL),
(3, 102, NULL, NULL),
(3, 103, NULL, NULL),
(3, 104, NULL, NULL),
(3, 105, NULL, NULL),
(3, 106, NULL, NULL),
(3, 107, NULL, NULL),
(3, 108, NULL, NULL),
(3, 109, NULL, NULL),
(3, 110, NULL, NULL),
(3, 111, NULL, NULL),
(3, 112, NULL, NULL),
(3, 113, NULL, NULL),
(3, 114, NULL, NULL);

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
(1, 'super-admin', '$2y$10$H6GEBthh.w0f7hTAiIPGReseT8KJRsPqCE2AtGvvRczN2OGmawONa', 'Administrator', 'ug.jpeg', '780vkcqiIrTIS8El57Yaopi9ti4YfeMcpP27gCyXnY1BVf0zXdrjXlEJehai', '2021-10-20 08:50:00', '2022-03-07 12:31:41', '', '', ''),
(2, 'admin', '$2y$10$Xfk6Uop0crN0QaSFOfSa.ukJ5/FSiwlNchDf6trFnHoyvw2GjZfKy', 'Muhindo Mubaraka', 'harvesting.png', 'GHxqh8Z96xpYFHzOS72l5nGoHsHHjS6Lr1l7ImXyDEjz2XnpLA13QXp9hMOj', '2021-10-20 13:09:43', '2022-04-29 08:58:25', '', '', ''),
(3, 'basic-user', '$2y$10$cBUNI05M8a7AUXSEgLr4cudiDW3nFZ2McpfuAQOf4HIfjUF.6Viha', 'Betty Namagembe', 'pic.png', 'dIuKB6PHoNiiH11CkbjHeKfZqrWVhvYV4HOBnPsghZ4OI87CbequsCPbHDgH', '2021-10-20 13:21:48', '2022-03-07 12:13:07', '', '', ''),
(18, 'john1@gmail.com4998', '$2y$10$KFXQO6uMd4oaapJ6KdJMYOqQ2zWgFUT9S4NaQQE5UeaeK4BxSOTWa', 'John Doe', NULL, 'D4QAHDbt5IwphC254MLFEUlOwNhnFAG6iStX8ptSgp7XfHtjzdUo09GigscJ', '2021-10-24 14:44:31', '2021-11-10 05:21:22', 'John', 'Doe', 'john1@gmail.com4998'),
(20, 'inspector', '$2y$10$xGq48MAYBM7ThjM/pLqeCu8Q3QOziQtuCQSW0Kz0I2dD8eA4oe0Oe', 'Thembo Akisam', '245863543_931529574441067_8414242258604896822_n.jpg', 'hOOskzK3QGwWdkRGVzR5Rb1Hxd7vlGqCEKP2SBD2mmpeBcqcn7HfbqmZaOdC', '2021-10-25 03:43:02', '2021-10-25 03:43:02', NULL, NULL, NULL),
(21, 'basic-user@gmail.com', '$2y$10$q4kgzYEs.EfsFwX9Lj7CUeADqzCmkozFn5ipyVQCz2NEorxOyH5Lq', 'John Doe', NULL, 'T51bxD4QM0blrnI9QmXBoWBvFwm5uAa7LVSAtJhFiSVz1F4f56dLUOd38n92', '2021-10-25 06:42:33', '2021-10-25 06:42:33', 'John', 'Doe', 'basic-user@gmail.com'),
(22, 'lab-reception', '$2y$10$iPiL4vUv2bQqIZhQ3dcRqONL4EuXOlMunIL97vADdLyOR..OkdkQ2', 'Musa Rahim', NULL, 'qLEThYoJUDYNUXU9vgwd8KRzrtblmEcSljppMXDxNIq6tvg5JoX6eGp5LBQp', '2021-11-12 08:25:49', '2021-11-12 08:25:49', NULL, NULL, NULL),
(23, 'lab-technician', '$2y$10$l.6rACtWrpA7B.vd4OzDo.Nlss7smhGjkQNwFBuMVi3DotXYzAGr2', 'Tusiime Bob', NULL, 'Kyeokpy7T5XTw7j3JIMbfrsocLKU3CwwBBC9NEGpRNv6Gw9CelgHoLlgXELU', '2021-11-12 09:15:32', '2021-11-12 09:15:32', NULL, NULL, NULL),
(24, 'usta', '$2y$10$v/FSc69swhxmu.eRIwaWQugkbGyD9T6MHdlH9STWrqhj0UpQccntu', 'Phiona', NULL, '7VvRq1b1wFtAQ2oaKyC9KbJ6aG54FtoSgNkmTww3sn4X3dKojKbjMaXrDdi6', '2021-11-16 06:54:54', '2021-11-16 06:54:54', NULL, NULL, NULL),
(25, 'basic-user-2@gmail.com', '$2y$10$boHTa92bCZ8a4Z8ZCvlJLusCmuimK7ePU7trpY762eEP29i052NS6', 'John Paul', NULL, 'aX2ba1jsKKYkYLGqONvycLEkDyx1wvZhhr0l6M8VGjlSBQPJqaxEtvY2FTJA', '2021-11-24 06:13:20', '2021-11-24 06:13:20', 'John', 'Paul', 'basic-user-2@gmail.com'),
(26, 'mutesiief@gmail.com', '$2y$10$vY4Cf0iwYwLi2EAC2obRM.6ucmctJLGQU1xts5ctk66Qjti5btGXC', 'Efulansi Mutesi', NULL, 'SSTzYKq9fvDXn7BjBDHXgXCTcuw50D1HtreDOvlz8HbRihGmr5n0mgtYqojw', '2022-03-07 14:20:30', '2022-03-07 14:20:30', 'Efulansi', 'Mutesi', 'mutesiief@gmail.com'),
(27, 'mbabaziisaac@gmail.com', '$2y$10$gQCllgawSgK9uc097WvFjek1fg4WvSQhmpoilcjdyQnB6H4UkmiMm', 'Mbabazi Isaac', 'Capture.PNG', 'Kx50BYL1OTA3B5QJbBTMLS7lQNbc2qzxOLTiSi4JWaxDMv1t9zTPpTHspKb3', '2022-03-09 12:02:42', '2022-03-09 12:03:27', 'Mbabazi', 'Isaac', 'mbabaziisaac@gmail.com'),
(28, 'isaac@8technologies.net', '$2y$10$jOPnKBHeOKO8h8ahcrTl6eZrfX0aqcCODjEqC61qrTnLfv7Jn64uK', 'Isaac Mbabazi', 'Zac.jpg', 'tpAF1MYdQ1mUMgQDcDWWw9zukPEs3w1Eec21HgXqEppDkmpk6AwCPbn4r3Zt', '2022-03-09 12:14:47', '2022-03-09 12:15:58', 'Mbabazi', 'Isaac', 'isaac@8technologies.net'),
(30, 'csendaaza@gmail.com', '$2y$10$GgSY/pzJy6Uo0/67kjE3FOxx91XCMEiVX5HGHdRPUPjYxWMFGmHD2', 'sendaaza charles', NULL, 'UgF3QF3XeZVvI1LaAxhAHYgIP5RRTka2zhqxqQzqoCXKX3JlOr3oigfazapX', '2022-03-24 12:08:32', '2022-03-24 12:08:32', 'sendaaza', 'charles', 'csendaaza@gmail.com'),
(32, 'wamusoi@yahoo.co.uk', '$2y$10$ysO5/BYMG5Gf4z4lK5dGt.cmiiwwqvCbulo91B/HrzoFg/li5MRP2', 'Isaac Wamatsembe', NULL, 'M6YK7tHGR5bvk5oRSZMO4NrclXg73Csa9Yej6SUH525Nlwmqbmc5McvgBHkn', '2022-03-24 12:10:52', '2022-03-24 12:10:52', 'Isaac', 'Wamatsembe', 'wamusoi@yahoo.co.uk'),
(34, 'adrine.agaba@gmail.com', '$2y$10$50mOo0GSh/.xwRpHAxBe7uuxvK38UhWMVMLJbiQ6fGEDVteTFWuBK', 'Adrine Agaba', NULL, 'xat47TPjUXbKIVB5uk8CUaHhMDRKbWH8ucqQHrcZKkCtj8OVVhGvFPOngh9E', '2022-03-24 12:17:28', '2022-03-24 12:17:28', 'Adrine', 'Agaba', 'adrine.agaba@gmail.com'),
(35, 'muyingojoseph2@gmail.com', '$2y$10$plObrYYpbIxfVObwnd5Pqe2007getF.8HmSnZk3TNx28AEieCdiBG', 'Joseph Muyingo', NULL, 'kba25dRG0CUio6PKAdy5JrjySAhxKfknAJv2CYZnNCIMtOTgOw0Zq7A29NEQ', '2022-03-24 13:44:12', '2022-03-24 13:44:12', 'Joseph', 'Muyingo', 'muyingojoseph2@gmail.com'),
(36, 'idanc7@gmail.com', '$2y$10$JAaHgd484yOq3iOtur7bXOj3b0zBsToi/iU20KziB3mhHVpchGRya', 'Idan Cohen', NULL, '4QzKXiuTs9OgYZco95Ay8jfx5gdxyxKACHhSRhGmi8gfvwlmhJYGQYTTiGT1', '2022-04-12 22:50:53', '2022-04-12 22:50:53', 'Idan', 'Cohen', 'idanc7@gmail.com'),
(37, 'coperemo@gmail.com', '$2y$10$YD7sLL/fvwXNM4nCwyPz2uUUVKKk7SXQSZfJ8ImGmmNRDaTeJAIMO', 'Charles Operemo', 'IMG_6453.jpg', 'KcjDfmnLCBajeNb72GdcNLacxHG7VAbdObR68ydUD3JEq1KHoqXpc82GmUdP', '2022-04-25 10:58:03', '2022-04-25 11:36:12', 'charles', 'Operemo', 'coperemo@gmail.com'),
(38, 'brianmercy999@gmail.com', '$2y$10$rAxkWBnY7uKf/IUQJ1inUOFx.psNnc4Yc.JKx57pQzxxt.AUT7dx2', 'Mercy Brain', '1650871159874484077802900066233.jpg', 'VVdMPqXJ3U9JrAPnzkJ8lBhmtJxXRqaYebxyaDuKwcJl0h3bdOPMLKkoJ8HB', '2022-04-25 11:03:42', '2022-04-25 11:21:31', 'Mercy', 'Brain', 'brianmercy999@gmail.com'),
(39, 'noahntum@gmail.com', '$2y$10$YO/3Aj1Q7dQoXHdsi7t5Te7PvfASxpXzkekHP..HxNjf6xjj.0qZW', 'Noah Ntumwa', 'NTUMWA.jpg', 'WJjSrLjPciozE1bOUUW1IljdUYaFr5jPDkLar3A8sIiH7QIgZZQUnz1EnEBl', '2022-04-25 11:03:45', '2022-04-25 11:19:13', 'Noah', 'Ntumwa', 'noahntum@gmail.com'),
(40, 'josephkivumbi@gmail.com', '$2y$10$.lalB0jTLkra/PM/qhPE..mn9yEVhoWLmYy7asBk4037GoWq7P0Zm', 'JOSEPH KIVUMBI', 'IMG_20180928_074642.jpg', 'LoMzoq3DAGUkze1jbWpWCjfXuui0Mkk88YpfczOXxpAe1HgvBa3SjyFN91ED', '2022-04-25 11:03:54', '2022-04-25 11:21:22', 'JOSEPH', 'KIVUMBI', 'josephkivumbi@gmail.com'),
(41, 'greenfirmafrica@gmail.com', '$2y$10$q.c1YIAaORXhEEfZqdIZJOy6jgolWId6ySB4wSXooBvXac1ZnRWz2', 'Amos Owamani', 'IMG_20200802_154121_486.jpg', 'gnko3kxkoN2kJZPkslKxujUsRyDnM5mfG25MfMfNo377mFMfRLbaeM4e1EZY', '2022-04-25 11:04:09', '2022-04-25 11:26:12', 'Amos', 'Owamani', 'greenfirmafrica@gmail.com'),
(42, 'mjacobinheaven@gmail.com', '$2y$10$ozaDLP72A3RE5g87jE.ME.p0WYzb8mSGjL2PGm.lRw1BGc7mtl6NS', 'Jacob Mugisa', 'IMG-20200906-WA0009.jpg', '49S3iZtGW3OapPlZkEAMI4tQq4XwLudZZKU7rZ4vhdLCd5yJxeGTjavmak73', '2022-04-25 11:04:20', '2022-04-25 11:20:05', 'Jacob', 'Mugisa', 'mjacobinheaven@gmail.com'),
(43, 'kawuzialie@gmail.com', '$2y$10$DXXq4n.igkMY2oLVKznE.uQ18qeXyPEHNkuock5TOAJDeVQiUfEga', 'Kawuzi Erimiya', 'IMG_20211027_113431_044.jpg', 'dDiMeMbP1GdTIFGEl0ilAr5HO3w3MEp4owYFe397hlWvp6c5CecwqpzMJ34g', '2022-04-25 11:04:24', '2022-04-25 11:21:57', 'Kawuzi', 'Erimiya', 'kawuzialie@gmail.com'),
(44, 'nakalawatabisa@gmail.com', '$2y$10$MaSnZwpPrDk/Ru2NLXtzcOM85dYQoY63SP4YZeYk3XyFjEXfpNUp2', 'Tabiisa Nakalawa', 'WP_20150108_011.jpg', 'NRIhUV6zIoeOs8PH28tf9CEozRpssdS60q3dnhZJyko06D2UI7glhOk2crNm', '2022-04-25 11:04:42', '2022-04-25 11:20:39', 'Tabiisa', 'Nakalawa', 'nakalawatabisa@gmail.com'),
(45, 'emilerwembuzi2002@gmail.com', '$2y$10$lr0z05gnJoMcxPVLEFjhFuhkRPj.IAVC05SYrXhvKLFcjN9KXJvSq', 'Ekyasimire Emill', 'IMG_20191015_125310.jpg', 'tnRB0wdcitV6IziEqLsn0cjpt57fmmVAacjK3U8QJJmI8nq8HW7AbtT1045X', '2022-04-25 11:04:58', '2022-04-25 11:22:50', 'Ekyasimire', 'Emill', 'emilerwembuzi2002@gmail.com'),
(46, 'aloci2025@gmail.com', '$2y$10$1TL89cCvRbG0u1MrX0kYn.SajFfKlR/d1TX4g0DH0lesCZt0MaDyC', 'Sam Aloci', '16508712648021871092222.jpg', 'QrBj9OnYulmu9US4p2Xlwn2VaIPSOpcreFqndJON5mk0zW4aa6MLzjuKVNl7', '2022-04-25 11:05:06', '2022-04-25 11:20:31', 'Sam', 'Aloci', 'aloci2025@gmail.com'),
(47, 'kemigisam36@gmail.com', '$2y$10$5.bhrKEkdcS.onWPRXg2Xe10jKSqZweMukIYSivaY4PKjy1ew0Kx2', 'MARY KEMIGISA', 'IMG_20211027_125959.jpg', 'ZrPGCDyIloXCfW8g5jkWqrN1EWPT1ulkpitesCddMx4X8TBTNHpVTtDrtzJm', '2022-04-25 11:05:21', '2022-04-25 11:27:41', 'MARY', 'KEMIGISA', 'kemigisam36@gmail.com'),
(48, 'Benedictomatty@gmail.com', '$2y$10$rmMaf5J2LZjTUiyYM8/bOuMYHS0lN8UVH/nkcHfDgxpJlB1jVE6y2', 'Ben Kisitu', '93358eb0f1e3ec12709b316259be7572.jpg', 'jK8yNzN8P0ZQYlhshsMxpQSAm95we4xEZNi1AofIYglYO1amyTOsLCZkh2Jk', '2022-04-25 11:05:25', '2022-04-26 10:25:06', 'Ben', 'Kisitu', 'Benedictomatty@gmail.com'),
(49, 'morynzopae@gmail.com', '$2y$10$kIt0sqUfLzLzruNZ/S7zWeKcQ8cExZDAf2Cqf1GvardJax1EwdDs.', 'Mourine Achulu', 'FSP_0353.JPG', 'rPDXmtpRJBDv0hZ4dF4s3Y1ThGCneoJicBxRlpgHoVnKsjDDXjmnjH81lp0i', '2022-04-25 11:05:31', '2022-04-25 11:20:50', 'Mourine', 'Achulu', 'morynzopae@gmail.com'),
(50, 'aligumae@gmail.com', '$2y$10$lggV5akNPR8DdBlabw6kQuhi2Yrl09GbB6eXC9hxzeCYCiUWy7Cfu', 'Aliguma Emmanuel', '20211011_101357.jpg', 'TUXrZH6aLYRTBicyBzcWa78gyLObYlo5uiVGRae45KhJSuUMSCpRJdjIrOzu', '2022-04-25 11:05:56', '2022-04-25 11:11:11', 'Aliguma', 'Emmanuel', 'aligumae@gmail.com'),
(51, 'mpairwejimmy@gmail.com', '$2y$10$CMXPRW.4o8HGaY1NCfGgju0.AYBT3I/3aOO0Jv6i.4oQtuM62.Afe', 'Jimmy Mpairwe', 'tmp-cam-3656652433527260082.jpg', '5DFHLpyLaTl2JUAen5kxteIF5O1FKou0EAPLdspwTEOSQwOBp5Dh2Yi8uIEY', '2022-04-25 11:06:05', '2022-04-25 11:23:55', 'Jimmy', 'Mpairwe', 'mpairwejimmy@gmail.com'),
(52, 'rkmbabazi@gmail.com', '$2y$10$xrLO2kbmU.e7gBAdRjKRF.J84mR.zZMqyxOt0Gqt.2HaYYl.E3Jsa', 'Racheal Mbabazi', '20211029_211003.jpg', 'lfptldFWTjogmAwiP5Na9mCTF1d0WTwNQWwcr1LFWMjG9Ec6kIroVXq6BSfJ', '2022-04-25 11:06:09', '2022-04-25 11:20:29', 'Racheal', 'Mbabazi', 'rkmbabazi@gmail.com'),
(53, 'hermanbyakagaba98@gmail.com', '$2y$10$0K2VZUSuV/M2BXTwXV1U.u8.aOcql5h8szJjFO0I3.Ey57UyzhRcq', 'Byakagaba Herman', 'IMG_20220411_090443_9.jpg', 'eylR8a862gMcZREhOprDNUsPmr7qXCSWbn3ebdGiIKhtgkix70xSU5HcD3Tf', '2022-04-25 11:06:17', '2022-04-25 11:24:44', 'Byakagaba', 'Herman', 'hermanbyakagaba98@gmail.com'),
(54, 'masagazicliff@gmail.com', '$2y$10$NsNshL3sSaywXc5.7wSMx.ji2hE6cJ7RAsljWl48.ILHpPBLknVnK', 'Masagazi Cliff Richard', 'Cliff (2).jpg', 'TsA6GUcOqcY1prykptVqqIhYseX6kfEeFd5LuD95MjIm0EiuDtznqPw5DOh6', '2022-04-25 11:06:34', '2022-04-25 11:34:12', 'Masagazi', 'Cliff Richard', 'masagazicliff@gmail.com'),
(55, 'isaac.mbabazi@gmail.com', '$2y$10$0zH7PJpeNQZS7PGADeLk0.NIoBZtfFZ.zQXopa5CRQtS5F2es.Y0C', 'Mbabazi Isaac', '2f087a39d1f3e96536aa707b6b2bf973.PNG', '06ndSv3tgUTwMpSH7oV6qLGHpq64eVsxY3iFwMdHtLhIE1iEU6dKA0Ncz3th', '2022-04-25 11:06:50', '2022-04-25 11:20:05', 'Mbabazi', 'Isaac', 'isaac.mbabazi@gmail.com'),
(56, 'kirungigodwin8@gmail.com', '$2y$10$GIHNAvUTUiiZpSbL/GhC5eZ1MIdG4lIGXPzAo3PWyItBKUcVb9d5C', 'kirungi godwin', NULL, 'JB7K5cUNN4EhtPY9Pz8BWLlO9RPqQpBO1nFjk0CaVUtaBuqIfuDhDKfZ2mNi', '2022-04-25 11:07:03', '2022-04-25 11:07:03', 'kirungi', 'godwin', 'kirungigodwin8@gmail.com'),
(57, 'kennedy.wekulo@brac.net', '$2y$10$5MPrD8YE7qrQrl1.BlrIiO3Y.R1hHUocQdURmLybxGwtqTFMMpED.', 'KENNEDY MANGWANA', 'Ken 01.JPG', 'RParyUFhoc5tNUjvJLNtxWdmkflAuAT201M1p0RRpGo39GFOXGmgyLpWwxXy', '2022-04-25 11:07:30', '2022-04-25 11:21:01', 'KENNEDY', 'MANGWANA', 'kennedy.wekulo@brac.net'),
(58, 'lutaayajoseph@ymail.com', '$2y$10$ahFiIF5xvcQmH.kdsCFl7.u7zrBV2GW4sJrvlUGe6iHTCdnackA7q', 'Lutaaya Joseph', '16508710522663879462973333220467.jpg', 'K88iiUxM971NDApMThMKqiNxeTFBh7bVAUJaKGG8SK1D2O2P2fRWTcNr2TVF', '2022-04-25 11:07:51', '2022-04-25 11:20:10', 'Lutaaya', 'Joseph', 'lutaayajoseph@ymail.com'),
(59, 'saviok@hotmail.co.uk', '$2y$10$htv4yl6EBB0OXC5eUyfJheO9pepolqCft23rRfU1UMMkjwgegmsaC', 'Kinkumu Ronald', NULL, 'ukUteJN5ThQFrpaSDW4mG65rlplSq5btY4dhC7TIcYVhnE191ex4unKRF2lY', '2022-04-25 11:08:35', '2022-04-25 11:08:35', 'Kinkumu', 'Ronald', 'saviok@hotmail.co.uk'),
(60, 'gitta_paul@yahoo.com', '$2y$10$TYP3iMGHwQuSWpsRel5n2.AwGWM4KdlctlCLLGRsdm0zFjpGeDrS.', 'Paul Gitta', 'IMG_4890.JPG', 'Jr32rxFnPPEFSHWR0VkbfH977M7hJUiYfj2ShvCFWAhtvZoRE40AFy37PTLu', '2022-04-25 11:08:47', '2022-04-25 11:24:43', 'Paul', 'Gitta', 'gitta_paul@yahoo.com'),
(61, 'moseotai@gmail.com', '$2y$10$SMOmgFaFps5SC63kEdbxu.bbF0t43arGz8wbz.lPJne45xXO49.vm', 'Moses Otai', NULL, 'HX9YKpJYcwiBWikfNMnz1gz7PwAH7yCqObo0W9vrxKELTcAskS2SSsbCuzih', '2022-04-25 11:08:56', '2022-04-25 11:08:56', 'Moses', 'Otai', 'moseotai@gmail.com'),
(62, 'jralexewinyu@gmail.com', '$2y$10$BnIN1U6/8e/0R6Gb.WBWw.PRdXbCEt8ngoEJdX1av6fVFsMk898Pa', 'Alex Ewinyu', 'IMG_20211114_150336.jpg', 'aPzYL1L2kHqSgZ193rS6Y1iQrtUm1yH3ZoCjV36AYYojGheVJTFZbC34Z6Ei', '2022-04-25 11:09:28', '2022-04-25 11:20:27', 'Alex', 'Ewinyu', 'jralexewinyu@gmail.com'),
(63, 'yafloina@gmail.com', '$2y$10$NIsS5LWJsjE5b5eB41Sjy.b2byPYq8Z39dPpzIciqm5PvqjxtKn9a', 'YAFESI OMUMWA', 'USTA LOgo (3).jpg', 'ScjjkSex073YOLwFtX079hh1LRY1Va9OuRRV8rsQG80mnaBupEx6Lv6xlIef', '2022-04-25 11:10:09', '2022-04-25 11:22:34', 'YAFESI', 'OMUMWA', 'yafloina@gmail.com'),
(64, 'savanaseeds1@gmail.com', '$2y$10$ij01Bqi.7R2z6axLWHHif.6RCfGMvpY7nQdydfc2BCJBBNMKe/rFe', 'moses mugabirwe', 'a44ff6fa57c9dad49d0b1fe4d12cb2ef.jpg', 'MgPSqccfgWsIFb4Br9hh1ErUmz3G1yaNQPWVsPP3sBQt7ENkbCNfNisSWd0U', '2022-04-25 11:12:11', '2022-04-25 11:25:21', 'moses', 'mugabirwe', 'savanaseeds1@gmail.com'),
(65, 'nakawukimariam8@gmail.com', '$2y$10$A4UngIIyIPjPZae9sJSTTOoU4ytjRjFJphJeOEy3iPzm5Pi/mqzRG', 'Nakawuki Mariam', 'IMG-20220420-WA0010.jpg', 'qXmrr3jSQS7ObpKqEjfGMhNSlswoQxJgKuNNGvdR8rIFORzWrzuirP6bQBOO', '2022-04-25 11:16:00', '2022-04-25 11:24:25', 'Nakawuki', 'Mariam', 'nakawukimariam8@gmail.com'),
(66, 'ngcu@utlonline.co.ug', '$2y$10$VInkJn0fsSHuyeAniGZ8yeeVgLz/4oKcMZlcZzctbrD4FaucXaKwW', 'Mpabaisi Joseph', NULL, '8mtptxfVBhH5gZOctqWJdObJ518VHNjYE2kD5Nm0hCl6g7p02FSbDHMEWurV', '2022-04-25 11:21:17', '2022-04-25 11:21:17', 'Mpabaisi', 'Joseph', 'ngcu@utlonline.co.ug'),
(67, 'lubegabernard37@gmail.com', '$2y$10$TMnZLa03TtH19B0N0/ZzYeYiHPs.Lbpy.YzQwK7yfu1osESJe9x4G', 'Lubega Benard', '4608c74c28778564fe91959ccfbb4ce8.jpg', '2NCHhSHXmXcB9gALZvUnrdaLx9egQ3Fbu9z2Cn6UR4t080YXc8KpDJCRztmy', '2022-04-25 11:22:31', '2022-04-25 11:31:14', 'Lubega', 'Benard', 'lubegabernard37@gmail.com'),
(68, 'snabimanya@yahoo.com', '$2y$10$z/t.yM0C5slCRzoFpyMUMenmvNQ2e/K7.tE3deagjOUkhIwO3rDha', 'Nabimanya Samuel', 'GFA LOGO.png', 'h8hghBjG0v4cbxdxODFzW4EbAMYaaVOL3uUyLT3GVf9pf62D7LzJaXIEtJfR', '2022-04-25 11:29:29', '2022-04-25 11:33:25', 'Nabimanya', 'Samuel', 'snabimanya@yahoo.com'),
(69, 'isaacowino84@gmail.com', '$2y$10$GaJ1V7c7xb/eLuTGQHW4suxIQIcvfbIzrmRg5fdWUM4AmN.xBksmS', 'Owino Isaac', NULL, 'wC3kSfqgtyLOLz3DGCfrGqIidcEPNY671zuEZ9VAPcnu7qXcaz30E0SEk7QX', '2022-04-25 12:43:13', '2022-04-25 12:43:13', 'Owino', 'Isaac', 'isaacowino84@gmail.com'),
(70, 'kunihira1987@gmail.com', '$2y$10$uGphHIFyBTrDXNWCuqP5y.rva.FoznaJm75AyJ8Etdu8iPumnMQnO', 'Innocent Kunihira', NULL, '3gmLoevU0IsxXTNzUIFU2KgsHm2zwjngZuMr3lPFU0ZRCqRbYG6w67akC4j0', '2022-04-25 15:18:31', '2022-04-25 15:18:31', 'Innocent', 'Kunihira', 'kunihira1987@gmail.com'),
(71, 'sharoncathyalobo@gmail.com', '$2y$10$1EdAYYWjT99g.ev027J3hOa8FQkRC/3imCXgVV.e9viwmYj3o2Uc.', 'Alobo Sharon Cathy', NULL, 'F7bjjDepEaPI4v9T1wEvGg8kuTPbsl5bh1vY6EYmExOnyWfmWO99aQ2AFmtr', '2022-04-25 17:36:07', '2022-04-25 17:36:07', 'Alobo', 'Sharon Cathy', 'sharoncathyalobo@gmail.com'),
(73, 'basic@gmail.com', '$2y$10$DFvOQ9K/UbaZXJiL0C96AuV7YhKiU5tOYIl059AV7rHjC0TwM0QzK', 'Basic User', NULL, 'd39jf0IncVfTzFkOsyra8qmVI9KMpSaILMFZ4Bo7fuhtUGT1EJB8qVMrGZ7A', '2022-04-27 16:41:13', '2022-04-27 16:41:13', 'Basic', 'User', 'basic@gmail.com'),
(74, 'eodongkara@gmail.com', '$2y$10$XZ/FKESe2ddRIJa9M0SlleVovAUecGW2.MqvCNOym7D45MXvx7mbO', 'Odongkara Emmanuel', 'IMG_20211218_123755_046.jpg', 'o02kc9i9QtRhIplzJkwANEuoGLRQecMIr7gEvfLBtHmy6RzGJITiHLtKRbXZ', '2022-04-28 10:44:41', '2022-04-28 11:01:40', 'Odongkara', 'Emmanuel', 'eodongkara@gmail.com'),
(75, 'kennyomoding@gmail.com', '$2y$10$9op0BwaeD4nN5dY77Im3te4xcg4odPPILF2JZHfR34tE4oPpaL.pm', 'Kenneth Omoding', 'IMG-20170629-WA0015.jpg', 'aOvCoFHnJwF21duj2A9WartSSgqbKEDQOCZkORoGkl4dbgC2s5lRnXyjGYB1', '2022-04-28 10:45:07', '2022-04-28 11:01:31', 'Kenneth', 'Omoding', 'kennyomoding@gmail.com'),
(76, 'mbabazi.isaac@gmail.com', '$2y$10$UOi5o8k2t.rVv8/QiZlKCO/7pzzyvgjryrbWwDjU7J/JxbB7xbawe', 'Isaac Mbabazi', 'de41d3f3489510a341266409e9a30427.PNG', 'eYAmqVUEc181A8EB1h5MgOPpNhFy24GxSISDr3dewTmckZQM3zT0cAne3HW9', '2022-04-28 10:45:29', '2022-04-28 11:01:29', 'Isaac', 'Mbabazi', 'mbabazi.isaac@gmail.com'),
(77, 'muyingoali5@gmail.com', '$2y$10$eZnsFsSIBsqwNLA4zPZrue04xUkPmOzTVRZd/Ya9.UMCh4ew17ppu', 'MUYINGO ALI', NULL, 'H0pyaXF3EPvITdze96lWSskf5S5Gf7IQcfq5cVnN7zhuM4CYhBxws3Tt1vJ9', '2022-04-28 10:45:35', '2022-04-28 10:45:35', 'MUYINGO', 'ALI', 'muyingoali5@gmail.com'),
(78, 'nelsonmasereka@gmail.com', '$2y$10$lTGl4un/hqqowQtAEfTfae3PqieKKQBvoiiZop1gVHiLfvLVKSQjG', 'Uganda Seed Trade Association', '3729fd7bcbafc2797ea6db5c94e4c20e.jpg', 'kX2CE88j59IvBLBvpNynArCPUYmDEyYRrBKmyBPaN0TSnFMFfMzZTyzbuwrH', '2022-04-28 10:45:36', '2022-04-28 11:07:51', 'Masereka', 'Nelson Sirikani', 'nelsonmasereka@gmail.com'),
(79, 'christinebiira77@gmail.com', '$2y$10$TrKMo.LSluNKIAWopwWZ0e3Avdi1uLpHSFfrDhXIS.NQPwZhwRAty', 'Uganda Seed Trade Association', 'IMG_20220427_185449_599.jpg', '7fixOfP99kL3HXQFOWlBlUDy5kt8UlPGbxeJVIOXmgQRuMsfA5aGRSK2jjn1', '2022-04-28 10:45:41', '2022-04-28 11:01:46', 'Biira', 'Christine', 'christinebiira77@gmail.com'),
(80, 'joelmukisa256@yahoo.com', '$2y$10$q/GLFjKXKDbxsaFXCvdVoOrPxx0n0wb6heaV4QMJd6mltF15XvzTS', 'MOVA SEED', 'joel 1.jpg', '3Y0TV8EpD1njoSTPDBCHD8pMrGDcEiwVEO0e5TAN7yJXmkxoLNJRBv9Jf5mR', '2022-04-28 10:45:41', '2022-04-28 11:08:04', 'Joel', 'Mukisa', 'joelmukisa256@yahoo.com'),
(81, 'elyonagroconsultsltd2019@gmail.com', '$2y$10$AUlzCjiD.V4fFnHR6tV.9.3tJGvTkmHMM/dZnukdrWk8aGCqDCUu6', 'Miiro Steven', 'tmp-cam-8329085211235753052.jpg', 'dwlExcjqCZfAeNgBxzLDGH4XOPdihTLcj3bPs0WCJIUO8fM2J7wPnjGIdBT3', '2022-04-28 10:46:01', '2022-04-28 13:24:35', 'Miiro', 'Steven', 'elyonagroconsultsltd2019@gmail.com'),
(82, 'mbowaarnold@gmail.com', '$2y$10$y6z63dA2C8j55HjcHnFjB.KkPobLZGTj7K5bAzswM/tAUmshdIRM.', 'Arnold Mbowa', 'Mr. Kakembe of Muwoko village - Mubende.jpeg', 'swdLgUyQcK1BMCQTKOPSq06Bf8b5ECZHNnGqbmftLIzh0dNDa3N0HB9zn0n6', '2022-04-28 10:46:03', '2022-04-28 11:03:37', 'Arnold', 'Mbowa', 'mbowaarnold@gmail.com'),
(83, 'johnkalas96@gmail.com', '$2y$10$PV9dzdFvy22UUTWx6GhpYOzD.AfGVttPNuYkHR0.v6gkK.QrFSgCa', 'John Mulonde', '16511291975988023772235840383155.jpg', 'n7PVvScrfs3J4rsfUsFhFfD6xlblEDZbCimu8fLAQIWC21inGuecAxHH9ajk', '2022-04-28 10:46:12', '2022-04-28 11:01:37', 'John', 'Mulonde', 'johnkalas96@gmail.com'),
(84, 'd88nyeko@gmail.com', '$2y$10$WjYJj2SRk1sEpp19OL8W0etrc9GdlXwSEtcFou/KmL/R9G9oZZRkS', 'Dominic Kimara', 'PHOTO.jpeg', 'rtvWCoyXXNH9l9xeyg8NNcn6DLaeB0ONLz7i0B79j8Y1VTgOUmmhvsOdveJB', '2022-04-28 10:46:14', '2022-04-28 11:04:12', 'Dominic', 'Kimara', 'd88nyeko@gmail.com'),
(85, 'matatajob72@gmail.com', '$2y$10$qpJKIQMBGLU4kINlKY/Pr.2//JBsnVYMGfliOcjVjYYU3IxF1TX3m', 'SELECT SEED LIMITED', 'IMG_20211213_094738_257.jpg', 'LPcXH1m4z7UkEuzb3GzVq9bGq0eqykYm39jdIRgumc1ppRbnkf9wRmVJf7R6', '2022-04-28 10:46:20', '2022-04-28 11:01:57', 'MATATA', 'JOB', 'matatajob72@gmail.com'),
(86, 'mutegekiivan@gmail.com', '$2y$10$ZPo6NGfxVnOYgifHkHgQ6uwPYlbsdlOoTIJ.W8obzt3yWa10bsqce', 'mutegeki ivan', 'IMG_20220524_091732_2.jpg', 'YuImr65uWRvi3HtaFqxPwFJEWMnexLqcp1nRCebawoUJd5JdMDXDz8XJ4x9U', '2022-04-28 10:46:22', '2022-05-24 14:20:03', 'IVAN', 'MUTEGEKI', 'mutegekiivan@gmail.com'),
(87, 'sulajjemba4@gmail.com', '$2y$10$H/H.jpg.sACY5GzPP6U7WONjJZhwLxIWXmdF8djxGvX9yty4pgXdG', 'Sula Jjemba', '20220427_152327.jpg', 'BD3z99lGCRyQyOlqdQQqts4xpW5HzPVCXHdOSltxXqBWQ2Ad5sBuej3hpHq7', '2022-04-28 10:47:29', '2022-04-28 11:08:27', 'Sula', 'Jjemba', 'sulajjemba4@gmail.com'),
(88, 'walufeloisimabonty16@gmail.com', '$2y$10$ivOFdBl9rgAK2dZCsQD4Deu166XmL/KukFPoq583TNws/D0fDK1Ty', 'walufelo isima', '1651129159685-174580839.jpg', 'bCcvpmCfuzJUEhcMmxXiQBNwW1n1CbrUVYEsWoQLhZC5JuUqrkg8riyGuxlS', '2022-04-28 10:47:31', '2022-04-28 11:02:18', 'walufelo', 'isima', 'walufeloisimabonty16@gmail.com'),
(89, 'Opiobanya@gmail.com', '$2y$10$xQnoPMm7ikBEgjSK32IsGeMJlaLNPWYnjQhdLPsxgRNIdN1VAE4sy', 'Opio Kelvin', '20220428_085704.jpg', 'AJZkUvzUiEAB84L7QZANdvoxIbqxfrgSjG4voPds0npLBKoLSPkPVICTa9ux', '2022-04-28 10:48:48', '2022-04-28 11:02:54', 'Opio', 'Kelvin', 'Opiobanya@gmail.com'),
(90, 'atiaserogal2@gmail.com', '$2y$10$FOSi3Vez9tbMGQCxsyVbuuVjUQ4mNnNC4Z44.H6ABAv12zKU1pX5W', 'Atia serogal', 'IMG_20220427_181457_543.jpg', 'gIMMIBcpFydVeBvsL6bV5z3NmQiZYppY3CCFuu5MRuz2sLeCxjsNKQcPYI79', '2022-04-28 10:49:01', '2022-04-28 11:01:43', 'Atia', 'Serogal', 'atiaserogal2@gmail.com'),
(91, 'cathyadong3@gmail.com', '$2y$10$duLneh6mYCTJ2Y9MXWnX0uT2EoRquX80DH2EhVDc4ZpiHFzt0j2MS', 'Cathy Adong', 'IMG_20220427_075136.jpg', 'HL2rsPL2MCcceiSBgZHekM4AwzE8qWA4ah1dCodona0IaK1s5hipWl65x6Et', '2022-04-28 10:49:18', '2022-04-28 11:02:05', 'Cathy', 'Adong', 'cathyadong3@gmail.com'),
(92, 'pollymagero23@gmail.com', '$2y$10$.NC4qrD.vH40ub0zylHnRejo50GgPm5Tyh2t2em5ZCt.svaXJ06WS', 'Polly Bantel', 'IMG-20210517-WA0004.jpeg', 'J5x7i8ZjDg4ClMIAZjWy6VmQsGkq0fgHp8ZkDvsF0uSTYLyxLAHtihYuFahe', '2022-04-28 10:50:38', '2022-04-28 11:01:32', 'Polly', 'Bantel', 'pollymagero23@gmail.com'),
(93, 'wesigah@gmail.com', '$2y$10$KF3skTBHWj5iLSaNB23zZOBLGwuBJ1QE8yZ7FyjLkkfS3wI42ZAqW', 'WESIGA JIMMY', '100_2659.JPG', 'Bb6iTn1gqVKTPjbsp5HsgBckXRAo9BfAGJUGGrits0vDsfEdJY2hSkoPbysA', '2022-04-28 10:51:38', '2022-04-28 11:03:05', 'WESIGA', 'JIMMY', 'wesigah@gmail.com'),
(94, 'wandabarnabas3@gmail.com', '$2y$10$8CG/RSeeZ8Scw4wRkSjYYuoN5k4joucbHYQjrjNetBkvQeOsJ97Z6', 'WANDA BARNABAS', 'IMG_20220421_103220_941[1].jpg', 'BSZ8mtkgzTxXaj5LyHO9yd3LBHbnlLQaJpjiZnjOsRFpwtbTo90UCnRMzFir', '2022-04-28 10:52:40', '2022-04-28 11:01:56', 'WANDA', 'BARNABAS', 'wandabarnabas3@gmail.com'),
(95, 'wabusonko@gmail.com', '$2y$10$r/an7OBficthjV5voYS1/OAGzxC5AJB0io3.abVLiG4Nh5engLh7G', 'kibalama brian', 'photo.PNG', '2zzKuiuMdsFyBb3uZUNGuXQYj8JiUAHWCuCHBdWKQrHqV1TXbqL0FuG3WBRv', '2022-04-28 10:58:16', '2022-04-28 11:13:42', 'kibalama', 'brian', 'wabusonko@gmail.com'),
(96, 'muyingoali6@gmail.com', '$2y$10$qE1ovUq8.LfcCjzKirS0ieAQqHKKDUZ1ICnqJmR1MRd10FgKfRv9W', 'MUYINGO ALI', 'IMG-20210325-WA0017.jpg', 'EgwYkL9F8mCaoK6u8s2NNnpywVhjooRahepXWvDXyYmrKFVeulOihtcjS4TZ', '2022-04-28 10:59:53', '2022-04-28 11:21:17', 'MUYINGO', 'ALI', 'muyingoali6@gmail.com'),
(97, 'magimbig@gmail.com', '$2y$10$o7SEqvETlGFfUuP7Rt4yde13KWcaZKeuTlADsNHtgnQ4h09mCoTda', 'George Magimbi', NULL, 'J0kpzEYNdtZdyKHUR2iLahF1Cw8Gl0nQdeJ1gSGlyg6ZPEQsO5MB1uXjRB2m', '2022-04-28 11:19:15', '2022-04-28 11:19:15', 'George', 'Magimbi', 'magimbig@gmail.com'),
(98, 'nbvicky@yahoo.com', '$2y$10$BKN/lZtpfVE/YCNC7FrIxe1.qMRhBr9rdsuqQN0d5/DMYeToJsfvK', 'Vicky Nyakatuura', NULL, 'fHpkbacIdkn7LzEF1YOehEHWxBLQtdzE8J66LU1PMhO4Qm6RNVopT8bbSVGX', '2022-04-28 11:36:46', '2022-04-28 11:36:46', 'Vicky', 'Nyakatuura', 'nbvicky@yahoo.com'),
(99, 'muyingoali7@gmail.com', '$2y$10$CzjQTUydgYIMvNaLDlQU2OD/PC76KcNC0jCsMupf4.uoysdJWS0Ui', 'MUYINGO ALI', '1651131972151343519220794481266.jpg', 'OXxCgECnR8MzEGBjlr1cAOQF80yA86ApzOJDjyV1dYjQx2bFKTyROubD2utA', '2022-04-28 11:44:45', '2022-04-28 11:47:29', 'MUYINGO', 'ALI', 'muyingoali7@gmail.com'),
(100, 'muyingoali8@gmail.com', '$2y$10$Oyu52DbmsVJtdBEAw/kfr.I17Sn/PMY.l6ycF14VVfRIlaCPzj8BC', 'MUYINGO ALI', NULL, 'NPgiazjavutA9IbijS1Pm0QFaJkp0aj36IzhLKEYdXGr0b54hwVgvXwJhxxn', '2022-04-28 16:48:17', '2022-04-28 16:48:17', 'MUYINGO', 'ALI', 'muyingoali8@gmail.com'),
(101, 'masumugogo@gmail.com', '$2y$10$KtApDilG7uPJiLTr7lVtpuoWOZek2LyryQsNuLPmNzin28AOLJZwm', 'Masumu Gogo', 'RHINO SEEDS LOGO_page-0001 (2).jpg', 'AOpELryk2lcngJh892pvdr3M82eGAGDSq6QR0NUlhtdwZvwBWRDu4biUme26', '2022-04-29 10:27:10', '2022-04-29 10:34:29', 'Masumu', 'Gogo', 'masumugogo@gmail.com'),
(102, 'naroholdings@gmail.com', '$2y$10$klWjRIfSEyqk6bR32tKAJuekLJNhCar0AyuxVqR7SqpWr6tlxabyi', 'NARO HOLDINGS LIMITED', 'logo naro.png', 'tISMsY9ysXJN9Y9z5C4n1HrXZknfMmCwwx77SIwXc7F4iF7fKRabU0eAMt55', '2022-05-04 10:46:53', '2022-05-24 12:15:31', 'NARO HOLDINGS LIMITED', 'NARO HOLDINGS LIMITED', 'naroholdings@gmail.com'),
(103, 'syova.ug@easeed.com', '$2y$10$w.7lFrHzGhJCzG6EteJZ3.Z6IzVYUvPWBAXO9XiAheTF6/2YCNCZa', 'H.C.V REDDY', 'syova 111.png', 'Ll7dSDCFEYVy33723raAyFQW7JUE9UShilwmUlgoaTZ0N7EuazTFCMssaQsV', '2022-05-09 13:41:15', '2022-05-09 13:44:18', 'H.C.V', 'REDDY', 'syova.ug@easeed.com'),
(104, 'musa@8technologies.net', '$2y$10$jPW8F7nm/4UIiVql91hfeuc/V.kUEpBzGNTyOUTuDgXJTnRWUcmF.', 'Musa Rahim', '8techacunt.jpg', 'U87k2vicYq0eXfSulrWyZjxRu0gNKYml1Qhv9Q2jDGrizr4coqU7WNFE9nGC', '2022-05-09 15:37:31', '2022-05-09 15:39:28', 'Musa', 'Rahim', 'musa@8technologies.net'),
(105, 'crownseeds17@gmail.com', '$2y$10$99NGxI46YXJPjeNuHXBxz.LYzKqLMXpLh03h3knKoJxQP2nRKytYC', 'Crown Seeds Ltd', 'Header.png', 'ABKTr9pWnejQwNH91m4Of0xw2RvzOXyzzcAWXkgxzJDeZ2P6Xc3fOE8wZihK', '2022-05-10 10:26:33', '2022-05-16 10:42:33', 'Crown', 'Seeds Ltd', 'crownseeds17@gmail.com'),
(106, 'Kalks751@gmail.com', '$2y$10$y3LwUctaQlQXEGaHHwbbeeuY25ZqaUw9G04ogxhoRakS/AnXarcwK', 'Kalule Kusain', NULL, 'izrdzY9NuJXo5qs9Ji3qtLXuK0QhvI73KPd1LkdRlMA9xGRMSOfhsfDzAyWV', '2022-05-11 09:41:19', '2022-05-11 09:41:19', 'Kalule', 'Kusain', 'Kalks751@gmail.com'),
(107, 'klyghfffd@gmail.com', '$2y$10$zdokDmcFCzB/oOo9TpDUOOOpPm87HcRD/unnUUOeDyxEiAhFzgBjm', 'opi iuy', NULL, 'bzAvB9w6dUQ9m1kbrSicUN50v5L6yhLDz4XQflBLQjSfaq07jZwf0idXZPyE', '2022-05-11 13:28:43', '2022-05-11 13:28:43', 'opi', 'iuy', 'klyghfffd@gmail.com'),
(108, 'admin@growmoreseeds.com', '$2y$10$i4rfUGusOtes5sjCx9.vXukhyVXibABcZZPx.xT0Y7KIejt0f2CLe', 'Grow More Seeds and Chemicals Ltd', 'gms logo .png', 'd87XYmkto6d7HrNl3fGAzlLo0sCUCqyiVYOQdonvzO9xVh8Y0fd6p897RDf1', '2022-05-17 13:25:12', '2022-05-17 13:30:54', 'Grow More Seeds', 'and Chemicals Ltd', 'admin@growmoreseeds.com'),
(109, 'joseph.lutaaya@brac.net', '$2y$10$Id0CxLge7Bqx0MNWx5C4QuYLUOQxAj3DajQTGX3WYbLeO5gkOn0me', 'Brac  social business enterprises limited', 'shop.jpg', 'A7AgqU4YZ2VgToevduYov0LRKQXnp9xqz3YN7lzhFzIs4P6Bw3DJRs0ManXT', '2022-05-18 15:14:42', '2022-05-18 15:40:22', 'Brac seed', 'social business', 'joseph.lutaaya@brac.net'),
(110, 'pearlseedltd1@gmail.com', '$2y$10$a8qLC/tO77LZ5VtotqdIDOO7qomadvHhjs75BliOfC2W8FLsifQh.', 'Masagazi Richard', 'MASAGAZI CLIFF RICHARD.jpg', 'EXwiY1tb1Kzfy88Z7P8ErGmMHnLYEotp1jHs3aMe1vC5wZSx2YFJODOzShZG', '2022-05-24 14:13:28', '2022-05-24 14:40:39', 'Masagazi', 'Richard', 'pearlseedltd1@gmail.com'),
(111, 'michaeledema100@gmail.com', '$2y$10$P3.BtkpRS8/cXKvQ.NbnFe87hNHKWks8YIMyu90X2onBTjCtDX91m', 'Edema Michael', NULL, '4g4jZF81TfNV7f7aHidOoUtnCQPpTjjwqK7txdehLSpwkt8aAIlzc8c46NGH', '2022-05-25 11:55:36', '2022-05-25 11:55:36', 'Edema', 'Michael', 'michaeledema100@gmail.com'),
(112, 'michaeledema20@yahoo.com', '$2y$10$OYrbF7DR5.XSm1WhqQlu6e.A2YWhpL6iYDn30GXL1aEpsXyloX6Aq', 'Edema Michael', NULL, 'X0yJ3sedPKbiptovuZmkZB4w2VHTtjYL5ElL4EXVXDJjGfjFmk3b0yqlbBQj', '2022-05-25 13:14:05', '2022-05-25 13:14:05', 'Edema', 'Michael', 'michaeledema20@yahoo.com'),
(113, 'equatorseeds@yahoo.com', '$2y$10$rG4a2Nkt/xGRGuxbj8a0v.5AGZNM7S5tiDOPl/K6EbkNxKCOO5JRm', 'TONNY OKELLO', NULL, 'yeUfS8iY8bhqXXpbUWJP18u1S1RaEzN93r6sBLSRnUjovbxJVImrjEzl3DQd', '2022-05-30 12:58:41', '2022-05-30 12:58:41', 'TONNY', 'OKELLO', 'equatorseeds@yahoo.com'),
(114, 'unitedseed.ug@gmail.com', '$2y$10$VBA./yA3bOgXE4Gw.U4W/.b6FUCQiC6.cNHri3Y2ZhiCokhgB2Xd.', 'UNITED SEEDS (U) LTD', 'United seeds logo.jpg', 'J0NyNO6xixvCcQMCN1bO4mO7cHml00rZbkDDHhteK43NzW2PH4q5wGntqZqF', '2022-05-31 11:35:02', '2022-05-31 12:01:19', 'OKELLO', 'HABERT', 'unitedseed.ug@gmail.com');

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
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(4) DEFAULT NULL,
  `units` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender` bigint(20) UNSIGNED NOT NULL,
  `receiver` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `thread` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_inspection` int(11) DEFAULT NULL,
  `number_of_days_before_submision` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crops`
--

INSERT INTO `crops` (`id`, `created_at`, `updated_at`, `name`, `number_of_inspection`, `number_of_days_before_submision`) VALUES
(1, '2022-04-28 13:23:36', '2022-04-28 13:23:36', 'Default crop', NULL, NULL),
(3, '2021-10-27 04:30:25', '2021-10-27 05:00:02', 'Bush Beans', 3, 15),
(4, '2021-10-27 05:01:26', '2021-10-27 05:01:26', 'Climbing Beans', 3, 15),
(5, '2021-10-27 05:02:56', '2022-02-25 07:07:36', 'Ground Nuts', 2, 15),
(6, '2021-10-27 05:04:44', '2022-02-25 07:07:47', 'Maize (OPV)', 6, 15),
(7, '2021-10-27 05:05:47', '2022-02-25 07:07:58', 'Sim sim', 3, 15),
(8, '2021-10-27 05:06:44', '2022-02-25 07:08:08', 'Soybeans', 2, 15),
(9, '2021-10-27 05:07:42', '2022-02-25 07:08:19', 'Maize (Hybrid)', 5, 15),
(10, '2021-10-27 05:08:39', '2022-02-25 07:08:29', 'Sorghum', 3, 15),
(11, '2021-10-27 05:09:21', '2022-02-25 07:08:38', 'Rice', 3, 15),
(12, '2022-03-24 14:26:09', '2022-03-24 14:26:09', 'greengram', NULL, 15),
(13, '2022-03-24 18:16:58', '2022-03-24 18:16:58', 'Snap Beans', NULL, 15),
(14, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 'Wheat', NULL, 15),
(15, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 'Millet', NULL, 15),
(16, '2022-03-24 18:46:26', '2022-03-24 19:01:25', 'Pearl Millet', NULL, 15),
(17, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 'Sun flower', NULL, 15),
(18, '2022-03-24 19:05:23', '2022-03-24 19:05:23', 'Pigeon Pea', NULL, 15),
(19, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 'Cow pea', NULL, 15),
(20, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 'Cassava', NULL, 15),
(21, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 'Sweetpotato', NULL, 15),
(22, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 'Potato', NULL, 15),
(23, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 'Banana', NULL, 15),
(24, '2022-03-24 21:32:02', '2022-03-24 21:32:02', 'Apples', NULL, 15),
(25, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 'Coffee', NULL, 15),
(26, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 'Maize parental lines', NULL, 15);

-- --------------------------------------------------------

--
-- Table structure for table `crop_inspection_types`
--

CREATE TABLE `crop_inspection_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `crop_id` bigint(20) UNSIGNED NOT NULL,
  `inspection_stage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `period_after_planting` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crop_inspection_types`
--

INSERT INTO `crop_inspection_types` (`id`, `created_at`, `updated_at`, `crop_id`, `inspection_stage`, `period_after_planting`) VALUES
(1, '2021-11-04 06:56:29', '2021-11-04 06:56:29', 3, 'Pre-flowering', '30'),
(2, '2021-11-04 06:56:29', '2021-11-04 06:56:29', 3, 'Flowering', '45'),
(3, '2021-11-04 06:56:29', '2021-11-04 06:56:29', 3, 'Pre-harvest', '60'),
(5, '2022-03-24 14:24:42', '2022-03-24 14:24:42', 5, 'pre-flowering', '30'),
(6, '2022-03-24 14:24:42', '2022-03-24 14:24:42', 5, 'flowering', '45'),
(7, '2022-03-24 14:24:42', '2022-03-24 14:24:42', 5, 'pre-harvest', '60'),
(8, '2022-03-24 14:26:09', '2022-03-24 14:26:09', 12, 'pre-flowering', '30'),
(9, '2022-03-24 14:26:09', '2022-03-24 14:26:09', 12, 'flowering', '45'),
(10, '2022-03-24 14:26:09', '2022-03-24 14:26:09', 12, 'pre-harvest', '60'),
(11, '2022-03-24 18:16:58', '2022-03-24 18:16:58', 13, '3', '45'),
(12, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 14, '3', '45'),
(13, '2022-03-24 18:33:17', '2022-03-24 18:33:17', 6, '5', '60'),
(14, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, '5', '60');

-- --------------------------------------------------------

--
-- Table structure for table `crop_types`
--

CREATE TABLE `crop_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `crop_id` bigint(20) UNSIGNED NOT NULL,
  `inspection_stage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `period_after_planting` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crop_varieties`
--

INSERT INTO `crop_varieties` (`id`, `created_at`, `updated_at`, `crop_id`, `name`) VALUES
(1, '2022-04-28 13:23:36', '2022-04-28 13:23:36', 1, 'Default crop vareity'),
(12, '2021-10-27 05:02:56', '2021-10-27 05:02:56', 5, 'BUKENE (OBSE LET)'),
(13, '2021-10-27 05:02:56', '2021-10-27 05:02:56', 5, 'IGORA'),
(19, '2021-10-27 05:06:44', '2022-03-24 15:17:30', 8, 'Bukalasa 4'),
(20, '2021-10-27 05:06:44', '2021-10-27 05:06:44', 8, 'Congo 72'),
(28, '2022-03-24 14:23:22', '2022-03-24 14:23:22', 5, 'serenut 14R'),
(29, '2022-03-24 14:23:22', '2022-03-24 14:23:22', 5, 'read beauty'),
(30, '2022-03-24 14:23:22', '2022-03-24 14:23:22', 5, 'serenut 8T'),
(31, '2022-03-24 14:26:43', '2022-03-24 18:11:00', 12, 'narogram 1(Filsan)'),
(32, '2022-03-24 14:26:43', '2022-03-24 18:11:00', 12, 'narogram 2(Sunshine)'),
(63, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NABE 7C* (Vuninkingi)'),
(64, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NABE 8C* (Ngwinurare)'),
(65, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NABE 9C* (Gisenyi)'),
(66, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NABE 10C* Umubano'),
(67, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NABE 12 C*'),
(68, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NABE 26 C*  (F4:8 34 ML-14/4)'),
(69, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NABE 27 C*  (F4:8 34 ML – 2/3)'),
(70, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NABE 28 C*  (F5:8 90 ML – 2/1/39'),
(71, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NABE 29 C*  (F6:8 90 ML – 5/13'),
(72, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NAROBEAN 4 C* (MAC44)'),
(73, '2022-03-24 15:08:35', '2022-03-24 15:08:35', 4, 'NAROBEAN5 C* (Nyiramuhundo)'),
(74, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'S 38'),
(75, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Kabanyolo 1'),
(76, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Nam 1(CAL 131)'),
(77, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Nam11(L73)'),
(78, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Namsoy3(NG7.3)'),
(79, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Maksoy1N'),
(80, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Namsoy4M'),
(81, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Maksoy 2N'),
(82, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Maksoy 3N'),
(83, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Maksoy4N'),
(84, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Maksoy5N'),
(85, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'Maksoy6N'),
(86, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'SC Saga(COMESA)'),
(87, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'SC Signal(COMESA)'),
(88, '2022-03-24 15:17:30', '2022-03-24 15:17:30', 8, 'SC Sentinel (COMESA)'),
(89, '2022-03-24 15:24:32', '2022-03-24 15:24:32', 3, 'Banja 2'),
(90, '2022-03-24 15:24:32', '2022-03-24 15:24:32', 3, 'K20'),
(91, '2022-03-24 15:31:39', '2022-03-24 15:31:39', 3, 'K131 (MCM 5001)'),
(92, '2022-03-24 15:31:39', '2022-03-24 15:31:39', 3, 'K132 (CAL 96)'),
(93, '2022-03-24 15:31:39', '2022-03-24 15:31:39', 3, 'NABE 1 (OBA 1)'),
(94, '2022-03-24 15:31:39', '2022-03-24 15:31:39', 3, 'NABE 2 (MCM1015)'),
(95, '2022-03-24 15:31:39', '2022-03-24 15:31:39', 3, 'NABE 3 (MCM 2001)'),
(96, '2022-03-24 15:31:39', '2022-03-24 15:31:39', 3, 'NABE 4 (POA 2)'),
(97, '2022-03-24 15:31:39', '2022-03-24 15:31:39', 3, 'NABE 5 (SUGAR 73)'),
(98, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 6 (UBR92) 25ML'),
(99, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 11'),
(100, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 13 (RWR 1946)'),
(101, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 14 (RWR 2075)'),
(102, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 15 (NARBL-144)'),
(103, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 16 (NARBL 233-2)'),
(104, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 17 (NARBL 220)'),
(105, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 18 (NARBL 110 -1)'),
(106, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 19 (NARBL 50 – 1)'),
(107, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 20 (NARBL 50 – 3)'),
(108, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 21 (NARBL 53 – 3)'),
(109, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 22 (NARBL 40 – 3)'),
(110, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NABE 23 (NARBL 252)'),
(111, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NAROBEAN 1 (RWR2154)'),
(112, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NAROBEAN2 (RWR 2245)'),
(113, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NAROBEAN3 (MOORE 88002)'),
(114, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NAROBEAN 6   (SCR 26)'),
(115, '2022-03-24 15:46:33', '2022-03-24 15:46:33', 3, 'NAROBEAN 7 (SCN 11)'),
(116, '2022-03-24 16:00:29', '2022-03-24 16:00:29', 6, 'White star'),
(117, '2022-03-24 16:00:29', '2022-03-24 16:00:29', 6, 'Western Queen'),
(118, '2022-03-24 16:00:29', '2022-03-24 16:00:29', 6, 'Kawanda       Comp A.'),
(119, '2022-03-24 16:00:29', '2022-03-24 16:00:29', 6, 'Longe 1'),
(120, '2022-03-24 16:00:29', '2022-03-24 16:00:29', 6, 'Longe 4 (LP 16)'),
(121, '2022-03-24 16:00:29', '2022-03-24 16:00:29', 6, 'Longe 5 (Obatampa POP 63 QPM)'),
(122, '2022-03-24 16:00:29', '2022-03-24 16:00:29', 6, 'Myezi Mitatu(MM3)'),
(123, '2022-03-24 16:00:29', '2022-03-24 16:00:29', 6, 'Longe 5 D'),
(124, '2022-03-24 16:17:44', '2022-03-24 16:17:44', 5, 'Manipinter'),
(125, '2022-03-24 16:17:44', '2022-03-24 16:17:44', 5, 'Tatu 386'),
(126, '2022-03-24 16:17:44', '2022-03-24 16:17:44', 5, 'Roxo'),
(127, '2022-03-24 16:17:44', '2022-03-24 16:17:44', 5, 'Mt. Makulu Red'),
(128, '2022-03-24 16:17:44', '2022-03-24 16:17:44', 5, 'Igola-1'),
(129, '2022-03-24 16:17:44', '2022-03-24 16:17:44', 5, 'Serenut 1R (ICGV-SM83708) (Serere Red)'),
(130, '2022-03-24 16:17:44', '2022-03-24 16:17:44', 5, 'Serenut 2 (ICGV-SM 90704) Igola-II'),
(131, '2022-03-24 16:17:44', '2022-03-24 16:17:44', 5, 'Serenut 3 R (ICGV-SM93530)'),
(132, '2022-03-24 16:17:44', '2022-03-24 16:17:44', 5, 'Serenut 4 (ICG-122991)'),
(133, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 5 R (ICGV- 93535)'),
(134, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 6 T (ICGV – 99566)'),
(135, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 7 T (ICGV – 99018)'),
(136, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 9 T (ICGV – 99044)'),
(137, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 11 T (ICGV – 99031)'),
(138, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 13 T (ICGV – 99052)'),
(139, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 8R (ICGV – 99019)'),
(140, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 10R (ICGV – 99024)'),
(141, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 12R (ICGV – 99048)'),
(142, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Serenut 14R (ICGV – 99064)'),
(143, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Naronut 1R (DOK 1R)'),
(144, '2022-03-24 16:17:45', '2022-03-24 16:17:45', 5, 'Naronut 2T (DOK 1T)'),
(145, '2022-03-24 16:20:56', '2022-03-24 16:20:56', 7, 'Sesim 1, Sesim 2, Sesim 3'),
(146, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'Longe 2 H      (Hybrid B)'),
(147, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'Longe 3 H    (Hybrid C)'),
(148, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SC 627'),
(149, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN 67'),
(150, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN 77'),
(151, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SC 407'),
(152, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN 15'),
(153, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'Longe 6 H'),
(154, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'Longe  7 H'),
(155, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'Longe 8 H'),
(156, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'DK 8051'),
(157, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'DK 8071'),
(158, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'DK 8031'),
(159, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'H 517'),
(160, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'H 529'),
(161, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'H 614'),
(162, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'H628'),
(163, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'H 629'),
(164, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH 6303'),
(165, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH 615'),
(166, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WH 403'),
(167, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PHB 30 V 53'),
(168, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PHB 30 G 19'),
(169, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'YARA 41'),
(170, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'YARA 42'),
(171, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'H QPM(Salongo)'),
(172, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'H 9 H'),
(173, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'H 10 H'),
(174, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'H 11 H'),
(175, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN 4M- 19'),
(176, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN 5 M - 35'),
(177, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN 7 M - 89'),
(178, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN 63'),
(179, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH 5051 (ECAVL1/ECAVL 18'),
(180, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH 5052 (ECAVL 2/ECAVL 19'),
(181, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH 5053 (ECAVL2/ECAVIL18'),
(182, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'FH 6150'),
(183, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'FH 5160'),
(184, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'VP max (VP5120)'),
(185, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'KH 500 – 43 A'),
(186, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'ZMS 652'),
(187, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'KH 600 – 15 A'),
(188, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WANAK       NAS 9200 6 HK'),
(189, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'FH 500S'),
(190, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'VICTORIA 1'),
(191, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'VICTORIA 2'),
(192, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE 2114'),
(193, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE 2115'),
(194, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH5401'),
(195, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH5354 /Bazooka       (CKH 10769'),
(196, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH5355        (CKH 10692)'),
(197, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE 2101'),
(198, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE 2103'),
(199, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE 2104'),
(200, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE 2106'),
(201, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH 5402'),
(202, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WH401'),
(203, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WH505'),
(204, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH5556 (Super)       Naromaize 56'),
(205, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH5557       Naromaize 57'),
(206, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH5403       Naromaize 3'),
(207, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SC637'),
(208, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SC719'),
(209, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE1101'),
(210, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE3103'),
(211, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE3106'),
(212, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE3109'),
(213, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN7M-81'),
(214, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN7M-83'),
(215, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN4M-23'),
(216, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'VITAMU40       (Ex3152)'),
(217, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'VITAMU50        (Ex0629)'),
(218, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'PAN4M-21'),
(219, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'MH501(HODARI)'),
(220, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'MH502(FAIDA)'),
(221, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SY624'),
(222, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SY634'),
(223, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'NAROMAIZE 731'),
(224, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'NAROMAIZE 733'),
(225, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'NAROMAIZE58IR      (CKHRM1212)'),
(226, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'NAROMAIZE59IR       (CKHRM 1219)'),
(227, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'NAROMAIZE60IR       (CKHRM 13580)'),
(228, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE 5117'),
(229, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WE 6103'),
(230, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'ADV2309'),
(231, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'ADV 2310'),
(232, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH5961'),
(233, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'UH5962'),
(234, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SC301 (COMESA)'),
(235, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SC403 (COMESA)'),
(236, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SC513  (COMESA)'),
(237, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'SC529 (COMESA)'),
(238, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WH101 (COMESA)'),
(239, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WH 504    (COMESA)'),
(240, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WH 507  (COMESA)'),
(241, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WH 509 (COMESA)'),
(242, '2022-03-24 17:36:32', '2022-03-24 17:36:32', 9, 'WH 605 (COMESA)'),
(243, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'Serena (P127 x 1) Dobbs'),
(244, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'Seredo (5 D x 135/13)'),
(245, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'Sekedo (E525 Ht. Red)'),
(246, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'Epuripur (2Kx 17/B/1)'),
(247, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'SESO 1'),
(248, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'SESO 2'),
(249, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'SESO 3'),
(250, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'NAROSORG 1 (ISCR160)'),
(251, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'NAROSORG 2 (IS8193)'),
(252, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'NAROSORG 3(IESV92043DL)'),
(253, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'NAROSORG 4 (GE17/1/2013A)'),
(254, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'PAC 501'),
(255, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'PAC 537'),
(256, '2022-03-24 17:47:55', '2022-03-24 17:47:55', 10, 'SC Silla (COMESA)'),
(257, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'Abilony   (IRAT 112)'),
(258, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'UK-2     (2228)'),
(259, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'NP-3    (2995)'),
(260, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'NP-2    (5881)'),
(261, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'NARIC 1    (ITA 257)'),
(262, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'NARIC 11   (ITA 325)'),
(263, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'NARIC 111    (WAB 450)'),
(264, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'SUPERICA 1    (WABC 165)'),
(265, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'NERICA 1'),
(266, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'NERICA 4'),
(267, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'NERICA 10'),
(268, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'Namche 1'),
(269, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'Namche 2'),
(270, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'Namche 3'),
(271, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'Namche 4'),
(272, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'NERICA 6'),
(273, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'Komboka'),
(274, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'Okile'),
(275, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'Agoro'),
(276, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'WITA 9'),
(277, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'DU 363-2'),
(278, '2022-03-24 18:04:37', '2022-03-24 18:04:37', 11, 'ARIZE 6444 GOLD'),
(279, '2022-03-24 18:16:58', '2022-03-24 18:16:58', 13, 'NAROSnBe1 (J 12)'),
(280, '2022-03-24 18:16:58', '2022-03-24 18:16:58', 13, 'NAROSnBe2 (SB 001)'),
(281, '2022-03-24 18:16:58', '2022-03-24 18:16:58', 13, 'NAROSnBe3 (SB004)'),
(282, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 14, 'Kenya Chiriku'),
(283, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 14, 'Pasa'),
(284, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 14, 'Nkungu'),
(285, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 14, 'Karne'),
(286, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 14, 'Sabiny'),
(287, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 14, 'Narowheat1 (BUG1)'),
(288, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 14, 'Narowheat2 (BUG2)'),
(289, '2022-03-24 18:23:42', '2022-03-24 18:23:42', 14, 'Narowheat 3 (BUG3)'),
(290, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Engenyi'),
(291, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Gulu E'),
(292, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Serere 1'),
(293, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Pese 1 (P224)'),
(294, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Seremi 1 (P249) (Pese 11)'),
(295, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Seremi 2 (U 15)'),
(296, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Seremi 3 (Sx 17-88)'),
(297, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Naromill 1 (FMS387)'),
(298, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Naromill 2 (FMS376)'),
(299, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Naromill 3 (FMS72)'),
(300, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Naromill 4 (IE2440)'),
(301, '2022-03-24 18:31:01', '2022-03-24 18:31:01', 15, 'Naromill 5 (SEC915)'),
(302, '2022-03-24 18:46:26', '2022-03-24 18:46:26', 16, 'Serere Comp. 1'),
(303, '2022-03-24 18:46:26', '2022-03-24 18:46:26', 16, 'Serere Comp. 2'),
(304, '2022-03-24 18:46:26', '2022-03-24 18:46:26', 16, 'ICMV 225'),
(305, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'New Sunfola'),
(306, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'PAN 7351'),
(307, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'DK 4040'),
(308, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'AGSUN 8251'),
(309, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'SNF 68 – 22'),
(310, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'PAN 7369'),
(311, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'PAN 7033'),
(312, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'PAN 7034'),
(313, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'SESUN 1 H'),
(314, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'SESUN 2 H'),
(315, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'NS 10'),
(316, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'NS 14'),
(317, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'EASF – 1 (KBSH)'),
(318, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'EASF – 2 (KBSH)'),
(319, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'PAN 7057'),
(320, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'PAN 7049'),
(321, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'NK FERTI'),
(322, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'SY 4045'),
(323, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'SY 4200'),
(324, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'NK TUTTI'),
(325, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'PAN7158H0'),
(326, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'AGUARA 4'),
(327, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'AGUARA 6'),
(328, '2022-03-24 19:00:35', '2022-03-24 19:00:35', 17, 'HYSUN 33'),
(329, '2022-03-24 19:05:23', '2022-03-24 19:05:23', 18, 'SEPI 1 (KAT 60/80)'),
(330, '2022-03-24 19:05:23', '2022-03-24 19:05:23', 18, 'SEPI 2 (KPL 87091)'),
(331, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'SECOW I T'),
(332, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'SECOW 2 W'),
(333, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'CP KUNDE'),
(334, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'CP WHITE'),
(335, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'SECOW 3B'),
(336, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'SECOW 4 W'),
(337, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'SECOW 5T'),
(338, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'NAROCOW1'),
(339, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'NAROCOW2'),
(340, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'NAROCOW3'),
(341, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'NAROCOW4'),
(342, '2022-03-24 19:14:44', '2022-03-24 19:14:44', 19, 'NAROCOW5'),
(343, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'Bukalasa II'),
(344, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'Embwa-Natereka'),
(345, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'BOA'),
(346, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE I (TMS 60142)'),
(347, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 2 (TMS 30337)'),
(348, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 3 (TMS 30572)'),
(349, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 4 (SS4)'),
(350, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 5 (SS5)'),
(351, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 6 (TMS 4(2)1425)'),
(352, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 7 (CE 85)'),
(353, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 8 (CE 98)'),
(354, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 9 (30555-17)'),
(355, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 10 (95/NA 00063)'),
(356, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 11 (29/NA 2TC 1)'),
(357, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 12 (MH95/0414)'),
(358, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 13'),
(359, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 14'),
(360, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 15'),
(361, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 16'),
(362, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 17'),
(363, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 18'),
(364, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NASE 19'),
(365, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NAROCASS 1 Tz/130'),
(366, '2022-03-24 19:31:34', '2022-03-24 19:31:34', 20, 'NAROCASS 2 MM 06/130'),
(367, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'Wagabolige'),
(368, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'Tanzania (TZ)'),
(369, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'Bwanjule (No.29)'),
(370, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'Tororo 3 (T3)'),
(371, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'Sowola (389A)'),
(372, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'New Kawogo (NKA)'),
(373, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NASPOT  1 (NIS/91/52)'),
(374, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NASPOT  2'),
(375, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NASPOT  3'),
(376, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NASPOT  4 (NIS/91/282)'),
(377, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NASPOT  5 (NIS/91/316)'),
(378, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NASPOT  6 (NIS/91/324)'),
(379, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NASPOT 11 (NKA 1081L)'),
(380, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NASPOT 12-o'),
(381, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NASPOT 13-o'),
(382, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NAROSPOT 1 (New Dimbuka)'),
(383, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NAROSPOT 2 (NAs 7/2006/1139)'),
(384, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NAROSPOT 3 (NK318L/2011/5695)'),
(385, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NAROSPOT 4 (NAS 7/2006/1160)'),
(386, '2022-03-24 21:11:36', '2022-03-24 21:11:36', 21, 'NAROSPOT 5 (SPK004/2006/229)'),
(387, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Malirahinda'),
(388, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Victoria 381381.2'),
(389, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Kisoro 381379.9'),
(390, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Kabale 374080.5'),
(391, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'NAKPOT 1 (382171.4)'),
(392, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'NAKPOT 2 (381403.8)'),
(393, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'NAKPOT 3 (575049)'),
(394, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'NAKPOT 4 (387121.4)'),
(395, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'NAKPOT 5 (381471.18)'),
(396, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'KACHPOT1 393382.14'),
(397, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'KACHPOT2 393385.39'),
(398, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'NAROPOT 1 396038.107'),
(399, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'NAROPOT 2 396280.82'),
(400, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'NAROPOT 3 396034.103'),
(401, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Arizona'),
(402, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Elmundo'),
(403, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Sagitta'),
(404, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Markies'),
(405, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Connect'),
(406, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Sarpomira'),
(407, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'Voyager'),
(408, '2022-03-24 21:22:07', '2022-03-24 21:22:07', 22, 'NAROPOT 4 (Rwangume)'),
(409, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'KABANA  1H (FHIA 01)'),
(410, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'KABANA  2H (FHIA 03)'),
(411, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'KABANA  3H (FHIA 17)'),
(412, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'KABANA  4H (FHIA 23)'),
(413, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'KABANA  5 (YAGAMBI)'),
(414, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'KABANA 6 H (Kiwangazi)'),
(415, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'KABANA 7 H'),
(416, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'NAROBAN 1 (M19)'),
(417, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'NAROBAN 2 (M20)'),
(418, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'NAROBAN 3 (M25)'),
(419, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'NAROBAN4 (M27)'),
(420, '2022-03-24 21:29:34', '2022-03-24 21:29:34', 23, 'NAROBAN 5'),
(421, '2022-03-24 21:32:02', '2022-03-24 21:32:02', 24, '1.	Golden Dorsett'),
(422, '2022-03-24 21:32:02', '2022-03-24 21:32:02', 24, '2.	Anna'),
(423, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, 'Erecta Unknown 20'),
(424, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, 'Erecta Unknown 14'),
(425, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, '2/22/12'),
(426, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, 'J1/14/21/1'),
(427, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, 'J/1/1'),
(428, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, 'Q3/4'),
(429, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, 'R/1/4'),
(430, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, 'KR 1 3/15/1'),
(431, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, 'KR2 2/22/2'),
(432, '2022-03-24 21:38:57', '2022-03-24 21:38:57', 25, 'KR3 245/21/5'),
(433, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CZL00003/CML488'),
(434, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKL05019'),
(435, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CZL00003/CML444'),
(436, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKL05003'),
(437, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKL05022'),
(438, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML442/CML444'),
(439, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKL020022'),
(440, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKL05003/CKL05007'),
(441, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML536'),
(442, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKL05003/CKL05022'),
(443, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML312/CML444'),
(444, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML550'),
(445, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CZL0810/CML312'),
(446, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML443'),
(447, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML202/CML395'),
(448, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'NML88'),
(449, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML312/CML442'),
(450, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'NML97'),
(451, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML202/CML206'),
(452, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML206'),
(453, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML202/CML216'),
(454, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML312'),
(455, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML202/CML395'),
(456, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML389'),
(457, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'NML85'),
(458, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML202/CML216'),
(459, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML216'),
(460, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML312/CML442'),
(461, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'WL118-6'),
(462, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'WL429-40'),
(463, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML444/CML489'),
(464, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CZL00814'),
(465, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'ECAVL1/ECAVL18'),
(466, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'ECAVL18'),
(467, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'ECAVL2/ECAVL17'),
(468, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'ECAVL17'),
(469, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'ECAVL2/ECAVL18'),
(470, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'ECAVL18'),
(471, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML395/CML444'),
(472, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0250'),
(473, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML312/CML442'),
(474, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0165'),
(475, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKLDL0228'),
(476, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0374'),
(477, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0333'),
(478, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0089'),
(479, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML312/CML395'),
(480, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CZL054(CML548)'),
(481, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CZL00003(CML547)'),
(482, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0089'),
(483, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKKDHL0323'),
(484, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0159'),
(485, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0089'),
(486, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0165'),
(487, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0350'),
(488, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKDHL0109'),
(489, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML78/P300C5S1B-2-3-2#-#-1-2-B-B-#/CKDHL0089'),
(490, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML78/P300C5S1B-2-3-2#-#-1-2-B-B-#/CKDHL0323'),
(491, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML312/CML395'),
(492, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML539/CML442'),
(493, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML312/CML444'),
(494, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML395'),
(495, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML312'),
(496, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML444'),
(497, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML539'),
(498, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML442'),
(499, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML78'),
(500, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'ECAVL1'),
(501, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'ECAVL2'),
(502, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML489'),
(503, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML202'),
(504, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML216'),
(505, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CZL0810'),
(506, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKL05003'),
(507, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CKL05007'),
(508, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CZL00003'),
(509, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML488'),
(510, '2022-03-27 01:26:02', '2022-03-27 01:26:02', 26, 'CML444');

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
  `source_of_seed` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_size` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seed_rate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_receipt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector` int(11) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_from` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT '2021-01-01',
  `valid_until` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2021-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_crop_declarations`
--

INSERT INTO `form_crop_declarations` (`id`, `created_at`, `updated_at`, `administrator_id`, `form_qd_id`, `source_of_seed`, `field_size`, `seed_rate`, `amount`, `payment_receipt`, `status`, `inspector`, `status_comment`, `valid_from`, `valid_until`) VALUES
(1, '2022-02-21 07:06:49', '2022-02-21 07:09:11', 3, 3, 'isaac mbabazi', '100', '10', '20000', 'ec2ee90688b64aed07c58b3607354aa2.jpeg', '5', 20, NULL, '2021-01-01', '2022-01-01');

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
(4, '2021-11-09 05:19:35', '2021-11-09 05:19:35', 2, 4),
(5, '2022-02-21 07:06:49', '2022-02-21 07:06:49', 1, 3);

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
  `premises_location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_of_expirience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealers_in` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_grower_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cropping_histroy` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_isolation` tinyint(4) DEFAULT NULL,
  `have_adequate_labor` tinyint(4) DEFAULT NULL,
  `aware_of_minimum_standards` tinyint(4) DEFAULT NULL,
  `signature_of_applicant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grower_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector` int(11) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(6, '2022-04-28 12:00:58', '2022-04-28 12:00:58', 99, 'MUYINGO ALI', 'Kampala', NULL, 'Gayaaza', '3', '[{\"crop\":\"Maize\",\"variety\":\"Long4\",\"ha\":\"T\",\"origin\":\"Buganda\"}]', NULL, 'Virgine land', 0, 0, 1, 'files/SMALL ENTRPRISE   MANGT NOTES.doc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL),
(7, '2022-05-18 12:43:29', '2022-05-18 12:43:29', 106, 'Kalule Kusain', 'Rubaga', NULL, 'mengo', '-9', '[{\"crop\":\"cow\",\"variety\":\"cow\",\"ha\":\"ddd\",\"origin\":\"dddd\"},{\"crop\":\"sheep\",\"variety\":\"sheep\",\"ha\":\"ddd\",\"origin\":\"ddd\"}]', NULL, '2155555561981989812132121988/561616168131318125313', 0, 1, 1, 'files/63d245add734cac0dfd731a33eaa68d2.gif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, -13, 0, NULL, NULL);

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
  `premises_location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_of_expirience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expirience_in` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealers_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_of` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketing_of` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_land` tinyint(4) DEFAULT NULL,
  `land_size` int(11) DEFAULT NULL,
  `eqipment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_equipment` tinyint(4) DEFAULT NULL,
  `have_contractual_agreement` tinyint(4) DEFAULT NULL,
  `have_adequate_field_officers` tinyint(4) DEFAULT NULL,
  `have_conversant_seed_matters` tinyint(4) DEFAULT NULL,
  `souce_of_seed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_land_for_production` tinyint(4) DEFAULT NULL,
  `have_internal_quality_program` tinyint(4) DEFAULT NULL,
  `receipt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accept_declaration` tinyint(4) DEFAULT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector` int(11) DEFAULT NULL,
  `dealers_in_other` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_of_other` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketing_of_other` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `souce_of_seed_other` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_storage` tinyint(4) DEFAULT NULL,
  `seed_board_registration_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_sr4s`
--

INSERT INTO `form_sr4s` (`id`, `created_at`, `updated_at`, `administrator_id`, `name_of_applicant`, `address`, `company_initials`, `premises_location`, `years_of_expirience`, `expirience_in`, `dealers_in`, `processing_of`, `marketing_of`, `have_adequate_land`, `land_size`, `eqipment`, `have_adequate_equipment`, `have_contractual_agreement`, `have_adequate_field_officers`, `have_conversant_seed_matters`, `souce_of_seed`, `have_adequate_land_for_production`, `have_internal_quality_program`, `receipt`, `accept_declaration`, `valid_from`, `valid_until`, `status`, `status_comment`, `inspector`, `dealers_in_other`, `processing_of_other`, `marketing_of_other`, `souce_of_seed_other`, `have_adequate_storage`, `seed_board_registration_number`, `type`) VALUES
(10, '2022-03-23 15:20:59', '2022-03-23 15:27:59', 28, 'Zac Seed Dealers.', 'Kampala', 'ZacSD', 'Namalere', 'Seed Merchant', '12', 'Agricultural crops', 'Agricultural crops', 'Agricultural crops', 1, 100, 'Tractors.', 1, 1, 1, 1, '3', 1, 0, 'files/USAID-logo.jpg', 1, '2022-03-23 15:27:59', '2023-03-23 15:27:59', '5', 'Your application is missing some information.', 27, NULL, NULL, NULL, NULL, 1, 'EXP/2022/0002', 'Seed Merchant'),
(11, '2022-05-20 10:01:59', '2022-05-20 10:01:59', 106, 'Kalule Kusain', 'Rubaga', '6666', 'mengo', 'Seed Merchant', '-5', 'Agricultural crops', 'Agricultural crops', 'Agricultural crops', 0, NULL, NULL, 0, 0, 0, 1, '1', 1, 1, 'files/a9e65ee721afcdddf5a23015f6409d1d.gif', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'Seed Merchant');

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
  `premises_location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_of_expirience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dealers_in` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_grower_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cropping_histroy` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_isolation` tinyint(4) DEFAULT NULL,
  `have_adequate_labor` tinyint(4) DEFAULT NULL,
  `aware_of_minimum_standards` tinyint(4) DEFAULT NULL,
  `signature_of_applicant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grower_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector` int(11) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_adequate_storage` tinyint(4) DEFAULT NULL,
  `seed_grower_in_past` tinyint(4) DEFAULT NULL,
  `type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_sr6s`
--

INSERT INTO `form_sr6s` (`id`, `created_at`, `updated_at`, `administrator_id`, `name_of_applicant`, `address`, `company_initials`, `premises_location`, `years_of_expirience`, `dealers_in`, `previous_grower_number`, `cropping_histroy`, `have_adequate_isolation`, `have_adequate_labor`, `aware_of_minimum_standards`, `signature_of_applicant`, `grower_number`, `registration_number`, `valid_from`, `valid_until`, `status`, `inspector`, `status_comment`, `have_adequate_storage`, `seed_grower_in_past`, `type`) VALUES
(71, '2022-05-09 13:59:26', '2022-05-31 10:54:30', 103, 'H.C.V REDDY', 'PLOT 888 & 2981 BOMBO RAOD KAWEMPE, P.O. BOX 3678 KAMPALA - UGANDA', NULL, 'PLOT 888 & 2981 BOMBO RAOD KAWEMPE', '22', '[]', '008', 'Beans', 1, 1, 1, 'files/Syova - Seed Certificate 2021.pdf', '008', NULL, '2022-01-01 05:00:00', '2022-12-31 05:00:00', '5', 30, NULL, 1, 1, 'Company'),
(72, '2022-05-16 10:14:22', '2022-05-31 10:55:45', 105, 'Crown Seeds Ltd', 'P.O Box 293 Mukono, Kayunga Road', NULL, 'Mpoma, Mukono, Kayunga Rd.', '5', '[]', '068', 'The fields have been in crop rotation between legume and cereal seeds in different farms across the country', 1, 1, 1, 'files/Seed Grower Certificate.pdf', '068', NULL, '2022-01-01 05:00:00', '2022-12-31 05:00:00', '5', 30, NULL, 1, 1, 'Company'),
(73, '2022-05-17 13:53:04', '2022-05-31 10:58:35', 108, 'Grow More Seeds and Chemicals Ltd', 'plot 21, Luthuli Avenue, Bugolobi', NULL, 'plot 21, Luthuli Avenue, Bugolobi', '14', '[]', '023', 'Virgin Land', 1, 1, 1, NULL, '023', NULL, '2022-01-01 05:00:00', '2022-12-31 05:00:00', '5', 30, NULL, 1, 1, 'Company'),
(74, '2022-05-18 15:56:47', '2022-05-31 11:07:17', 109, 'Brac  social business enterprises limited', 'P.o.box 31817, clock tower', NULL, 'Nsambya Heritage Road', '15', '[]', NULL, 'crop cultivation: beans, soya beans maize some fields were under  virgin', 1, 1, 1, 'files/MAAIF CERTIFICATE.pdf', '034', NULL, '2022-01-01 05:00:00', '2022-12-31 05:00:00', '5', 30, NULL, 0, 0, 'Company'),
(75, '2022-05-24 13:27:58', '2022-05-31 11:21:31', 102, 'NARO HOLDINGS LIMITED', 'KIRYANDONGO DISTRICT', NULL, 'KIGUMBA. 2 km along Kigumba - masindi road.', '5', '[]', NULL, 'we have a seed farm where we are growing seeds of different crops like maize (hybrid and OPV\'s, soyabean, beans, ground nuts among others.\r\nwe recommend rotation patterns in seed production.\r\nwe also produce through out-growers (individual commercial farmers or groups) and NARO Institutes.', 1, 1, 1, 'files/NHL_Certificate_of_Incorporation[1] (1).pdf', '000', NULL, '2022-01-01 05:00:00', '2022-12-31 05:00:00', '5', 30, NULL, 0, 0, 'Company'),
(76, '2022-05-24 14:33:37', '2022-05-31 11:33:11', 110, 'Masagazi Richard', '36240', NULL, 'Plot 830 Kasambya, Busukuma Division, 7km Gayaza-Zirobwe Road, Nasaana Municipality , Wakiso District', '12', '[]', '028', 'Kamira-Luwero', 1, 1, 1, 'files/Licence to Seed.pdf', '028', NULL, '2022-01-01 05:00:00', '2022-12-31 05:00:00', '5', 30, NULL, 1, 1, 'Company');

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
(1, 68, 6, '2022-04-28 12:37:40', '2022-04-28 12:37:40'),
(2, 54, 6, '2022-04-28 12:51:24', '2022-04-28 12:51:24'),
(3, 54, 8, '2022-04-28 12:55:15', '2022-04-28 12:55:15'),
(4, 72, 6, '2022-05-16 10:14:22', '2022-05-16 10:14:22'),
(5, 72, 7, '2022-05-16 10:14:22', '2022-05-16 10:14:22'),
(6, 72, 5, '2022-05-16 10:14:22', '2022-05-16 10:14:22'),
(7, 72, 3, '2022-05-16 10:14:22', '2022-05-16 10:14:22'),
(8, 72, 9, '2022-05-16 10:14:22', '2022-05-16 10:14:22'),
(9, 72, 26, '2022-05-16 10:14:22', '2022-05-16 10:14:22'),
(10, 72, 11, '2022-05-16 10:14:22', '2022-05-16 10:14:22'),
(11, 72, 10, '2022-05-16 10:14:22', '2022-05-16 10:14:22'),
(12, 72, 8, '2022-05-16 10:14:22', '2022-05-16 10:14:22'),
(13, 72, 19, '2022-05-16 10:14:22', '2022-05-16 10:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `form_sr10s`
--

CREATE TABLE `form_sr10s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `planting_return_id` bigint(20) UNSIGNED NOT NULL,
  `stage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submited_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `administrator_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `is_done` tinyint(4) NOT NULL DEFAULT 0,
  `is_initialized` tinyint(4) DEFAULT NULL,
  `valid_from` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT '2021-01-01',
  `valid_until` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2021-01-01',
  `approve_by_farmer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `planting_return_crop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seed_class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_of_field` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `off_types` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diseases` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noxious_weeds` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_weeds` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isolation_distance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variety` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proposed_distance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `general_conditions_of_crop` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_yield` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `futher_remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sr10_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_final` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_sr10s`
--

INSERT INTO `form_sr10s` (`id`, `created_at`, `updated_at`, `planting_return_id`, `stage`, `status`, `status_comment`, `submited_date`, `min_date`, `max_date`, `administrator_id`, `is_active`, `is_done`, `is_initialized`, `valid_from`, `valid_until`, `approve_by_farmer`, `farmer_id`, `planting_return_crop_name`, `seed_class`, `size_of_field`, `off_types`, `diseases`, `noxious_weeds`, `other_features`, `other_weeds`, `isolation_distance`, `variety`, `proposed_distance`, `general_conditions_of_crop`, `estimated_yield`, `futher_remarks`, `sr10_number`, `is_final`) VALUES
(11, '2022-04-28 13:35:02', '2022-04-28 13:35:02', 1, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 0, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2022-04-28 13:35:02', '2022-04-28 13:35:02', 1, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 0, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2022-04-28 13:37:56', '2022-04-28 16:56:29', 2, 'Pre-flowering', '17', 'asas', '2022-04-28', '2022-05-28', NULL, 20, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2022-04-28 13:37:56', '2022-04-28 16:56:41', 2, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 20, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2022-04-28 13:37:56', '2022-04-28 16:56:50', 2, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 20, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '46502651', 1),
(16, '2022-04-28 15:53:10', '2022-04-28 15:53:26', 6, 'Pre-flowering', '17', 'asas', '2022-04-28', '2022-05-28', NULL, 20, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2022-04-28 15:53:10', '2022-04-28 15:53:36', 6, 'Flowering', '17', 'asas', '2022-04-28', '2022-06-12', NULL, 20, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asas', NULL, NULL),
(18, '2022-04-28 15:53:10', '2022-04-28 15:53:44', 6, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 20, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asasas', '71070252', 1),
(19, '2022-04-28 16:33:08', '2022-04-28 17:01:10', 92, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2022-04-28 16:33:08', '2022-04-28 17:01:26', 92, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2022-04-28 16:33:08', '2022-04-28 17:01:47', 92, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '92327353', 1),
(22, '2022-04-28 16:33:44', '2022-04-28 17:01:32', 9, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2022-04-28 16:33:44', '2022-04-28 17:02:07', 9, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '2022-04-28 16:33:44', '2022-04-28 17:02:33', 9, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32886026', 1),
(25, '2022-04-28 16:34:37', '2022-04-28 17:02:42', 4, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '2022-04-28 16:34:37', '2022-04-28 17:03:24', 4, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '2022-04-28 16:34:37', '2022-04-28 17:03:50', 4, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '80711656', 1),
(28, '2022-04-28 16:35:22', '2022-04-28 17:02:59', 22, 'pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '2022-04-28 16:35:22', '2022-04-28 17:04:12', 22, 'flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '2022-04-28 16:35:22', '2022-04-28 17:04:31', 22, 'pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6830906', 1),
(31, '2022-04-28 16:35:23', '2022-04-28 17:10:33', 5, 'Pre-flowering', '17', 'drougt', '2022-04-28', '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'black african army worm', NULL, NULL),
(32, '2022-04-28 16:35:23', '2022-04-28 16:35:23', 5, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '2022-04-28 16:35:23', '2022-04-28 16:35:23', 5, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '2022-04-28 16:35:50', '2022-04-28 17:03:07', 15, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, '2022-04-28 16:35:50', '2022-04-28 17:03:35', 15, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, 'Basic seed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '2022-04-28 16:35:50', '2022-04-28 17:03:53', 15, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22275505', 1),
(37, '2022-04-28 16:36:18', '2022-04-28 17:04:55', 12, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '2022-04-28 16:36:18', '2022-04-28 17:05:41', 12, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '2022-04-28 16:36:18', '2022-04-28 17:08:32', 12, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '88455946', 1),
(40, '2022-04-28 16:36:31', '2022-04-28 17:16:42', 7, 'Pre-flowering', '4', 'weaviled', '2022-04-28', '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '2022-04-28 16:36:31', '2022-04-28 16:36:31', 7, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, '2022-04-28 16:36:31', '2022-04-28 16:36:31', 7, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '2022-04-28 16:36:57', '2022-04-28 17:08:45', 17, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '2022-04-28 16:36:57', '2022-04-28 17:15:01', 17, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, '2022-04-28 16:36:57', '2022-04-28 17:17:46', 17, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13865690', 1),
(46, '2022-04-28 16:37:13', '2022-04-28 17:06:17', 11, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '2022-04-28 16:37:13', '2022-04-28 17:17:41', 11, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '2022-04-28 16:37:13', '2022-04-28 17:18:51', 11, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'good', '18590451', 1),
(49, '2022-04-28 16:37:38', '2022-04-28 17:04:36', 10, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, '2022-04-28 16:37:38', '2022-04-28 17:16:59', 10, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, '2022-04-28 16:37:38', '2022-04-28 16:37:38', 10, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, '2022-04-28 16:38:24', '2022-04-28 17:14:41', 21, '5', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '16498102', 1),
(53, '2022-04-28 16:38:51', '2022-04-28 17:05:44', 32, '5', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '25993078', 1),
(54, '2022-04-28 16:39:19', '2022-04-28 17:06:00', 16, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, '2022-04-28 16:39:19', '2022-04-28 17:12:54', 16, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, '2022-04-28 16:39:19', '2022-04-28 16:39:19', 16, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, '2022-04-28 16:39:24', '2022-04-28 17:05:08', 31, 'pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, '2022-04-28 16:39:25', '2022-04-28 17:05:27', 31, 'flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, '2022-04-28 16:39:25', '2022-04-28 16:39:25', 31, 'pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, '2022-04-28 16:39:41', '2022-04-28 17:02:49', 23, 'Pre-flowering', '7', '', '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, '2022-04-28 16:39:41', '2022-04-28 17:03:31', 23, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, '2022-04-28 16:39:41', '2022-04-28 17:18:23', 23, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '55732210', 1),
(63, '2022-04-28 16:39:53', '2022-04-28 17:15:30', 33, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, '2022-04-28 16:39:53', '2022-04-28 17:18:44', 33, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, '2022-04-28 16:39:53', '2022-04-28 16:39:53', 33, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, '2022-04-28 16:40:13', '2022-04-28 17:13:15', 14, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, '2022-04-28 16:40:14', '2022-04-28 16:40:14', 14, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, '2022-04-28 16:40:14', '2022-04-28 16:40:14', 14, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, '2022-04-28 16:40:23', '2022-04-28 17:05:49', 30, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, '2022-04-28 16:40:23', '2022-04-28 17:09:02', 30, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '2022-04-28 16:40:23', '2022-04-28 17:12:07', 30, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30709542', 1),
(72, '2022-04-28 16:40:27', '2022-04-28 17:14:16', 13, '5', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30260580', 1),
(73, '2022-04-28 16:40:53', '2022-04-28 17:16:38', 27, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '2022-04-28 16:40:53', '2022-04-28 17:31:09', 27, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '2022-04-28 16:40:53', '2022-04-28 17:32:29', 27, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '41518188', 1),
(76, '2022-04-28 16:41:02', '2022-04-28 17:06:19', 18, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, '2022-04-28 16:41:02', '2022-04-28 17:13:52', 18, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '2022-04-28 16:41:02', '2022-04-28 17:19:07', 18, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17313706', 1),
(79, '2022-04-28 16:41:21', '2022-04-28 17:01:48', 20, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, '2022-04-28 16:41:21', '2022-04-28 17:10:57', 20, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, '2022-04-28 16:41:21', '2022-04-28 16:41:21', 20, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, '2022-04-28 16:41:58', '2022-04-28 17:08:08', 34, '5', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8561677', 1),
(83, '2022-04-28 16:42:14', '2022-04-28 16:42:14', 24, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, '2022-04-28 16:42:14', '2022-04-28 16:42:14', 24, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, '2022-04-28 16:42:14', '2022-04-28 16:42:14', 24, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, '2022-04-28 16:42:28', '2022-04-28 16:42:28', 28, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '2022-04-28 16:42:28', '2022-04-28 16:42:28', 28, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, '2022-04-28 16:42:28', '2022-04-28 16:42:28', 28, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, '2022-04-28 16:42:47', '2022-04-28 16:42:47', 25, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, '2022-04-28 16:42:47', '2022-04-28 16:42:47', 25, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, '2022-04-28 16:42:47', '2022-04-28 16:42:47', 25, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, '2022-04-28 16:43:37', '2022-04-28 16:43:37', 44, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, '2022-04-28 16:43:37', '2022-04-28 16:43:37', 44, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, '2022-04-28 16:43:37', '2022-04-28 16:43:37', 44, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, '2022-04-28 16:44:08', '2022-04-28 16:44:08', 29, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, '2022-04-28 16:44:08', '2022-04-28 16:44:08', 29, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, '2022-04-28 16:44:08', '2022-04-28 16:44:08', 29, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, '2022-04-28 16:45:18', '2022-04-28 17:24:22', 37, '5', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32435505', 1),
(99, '2022-04-28 16:45:26', '2022-04-28 16:45:26', 36, 'pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, '2022-04-28 16:45:26', '2022-04-28 16:45:26', 36, 'flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, '2022-04-28 16:45:26', '2022-04-28 16:45:26', 36, 'pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, '2022-04-28 16:45:53', '2022-04-28 17:15:03', 38, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, '2022-04-28 16:45:53', '2022-04-28 17:16:01', 38, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, '2022-04-28 16:45:53', '2022-04-28 16:45:53', 38, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, '2022-04-28 16:46:16', '2022-04-28 16:46:16', 39, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, '2022-04-28 16:46:16', '2022-04-28 16:46:16', 39, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, '2022-04-28 16:46:16', '2022-04-28 16:46:16', 39, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, '2022-04-28 16:46:42', '2022-04-28 17:07:32', 40, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, '2022-04-28 16:46:42', '2022-04-28 17:16:17', 40, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, '2022-04-28 16:46:42', '2022-04-28 16:46:42', 40, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, '2022-04-28 16:47:04', '2022-04-28 17:02:17', 41, 'Pre-flowering', '7', '', '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, '2022-04-28 16:47:04', '2022-04-28 17:07:21', 41, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, '2022-04-28 16:47:04', '2022-04-28 17:07:51', 41, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '40683661', 1),
(114, '2022-04-28 16:47:25', '2022-04-28 17:31:58', 42, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, '2022-04-28 16:47:25', '2022-04-28 16:47:25', 42, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, '2022-04-28 16:47:25', '2022-04-28 16:47:25', 42, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, '2022-04-28 16:47:53', '2022-04-28 17:10:38', 45, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, '2022-04-28 16:47:53', '2022-04-28 16:47:53', 45, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, '2022-04-28 16:47:53', '2022-04-28 16:47:53', 45, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, '2022-04-28 16:48:48', '2022-04-28 17:06:37', 51, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, '2022-04-28 16:48:48', '2022-04-28 17:07:09', 51, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, '2022-04-28 16:48:48', '2022-04-28 17:07:21', 51, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6268925', 1),
(123, '2022-04-28 16:48:49', '2022-04-28 17:06:51', 46, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, '2022-04-28 16:48:49', '2022-04-28 17:07:34', 46, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, '2022-04-28 16:48:49', '2022-04-28 17:07:46', 46, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '52889777', 1),
(126, '2022-04-28 16:49:51', '2022-04-28 17:07:58', 70, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, '2022-04-28 16:49:51', '2022-04-28 17:08:13', 70, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, '2022-04-28 16:49:51', '2022-04-28 17:08:28', 70, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '79605299', 1),
(129, '2022-04-28 16:49:53', '2022-04-28 17:08:41', 47, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, '2022-04-28 16:49:53', '2022-04-28 17:08:57', 47, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, '2022-04-28 16:49:53', '2022-04-28 17:09:10', 47, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '39196861', 1),
(132, '2022-04-28 16:50:30', '2022-04-28 17:09:29', 71, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, '2022-04-28 16:50:30', '2022-04-28 17:09:44', 71, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, '2022-04-28 16:50:30', '2022-04-28 17:09:56', 71, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22773948', 1),
(135, '2022-04-28 16:50:41', '2022-04-28 17:10:15', 54, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, '2022-04-28 16:50:41', '2022-04-28 17:10:29', 54, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, '2022-04-28 16:50:41', '2022-04-28 17:10:42', 54, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '51841572', 1),
(138, '2022-04-28 16:51:02', '2022-04-28 17:10:57', 48, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, '2022-04-28 16:51:02', '2022-04-28 17:11:19', 48, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, '2022-04-28 16:51:02', '2022-04-28 17:11:28', 48, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '99894904', 1),
(141, '2022-04-28 16:51:22', '2022-04-28 17:11:42', 49, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, '2022-04-28 16:51:22', '2022-04-28 17:11:55', 49, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, '2022-04-28 16:51:22', '2022-04-28 17:12:06', 49, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10700714', 1),
(144, '2022-04-28 16:51:51', '2022-04-28 17:12:22', 57, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, '2022-04-28 16:51:51', '2022-04-28 17:12:39', 57, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, '2022-04-28 16:51:51', '2022-04-28 17:12:54', 57, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '26610542', 1),
(147, '2022-04-28 16:52:30', '2022-04-28 17:13:05', 67, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, '2022-04-28 16:52:30', '2022-04-28 17:13:26', 67, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, '2022-04-28 16:52:30', '2022-04-28 16:52:30', 67, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, '2022-04-28 16:52:58', '2022-04-28 16:52:58', 52, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, '2022-04-28 16:52:58', '2022-04-28 16:52:58', 52, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, '2022-04-28 16:52:58', '2022-04-28 16:52:58', 52, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, '2022-04-28 16:52:59', '2022-04-28 16:52:59', 68, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, '2022-04-28 16:52:59', '2022-04-28 16:52:59', 68, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, '2022-04-28 16:52:59', '2022-04-28 16:52:59', 68, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, '2022-04-28 16:53:43', '2022-04-28 16:53:43', 53, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, '2022-04-28 16:53:43', '2022-04-28 16:53:43', 53, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, '2022-04-28 16:53:43', '2022-04-28 16:53:43', 53, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, '2022-04-28 16:55:01', '2022-04-28 17:13:54', 58, 'pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 27, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, '2022-04-28 16:55:01', '2022-04-28 16:55:01', 58, 'flowering', '1', '', NULL, '2022-06-12', NULL, 27, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, '2022-04-28 16:55:01', '2022-04-28 16:55:01', 58, 'pre-harvest', '1', '', NULL, '2022-06-27', NULL, 27, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, '2022-04-28 17:15:23', '2022-04-28 17:16:35', 99, 'Pre-flowering', '17', NULL, '2022-04-28', '2022-05-28', NULL, 20, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, '2022-04-28 17:15:23', '2022-04-28 17:16:49', 99, 'Flowering', '17', NULL, '2022-04-28', '2022-06-12', NULL, 20, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, '2022-04-28 17:15:23', '2022-04-28 17:17:06', 99, 'Pre-harvest', '5', '', '2022-04-28', '2022-06-27', NULL, 20, 0, 1, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4780978', 1),
(165, '2022-04-28 17:15:56', '2022-04-28 17:15:56', 100, 'Pre-flowering', '1', '', NULL, '2022-05-28', NULL, 20, 1, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, '2022-04-28 17:15:56', '2022-04-28 17:15:56', 100, 'Flowering', '1', '', NULL, '2022-06-12', NULL, 20, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, '2022-04-28 17:15:56', '2022-04-28 17:15:56', 100, 'Pre-harvest', '1', '', NULL, '2022-06-27', NULL, 20, 0, 0, 0, '2021-01-01', '2021-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `seed_class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_of_field` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `off_types` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diseases` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noxious_weeds` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_weeds` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isolation_distance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proposed_distance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `general_conditions_of_crop` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_yield` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `futher_remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planting_return_crop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
  `field_size` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yield` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purity` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `germination` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moisture_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insect_damage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moldiness` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noxious_weeds` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommendation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `inspector` bigint(20) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `examination_category` int(11) NOT NULL DEFAULT 1,
  `administrator_id` bigint(20) NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) DEFAULT 1,
  `seed_class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lot_number` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_stock_examination_requests`
--

INSERT INTO `form_stock_examination_requests` (`id`, `created_at`, `updated_at`, `import_export_permit_id`, `planting_return_id`, `form_qds_id`, `field_size`, `yield`, `date`, `purity`, `germination`, `moisture_content`, `insect_damage`, `moldiness`, `noxious_weeds`, `recommendation`, `status`, `inspector`, `status_comment`, `remarks`, `examination_category`, `administrator_id`, `crop_variety_id`, `seed_class`, `lot_number`) VALUES
(2, '2021-11-08 06:37:29', '2021-11-09 03:50:29', 8, NULL, NULL, NULL, '12000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 20, NULL, 'test', 1, 3, 3, 'Basic seed', '-'),
(3, '2021-11-09 06:50:29', '2021-11-09 06:57:02', 18, NULL, NULL, NULL, '500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 20, NULL, 'test', 1, 3, 4, 'Pre-Basic seed', '-'),
(4, '2022-03-24 13:52:18', '2022-03-24 14:02:15', NULL, 16, NULL, '2.5', '5', '2022-03-24', '98.9', '85', '13.2', 'minimal', 'none', 'none', NULL, 5, 30, NULL, 'Request for stock approval inspection', 2, 31, 1, 'Certified seed', '-'),
(5, '2022-03-24 13:52:59', '2022-03-24 14:00:59', NULL, 22, NULL, '12', '10000', '2022-03-24', '99', '90', '7', 'nil', 'nil', 'nil', NULL, 5, 34, NULL, 'Request for the approval inspection', 2, 33, 1, 'Certified seed', '-'),
(6, '2022-03-24 14:06:36', '2022-03-24 14:08:38', NULL, 25, NULL, '2.5', '5', '2022-03-24', '98.9', '85', '9.4', 'minimal', 'none', 'none', NULL, 5, 30, NULL, 'Stock examinations', 2, 31, 1, 'Certified seed', '-'),
(7, '2022-03-28 16:24:58', '2022-03-28 16:34:32', NULL, 31, NULL, '100', '1000', '2022-03-28', '100', '90', 'None', 'None', '90', 'None', NULL, 5, 27, NULL, 'Please come and do stock approval for my seeds.', 2, 28, 1, 'Basic seed', '-'),
(8, '2022-03-29 11:53:49', '2022-04-04 11:43:13', NULL, 31, NULL, '100', '1000', '2022-04-04', '100', '90', 'None', 'None', '90', 'None', NULL, 5, 27, NULL, 'Please come pick my stock for Lab test', 2, 28, 1, 'Basic seed', '-'),
(9, '2022-04-04 15:52:31', '2022-04-06 12:27:56', NULL, 31, NULL, '12', '11', '2022-04-06', '11', '11', '11', '11', '11', '11', NULL, 5, 27, NULL, 'Stock examination request.', 2, 28, 1, 'Basic seed', '-'),
(10, '2022-04-25 17:09:42', '2022-04-26 11:21:14', NULL, 84, NULL, '40', '30000', '2022-04-29', '96', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'stock is very ok', 2, 41, 1, 'Certified seed', '922767129'),
(11, '2022-04-25 17:11:22', '2022-04-26 11:22:08', NULL, 74, NULL, '12', '28000', '2022-04-14', '98', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'My stock is very ready for inspection', 2, 40, 1, 'Certified seed', '373130064'),
(12, '2022-04-25 17:11:29', '2022-04-26 11:23:00', NULL, 78, NULL, '32', '50000', '2022-04-04', '99', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'Stock ready for inspection', 2, 62, 1, 'Certified seed', '275975020'),
(13, '2022-04-25 17:11:36', '2022-04-26 11:10:59', NULL, 40, NULL, '20', '1000', '2022-04-26', '100', '90', 'None', 'None', '90', 'None', NULL, 5, 20, NULL, 'My crop is ready for stock approval.', 2, 55, 1, 'Basic seed', '255624899'),
(14, '2022-04-25 17:11:40', '2022-04-26 11:19:31', NULL, 75, NULL, '20', '40000', '2022-04-12', '100', '90', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'Nice work', 2, 38, 1, 'Certified seed', '766122306'),
(15, '2022-04-25 17:11:41', '2022-04-26 11:20:31', NULL, 44, NULL, '10', '10000', '2022-04-25', '100', '90', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'crop in crib ready for approval', 2, 39, 1, 'Certified seed', '43852763'),
(16, '2022-04-25 17:11:41', '2022-04-26 11:21:29', NULL, 66, NULL, '20', '20000', '2022-04-19', '100', '90', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'My stock is ready for inspection', 2, 44, 1, 'Certified seed', '713441304'),
(17, '2022-04-25 17:11:42', '2022-04-26 11:22:26', NULL, 87, NULL, '10', '15000', '2022-04-26', '100', '90', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'my crop is ready for inspection', 2, 69, 1, 'Certified seed', '724946468'),
(18, '2022-04-25 17:11:47', '2022-04-26 11:23:16', NULL, 37, NULL, '20', '30000', '2022-04-18', '100', '90', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'stock set for approval', 2, 47, 1, 'Certified seed', '968706070'),
(19, '2022-04-25 17:12:00', '2022-04-26 11:24:18', NULL, 83, NULL, '30', '40000', '2022-04-25', '100', '90', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'my crop is ready for inspection', 2, 56, 1, 'Certified seed', '993300638'),
(20, '2022-04-25 17:12:00', '2022-04-26 11:23:58', NULL, 70, NULL, '60', '80000', '2022-05-05', '99', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'Crop waiting for your approval', 2, 43, 1, 'Certified seed', '822897300'),
(21, '2022-04-25 17:12:05', '2022-04-26 11:19:19', NULL, 52, NULL, '4', '1200', '2022-04-26', '100', '100', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'my stock is ready for approval', 2, 49, 1, 'Basic seed', '138503013'),
(22, '2022-04-25 17:12:16', '2022-04-26 11:20:34', NULL, 74, NULL, '5', '900', '2022-04-26', '100', '100', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'Ready for inspection', 2, 40, 1, 'Pre-Basic seed', '726532607'),
(23, '2022-04-25 17:12:30', '2022-04-26 11:21:27', NULL, 92, NULL, '8', '1500', '2022-04-26', '100', '100', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'My crop is ready for harvesting', 2, 63, 1, 'Pre-Basic seed', '524653210'),
(24, '2022-04-25 17:12:36', '2022-04-26 11:22:15', NULL, 80, NULL, NULL, '2000', '2022-04-26', '100', '100', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'Stock ready for inspection', 2, 62, 1, 'Pre-Basic seed', '313823215'),
(25, '2022-04-25 17:12:43', '2022-04-26 11:23:11', NULL, 55, NULL, '10', '1800', '2022-04-26', '100', '100', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'My stock is ready for examination', 2, 37, 1, 'Pre-Basic seed', '542383164'),
(26, '2022-04-25 17:12:44', '2022-04-26 11:24:16', NULL, 66, NULL, '5', '2400', '2022-04-26', '100', '100', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'ready for nspection', 2, 44, 1, 'Pre-Basic seed', '406050746'),
(27, '2022-04-25 17:12:49', '2022-04-26 11:24:47', NULL, 55, NULL, '38', '55000', '2022-03-28', '97', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'My stock is ready for examination', 2, 37, 1, 'Certified seed', '924728951'),
(28, '2022-04-25 17:12:51', '2022-04-26 11:19:09', NULL, 43, NULL, '5', '50', '2022-03-28', '100', '100', 'none', 'none', 'none', 'none', NULL, 5, 20, NULL, 'stock ready for approval', 2, 47, 1, 'Certified seed', '591377941'),
(29, '2022-04-25 17:12:51', '2022-04-26 11:20:26', NULL, 89, NULL, '11', '80', '2022-03-27', '100', '100', '15', 'noe', 'none', 'none', NULL, 5, 20, NULL, 'my field is ready for inspection', 2, 49, 1, 'Certified seed', '827202373'),
(30, '2022-04-25 17:12:59', '2022-04-26 11:26:03', NULL, 87, NULL, '40', '600000', '2022-04-25', '100', '90', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'Come tomorrow', 2, 69, 1, 'Certified seed', '774107004'),
(31, '2022-04-25 17:13:21', '2022-04-26 11:25:32', NULL, 55, NULL, '60', '80000', '2022-04-29', '100', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'My stock is ready for examination', 2, 37, 1, 'Certified seed', '610376212'),
(32, '2022-04-25 17:13:34', '2022-04-26 11:24:58', NULL, 46, NULL, '3.5', '45', '2022-04-01', '100', '100', 'none', 'none', NULL, NULL, NULL, 5, 20, NULL, '20000 kg approved', 2, 52, 1, 'Certified seed', '882985758'),
(33, '2022-04-25 17:13:36', '2022-04-26 11:23:51', NULL, 87, NULL, '9', '65', '2022-04-13', '100', '100', 'none', 'none', 'none', 'none', NULL, 5, 20, NULL, 'Eating Food', 2, 69, 1, 'Certified seed', '104123932'),
(34, '2022-04-25 17:13:36', '2022-04-26 11:22:36', NULL, 49, NULL, '5', '54', '2022-04-05', '100', '100', 'none', 'none', 'none', 'none', NULL, 5, 20, NULL, 'My crop is ready for approvals', 2, 42, 1, 'Certified seed', '283352489'),
(35, '2022-04-25 17:14:02', '2022-04-26 11:21:33', NULL, 61, NULL, '7', '75', '2022-04-12', '100', '100', 'none', 'none', 'none', 'none', NULL, 5, 20, NULL, 'My stock is ready for examination', 2, 51, 1, 'Certified seed', '320434792'),
(36, '2022-04-25 17:14:09', '2022-04-26 11:20:36', NULL, 92, NULL, '55', '333', '2022-04-27', '100', '100', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'my crop is ready for harvesting', 2, 63, 1, 'Certified seed', '784561349'),
(37, '2022-04-25 17:14:19', '2022-04-26 11:22:32', NULL, 53, NULL, '88', '33', '2022-04-25', '100', '100', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'stock ready for examination', 2, 47, 1, 'Certified seed', '279385702'),
(38, '2022-04-25 17:14:24', '2022-04-26 11:23:39', NULL, 87, NULL, '99', '66', '2022-04-25', '100', '100', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'Eating food', 2, 69, 1, 'Certified seed', '370067164'),
(39, '2022-04-25 17:14:44', '2022-04-26 11:27:33', NULL, 73, NULL, '40', '55000', '2022-04-21', '100', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'My stock.is.ready for.inspection\r\n\r\n\r\nMy stock is ready for inspection', 2, 46, 1, 'Certified seed', '707320312'),
(40, '2022-04-25 17:16:41', '2022-04-26 11:19:16', NULL, 62, NULL, '3', '1111', '2022-04-26', '100', '100', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'My crop has been fully inspected', 2, 53, 1, 'Basic seed', '131311787'),
(41, '2022-04-25 17:18:34', '2022-04-26 11:26:57', NULL, 84, NULL, '70', '80000', '2022-05-05', '100', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'excellent stock', 2, 41, 1, 'Certified seed', '328665468'),
(42, '2022-04-26 09:30:01', '2022-04-26 11:26:20', NULL, 96, NULL, '89', '100000', '2022-04-08', '100', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'Well  was very clean', 2, 45, 1, 'Certified seed', '802842832'),
(43, '2022-04-26 10:36:20', '2022-04-26 11:24:50', NULL, 93, NULL, '99', '333', '2022-04-25', '100', '100', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'good seeds', 2, 48, 1, 'Certified seed', '650521468'),
(44, '2022-04-26 10:50:52', '2022-04-26 11:32:03', NULL, 99, NULL, '40', '300000', '2022-04-26', '100', '90', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'stock is ready for approval', 2, 54, 1, 'Certified seed', '895903624'),
(45, '2022-04-26 10:51:29', '2022-04-26 11:18:37', NULL, 75, NULL, '35', '2500', '2022-04-19', '98', '94', '13', '0.1', '00', '00', NULL, 5, 20, NULL, 'Good', 2, 38, 1, 'Basic seed', '816058668'),
(46, '2022-04-26 10:51:35', '2022-04-26 11:20:15', NULL, 70, NULL, '50', '1000', '2022-04-21', '99', '93', '13', '00', '00', '00', NULL, 5, 20, NULL, 'Waiting for approval', 2, 43, 1, 'Basic seed', '536235800'),
(47, '2022-04-26 10:51:37', '2022-04-26 11:31:11', NULL, 100, NULL, '40', '45000', '2022-04-25', '100', '90', 'none', 'none', '90', 'none', NULL, 5, 20, NULL, 'Farming', 2, 50, 1, 'Certified seed', '482051304'),
(48, '2022-04-26 10:51:58', '2022-04-26 11:19:18', NULL, 62, NULL, '10', '1000', '2022-04-26', '98', '98', 'None', 'None', 'None', 'None', NULL, 5, 20, NULL, 'Inspection went on well', 2, 53, 1, 'Certified seed', '41934309'),
(49, '2022-04-26 11:10:35', '2022-04-29 10:44:19', NULL, NULL, NULL, '4', '25', '2022-04-20', '98', '90', 'None', 'None', '10', 'None', NULL, 5, 27, NULL, 'Good night', 1, 67, 1, 'Basic seed', '211968458'),
(50, '2022-04-26 12:35:27', '2022-04-29 10:46:10', NULL, 99, NULL, '5', '50', '2022-04-21', '100', '100', 'None', 'None', 'None', 'None', NULL, 5, 27, NULL, 'seeds ready', 2, 54, 1, 'Pre-Basic seed', '844642433'),
(51, '2022-04-27 17:08:01', '2022-04-27 17:50:11', NULL, 103, NULL, '12', '10000', '2022-04-27', '100', '90', 'None', 'None', '90', 'None', NULL, 5, 27, NULL, 'Examine stock', 2, 73, 1, 'Pre-Basic seed', '823139195'),
(52, '2022-04-28 16:57:06', '2022-04-28 17:52:54', NULL, 15, NULL, '14', '1000', '2022-04-28', '10', 'as', 'dee', '11', '12', '11', NULL, 5, 20, NULL, 'Simple love', 2, 3, 1, 'Pre-Basic seed', '86840500'),
(53, '2022-04-28 17:19:10', '2022-04-29 10:47:31', NULL, 72, NULL, '50', '600', '2022-04-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'My seeds stocks are ready please come for approval', 2, 74, 1, 'Basic seed', '252290663'),
(54, '2022-04-28 17:19:12', '2022-04-29 10:44:11', NULL, 36, NULL, '30', '2000', '2022-04-20', '10', '90', '9', '5', '9', '5', NULL, 5, 27, NULL, 'please come for my stock approval', 2, 80, 1, 'Basic seed', '541190698'),
(55, '2022-04-28 17:20:16', '2022-04-29 10:47:59', NULL, 39, NULL, '20', '320', '2022-04-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'Please come for my seed stock approval', 2, 74, 1, 'Certified seed', '295644800'),
(56, '2022-04-28 17:20:53', '2022-04-29 10:48:14', NULL, 82, NULL, '30', '050', '2022-04-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'Please come for my seed stock approval', 2, 91, 1, 'Basic seed', '141830610'),
(57, '2022-04-28 17:21:39', '2022-04-29 10:49:18', NULL, 134, NULL, '45', '460', '2022-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'fine', 2, 94, 1, 'Certified seed', '598877569'),
(58, '2022-04-28 17:21:55', '2022-04-29 10:45:12', NULL, 113, NULL, '20', '400', '2022-04-15', '100', '100', 'None', 'None', 'None', 'None', NULL, 5, 27, NULL, 'Ready at the warehouse', 2, 89, 1, 'Basic seed', '620187649'),
(59, '2022-04-28 17:21:58', '2022-04-29 10:51:34', NULL, 137, NULL, '30', '5521', '2022-04-28', '100', '98', '13', '00', 'NONE', 'NONE', NULL, 5, 27, NULL, 'please come for my seed stock approval', 2, 95, 1, 'Certified seed', '967092192'),
(60, '2022-04-28 17:22:23', '2022-04-29 10:47:17', NULL, 122, NULL, '30', '48', '2022-04-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'Flowing stage well inspected, offtypes of NABE 16 anound 12%', 2, 98, 1, 'Certified seed', '566368605'),
(61, '2022-04-28 17:22:46', '2022-04-29 10:51:11', NULL, 125, NULL, '50', '800', '2022-04-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'Please come for my stock approval', 2, 92, 1, 'Certified seed', '480712188'),
(63, '2022-04-28 17:22:51', '2022-04-29 10:46:34', NULL, 140, NULL, '30', '400', '2022-04-26', '10', '99', '10', '0', '0', '0', NULL, 5, 27, NULL, 'Please come for my seed stock approval', 2, 93, 1, 'Basic seed', '497870226'),
(64, '2022-04-28 17:22:53', '2022-04-29 10:49:41', NULL, 24, NULL, '100', '500', '2022-04-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'Please come for my seed stock approval.', 2, 86, 1, 'Certified seed', '261508892'),
(65, '2022-04-28 17:22:58', '2022-04-29 10:50:41', NULL, 164, NULL, '200', '1200', '2022-04-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'Please come for seed inspection', 2, 85, 1, 'Certified seed', '580697459'),
(66, '2022-04-28 17:23:16', '2022-04-29 10:49:12', NULL, 30, NULL, '30', '50', '2022-04-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'Please come for my seed stock approval', 2, 79, 1, 'Basic seed', '422100015'),
(67, '2022-04-28 17:24:05', '2022-04-29 10:50:06', NULL, 146, NULL, '50', '400', '2022-04-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'Kindly  come and do a stoke examination and approval', 2, 78, 1, 'Certified seed', '916004095'),
(68, '2022-04-28 17:25:34', '2022-04-29 10:45:33', NULL, 98, NULL, '30', '1000', '2022-04-26', '99', '99', '10', '0', '0', '0', NULL, 5, 27, NULL, 'sucess', 2, 84, 1, 'Basic seed', '487943693'),
(69, '2022-04-28 17:28:23', '2022-04-29 10:45:58', NULL, 71, NULL, '30', '4300', '2022-04-29', '100', '98', '13', '00', 'NONE', 'NONE', NULL, 5, 27, NULL, 'Please come for my stock approval', 2, 90, 1, 'Certified seed', '975258940'),
(70, '2022-04-28 17:34:09', '2022-04-29 10:46:58', NULL, 75, NULL, '35', '450', '2022-04-23', '100', '100', 'None', 'None', 'None', 'None', NULL, 5, 27, NULL, 'Please come for my stock approval', 2, 75, 1, 'Basic seed', '742674581'),
(72, '2022-04-29 10:21:26', '2022-04-29 10:48:53', NULL, 30, NULL, '2', '30', '2022-04-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, NULL, 'Growing certified seeds', 2, 79, 1, 'Certified seed', '373480349'),
(73, '2022-04-29 10:31:17', '2022-04-29 10:47:21', NULL, 18, NULL, '30', '2000', '2022-04-29', '100', '90', 'None', 'None', '90', 'None', NULL, 5, 27, NULL, 'Stock ready for examination.', 2, 76, 1, 'Basic seed', '768986469'),
(74, '2022-04-29 10:36:35', '2022-04-29 10:44:53', NULL, 62, NULL, '30', '3900', '2022-04-28', '100', '98', '13', '00', 'NONE', 'NONE', NULL, 5, 27, NULL, 'rt5r4', 2, 88, 1, 'Certified seed', '242671052'),
(75, '2022-04-29 10:41:07', '2022-04-29 10:41:07', NULL, 140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'My stock ready for inspection', 2, 93, 1, NULL, '-');

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
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_seed_board_reg_num` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantiry_of_seed` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_address_of_origin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ista_certificate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_from` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_until` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `inspector` bigint(20) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permit_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_import` tinyint(4) DEFAULT NULL,
  `phytosanitary_certificate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crop_category` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_export_permits`
--

INSERT INTO `import_export_permits` (`id`, `created_at`, `updated_at`, `administrator_id`, `name`, `address`, `telephone`, `national_seed_board_reg_num`, `store_location`, `quantiry_of_seed`, `name_address_of_origin`, `details`, `ista_certificate`, `valid_from`, `valid_until`, `status`, `inspector`, `status_comment`, `permit_number`, `is_import`, `phytosanitary_certificate`, `category`, `type`, `crop_category`) VALUES
(25, '2022-03-17 14:05:29', '2022-03-17 14:12:09', 28, 'Isaac Mbabazi', 'Rukoki', '0780602550', NULL, 'Rukoki', '0', 'Nairobi Kenya', NULL, NULL, '2022-03-17 10:12:09', '2023-03-17 10:12:09', 5, 27, NULL, '265562', 1, NULL, NULL, 'Researchers', 'Own use'),
(26, '2022-03-23 15:43:02', '2022-03-23 16:36:33', 28, 'Isaac Mbabazi', 'Kungu Trading Centre.', '+256753388839', 'EXP/2022/0002', 'Mubuku', '10', 'Nairobi Kenya', NULL, 'files/sorghum.jpg', '2022-03-23 12:36:33', '2023-03-23 12:36:33', 5, 27, 'The application has been Rejected.', 'EXPORT/2022/001', 0, 'files/Naro.JPG', NULL, 'Seed Merchant', NULL),
(27, '2022-03-28 17:42:00', '2022-04-04 13:43:37', 28, 'Isaac Mbabazi', 'Kampala', '+256753388839', 'EXP/2022/0002', 'Mubuku', '1000', 'Nairobi Kenya', NULL, NULL, NULL, NULL, 2, 27, NULL, NULL, 1, NULL, NULL, 'Researchers', 'Own use'),
(28, '2022-04-04 13:42:20', '2022-04-04 13:43:48', 3, 'Betty Namagembe', 'Kampala', '+256753388839', NULL, 'Mubuku', '0', 'Tazania', NULL, 'files/QA.JPG', NULL, NULL, 2, 27, NULL, NULL, 1, 'files/twit.JPG', NULL, 'Researchers', 'Research'),
(29, '2022-05-16 14:13:21', '2022-05-18 11:50:03', 106, 'Kalule Kusain', 'Rubaga', '111223176442', NULL, 'ffffff', '-2', 'Rubaga', NULL, 'files/eid anima585.gif', NULL, NULL, 1, NULL, NULL, NULL, 1, 'files/koll logo.mp4', NULL, 'Researchers', 'Commercial');

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
  `varieties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` bigint(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_export_permits_has_crops`
--

INSERT INTO `import_export_permits_has_crops` (`id`, `created_at`, `updated_at`, `import_export_permit_id`, `crop_variety_id`, `varieties`, `category`, `weight`) VALUES
(1, '2021-11-09 06:34:07', '2021-11-09 06:34:07', 18, 3, NULL, 'jkabsl', 1299),
(2, '2022-02-22 05:37:26', '2022-02-22 05:37:26', 19, 5, NULL, 'Beans', 12),
(3, '2022-02-22 05:37:26', '2022-02-22 05:37:26', 19, 3, NULL, 'Beans', 1200),
(4, '2022-02-22 05:37:26', '2022-02-22 05:37:26', 19, 4, NULL, 'Beans', 11),
(5, '2022-02-22 05:38:28', '2022-02-22 05:38:28', 20, 3, NULL, 'Beans', 12000),
(6, '2022-02-22 06:18:38', '2022-02-22 06:18:38', 21, 4, NULL, '1122', 12000),
(7, '2022-02-22 06:18:38', '2022-02-22 06:18:38', 21, 5, NULL, 'Beans', 10000),
(8, '2022-03-09 13:20:17', '2022-04-29 10:50:03', 22, 1, NULL, 'Personal use.', 200),
(9, '2022-03-09 13:22:57', '2022-03-09 13:22:57', 23, 3, NULL, 'Research', 200),
(10, '2022-03-09 13:25:00', '2022-03-09 13:25:00', 24, 4, NULL, 'Research', 200),
(11, '2022-03-17 14:05:29', '2022-03-17 14:05:29', 25, 4, NULL, NULL, 100),
(12, '2022-03-23 15:43:02', '2022-03-23 16:10:14', 26, 3, NULL, 'Research', 300),
(13, '2022-03-28 17:42:00', '2022-03-28 17:42:00', 27, 90, NULL, NULL, 1000),
(14, '2022-04-04 13:42:20', '2022-04-04 13:42:20', 28, 89, NULL, NULL, 200);

-- --------------------------------------------------------

--
-- Table structure for table `marketable_seeds`
--

CREATE TABLE `marketable_seeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `seed_label_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `lot_number` bigint(20) DEFAULT 0,
  `quantity` bigint(20) DEFAULT 0,
  `seed_class` int(11) DEFAULT NULL,
  `source` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deposit` tinyint(4) DEFAULT NULL,
  `seed_label_package_id` bigint(20) DEFAULT NULL,
  `lab_test_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT 0,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_counted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marketable_seeds`
--

INSERT INTO `marketable_seeds` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `seed_label_id`, `lot_number`, `quantity`, `seed_class`, `source`, `detail`, `is_deposit`, `seed_label_package_id`, `lab_test_number`, `price`, `image`, `images`, `is_counted`) VALUES
(1, '2022-04-29 15:30:55', '2022-04-29 15:36:18', 84, 1, 4, 58058008, 11, NULL, 'From seedlab test number: 009/2022/dom', 'From seedlab ID: 73', 1, 1, '009/2022/dom', 0, NULL, NULL, 1),
(2, '2022-04-29 15:31:04', '2022-04-29 15:36:18', 90, 1, 5, 19767497, 2000, NULL, 'From seedlab test number: 008/dom/2022', 'From seedlab ID: 59', 1, 1, '008/dom/2022', 0, NULL, NULL, 1),
(3, '2022-04-29 15:31:14', '2022-04-29 15:36:18', 89, 1, 6, 24770820, 500, NULL, 'From seedlab test number: Test1/2022/N0004', 'From seedlab ID: 67', 1, 2, 'Test1/2022/N0004', 0, NULL, NULL, 1),
(4, '2022-04-29 15:31:24', '2022-04-29 15:36:18', 74, 1, 7, 71732547, 1000, NULL, 'From seedlab test number: 001/2022/dom', 'From seedlab ID: 69', 1, 3, '001/2022/dom', 0, NULL, NULL, 1),
(5, '2022-04-29 15:31:34', '2022-04-29 15:36:18', 86, 1, 8, 25554681, 300, NULL, 'From seedlab test number: Test1/2022/N0002', 'From seedlab ID: 72', 1, 2, 'Test1/2022/N0002', 0, NULL, NULL, 1),
(6, '2022-04-29 15:31:42', '2022-04-29 15:36:18', 94, 1, 9, 67857572, 200, NULL, 'From seedlab test number: TEST2/2022/2B', 'From seedlab ID: 74', 1, 1, 'TEST2/2022/2B', 0, NULL, NULL, 1),
(7, '2022-04-29 15:31:51', '2022-04-29 15:36:18', 95, 1, 10, 70484855, 1000, NULL, 'From seedlab test number: Test1/2022/N0007', 'From seedlab ID: 60', 1, 2, 'Test1/2022/N0007', 0, NULL, NULL, 1),
(8, '2022-04-29 15:32:03', '2022-04-29 15:36:18', 76, 1, 11, 75190054, 1000, NULL, 'From seedlab test number: 005/2022/dom', 'From seedlab ID: 62', 1, 2, '005/2022/dom', 0, NULL, NULL, 1),
(9, '2022-04-29 15:32:22', '2022-04-29 15:36:18', 92, 1, 12, 88952214, 20, NULL, 'From seedlab test number: TEST3/2022/3B', 'From seedlab ID: 68', 1, 2, 'TEST3/2022/3B', 0, NULL, NULL, 1),
(10, '2022-04-29 15:32:31', '2022-04-29 15:36:18', 79, 1, 13, 23920622, 200, NULL, 'From seedlab test number: 001/2022/dom', 'From seedlab ID: 66', 1, 1, '001/2022/dom', 0, NULL, NULL, 1),
(11, '2022-04-29 15:32:41', '2022-04-29 15:36:18', 91, 1, 16, 94922685, 100, NULL, 'From seedlab test number: 004/2022/musa/001', 'From seedlab ID: 76', 1, 1, '004/2022/musa/001', 0, NULL, NULL, 1),
(12, '2022-04-29 15:32:45', '2022-04-29 15:36:18', 80, 1, 14, 25675580, 500, NULL, 'From seedlab test number: Test1/2022/N0009', 'From seedlab ID: 65', 1, 1, 'Test1/2022/N0009', 0, NULL, NULL, 1),
(13, '2022-04-29 15:32:55', '2022-04-29 15:36:18', 88, 1, 15, 14196693, 2000, NULL, 'From seedlab test number: 008/34/dom', 'From seedlab ID: 71', 1, 2, '008/34/dom', 0, NULL, NULL, 1),
(14, '2022-04-29 15:32:59', '2022-04-29 15:36:18', 85, 1, 17, 81650251, 50, NULL, 'From seedlab test number: Test1/2022/N0001', 'From seedlab ID: 77', 1, 2, 'Test1/2022/N0001', 0, NULL, NULL, 1),
(15, '2022-04-29 15:40:29', '2022-04-29 15:43:35', 78, 1, 19, 91804360, 1000, NULL, 'From seedlab test number: 003/2022/dom', 'From seedlab ID: 63', 1, 1, '003/2022/dom', 0, NULL, NULL, 1),
(16, '2022-04-29 15:40:43', '2022-04-29 15:43:35', 98, 1, 18, 72521820, 20, NULL, 'From seedlab test number: 006/2022/dom', 'From seedlab ID: 64', 1, 1, '006/2022/dom', 0, NULL, NULL, 1),
(17, '2022-04-29 15:59:28', '2022-04-29 15:59:28', 3, 3, 3, 89806835, 1000, NULL, NULL, 'Sold crop to Uganda Seed Trade Association, ID: 79', 0, NULL, 'A000120C', 900, NULL, NULL, 1),
(18, '2022-04-29 15:59:40', '2022-04-29 15:59:40', 95, 1, 10, 70484855, 100, NULL, NULL, 'Sold crop to Isaac Mbabazi, ID: 76', 0, NULL, 'Test1/2022/N0007', 0, NULL, NULL, 1),
(19, '2022-04-29 15:59:47', '2022-04-29 15:59:47', 94, 1, 9, 67857572, 40, NULL, NULL, 'Sold crop to Polly Bantel, ID: 92', 0, NULL, 'TEST2/2022/2B', 0, NULL, NULL, 1),
(20, '2022-04-29 15:59:48', '2022-04-29 15:59:48', 86, 1, 8, 25554681, 200, NULL, NULL, 'Sold crop to Uganda Seed Trade Association, ID: 78', 0, NULL, 'Test1/2022/N0002', 0, NULL, NULL, 1),
(21, '2022-04-29 15:59:58', '2022-04-29 15:59:58', 95, 1, 10, 70484855, 90, NULL, NULL, 'Sold crop to WANDA BARNABAS, ID: 94', 0, NULL, 'Test1/2022/N0007', 0, NULL, NULL, 1),
(22, '2022-04-29 15:59:59', '2022-04-29 15:59:59', 80, 1, 14, 25675580, 400, NULL, NULL, 'Sold crop to Uganda Seed Trade Association, ID: 78', 0, NULL, 'Test1/2022/N0009', 0, NULL, NULL, 1),
(23, '2022-04-29 16:00:14', '2022-04-29 16:00:14', 80, 1, 14, 25675580, 433, NULL, NULL, 'Sold crop to Dominic Kimara, ID: 84', 0, NULL, 'Test1/2022/N0009', 0, NULL, NULL, 1),
(24, '2022-04-29 16:00:17', '2022-04-29 16:00:17', 94, 1, 9, 67857572, 100, NULL, NULL, 'Sold crop to Isaac Mbabazi, ID: 76', 0, NULL, 'TEST2/2022/2B', 0, NULL, NULL, 1),
(25, '2022-04-29 16:01:06', '2022-04-29 16:01:06', 3, 3, 3, 89806835, 100, NULL, NULL, 'Sold crop to John Paul, ID: 25', 0, NULL, 'A000120C', 900, NULL, NULL, 1),
(26, '2022-04-29 16:01:10', '2022-04-29 16:01:10', 88, 1, 15, 14196693, 1000, NULL, NULL, 'Sold crop to MUYINGO ALI, ID: 99', 0, NULL, '008/34/dom', 0, NULL, NULL, 1),
(27, '2022-04-29 16:01:11', '2022-04-29 16:01:11', 85, 1, 17, 81650251, 20, NULL, NULL, 'Sold crop to Opio Kelvin, ID: 89', 0, NULL, 'Test1/2022/N0001', 0, NULL, NULL, 1),
(28, '2022-04-29 16:01:21', '2022-04-29 16:01:21', 84, 1, 4, 58058008, 11, NULL, NULL, 'Sold crop to NARO HOLDINGS LIMITED, ID: 86', 0, NULL, '009/2022/dom', 0, NULL, NULL, 1),
(29, '2022-04-29 16:01:23', '2022-04-29 16:01:23', 78, 1, 19, 91804360, 20, NULL, NULL, 'Sold crop to walufelo isima, ID: 88', 0, NULL, '003/2022/dom', 0, NULL, NULL, 1),
(30, '2022-04-29 16:01:27', '2022-04-29 16:01:27', 85, 1, 17, 81650251, 50, NULL, NULL, 'Sold crop to Uganda Seed Trade Association, ID: 79', 0, NULL, 'Test1/2022/N0001', 0, NULL, NULL, 1),
(31, '2022-04-29 16:01:30', '2022-04-29 16:01:30', 89, 1, 6, 24770820, 253, NULL, NULL, 'Sold crop to Vicky Nyakatuura, ID: 98', 0, NULL, 'Test1/2022/N0004', 0, NULL, NULL, 1),
(32, '2022-04-29 16:01:30', '2022-04-29 16:01:30', 91, 1, 16, 94922685, 50, NULL, NULL, 'Sold crop to MUYINGO ALI, ID: 99', 0, NULL, '004/2022/musa/001', 0, NULL, NULL, 1),
(33, '2022-04-29 16:01:40', '2022-04-29 16:01:40', 84, 1, 4, 58058008, 10, NULL, NULL, 'Sold crop to Opio Kelvin, ID: 89', 0, NULL, '009/2022/dom', 0, NULL, NULL, 1),
(34, '2022-04-29 16:01:41', '2022-04-29 16:01:41', 78, 1, 19, 91804360, 10, NULL, NULL, 'Sold crop to NARO HOLDINGS LIMITED, ID: 86', 0, NULL, '003/2022/dom', 0, NULL, NULL, 1),
(35, '2022-04-29 16:01:41', '2022-04-29 16:01:41', 85, 1, 17, 81650251, 20, NULL, NULL, 'Sold crop to Vicky Nyakatuura, ID: 98', 0, NULL, 'Test1/2022/N0001', 0, NULL, NULL, 1),
(36, '2022-04-29 16:01:44', '2022-04-29 16:01:44', 89, 1, 6, 24770820, 80, NULL, NULL, 'Sold crop to Odongkara Emmanuel, ID: 74', 0, NULL, 'Test1/2022/N0004', 0, NULL, NULL, 1),
(37, '2022-04-29 16:01:55', '2022-04-29 16:01:55', 89, 1, 6, 24770820, 100, NULL, NULL, 'Sold crop to MOVA SEED, ID: 80', 0, NULL, 'Test1/2022/N0004', 0, NULL, NULL, 1),
(38, '2022-04-29 16:02:12', '2022-04-29 16:02:12', 86, 1, 8, 25554681, 300, NULL, NULL, 'Sold crop to SELECT SEED LIMITED, ID: 85', 0, NULL, 'Test1/2022/N0002', 0, NULL, NULL, 1),
(39, '2022-04-29 16:02:17', '2022-04-29 16:02:17', 78, 1, 19, 91804360, 50, NULL, NULL, 'Sold crop to WANDA BARNABAS, ID: 94', 0, NULL, '003/2022/dom', 0, NULL, NULL, 1),
(40, '2022-04-29 16:02:34', '2022-04-29 16:02:34', 78, 1, 19, 91804360, 500, NULL, NULL, 'Sold crop to Cathy Adong, ID: 91', 0, NULL, '003/2022/dom', 0, NULL, NULL, 1),
(41, '2022-04-29 16:02:51', '2022-04-29 16:02:51', 86, 1, 8, 25554681, 100, NULL, NULL, 'Sold crop to SELECT SEED LIMITED, ID: 85', 0, NULL, 'Test1/2022/N0002', 0, NULL, NULL, 1),
(42, '2022-04-29 16:03:07', '2022-04-29 16:03:07', 86, 1, 8, 25554681, 200, NULL, NULL, 'Sold crop to Cathy Adong, ID: 91', 0, NULL, 'Test1/2022/N0002', 0, NULL, NULL, 1),
(43, '2022-04-29 16:04:04', '2022-04-29 16:04:04', 3, 3, 3, 89806835, 150, NULL, NULL, 'Sold crop to Polly Bantel, ID: 92', 0, NULL, 'A000120C', 900, NULL, NULL, 1),
(44, '2022-04-29 16:04:14', '2022-04-29 16:04:14', 3, 3, 3, 89806835, 100, NULL, NULL, 'Sold crop to Odongkara Emmanuel, ID: 74', 0, NULL, 'A000120C', 900, NULL, NULL, 1),
(45, '2022-04-29 16:04:22', '2022-04-29 16:04:22', 3, 3, 3, 89806835, 1000, NULL, NULL, 'Sold crop to kibalama brian, ID: 95', 0, NULL, 'A000120C', 900, NULL, NULL, 1),
(46, '2022-04-29 16:04:31', '2022-04-29 16:04:31', 3, 3, 3, 89806835, 1000, NULL, NULL, 'Sold crop to Atia serogal, ID: 90', 0, NULL, 'A000120C', 900, NULL, NULL, 1),
(47, '2022-04-29 16:07:24', '2022-04-29 16:07:24', 98, 1, 18, 72521820, 10, NULL, NULL, 'Sold crop to walufelo isima, ID: 88', 0, NULL, '006/2022/dom', 0, NULL, NULL, 1),
(48, '2022-04-29 16:08:22', '2022-04-29 16:08:22', 90, 1, 5, 19767497, 2000, NULL, NULL, 'Sold crop to Uganda Seed Trade Association, ID: 79', 0, NULL, '008/dom/2022', 0, NULL, NULL, 1),
(49, '2022-04-29 16:43:46', '2022-04-29 16:44:30', 76, 1, 11, 75190054, -200, NULL, 'From seedlab test number: 005/2022/dom', 'Schools', 0, 2, '005/2022/dom', 0, NULL, NULL, 1),
(50, '2022-04-29 16:43:57', '2022-04-29 16:44:30', 74, 1, 7, 71732547, -300, NULL, 'From seedlab test number: 001/2022/dom', 'Sold as grains', 0, 3, '001/2022/dom', 0, NULL, NULL, 1),
(51, '2022-04-29 16:44:00', '2022-04-29 16:44:30', 80, 1, 14, 25675580, -200, NULL, 'From seedlab test number: Test1/2022/N0009', 'sold as grain to school', 0, 1, 'Test1/2022/N0009', 0, NULL, NULL, 1),
(52, '2022-04-29 16:44:13', '2022-04-29 16:44:30', 94, 1, 9, 67857572, -50, NULL, 'From seedlab test number: TEST2/2022/2B', 'cash at hand', 0, 1, 'TEST2/2022/2B', 0, NULL, NULL, 1),
(53, '2022-04-29 16:44:41', '2022-04-29 16:49:16', 84, 1, 4, 58058008, -5, NULL, 'From seedlab test number: 009/2022/dom', 'good quality seed', 0, 1, '009/2022/dom', 0, NULL, NULL, 1),
(54, '2022-04-29 16:44:53', '2022-04-29 16:49:16', 78, 1, 19, 91804360, -50, NULL, 'From seedlab test number: 003/2022/dom', 'Maize for food, for easy access', 0, 1, '003/2022/dom', 0, NULL, NULL, 1),
(55, '2022-04-29 16:45:09', '2022-04-29 16:49:16', 90, 1, 5, 19767497, -150, NULL, 'From seedlab test number: 008/dom/2022', 'Payment through Mobile', 0, 1, '008/dom/2022', 0, NULL, NULL, 1),
(56, '2022-04-29 16:45:10', '2022-04-29 16:49:16', 76, 1, 11, 75190054, -300, NULL, 'From seedlab test number: 005/2022/dom', 'Sold to XYZ who are not users of the system.', 0, 2, '005/2022/dom', 0, NULL, NULL, 1),
(57, '2022-04-29 16:45:19', '2022-04-29 16:49:16', 74, 1, 7, 71732547, -50, NULL, 'From seedlab test number: 001/2022/dom', 'Sold to to Tina who are not users of the system', 0, 3, '001/2022/dom', 0, NULL, NULL, 1),
(58, '2022-04-29 16:45:19', '2022-04-29 16:49:16', 95, 1, 10, 70484855, -300, NULL, 'From seedlab test number: Test1/2022/N0007', 'not users of the sytem', 0, 2, 'Test1/2022/N0007', 0, NULL, NULL, 1),
(59, '2022-04-29 16:45:26', '2022-04-29 16:49:16', 85, 1, 17, 81650251, -40, NULL, 'From seedlab test number: Test1/2022/N0001', 'Sold to Atia who is not a user of the system', 0, 2, 'Test1/2022/N0001', 0, NULL, NULL, 1),
(60, '2022-04-29 16:45:27', '2022-04-29 16:49:16', 89, 1, 6, 24770820, -250, NULL, 'From seedlab test number: Test1/2022/N0004', 'Sold to a stockists', 0, 2, 'Test1/2022/N0004', 0, NULL, NULL, 1),
(61, '2022-04-29 16:45:37', '2022-04-29 16:49:16', 91, 1, 16, 94922685, -60, NULL, 'From seedlab test number: 004/2022/musa/001', 'User not in', 0, 1, '004/2022/musa/001', 0, NULL, NULL, 1),
(62, '2022-04-29 16:45:59', '2022-04-29 16:49:16', 86, 1, 8, 25554681, -10, NULL, 'From seedlab test number: Test1/2022/N0002', 'Sold to school as grain', 0, 2, 'Test1/2022/N0002', 0, NULL, NULL, 1),
(63, '2022-04-29 16:46:05', '2022-04-29 16:49:16', 92, 1, 12, 88952214, -10, NULL, 'From seedlab test number: TEST3/2022/3B', 'Sold as grain to dealers who\'s not user of the system', 0, 2, 'TEST3/2022/3B', 0, NULL, NULL, 1),
(64, '2022-04-29 16:46:17', '2022-04-29 16:49:16', 88, 1, 15, 14196693, -70, NULL, 'From seedlab test number: 008/34/dom', 'sold to gfy who are not system users', 0, 2, '008/34/dom', 0, NULL, NULL, 1);

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
(65, '2021_11_22_114654_create_orders_table', 37),
(66, '2021_11_24_053127_create_pre_orders_table', 38),
(67, '2021_11_24_072806_create_quotations_table', 39),
(68, '2021_11_24_120813_create_test_trees_table', 40),
(69, '2022_02_23_085326_create_sub_growers_table', 41);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `order_by` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` bigint(20) DEFAULT 0,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `administrator_id`, `order_by`, `crop_variety_id`, `product_id`, `quantity`, `detail`, `payment_type`, `receipt`, `status`, `total_price`) VALUES
(1, '2021-11-24 06:18:20', '2022-04-29 16:01:06', 3, 25, 3, 3, 100, 'simple', NULL, NULL, '3', 90000),
(2, '2021-11-24 07:11:09', '2021-11-24 07:11:09', 25, 2, 3, NULL, 8000, 'From pre-order ID: 7', NULL, NULL, '1', 0),
(4, '2021-11-24 07:23:29', '2021-11-24 07:23:29', 25, 2, 3, NULL, 1000, 'From pre-order ID: 9', NULL, NULL, '1', 40000000),
(5, '2021-11-24 08:18:58', '2021-11-24 08:18:58', 25, 3, 3, NULL, 1000, 'From pre-order ID: 10', NULL, NULL, '1', 800000),
(6, '2022-04-29 15:46:14', '2022-04-29 16:01:21', 84, 86, 1, 4, 11, '', NULL, NULL, '3', 0),
(7, '2022-04-29 15:47:36', '2022-04-29 15:59:40', 95, 76, 1, 10, 100, 'Please supply', NULL, NULL, '3', 0),
(8, '2022-04-29 15:48:12', '2022-04-29 16:02:51', 86, 85, 1, 8, 100, 'Please supply', NULL, NULL, '3', 0),
(9, '2022-04-29 15:48:32', '2022-04-29 16:04:22', 3, 95, 3, 3, 1000, 'on credit', NULL, NULL, '3', 900000),
(10, '2022-04-29 15:48:39', '2022-04-29 15:59:58', 95, 94, 1, 10, 90, 'wait to see your response', NULL, NULL, '3', 0),
(11, '2022-04-29 15:49:10', '2022-04-29 16:00:17', 94, 76, 1, 9, 100, 'Cash payment. ', NULL, NULL, '3', 0),
(12, '2022-04-29 15:49:21', '2022-04-29 16:00:14', 80, 84, 1, 14, 433, ' i will send u mobile money', NULL, NULL, '3', 0),
(13, '2022-04-29 15:49:38', '2022-04-29 16:04:31', 3, 90, 3, 3, 1000, 'Christine biira', NULL, NULL, '3', 900000),
(14, '2022-04-29 15:49:43', '2022-04-29 16:07:24', 98, 88, 1, 18, 10, 'quality seed paid on delivery', NULL, NULL, '3', 0),
(15, '2022-04-29 15:49:53', '2022-04-29 16:01:41', 85, 98, 1, 16, 20, 'Payment is by mobile phone service', NULL, NULL, '3', 0),
(16, '2022-04-29 15:49:54', '2022-04-29 16:02:17', 78, 94, 1, 17, 50, 'cash on delivery', NULL, NULL, '3', 0),
(17, '2022-04-29 15:49:56', '2022-04-29 16:04:14', 3, 74, 3, 3, 100, 'Please supply \r\nPayment will be made on delivery', NULL, NULL, '3', 90000),
(18, '2022-04-29 15:49:57', '2022-04-29 16:01:55', 89, 80, 1, 6, 100, 'supply please', NULL, NULL, '3', 0),
(19, '2022-04-29 15:50:04', '2022-04-29 16:01:10', 88, 99, 1, 15, 1000, 'Payment will be done using a check', NULL, NULL, '3', 0),
(20, '2022-04-29 15:50:19', '2022-04-29 16:02:34', 78, 91, 1, 17, 500, 'Pay on deliveries', NULL, NULL, '3', 0),
(21, '2022-04-29 15:50:28', '2022-04-29 16:08:22', 90, 79, 1, 5, 2000, 'Cash deposited  at the bank', NULL, NULL, '3', 0),
(22, '2022-04-29 15:50:45', '2022-04-29 16:04:04', 3, 92, 3, 3, 150, 'Payment on delivery ', NULL, NULL, '3', 135000),
(23, '2022-04-29 15:50:48', '2022-04-29 16:01:41', 78, 86, 1, 17, 10, 'cash on delivery ', NULL, NULL, '3', 0),
(24, '2022-04-29 15:50:58', '2022-04-29 16:01:40', 84, 89, 1, 4, 10, 'Payment on delivery ', NULL, NULL, '3', 0),
(25, '2022-04-29 15:51:13', '2022-04-29 15:51:13', 90, 80, 1, 5, 522, 'supply please', NULL, NULL, '1', 0),
(26, '2022-04-29 15:51:17', '2022-04-29 15:59:48', 86, 78, 1, 8, 200, 'Pay by cheque on delivery', NULL, NULL, '3', 0),
(27, '2022-04-29 15:51:24', '2022-04-29 15:59:15', 88, 94, 1, 15, 600, 'bank payment', NULL, NULL, '2', 0),
(28, '2022-04-29 15:51:46', '2022-04-29 16:03:07', 86, 91, 1, 8, 200, 'Pay on deliveries', NULL, NULL, '3', 0),
(29, '2022-04-29 15:52:08', '2022-04-29 15:52:08', 3, 90, 3, 3, 2000, 'Good quality', NULL, NULL, '1', 1800000),
(30, '2022-04-29 15:52:09', '2022-04-29 15:59:28', 3, 79, 3, 3, 1000, 'Will deposit money on your phone', NULL, NULL, '3', 900000),
(31, '2022-04-29 15:52:37', '2022-04-29 16:01:30', 91, 99, 1, 13, 50, 'Goods wornse taken are  nt ewtu in', NULL, NULL, '3', 0),
(32, '2022-04-29 15:52:50', '2022-04-29 16:01:27', 85, 79, 1, 16, 50, '', NULL, NULL, '3', 0),
(33, '2022-04-29 15:53:02', '2022-04-29 16:01:23', 78, 88, 1, 17, 20, 'pay on delivery', NULL, NULL, '3', 0),
(34, '2022-04-29 15:53:02', '2022-04-29 16:01:44', 89, 74, 1, 6, 80, 'Please supply payment on delivery', NULL, NULL, '3', 0),
(35, '2022-04-29 15:53:15', '2022-04-29 16:02:12', 86, 85, 1, 8, 300, 'Please supply', NULL, NULL, '3', 0),
(36, '2022-04-29 15:53:23', '2022-04-29 15:59:59', 80, 78, 1, 14, 400, 'pay by cheques', NULL, NULL, '3', 0),
(37, '2022-04-29 15:53:25', '2022-04-29 16:01:30', 89, 98, 1, 6, 253, 'Payment next week', NULL, NULL, '3', 0),
(38, '2022-04-29 15:53:57', '2022-04-29 15:59:47', 94, 92, 1, 9, 40, 'Advance PAYMENT done', NULL, NULL, '3', 0),
(39, '2022-04-29 15:54:29', '2022-04-29 16:01:11', 85, 89, 1, 16, 20, 'Transport at ur cost', NULL, NULL, '3', 0),
(40, '2022-04-29 15:55:01', '2022-04-29 15:55:01', 98, 78, 1, 18, 10, 'Coming to pic', NULL, NULL, '1', 0),
(41, '2022-04-29 16:23:17', '2022-04-29 16:23:17', 76, 24, 12, NULL, 300, 'From pre-order ID: 30', NULL, NULL, '1', 300000),
(42, '2022-04-29 16:28:32', '2022-04-29 16:28:32', 89, 27, 19, NULL, 50, 'From pre-order ID: 33', NULL, NULL, '1', 350000),
(43, '2022-04-29 16:30:42', '2022-04-29 16:30:42', 84, 82, 1, 4, 11, '', NULL, NULL, '1', 0),
(44, '2022-04-29 16:36:10', '2022-04-29 16:36:10', 3, 82, 3, 3, 1000, '', NULL, NULL, '1', 900000),
(45, '2022-04-29 16:36:32', '2022-04-29 16:36:32', 63, 14, 13, NULL, 82, 'From pre-order ID: 20', NULL, NULL, '1', 82000),
(46, '2022-04-29 16:36:51', '2022-04-29 16:36:51', 78, 14, 13, NULL, 30, 'From pre-order ID: 41', NULL, NULL, '1', 900000);

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
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seed_rate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registerd_dealer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `inspector` bigint(20) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_crops` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_harvest` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_planted` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_of_land` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lot_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crop_id` bigint(20) DEFAULT NULL,
  `amount_enclosed` bigint(20) DEFAULT NULL,
  `payment_receipt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_from` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_until` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_not_used` tinyint(4) DEFAULT NULL,
  `sub_growers_file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `lot_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_of_land` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_planted` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_harvest` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_crops` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pre_orders`
--

CREATE TABLE `pre_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `quantity` bigint(20) DEFAULT NULL,
  `seed_class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invetory_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_orders`
--

INSERT INTO `pre_orders` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `quantity`, `seed_class`, `invetory_status`, `collection_date`, `pickup_location`, `detail`, `status`) VALUES
(1, '2021-11-24 03:26:01', '2021-11-24 03:26:01', 1, 3, 8000, 'Certified', 'Processed', '2021-11-24', 'Simple pick', 'detail...', '1'),
(2, '2021-11-24 06:11:54', '2021-11-24 06:11:54', 2, 3, 1000, 'Certified', 'Raw', '2021-11-30', 'Jinja', 'explanation...', '1'),
(3, '2021-11-24 08:17:35', '2021-11-24 08:17:35', 2, 3, 8000, 'Certified', 'Processed', '2021-12-08', 'Mbale', 'simple', '1'),
(4, '2022-04-26 16:55:39', '2022-04-26 16:55:39', 38, 12, 1000, 'Certified', 'Processed', '2022-04-28', 'Kampala', 'Credit', '1'),
(5, '2022-04-26 16:55:41', '2022-04-26 16:55:41', 69, 13, 50, 'Certified', 'Raw', '2022-04-29', 'mbale', 'cash on delivery', '1'),
(6, '2022-04-26 16:56:49', '2022-04-26 16:56:49', 56, 12, 10, 'Certified', 'Processed', '2022-04-26', 'JINJA', 'YOUR SEEDS WILL BE READY FOR PICKING AT THE ABOVE LOCATION', '1'),
(7, '2022-04-26 16:57:01', '2022-04-26 16:57:01', 69, 13, 15, 'Certified', 'Processed', '2022-04-27', 'Namanve', 'payment after 1 month', '1'),
(8, '2022-04-26 16:57:48', '2022-04-26 16:57:48', 53, 13, 200, 'Certified', 'Processed', '2022-04-26', 'HOIMA', 'Cash payment', '1'),
(9, '2022-04-26 16:59:16', '2022-04-26 16:59:16', 54, 12, 200, 'Certified', 'Raw', '2022-05-12', 'Gayaza', 'Seed packed in 50kg bags', '1'),
(10, '2022-04-26 17:00:37', '2022-04-26 17:00:37', 44, 19, 550, 'Certified', 'Processed', '2022-05-02', 'factory', 'if stock is ready before the collection date please let me know', '1'),
(11, '2022-04-26 17:01:06', '2022-04-26 17:01:06', 23, 13, 800, 'Pre-basic', NULL, '2022-04-26', 'asasas', 'asas', '1'),
(12, '2022-04-26 17:04:59', '2022-04-26 17:04:59', 63, 12, 250, 'Certified', 'Processed', '2022-04-26', 'Mbale', 'certified seed', '1'),
(13, '2022-04-26 17:05:10', '2022-04-26 17:05:10', 47, 13, 4000, 'Certified', 'Raw', '2022-10-26', 'kafu', 'payment after delivery', '1'),
(14, '2022-04-26 17:05:30', '2022-04-26 17:05:30', 55, 13, 1000, 'Certified', 'Raw', '2022-05-13', 'kampala', 'Cash payment', '1'),
(15, '2022-04-26 17:06:31', '2022-04-26 17:06:31', 54, 12, 1000, 'Basic', NULL, '2022-04-29', 'Gayaza', 'Seed to be packed in 50 kgs', '1'),
(16, '2022-04-26 17:06:50', '2022-04-26 17:06:50', 52, 173, 100, 'Pre-basic', NULL, '2023-02-01', 'Namulonge', 'Male and female', '1'),
(17, '2022-04-26 17:07:26', '2022-04-26 17:07:26', 42, 13, 2000, 'Certified', 'Raw', '2022-04-26', 'Kampala', 'Pay through bank before delivery', '1'),
(18, '2022-04-26 17:09:03', '2022-04-26 17:09:03', 50, 195, 500, 'Pre-basic', NULL, '2022-05-24', 'Kampala', 'Kindly deliver to our office', '1'),
(19, '2022-04-26 17:10:04', '2022-04-26 17:10:04', 43, 194, 100, 'Quality declaired seed', NULL, '2022-10-01', 'Masaka', 'Pay by cash', '1'),
(20, '2022-04-26 17:11:17', '2022-04-26 17:11:17', 41, 20, 43, 'Certified', 'Processed', '2022-04-28', 'kawempe', 'call me when everything is ready', '1'),
(21, '2022-04-26 17:13:02', '2022-04-26 17:13:02', 62, 13, 2000, 'Pre-basic', NULL, '2022-04-30', 'Namulonge', 'Deliver in Ganny bags', '1'),
(22, '2022-04-29 16:12:55', '2022-04-29 16:12:55', 94, 1, 20, 'Basic', NULL, '2022-06-06', 'kiryandongo', 'cash on delivery', '1'),
(23, '2022-04-29 16:13:47', '2022-04-29 16:13:47', 76, 12, 1000, 'Pre-basic', NULL, '2022-08-31', 'kampala', 'To be paid in cash.', '1'),
(24, '2022-04-29 16:14:09', '2022-04-29 16:14:09', 85, 12, 100, 'Pre-basic', NULL, '2022-04-08', 'Kampala', 'To be paid in cash', '1'),
(25, '2022-04-29 16:14:20', '2022-04-29 16:14:20', 95, 12, 1000, 'Pre-basic', NULL, '2022-05-31', 'kawempe', 'to be delivered in future', '1'),
(26, '2022-04-29 16:14:44', '2022-04-29 16:14:44', 98, 13, 85, 'Pre-basic', NULL, '2022-08-29', 'Mukono', 'Unshelled', '1'),
(27, '2022-04-29 16:14:52', '2022-04-29 16:14:52', 74, 19, 1000, 'Certified', 'Processed', '2022-05-31', 'Supply store', 'Please supply and payment will be made on delivery', '1'),
(28, '2022-04-29 16:15:07', '2022-04-29 16:15:07', 79, 1, 200, 'Pre-basic', NULL, '2022-05-29', 'Kasese', 'Will use link bus', '1'),
(29, '2022-04-29 16:15:26', '2022-04-29 16:15:26', 80, 19, 200, 'Pre-basic', NULL, '2022-05-29', 'kampala', NULL, '1'),
(30, '2022-04-29 16:15:29', '2022-04-29 16:15:29', 88, 1, 200, 'Pre-basic', NULL, '2022-09-22', 'bugiri', 'egyeg', '1'),
(31, '2022-04-29 16:15:32', '2022-04-29 16:15:32', 94, 1, 1000, 'Pre-basic', NULL, '2022-07-04', 'kiryandongo', 'direct transfer', '1'),
(32, '2022-04-29 16:16:09', '2022-04-29 16:16:09', 90, 1, 3000, 'Basic', NULL, '2022-04-16', 'Jinja', 'Payment after delivery', '1'),
(33, '2022-04-29 16:16:49', '2022-04-29 16:16:49', 91, 12, 900, 'Pre-basic', NULL, '2022-05-05', 'Madindi', 'I will pay  at the end of the season', '1'),
(34, '2022-04-29 16:17:11', '2022-04-29 16:17:11', 94, 1, 400, 'Certified', 'Processed', '2022-09-04', 'kampala', 'payment after delivery', '1'),
(35, '2022-04-29 16:17:34', '2022-04-29 16:17:34', 89, 122, 150, 'Pre-basic', NULL, '2022-04-30', 'Gulu', 'Can be picked by the beginning of next season', '1'),
(36, '2022-04-29 16:18:28', '2022-04-29 16:18:28', 86, 20, 100, 'Pre-basic', NULL, '2022-08-15', 'Kampala', 'I will pay on delivery', '1'),
(37, '2022-04-29 16:22:23', '2022-04-29 16:22:23', 90, 12, 5000, 'Pre-basic', NULL, '2022-04-20', 'Kawempe', 'Payment on delivery', '1'),
(38, '2022-05-31 12:08:27', '2022-05-31 12:08:27', 114, 86, 2000, 'Basic', NULL, '2022-06-01', 'At the storage location', 'Please supply this variety of soybean and must be ready to conduct germination test \r\nPayment will be made after the seeds have passed the required percentage of germination test', '1');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `seed_label_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `quantity` bigint(20) DEFAULT 0,
  `lab_test_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lot_number` bigint(20) DEFAULT 0,
  `seed_class` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `wholesale_price` int(11) DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `seed_label_id`, `quantity`, `lab_test_number`, `lot_number`, `seed_class`, `price`, `wholesale_price`, `image`, `images`, `source`, `detail`, `name`, `total_price`) VALUES
(3, '2021-11-23 07:23:01', '2021-11-23 16:57:47', 3, 3, 3, 1000, 'A000120C', 89806835, NULL, 900, 0, 'a54783a032b79e0841ad2688d3ecf349.jpg', NULL, 'From seedlab test number: A000120C', 'From seedlab ID: 3', 'Bush Beans - NABE1', 0),
(4, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 84, 1, 4, 6, '009/2022/dom', 58058008, NULL, 0, 0, NULL, NULL, 'From seedlab test number: 009/2022/dom', 'good quality seed', 'Default crop vareity', 0),
(5, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 90, 1, 5, 1850, '008/dom/2022', 19767497, NULL, 0, 0, NULL, NULL, 'From seedlab test number: 008/dom/2022', 'Payment through Mobile', 'Default crop vareity', 0),
(6, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 89, 1, 6, 250, 'Test1/2022/N0004', 24770820, NULL, 0, 0, NULL, NULL, 'From seedlab test number: Test1/2022/N0004', 'Sold to a stockists', 'Default crop vareity', 0),
(7, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 74, 1, 7, 850, '001/2022/dom', 71732547, NULL, 0, 0, NULL, NULL, 'From seedlab test number: 001/2022/dom', 'Sold to to Tina who are not users of the system', 'Default crop vareity', 0),
(8, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 86, 1, 8, 290, 'Test1/2022/N0002', 25554681, NULL, 0, 0, NULL, NULL, 'From seedlab test number: Test1/2022/N0002', 'Sold to school as grain', 'Default crop vareity', 0),
(9, '2022-04-29 15:36:18', '2022-04-29 16:44:30', 94, 1, 9, 150, 'TEST2/2022/2B', 67857572, NULL, 0, 0, NULL, NULL, 'From seedlab test number: TEST2/2022/2B', 'cash at hand', 'Default crop vareity', 0),
(10, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 95, 1, 10, 700, 'Test1/2022/N0007', 70484855, NULL, 0, 0, NULL, NULL, 'From seedlab test number: Test1/2022/N0007', 'not users of the sytem', 'Default crop vareity', 0),
(11, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 76, 1, 11, 500, '005/2022/dom', 75190054, NULL, 0, 0, NULL, NULL, 'From seedlab test number: 005/2022/dom', 'Sold to XYZ who are not users of the system.', 'Default crop vareity', 0),
(12, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 92, 1, 12, 10, 'TEST3/2022/3B', 88952214, NULL, 0, 0, NULL, NULL, 'From seedlab test number: TEST3/2022/3B', 'Sold as grain to dealers who\'s not user of the system', 'Default crop vareity', 0),
(13, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 91, 1, 16, 40, '004/2022/musa/001', 94922685, NULL, 0, 0, NULL, NULL, 'From seedlab test number: 004/2022/musa/001', 'User not in', 'Default crop vareity', 0),
(14, '2022-04-29 15:36:18', '2022-04-29 16:44:30', 80, 1, 14, 300, 'Test1/2022/N0009', 25675580, NULL, 0, 0, NULL, NULL, 'From seedlab test number: Test1/2022/N0009', 'sold as grain to school', 'Default crop vareity', 0),
(15, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 88, 1, 15, 1930, '008/34/dom', 14196693, NULL, 0, 0, NULL, NULL, 'From seedlab test number: 008/34/dom', 'sold to gfy who are not system users', 'Default crop vareity', 0),
(16, '2022-04-29 15:36:18', '2022-04-29 16:49:16', 85, 1, 17, 10, 'Test1/2022/N0001', 81650251, NULL, 0, 0, NULL, NULL, 'From seedlab test number: Test1/2022/N0001', 'Sold to Atia who is not a user of the system', 'Default crop vareity', 0),
(17, '2022-04-29 15:43:35', '2022-04-29 16:49:16', 78, 1, 19, 950, '003/2022/dom', 91804360, NULL, 0, 0, NULL, NULL, 'From seedlab test number: 003/2022/dom', 'Maize for food, for easy access', 'Default crop vareity', 0),
(18, '2022-04-29 15:43:35', '2022-04-29 15:43:35', 98, 1, 18, 20, '006/2022/dom', 72521820, NULL, 0, 0, NULL, NULL, 'From seedlab test number: 006/2022/dom', 'From seedlab ID: 64', 'Default crop vareity', 0);

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
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `username` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `pre_order_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `quantity` bigint(20) DEFAULT NULL,
  `supply_date` date DEFAULT NULL,
  `seed_class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invetory_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_by` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `decline_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `pre_order_id`, `quantity`, `supply_date`, `seed_class`, `invetory_status`, `detail`, `quotation_by`, `status`, `decline_reason`, `price`) VALUES
(3, '2021-11-24 05:34:57', '2021-11-24 05:34:57', 2, 3, 1, 800, '2021-11-30', 'Certified', 'Processed', 'Simple details...', 1, NULL, NULL, NULL),
(4, '2021-11-24 05:36:39', '2021-11-24 05:36:39', 2, 3, 1, 1800, '2021-11-30', 'Certified', 'Processed', 'detail.', 1, NULL, NULL, NULL),
(5, '2021-11-24 05:36:51', '2021-11-24 05:36:51', 2, 3, 1, 800, '2021-11-24', 'Certified', 'Processed', 'details', 1, NULL, NULL, NULL),
(6, '2021-11-24 05:37:41', '2021-11-24 05:37:41', 2, 3, 1, 1000, '2021-11-24', 'Certified', 'Processed', 'detail', 1, NULL, NULL, NULL),
(8, '2021-11-24 07:21:37', '2021-11-24 07:21:37', 25, 3, 2, 10000, '2021-11-24', 'Certified', 'Raw', 'simple', 2, NULL, NULL, 400),
(9, '2021-11-24 07:22:18', '2021-11-24 07:23:29', 25, 3, 2, 1000, '2021-12-01', 'Certified', 'Raw', 'simple', 2, 5, NULL, 40000),
(10, '2021-11-24 08:18:35', '2021-11-24 08:18:58', 25, 3, 3, 1000, '2021-12-07', 'Certified', 'Processed', 'details...', 2, 5, NULL, 800),
(11, '2022-04-26 17:03:12', '2022-04-26 17:03:12', 23, 13, 5, 800, '2022-04-21', 'Certified', 'Raw', 'ksdbjlkn', 69, NULL, NULL, 800),
(12, '2022-04-26 17:07:02', '2022-04-26 17:07:02', 55, 12, 4, 2000, '2022-05-20', 'Certified', 'Processed', NULL, 38, NULL, NULL, 1000),
(13, '2022-04-26 17:07:31', '2022-04-26 17:07:31', 40, 13, 7, 14, '2022-04-30', 'Certified', 'Processed', 'Payment on delivery', 69, NULL, NULL, 15000),
(14, '2022-04-26 17:07:32', '2022-04-26 17:07:32', 48, 13, 8, 2000, '2022-04-26', 'Certified', 'Processed', 'good', 53, NULL, NULL, 1000),
(15, '2022-04-26 17:08:30', '2022-04-26 17:08:30', 56, 12, 4, 2000, '2022-04-26', 'Certified', 'Processed', 'THANK YOU', 38, NULL, NULL, 3000),
(16, '2022-04-26 17:08:41', '2022-04-26 17:08:41', 62, 19, 10, 500, '2022-04-30', 'Certified', 'Processed', 'Only pre payments allowed', 44, NULL, NULL, 7000),
(17, '2022-04-26 17:08:42', '2022-04-26 17:08:42', 45, 12, 6, 600, '2022-04-26', 'Certified', 'Processed', 'Cash delivery', 56, NULL, NULL, 500),
(18, '2022-04-26 17:09:07', '2022-04-26 17:09:07', 38, 12, 15, 50, '2022-04-26', 'Basic', NULL, 'Cash', 54, NULL, NULL, 5000),
(19, '2022-04-26 17:09:42', '2022-04-26 17:09:42', 69, 12, 12, 50, '2022-04-27', 'Certified', 'Processed', 'asap', 63, NULL, NULL, 5000),
(20, '2022-04-26 17:10:01', '2022-04-29 16:36:32', 63, 13, 14, 82, '2022-04-29', 'Certified', 'Raw', 'certified seed', 55, 5, NULL, 1000),
(21, '2022-04-26 17:10:40', '2022-04-26 17:10:40', 38, 12, 15, 50, '2022-04-26', 'Basic', NULL, 'Cash', 54, NULL, NULL, 500),
(22, '2022-04-26 17:10:51', '2022-04-26 17:10:51', 47, 13, 5, 50, '2022-09-26', 'Certified', 'Raw', 'keep time', 69, NULL, NULL, 4000),
(23, '2022-04-26 17:11:14', '2022-04-26 17:11:14', 62, 19, 10, 3000, '2022-04-30', 'Certified', 'Processed', 'Only prepayment allowed', 44, NULL, NULL, 4500),
(24, '2022-04-26 17:11:36', '2022-04-26 17:11:36', 49, 12, 6, 5, '2022-05-02', 'Certified', 'Processed', 'CASH AT HAND', 56, NULL, NULL, 5000),
(25, '2022-04-26 17:12:51', '2022-04-26 17:12:51', 45, 12, 6, 1000, '2022-04-26', 'Certified', 'Processed', 'Order with cash', 56, NULL, NULL, 4000),
(26, '2022-04-26 17:15:00', '2022-04-26 17:15:00', 41, 195, 18, 216, '2022-04-29', 'Pre-basic', NULL, 'alert me when u finish', 50, NULL, NULL, 7000),
(27, '2022-04-26 17:15:11', '2022-04-26 17:15:11', 44, 13, 7, 4, '2022-04-28', 'Certified', 'Processed', 'pick up at the factory', 69, NULL, NULL, 60000),
(28, '2022-04-29 16:15:11', '2022-04-29 16:15:11', 84, 173, 16, 10, '2022-04-29', 'Pre-basic', NULL, NULL, 52, NULL, NULL, 1000),
(29, '2022-04-29 16:16:35', '2022-04-29 16:16:35', 84, 173, 16, 10, '2022-05-04', 'Pre-basic', NULL, 'on delivery', 52, NULL, NULL, 34),
(30, '2022-04-29 16:21:14', '2022-04-29 16:23:17', 76, 12, 24, 300, '2022-06-30', 'Pre-basic', NULL, 'Cash payment.', 85, 5, NULL, 1000),
(31, '2022-04-29 16:21:17', '2022-04-29 16:21:17', 95, 13, 7, 100, '2022-05-31', 'Certified', 'Processed', 'cash payment', 69, NULL, NULL, 2000),
(32, '2022-04-29 16:21:42', '2022-04-29 16:21:42', 80, 13, 8, 300, '2022-06-29', 'Certified', 'Processed', 'expect payment', 53, NULL, NULL, 1000),
(33, '2022-04-29 16:22:27', '2022-04-29 16:28:32', 89, 19, 27, 50, '2022-04-30', 'Certified', 'Processed', 'Payment at delivery', 74, 5, NULL, 7000),
(34, '2022-04-29 16:22:53', '2022-04-29 16:22:53', 86, 13, 8, 100, '2022-07-29', 'Certified', 'Processed', 'Cash on delivery', 53, NULL, NULL, 6000),
(35, '2022-04-29 16:22:59', '2022-04-29 16:22:59', 98, 12, 4, 150, '2022-05-05', 'Certified', 'Processed', 'Payment on delivery', 38, NULL, NULL, 1000),
(36, '2022-04-29 16:23:22', '2022-04-29 16:23:22', 74, 19, 10, 150, '2022-07-25', 'Certified', 'Processed', 'I\'ll expect cash on delivery', 44, NULL, NULL, 6000),
(37, '2022-04-29 16:24:30', '2022-04-29 16:24:30', 92, 19, 10, 20, '2022-04-30', 'Certified', 'Processed', 'Payment after hervest', 44, NULL, NULL, 3000),
(38, '2022-04-29 16:25:06', '2022-04-29 16:25:06', 98, 12, 4, 450, '2022-04-29', 'Certified', 'Processed', 'Come by road', 38, NULL, NULL, 1000),
(39, '2022-04-29 16:25:48', '2022-04-29 16:25:48', 94, 20, 20, 200, '2022-05-02', 'Certified', 'Processed', 'cash on delivery', 41, NULL, NULL, 2500),
(41, '2022-04-29 16:26:27', '2022-04-29 16:36:51', 78, 13, 14, 30, '2022-04-30', 'Certified', 'Raw', 'Bringing cahs', 55, 5, NULL, 30000),
(42, '2022-04-29 16:26:55', '2022-04-29 16:26:55', 91, 19, 10, 200, '2022-04-29', 'Certified', 'Processed', 'Cash payment', 44, NULL, NULL, 1000),
(43, '2022-04-29 16:28:08', '2022-04-29 16:28:08', 91, 19, 10, 50, '2022-05-04', 'Certified', 'Processed', 'Cash at hand', 44, NULL, NULL, 100),
(44, '2022-04-29 16:34:39', '2022-04-29 16:34:39', 76, 12, 24, 100, '2022-08-31', 'Pre-basic', NULL, NULL, 85, NULL, NULL, 2000),
(45, '2022-04-29 16:36:19', '2022-04-29 16:36:19', 94, 20, 20, 10, '2022-05-02', 'Certified', 'Processed', 'cash on delivery', 41, NULL, NULL, 2500),
(46, '2022-04-29 16:38:51', '2022-04-29 16:38:51', 94, 1, 32, 100, '2022-05-03', 'Basic', NULL, 'cash on delivery', 90, NULL, NULL, 10000),
(47, '2022-04-29 16:40:52', '2022-04-29 16:40:52', 89, 19, 27, 200, '2022-04-27', 'Certified', 'Processed', 'Hurry', 74, NULL, NULL, 7000),
(48, '2022-04-29 16:42:42', '2022-04-29 16:42:42', 89, 1, 31, 200, '2022-04-29', 'Pre-basic', NULL, 'Hurry', 94, NULL, NULL, 7000);

-- --------------------------------------------------------

--
-- Table structure for table `seed_label`
--

CREATE TABLE `seed_label` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `seed_lab_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `quantity` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_quantity` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicant_remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT 0,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seed_labels`
--

CREATE TABLE `seed_labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `seed_lab_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `seed_label_package_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `quantity` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicant_remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_processed` int(11) DEFAULT 0,
  `price` bigint(20) DEFAULT 0,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seed_labels`
--

INSERT INTO `seed_labels` (`id`, `created_at`, `updated_at`, `administrator_id`, `seed_lab_id`, `crop_variety_id`, `seed_label_package_id`, `quantity`, `applicant_remarks`, `status`, `status_comment`, `receipt`, `is_processed`, `price`, `image`, `images`) VALUES
(2, '2021-11-17 03:44:56', '2022-04-29 15:24:47', 3, 1, 1, 2, '7000', 'test', 14, NULL, 'files/Sandboxing.pptx', 1, 0, NULL, NULL),
(3, '2021-11-23 07:20:48', '2022-04-29 15:24:47', 3, 3, 1, 2, '1000', 'detail..', 14, NULL, '017f0660b583f8feaa039da7030a631a.png', 1, 800, 'beans.jpg', NULL),
(4, '2022-04-29 15:15:45', '2022-04-29 15:30:55', 84, 73, 1, 1, '11', 'good', 14, NULL, 'files/20220311_181708.jpg', 1, 2500, '20220311_181708.jpg', '[]'),
(5, '2022-04-29 15:17:59', '2022-04-29 15:31:04', 90, 59, 1, 1, '2000', 'Quality seeds for better living', 14, NULL, 'files/IMG_20220429_122740_431.jpg', 1, 1000, 'IMG_20220429_123248_959.jpg', '[]'),
(6, '2022-04-29 15:18:23', '2022-04-29 15:31:14', 89, 67, 1, 2, '500', 'Quality is our first name', 14, NULL, 'files/2322e9b600c53e60abaaa2cbb59c1100.jpg', 1, 6000, 'Screenshot_20220429-103319_GBWhatsApp.jpg', '[]'),
(7, '2022-04-29 15:18:24', '2022-04-29 15:31:24', 74, 69, 1, 3, '1000', 'Seeds for health and wealth', 14, NULL, 'files/16512310370708414431627418956230.jpg', 1, 3500, 'IMG-20220429-WA0005.jpg', '[]'),
(8, '2022-04-29 15:18:45', '2022-04-29 15:31:34', 86, 72, 1, 2, '300', 'Seeds for better quality.', 14, NULL, 'files/16512310413854788900669439657411.jpg', 1, 1000, '16512309748239218677710295020633.jpg', '[]'),
(9, '2022-04-29 15:19:33', '2022-04-29 15:31:42', 94, 74, 1, 1, '200', 'QUALITY IS OUR FIRST NAME', 14, NULL, 'files/IMG_20210730_123544.jpg', 1, 2500, 'IMG_20210730_123634.jpg', '[]'),
(10, '2022-04-29 15:19:42', '2022-04-29 15:31:51', 95, 60, 1, 2, '1000', 'seeds ready for supply', 14, NULL, 'files/grower 7.xlsx', 1, 2000, '9f676db06ac87abb9745b70bcd9bb297.PNG', '[]'),
(11, '2022-04-29 15:20:00', '2022-04-29 15:32:03', 76, 62, 1, 2, '1000', NULL, 14, NULL, 'files/Google workspace.JPG', 1, 2000, 'Market analysis-2.jpg', '[]'),
(12, '2022-04-29 15:20:23', '2022-04-29 15:32:22', 92, 68, 1, 2, '20', 'Payment  made for labels', 14, NULL, 'files/9783ee581fde3e5cbcc6b01ba1841bc9.jpg', 1, 1000, 'IMG-20220421-WA0005.jpg', '[]'),
(13, '2022-04-29 15:21:33', '2022-04-29 15:32:31', 79, 66, 1, 1, '200', 'It\'s a certified seed', 14, NULL, 'files/tmp-cam-5556624534290479018.jpg', 1, 400, 'Screenshot_20220429-122257.jpg', '[]'),
(14, '2022-04-29 15:23:05', '2022-04-29 15:32:45', 80, 65, 1, 1, '500', NULL, 14, NULL, 'files/fc1cba05d1fd21a24d6257f8839dbec8.png', 1, 4500, 'beans.gif', '[]'),
(15, '2022-04-29 15:24:22', '2022-04-29 15:32:55', 88, 71, 1, 2, '2000', NULL, 14, NULL, 'files/1651231386660509774517.jpg', 1, 5000, '1651231353620-156952194.jpg', '[]'),
(16, '2022-04-29 15:24:25', '2022-04-29 15:32:41', 91, 76, 1, 1, '100', NULL, 14, NULL, 'files/IMG-20220429-WA0021.jpg', 1, 1000, 'IMG-20220429-WA0021.jpg', '[]'),
(17, '2022-04-29 15:24:51', '2022-04-29 15:32:59', 85, 77, 1, 2, '50', 'Label', 14, NULL, 'files/16512314254025435177053817723483.jpg', 1, 1000, '16512313950653172031282489036791.jpg', '[]'),
(18, '2022-04-29 15:35:56', '2022-04-29 15:40:43', 98, 64, 1, 1, '20', NULL, 14, NULL, 'files/tmp-cam-1886969605103182740.jpg', 1, 100, NULL, '[]'),
(19, '2022-04-29 15:37:59', '2022-04-29 15:40:29', 78, 63, 1, 1, '1000', NULL, 14, NULL, 'files/DSC_7990.JPG', 1, 3000, 'DSC_7990.JPG', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `seed_label_packages`
--

CREATE TABLE `seed_label_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `package_size` int(11) DEFAULT 0,
  `package_price` int(11) DEFAULT 0,
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
(1, '2021-11-26 04:51:13', '2022-04-26 16:33:00', 1, 3, 1, NULL, NULL, NULL, '2022-04-26', '20', 'Green', '15', '00001', NULL, NULL, 'Moisture content,Purity', NULL, 0, '100', '90', '90', '10', '11', 27, 1, 5, NULL, '10000', 1, NULL, '001', 23, 90, 0, 0, 'No name', 0),
(2, '2021-11-26 04:51:26', '2022-04-26 16:35:13', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '2', '5', '15', '0000089', NULL, NULL, 'Moisture content,Purity,Germination', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '86472944', 1, NULL, 'TestI002', 23, 90, 0, 0, 'No name', 0),
(3, '2021-11-26 04:52:46', '2022-04-26 16:34:03', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '2', '5', '15', '0000758', NULL, NULL, 'Purity,Germination,Seed health', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '38069215', 1, NULL, 'test 123', 23, 90, 0, 0, 'No name', 0),
(4, '2021-11-26 04:52:58', '2022-04-26 16:34:49', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '3', '5', '15', '7', NULL, NULL, 'Purity', NULL, 0, '100', '90', '1', '3', '11', 27, 1, 5, NULL, '76105202', 1, NULL, 'Test i ben00023', 23, 90, 0, 0, 'No name', 0),
(5, '2021-11-26 04:53:15', '2022-04-26 16:33:42', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '20', '10', '1', '000085', NULL, NULL, 'Purity', NULL, 0, '100', '90', '1', '3', '11', 27, 1, 5, NULL, '50750684', 1, NULL, 'Test i ben0001', 23, 90, 0, 0, 'No name', 0),
(6, '2021-11-26 04:53:26', '2022-04-26 16:34:15', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '9', '5', '15', '89', NULL, NULL, 'Purity', NULL, 0, '100', '90', '1', '3', '11', 27, 1, 5, NULL, '42169064', 1, NULL, '000198', 23, 90, 0, 0, 'No name', 0),
(7, '2021-11-26 04:53:40', '2022-04-26 16:37:08', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '3', 'good', '15', '000056', NULL, NULL, 'Purity', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '36917997', 1, NULL, 'test1234', 23, 90, 0, 0, 'No name', 0),
(8, '2021-11-26 04:53:51', '2022-04-26 16:33:22', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '2', '5', '15', '00007', NULL, NULL, 'Moisture content,Germination', NULL, 0, '99', '95', '00', '00', '11', 27, 1, 5, NULL, '75424505', 1, NULL, 'test 657898789', 23, 94, 6, 0, 'No name', 0),
(9, '2021-11-26 04:54:03', '2022-04-26 16:35:57', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '20', 'green', '15', '005', NULL, NULL, 'Purity', NULL, 0, '100', '90', '1', '3', '11', 27, 1, 5, NULL, '43223090', 1, NULL, 'test 12345', 23, 90, 0, 0, 'No name', 0),
(10, '2021-11-26 04:54:30', '2022-04-26 16:36:38', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '1', '5', '15', '7632', NULL, NULL, 'Moisture content,Germination', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '17790424', 1, NULL, 'Test i ben00021', 23, 90, 4, 0, 'No name', 0),
(11, '2021-11-26 04:54:40', '2022-04-26 16:38:11', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '3', '5', '15', '000065', NULL, NULL, 'Moisture content,Purity,Germination', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '81826637', 1, NULL, 'test00987', 23, 90, 0, 0, 'No name', 0),
(12, '2021-11-26 04:55:27', '2022-04-26 16:37:41', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '30', 'green', '15', '001', NULL, NULL, 'Purity', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '88703129', 1, NULL, 'Test i ben0004', 23, 90, 0, 0, 'No name', 0),
(13, '2021-11-26 04:55:51', '2022-04-26 16:36:09', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '3', '5', '15', '87000', NULL, NULL, 'Moisture content,Germination', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '74075858', 1, NULL, 'Test i ben0002', 23, 90, 0, 0, 'No name', 0),
(14, '2021-11-26 04:56:27', '2022-04-26 16:34:01', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '4', '10', '15', '9', NULL, NULL, 'Purity', NULL, 0, '100', '98', '80', '10', '11', 27, 1, 5, NULL, '10015671', 1, NULL, 'Test i ben0006', 23, 98, 3, 0, 'No name', 0),
(15, '2021-11-26 06:39:41', '2022-04-26 16:37:04', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '10', '5', '15', '6', NULL, NULL, 'Purity', NULL, 0, '100', '90', '1', '3', '11', 27, 1, 5, NULL, '81737716', 1, NULL, 'Test i ben0003', 23, 90, 8, 0, 'No name', 0),
(16, '2021-11-26 06:40:07', '2022-04-26 16:35:20', 1, 1, 1, NULL, NULL, NULL, '2022-04-26', '5', '10', '2', '8585858', NULL, NULL, 'Germination', NULL, 0, '100', '90', '1', '3', '11', 27, 1, 5, NULL, '49328745', 1, NULL, 'test 123456', 23, 90, 15, 0, 'No name', 0),
(17, '2021-11-26 08:54:39', '2021-11-26 10:45:45', 3, 3, 2, '2021-11-26', 'download.png', 'Simple', '2021-11-26', '100', 'No Packaging', '15', '10000', NULL, NULL, 'Purity,Germination', NULL, 1200, '10', '20', '10', '10', '11', 20, 1, 5, NULL, '46996209', 1, NULL, 'A1200', 23, 2, 1, 17, '46996209', 0),
(18, '2022-02-21 06:34:04', '2022-04-29 13:00:23', 3, 3, 2, '2022-02-25', '33.jpeg', 'Collection ready', '2022-04-29', '3424', '20', '15', '5432', NULL, NULL, 'Germination', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20, 1, 10, NULL, '60520736', 1, NULL, 'TEST1/2022/B001', 23, NULL, 0, 0, 'No name', 0),
(19, '2022-02-25 07:25:11', '2022-02-25 07:29:09', 3, 3, 2, '2022-02-26', '375c1056abc77e562050c0e7c8aed20b.png', 'READY FOR SAMPLING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(20, '2022-03-24 14:17:02', '2022-04-26 16:34:08', 31, 4, 4, '2022-03-25', NULL, 'Seed lab testing', '2022-04-26', '25', 'green', '15', '005', NULL, NULL, 'Purity', NULL, 0, '98', '95', '00', '00', '11', 27, 1, 5, NULL, '46345456', 1, NULL, 'test 2395', 23, 93, 1, 0, 'No name', 0),
(21, '2022-03-29 10:13:27', '2022-04-26 16:36:32', 28, 7, 7, '2022-04-02', 'files/7d0fb76c674bceee023f3de38ddf2afb.jpg', 'Please get sample seeds for testing.', '2022-04-26', '10', 'good', '15', '000067', NULL, NULL, 'Purity', NULL, 0, '100', '90', '1', '3', '11', 27, 1, 5, NULL, '48372188', 1, NULL, 'test 65456', 23, 90, 0, 0, 'No name', 0),
(22, '2022-04-26 12:20:32', '2022-04-26 16:33:52', 55, 13, 13, '2022-04-30', 'files/download.png', 'My seeds a ready for lab testing.', '2022-04-26', '25', 'green', '15', '003', NULL, NULL, 'Purity,Germination', NULL, 0, '100', '90', '10', '20', '11', 27, 1, 5, NULL, '95527227', 1, NULL, 'TestI003', 23, 90, 0, 0, 'No name', 0),
(23, '2022-04-26 12:20:50', '2022-04-26 16:33:15', 39, 15, 15, '2022-04-30', 'files/4th distribution.xlsx', 'my seeds here to be tested', '2022-04-26', '10', 'green', '15', '00002', NULL, NULL, 'Moisture content', NULL, 0, '90', '90', '0', '0', '11', 27, 1, 5, NULL, '35913630', 1, NULL, 'test 897678', 23, 81, 0, 0, 'No name', 0),
(24, '2022-04-26 12:21:04', '2022-04-26 16:33:34', 62, 12, 12, '2022-04-30', 'files/House plan', 'Please attend to my request for seed sampling', '2022-04-26', '20', 'green', '15', '0007', NULL, NULL, 'Purity', NULL, 0, '99', '99', '1', '0', '11', 27, 1, 5, NULL, '59121128', 1, NULL, 'Test i ben0009', 23, 98, 1, 0, 'No name', 0),
(25, '2022-04-26 12:21:11', '2022-04-26 16:38:07', 52, 32, 32, '2022-04-28', 'files/3bd43f83cc877fd975d2c4427956f88f.jpg', '45mt', '2022-04-26', '1', '5', '15', '7685432', NULL, NULL, 'Germination', NULL, 0, '90', '85', '0', '0', '11', 27, 1, 5, NULL, '79813266', 1, NULL, 'Test i ben00025', 23, 77, 0, 0, 'No name', 0),
(26, '2022-04-26 12:21:11', '2022-04-26 16:37:45', 69, 30, 30, '2022-04-29', 'files/c53fa12982eed4f614741b90c2c47b44.docx', 'My beans seeds is ready for collections\r\naaas', '2022-04-26', '1', '5', '15', '00075', NULL, NULL, 'Purity', NULL, 0, '100', '90', '1', '3', '11', 27, 1, 5, NULL, '85415259', 1, NULL, 'Test i ben00012', 23, 90, 0, 0, 'No name', 0),
(27, '2022-04-26 12:21:27', '2022-04-26 16:37:40', 56, 19, 19, '2022-04-16', 'files/HAND OVER TO NALI.docx', 'my seed is over due for sampling', '2022-04-26', '2', '5', '15', '00000078', NULL, NULL, 'Seed health', NULL, 0, '90', '85', '0', '0', '11', 27, 1, 5, NULL, '28075991', 1, NULL, 'Test i ben00013', 23, 77, 0, 0, 'No name', 0),
(28, '2022-04-26 12:21:34', '2022-04-26 16:38:57', 40, 11, 11, '2022-05-06', 'files/Screenshot (31).png', 'Urgent', '2022-04-26', '20', 'green', '15', '002', NULL, NULL, 'Purity', NULL, 0, '90', '87', '0', '0', '11', 27, 1, 5, NULL, '40690141', 1, NULL, 'Test i ben00016', 23, 78, 0, 0, 'No name', 0),
(29, '2022-04-26 12:21:35', '2022-04-26 16:39:22', 48, 43, 43, '2022-04-26', 'files/MT Feedback Form.docx', 'seed ok', '2022-04-26', '1', '5', '15', '6778', NULL, NULL, 'Purity', NULL, 0, '90', '85', '0', '0', '11', 20, 1, 5, NULL, '17235203', 1, NULL, 'Test i ben00023', 23, 77, 0, 0, 'No name', 0),
(30, '2022-04-26 12:21:41', '2022-04-26 16:38:12', 43, 20, 20, '2022-04-30', 'files/1635347319547.jpg', 'We are requesting for seed testing', '2022-04-26', '1', '5', '15', '3421786', NULL, NULL, 'Seed health', NULL, 0, '100', '99', '2', '1', '11', 27, 1, 5, NULL, '77077494', 1, NULL, 'Test i ben00024', 23, 99, 0, 0, 'No name', 0),
(31, '2022-04-26 12:21:47', '2022-04-26 16:39:10', 54, 44, 44, '2022-04-29', 'files/Booster Dose Letter.jpg', 'The seeds are packed in 100 kg bags', '2022-04-26', '3', 'good', '15', '43', NULL, NULL, 'Purity', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '10812083', 1, NULL, 'Test i ben00014', 23, 90, 0, 0, 'No name', 0),
(32, '2022-04-26 12:22:07', '2022-04-26 16:38:44', 69, 17, 17, '2022-04-27', 'files/872e29aed3534f34143f6a761a1e01cd.docx', 'am here', '2022-04-26', '1', '5', '15', '00987', NULL, NULL, 'Germination', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '56894193', 1, NULL, '0008', 23, 90, 0, 0, 'No name', 0),
(33, '2022-04-26 12:22:22', '2022-04-26 16:37:56', 41, 10, 10, '2022-04-28', 'files/news extract.jpeg', 'my seeds are ready for collection to be tested', '2022-04-26', '3', 'good', '15', '74', NULL, NULL, 'Purity', NULL, 0, '99', '92', '00', '00', '11', 27, 1, 5, NULL, '95870819', 1, NULL, 'test 543234', 23, 91, 0, 0, 'No name', 0),
(34, '2022-04-26 12:22:22', '2022-04-26 16:39:28', 45, 42, 42, '2022-04-26', 'files/IMG-20220426-WA0007.jpg', 'Seeds are ready for lab test', '2022-04-26', '50', '10', '10', '11234', NULL, NULL, 'Purity,Germination', NULL, 0, '99', '95', '00', '00', '11', 27, 1, 5, NULL, '58990635', 1, NULL, 'Test i ben00018', 23, 94, 1, 0, 'No name', 0),
(35, '2022-04-26 12:22:24', '2022-04-26 16:39:45', 42, 34, 34, '2022-04-27', 'files/IMG-20220425-WA0031.jpg', 'Make sure you come tomorrow\r\nLast time you delayed', '2022-04-26', '3', 'good', '15', '12', NULL, NULL, 'Purity', NULL, 0, '99', '93', '00', '00', '11', 27, 1, 5, NULL, '35445364', 1, NULL, 'Test i ben00017', 23, 92, 0, 0, 'No name', 0),
(36, '2022-04-26 12:22:30', '2022-04-26 16:38:46', 37, 25, 25, '2022-04-26', 'files/3f79bcfbe6d145b6da4ead463698f240.xlsx', 'My seeds are ready for testing. Please come for sseed sampling', '2022-04-26', '1', '5', '15', '0087', NULL, NULL, 'Moisture content', NULL, 0, '99', '91', '00', '00', '11', 27, 1, 5, NULL, '99891335', 1, NULL, 'test 1232123', 23, 90, 0, 0, 'No name', 0),
(37, '2022-04-26 12:22:37', '2022-04-26 16:35:13', 62, 24, 24, '2022-04-30', 'files/1650961298349123462984.jpg', 'Collect my seed for lab testing', '2022-04-26', '2', '5', '15', '00000000876', NULL, NULL, 'Germination', NULL, 0, '99', '99', '0', '0', '11', 27, 1, 5, NULL, '63387258', 1, NULL, '00091', 23, 98, 0, 0, 'No name', 0),
(38, '2022-04-26 12:22:53', '2022-04-26 12:31:04', 44, 16, 16, '2022-05-26', 'files/080f3eff0cdc12e67ede670a31a8e9f3.docx', 'please come and pick my samples', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(39, '2022-04-26 12:22:59', '2022-04-26 12:30:29', 69, 33, 33, '2022-04-28', 'files/c0eec54441c03b363c0a05d7f184f04c.docx', 'an on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(40, '2022-04-26 12:23:08', '2022-04-26 12:28:57', 37, 25, 25, '2022-04-26', 'files/3b47f6c06047ef7e95aa68e02164eae0.xlsx', 'My seeds are ready for testing. Please come for seed sampling', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(41, '2022-04-26 12:23:25', '2022-04-26 16:39:57', 38, 14, 14, '2022-04-13', 'files/Screenshot_20220425-225419.jpg', 'Good', '2022-04-26', '2', '5', '15', '4562', NULL, NULL, 'Purity', NULL, 0, '100', '90', '1', '3', '11', 20, 1, 5, NULL, '43841205', 1, NULL, 'Test i ben00024', 23, 90, 0, 0, 'No name', 0),
(42, '2022-04-26 12:23:25', '2022-04-26 16:35:51', 53, 40, 40, '2021-02-20', 'files/193cb8367ea8b50a228499799bb460fb.jpg', 'Good sample', '2022-04-26', '3', 'good', '15', '89', NULL, NULL, 'Purity', NULL, 0, '99', '92', '00', '00', '11', 27, 1, 5, NULL, '60905069', 1, NULL, 'Test i ben00019', 23, 91, 0, 0, 'No name', 0),
(43, '2022-04-26 12:23:43', '2022-04-26 16:35:13', 47, 18, 18, '2022-04-13', 'files/IMG_20210520_103045.jpg', 'please make sure that its ready by then', '2022-04-26', '3', 'good', '15', '73', NULL, NULL, 'Purity', NULL, 0, '99', '94', '00', '1', '11', 27, 1, 5, NULL, '29463972', 1, NULL, '0008', 23, 93, 0, 0, 'No name', 0),
(44, '2022-04-26 12:24:04', '2022-04-26 16:37:18', 50, 47, 47, '2022-04-29', 'files/20211012_101854.jpg', 'We are expecting you not to delay', '2022-04-26', '3', 'good', '15', '64', NULL, NULL, 'Purity', NULL, 0, '90', '87', '0', '0', '11', 27, 1, 5, NULL, '35326208', 1, NULL, 'test 89769', 23, 78, 0, 0, 'No name', 0),
(45, '2022-04-26 12:24:10', '2022-04-26 16:34:23', 49, 21, 21, '2022-04-29', 'files/fd027c92aeb719bc52d23956aa5a3585.JPG', 'my stock is ready for collection', '2022-04-26', '20', 'green', '15', '0006', NULL, NULL, 'Moisture content', NULL, 0, '75', '75', '30', '10', '12', 27, 1, 5, NULL, '64947833', 1, NULL, 'A1200', 23, 56, 0, 0, 'No name', 0),
(46, '2022-04-26 12:24:15', '2022-04-26 16:34:07', 69, 38, 38, '2022-04-30', 'files/a1a734f60ddba506ae47d619c49c03ac.docx', 'hi', '2022-04-26', '2', '5', '15', '0000000000453', NULL, NULL, 'Seed health', NULL, 0, '96', '90', '0', '0', '11', 27, 1, 5, NULL, '27049721', 1, NULL, 'Test i ben00011', 23, 86, 0, 0, 'No name', 0),
(47, '2022-04-26 12:24:19', '2022-04-26 16:34:44', 41, 41, 41, '2022-04-29', 'files/distribution.jpg', 'seed ready for lab test', '2022-04-26', '3', 'good', '15', '0000091', NULL, NULL, 'Purity', NULL, 0, '90', '90', '0', '0', '11', 27, 1, 5, NULL, '52595077', 1, NULL, 'A12002', 23, 81, 0, 0, 'No name', 0),
(48, '2022-04-26 12:24:55', '2022-04-26 16:35:13', 63, 23, 23, '2022-04-26', 'files/33e344dc6628641aeb159fea3c0f1e4c.docx', 'My field seed samples are ready for lab test so kindly come and pick.', '2022-04-26', '10', '10', '100', '2011', NULL, NULL, 'Moisture content,Purity,Germination', NULL, 0, '95', '87', '0', '0', '11', 27, 1, 5, NULL, '92848435', 1, NULL, 'test 453212', 23, 83, 0, 0, 'No name', 0),
(49, '2022-04-26 12:25:05', '2022-04-26 16:35:39', 44, 26, 26, '2022-05-26', 'files/78687634e44fc02dbe6a5de8c4c0947f.docx', 'samples are ready for collection', '2022-04-26', '12', '10', '15', '6', NULL, NULL, 'Purity', NULL, 0, '96', '87', '0', '0', '11', 27, 1, 5, NULL, '79136001', 1, NULL, '003', 23, 84, 0, 0, 'No name', 0),
(50, '2022-04-26 12:25:58', '2022-04-29 13:09:10', 47, 28, 28, '2022-05-26', 'files/20210504_114758.jpg', 'please be fast', '2022-05-06', '40', '10', '15', '3', NULL, NULL, 'Purity', NULL, 0, '100', '98', '90', '90', '11', 27, 1, 5, NULL, '29268784', 1, NULL, 'Test1/2022/N0006', 23, 98, 1, 0, 'No name', 0),
(51, '2022-04-26 12:27:34', '2022-04-26 16:48:00', 49, 29, 29, '2022-04-26', 'files/d3a51ac372845d0ecb4ced497025f10a.JPG', 'my stock is ready for collectiobn', '2022-04-26', '1', '5', '15', '00000000000009867', NULL, NULL, 'Germination', NULL, 0, '100', '90', '90', '90', '11', 27, 1, 5, NULL, '77686635', 1, NULL, 'test 000000000009876', 23, 90, 0, 0, 'No name', 0),
(52, '2022-04-26 12:28:10', '2022-04-26 16:36:35', 51, 35, 35, '2022-04-26', 'files/09d2707c7913b03b1576a16158f47964.jpg', 'To be tested for lab test', '2022-04-26', '10', '5', '150', '15432', NULL, NULL, 'Moisture content,Purity,Germination', NULL, 0, '95', '90', '0', '0', '11', 27, 1, 5, NULL, '36337843', 1, NULL, '0002', 23, 86, 0, 0, 'No name', 0),
(53, '2022-04-26 12:30:42', '2022-04-26 12:32:35', 46, 39, 39, '2022-04-29', 'files/16509618771402014145511.jpg', 'Sent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(54, '2022-04-26 12:37:35', '2022-04-29 12:22:14', 47, 37, 37, '2022-05-26', 'files/20210504_114720.jpg', 'the earlier the better', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(55, '2022-04-26 13:03:50', '2022-04-29 12:27:10', 55, 13, 13, '2022-04-26', 'files/ADVANCED.png', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(56, '2022-04-26 13:23:33', '2022-04-29 12:25:33', 43, 20, 20, '2022-04-30', 'files/96390369eeb0d37501c5440df9001d01.jpg', 'Few', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(57, '2022-04-27 17:52:43', '2022-04-29 12:24:50', 73, 51, 51, '2022-04-30', 'files/85d1f3b54c4ee407bac2bdffd63b9168.png', 'Ready', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(58, '2022-04-29 10:51:20', '2022-04-29 10:52:19', 3, 52, 52, '2022-04-29', 'files/1_logo.png', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0, 2, NULL, NULL, 0, NULL, NULL, 1, NULL, 1, 0, 'No name', 0),
(59, '2022-04-29 12:14:19', '2022-04-29 15:31:04', 90, 1, 1, '2022-04-29', 'files/IMG-20220428-WA0045.jpg', 'Come and pick seefs', '2022-04-29', '3441', '20', '15', '431135', NULL, NULL, 'Germination', NULL, 1700, '100', '98', '97', '90', '11', 20, 1, 5, NULL, '19767497', 1, NULL, '008/dom/2022', 23, 98, 0, 0, 'No name', 0),
(60, '2022-04-29 12:14:27', '2022-04-29 15:31:51', 95, 1, 1, '2022-04-30', 'files/SPRAYERS INFO.docx', 'my stock should be picked tommorrow', '2022-05-07', '4', '10', '15', '1', NULL, NULL, 'Purity', NULL, 4351, '100', '98', '94', '95', '11', 20, 1, 5, NULL, '70484855', 1, NULL, 'Test1/2022/N0007', 23, 98, 0, 0, 'No name', 0),
(61, '2022-04-29 12:14:30', '2022-04-29 12:21:27', 3, 20, 20, '2022-04-29', 'files/e11c09d7793b52bcd09066c6b7e00c85.png', 'Simple', '2022-04-29', '10', '12', '15', '10000001', NULL, NULL, 'Purity', NULL, 340, '10', '5', '10', '10', '11', 20, 1, 5, NULL, '44383647', 1, NULL, 'A120011', 23, 1, 0, 0, 'No name', 0),
(62, '2022-04-29 12:14:43', '2022-04-29 15:32:03', 76, 1, 1, '2022-04-30', 'files/farmer feedback.jpg', 'Please come and pick up my seed samples for lab testing.', '2022-05-07', '10', '10', '15', '3', NULL, NULL, 'Germination', NULL, 8400, '99', '95', '1', '4', '11', 20, 1, 5, NULL, '75190054', 1, NULL, '005/2022/dom', 23, 94, 1, 0, 'No name', 0),
(63, '2022-04-29 12:14:46', '2022-04-29 15:40:29', 78, 1, 1, '2022-04-30', 'files/Passport photographs.pdf', 'MY STOCK IS READY FOR SAMPLING', '2022-04-29', '543', '20', '15', '567', NULL, NULL, 'Germination', NULL, 200, '100', '98', '88', '99', '11', 20, 1, 5, NULL, '91804360', 1, NULL, '003/2022/dom', 23, 98, 0, 0, 'No name', 0),
(64, '2022-04-29 12:14:49', '2022-04-29 15:40:43', 98, 1, 1, '2022-04-30', 'files/tmp-cam-7407545346261318361.jpg', 'Seed in sonfe', '2022-04-29', '3242', '20', '15', '567899', NULL, NULL, 'Germination', NULL, 28, '100', '98', '56', '76', '11', 20, 1, 5, NULL, '72521820', 1, NULL, '006/2022/dom', 23, 98, 0, 0, 'No name', 0),
(65, '2022-04-29 12:14:56', '2022-04-29 15:32:45', 80, 1, 1, '2022-04-30', 'files/f49d4accde4a2725dd0818507909d27271ce2ef11461516266.png', 'please come take my sample for seed testing', '2022-04-29', '543', '20', '15', '1233445', NULL, NULL, 'Germination', NULL, 500, '99', '99', '3', '4', '11', 20, 1, 5, NULL, '25675580', 1, NULL, 'Test1/2022/N0009', 23, 98, 0, 0, 'No name', 0),
(66, '2022-04-29 12:14:58', '2022-04-29 15:32:31', 79, 1, 1, '2030-04-20', 'files/IMG-20220428-WA0002.jpg', 'Please pick your seeds tomorrow', '2022-04-29', '342', '20', '15', '8003', NULL, NULL, 'Germination', NULL, 380, '100', '98', '97', '99', '11', 20, 1, 5, NULL, '23920622', 1, NULL, '001/2022/dom', 23, 98, 0, 0, 'No name', 0),
(67, '2022-04-29 12:15:01', '2022-04-29 15:31:14', 89, 1, 1, '2022-04-30', 'files/10b0171ca34e503da66a06b23adc3328.jpg', 'Ready for seed test', '2022-04-29', '10', '10', '15', '40', NULL, NULL, 'Purity', NULL, 180, '99', '95', '2', '3', '11', 20, 1, 5, NULL, '24770820', 1, NULL, 'Test1/2022/N0004', 23, 94, 0, 0, 'No name', 0),
(68, '2022-04-29 12:15:02', '2022-04-29 15:32:22', 92, 1, 1, '2022-04-30', 'files/IMG-20220426-WA0002.jpg', 'Please come pick up my sqmple for lab testing', '2022-05-06', '4', '6', '15', '1', NULL, NULL, 'Purity', NULL, 482, '100', '98', '50', '45', '11', 20, 1, 5, NULL, '88952214', 1, NULL, 'TEST3/2022/3B', 23, 98, 0, 0, 'No name', 0),
(69, '2022-04-29 12:15:21', '2022-04-29 15:31:24', 74, 1, 1, '2022-04-30', 'files/16512199936015950096756557042728.jpg', 'Please collect my seed samples for the lab test from our stores', '2022-05-07', '10', '10', '15', '3', NULL, NULL, 'Purity', NULL, 220, '99', '95', '2', '3', '11', 20, 1, 5, NULL, '71732547', 1, NULL, '001/2022/dom', 23, 94, 0, 0, 'No name', 0),
(70, '2022-04-29 12:15:36', '2022-04-29 12:57:56', 85, 1, 1, '2022-04-14', 'files/IMG_20220428_172303_057.jpg', 'Seed sample for the lab test', '2022-04-29', '10', '10', '15', '40', NULL, NULL, 'Seed health', NULL, 700, NULL, NULL, NULL, NULL, NULL, 20, 1, 10, NULL, '85432161', 1, NULL, '006/2022/dom', 23, NULL, 0, 0, 'No name', 0),
(71, '2022-04-29 12:15:38', '2022-04-29 15:32:55', 88, 1, 1, '2022-04-30', 'files/1651220022462793552128.jpg', 'pliz accept the attachment', '2022-05-05', '10', '10', '15', '1', NULL, NULL, 'Purity', NULL, 500, '99', '99', '9', '9', '11', 20, 1, 5, NULL, '14196693', 1, NULL, '008/34/dom', 23, 98, 0, 0, 'No name', 0),
(72, '2022-04-29 12:15:44', '2022-04-29 15:31:34', 86, 1, 1, '2022-05-01', 'files/16512199758726012926958812860166.jpg', 'Please come and pick my seed samples for lab testing.', '2022-05-05', '10', '10', '15', '2', NULL, NULL, 'Seed health', NULL, 50, '99', '95', '3', '2', '11', 20, 1, 5, NULL, '25554681', 1, NULL, 'Test1/2022/N0002', 23, 94, 0, 0, 'No name', 0),
(73, '2022-04-29 12:16:01', '2022-04-29 15:30:55', 84, 1, 1, '2022-06-15', 'files/20220311_181456.jpg', 'kindly be timely', '2022-05-06', '10', '10', '15', '2', NULL, NULL, 'Germination', NULL, 699, '99', '99', '1', '1', '11', 20, 1, 5, NULL, '58058008', 1, NULL, '009/2022/dom', 23, 98, 1, 0, 'No name', 0),
(74, '2022-04-29 12:16:44', '2022-04-29 15:31:42', 94, 1, 1, '2022-05-02', 'files/IMG_20220305_095235_354[1].jpg', 'will be waiting for your response', '2022-04-29', '10', '10', '15', '40', NULL, NULL, 'Germination', NULL, 300, '99', '09', '1', '1', '11', 20, 1, 5, NULL, '67857572', 1, NULL, 'TEST2/2022/2B', 23, 9, 0, 0, 'No name', 0),
(75, '2022-04-29 12:17:34', '2022-04-29 13:07:04', 93, 1, 1, '0001-05-20', 'files/eca6ebfb3cc04432beb3c976a6745139.jpg', 'My sample ready for test', '2022-04-29', '4321', '20', '15', '100004', NULL, NULL, 'Germination', NULL, 340, '99', '99', '1', '1', '11', 20, 1, 5, NULL, '84089167', 1, NULL, 'Test1/2022/N0003', 23, 98, 0, 0, 'No name', 0),
(76, '2022-04-29 12:17:59', '2022-04-29 15:32:41', 91, 1, 1, '2022-05-05', 'files/VID-20210528-WA0003.mp4', 'Come and pick my seed', '2022-04-29', '12', 'Green', '15', '000005', NULL, NULL, 'Purity', NULL, 30, '99', '95', '2', '3', '11', 20, 1, 5, NULL, '94922685', 1, NULL, '004/2022/musa/001', 23, 94, 1, 0, 'No name', 0),
(77, '2022-04-29 12:18:08', '2022-04-29 15:32:59', 85, 1, 1, '2022-04-14', 'files/16512202089632865585085765522949.jpg', 'Seed sample', '2022-05-04', '24', '10', '15', '02', NULL, NULL, 'Purity', NULL, 650, '100', '90', '89', '10', '11', 27, 1, 5, NULL, '81650251', 1, NULL, 'Test1/2022/N0001', 23, 90, 1, 0, 'No name', 0),
(78, '2022-05-25 16:03:28', '2022-05-25 16:03:28', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yhhuj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, NULL, 1, NULL, 31, 0, 'No name', 0),
(79, '2022-05-25 16:06:48', '2022-05-25 16:06:48', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '78', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, NULL, 1, NULL, 0, 0, 'No name', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock_records`
--

CREATE TABLE `stock_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `crop_variety_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `seed_class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` bigint(20) DEFAULT 0,
  `is_deposit` tinyint(4) DEFAULT NULL,
  `is_transfer` tinyint(4) DEFAULT 0,
  `lot_number` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_records`
--

INSERT INTO `stock_records` (`id`, `created_at`, `updated_at`, `administrator_id`, `crop_variety_id`, `seed_class`, `source`, `detail`, `quantity`, `is_deposit`, `is_transfer`, `lot_number`) VALUES
(1, '2021-11-09 03:19:01', '2022-04-26 11:33:38', 3, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 10, 1, 0, '332641148'),
(2, '2021-11-09 03:20:15', '2022-04-26 11:33:38', 3, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 0, 1, 0, '28708649'),
(3, '2021-11-09 03:21:10', '2022-04-26 11:33:38', 3, 3, 'Basic seed', 'Stock examination', 'From stock exanination ID: 2', 12000, 1, 0, '634119030'),
(4, '2021-11-09 00:19:01', '2022-04-26 11:33:38', 3, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1200, 1, 0, '349158091'),
(5, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 4, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1220, 1, 0, '381714281'),
(6, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 4, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 2120, 1, 0, '505101817'),
(7, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 4, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 2220, 1, 0, '820905539'),
(8, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 5, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 3200, 1, 0, '121482169'),
(9, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 5, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 2000, 1, 0, '658071537'),
(10, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 6, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1200, 1, 0, '530925284'),
(11, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 6, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1000, 1, 0, '617117308'),
(12, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 7, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 3450, 1, 0, '400384969'),
(13, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 8, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 440, 1, 0, '420935082'),
(14, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 20, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 340, 1, 0, '347525357'),
(15, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 22, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1110, 1, 0, '810156070'),
(16, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 22, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1200, 1, 0, '895293723'),
(17, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 23, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1260, 1, 0, '521992626'),
(18, '2021-11-09 00:20:15', '2022-04-26 11:33:38', 3, 9, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 2', 1900, 1, 0, '490648445'),
(19, '2021-11-09 00:21:10', '2022-04-26 11:33:38', 3, 5, 'Basic seed', 'Stock examination', 'From stock exanination ID: 2', 12000, 1, 0, '98430206'),
(26, '2021-11-10 04:45:42', '2022-04-26 11:33:38', 3, 3, '-', 'Stock transfer to John Doe, ID: 18', 'Stock transfer to John Doe, ID: 18', -500, 0, 1, '593552813'),
(27, '2021-11-10 04:47:11', '2022-04-26 11:33:38', 18, 3, '-', 'Stock transfer from Betty Namagembe, ID: 3', 'Stock transfer from Betty Namagembe, ID: 3', 500, 1, 1, '961342340'),
(28, '2021-11-10 04:47:11', '2022-04-26 11:33:38', 3, 3, '-', 'Stock transfer to John Doe, ID: 18', 'Stock transfer to John Doe, ID: 18', -500, 0, 1, '503772622'),
(29, '2021-11-10 05:12:13', '2022-04-26 11:33:38', 18, 3, '-', 'Stock transfer from Betty Namagembe, ID: 3', 'Stock transfer from Betty Namagembe, ID: 3', 10210, 1, 1, '466021188'),
(30, '2021-11-10 05:12:13', '2022-04-26 11:33:38', 3, 3, '-', 'Stock transfer to John Doe, ID: 18', 'Stock transfer to John Doe, ID: 18', -10210, 0, 1, '902830252'),
(31, '2021-11-10 05:18:44', '2022-04-26 11:33:38', 3, 3, '-', 'sTOLEN', 'sTOLEN', -800, 0, 1, '846379819'),
(32, '2021-11-26 10:45:45', '2022-04-26 11:33:38', 3, 3, NULL, NULL, 'To seed lab. ID 17', -1200, 0, 0, '820903659'),
(33, '2022-02-21 07:28:12', '2022-04-26 11:33:38', 21, 8, '-', 'Stock transfer from Betty Namagembe, ID: 3', 'Stock transfer from Betty Namagembe, ID: 3', 300, 1, 1, '461450723'),
(34, '2022-02-21 07:28:12', '2022-04-26 11:33:38', 3, 8, '-', 'Stock transfer to John Doe, ID: 21', 'Stock transfer to John Doe, ID: 21', -300, 0, 1, '793001986'),
(35, '2022-04-04 11:43:13', '2022-04-26 15:37:09', 28, 3, 'Basic seed', 'Stock examination', 'From stock exanination ID: 8', 1000, 1, 0, '463777462'),
(36, '2022-04-06 12:27:56', '2022-04-26 11:33:38', 28, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 9', 11, 1, 0, '314618188'),
(37, '2022-04-26 11:10:59', '2022-04-26 15:40:11', 55, 3, 'Basic seed', 'Stock examination', 'From stock exanination ID: 13', 1000, 1, 0, '337686987'),
(38, '2022-04-26 11:18:37', '2022-04-26 15:35:39', 38, 3, 'Basic seed', 'Stock examination', 'From stock exanination ID: 45', 2500, 1, 0, '837943362'),
(39, '2022-04-26 11:19:09', '2022-04-26 15:35:40', 47, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 28', 50, 1, 0, '971363296'),
(40, '2022-04-26 11:19:16', '2022-04-26 15:39:23', 53, 3, 'Basic seed', 'Stock examination', 'From stock exanination ID: 40', 1111, 1, 0, '381298545'),
(41, '2022-04-26 11:19:18', '2022-04-26 15:39:39', 53, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 48', 1000, 1, 0, '409029006'),
(42, '2022-04-26 11:19:19', '2022-04-26 15:32:19', 49, 3, 'Basic seed', 'Stock examination', 'From stock exanination ID: 21', 1200, 1, 0, '581286799'),
(43, '2022-04-26 11:19:31', '2022-04-26 11:33:38', 38, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 14', 40000, 1, 0, '964018451'),
(44, '2022-04-26 11:20:15', '2022-04-26 15:33:56', 43, 3, 'Basic seed', 'Stock examination', 'From stock exanination ID: 46', 1000, 1, 0, '674128545'),
(45, '2022-04-26 11:20:26', '2022-04-26 15:32:25', 49, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 29', 80, 1, 0, '637156528'),
(46, '2022-04-26 11:20:31', '2022-04-26 15:35:13', 39, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 15', 10000, 1, 0, '59096396'),
(47, '2022-04-26 11:20:34', '2022-04-26 15:36:20', 40, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 22', 900, 1, 0, '534642722'),
(48, '2022-04-26 11:20:36', '2022-04-26 15:34:17', 63, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 36', 333, 1, 0, '806615647'),
(49, '2022-04-26 11:21:14', '2022-04-26 15:35:03', 41, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 10', 30000, 1, 0, '835778724'),
(50, '2022-04-26 11:21:27', '2022-04-26 15:35:19', 63, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 23', 1500, 1, 0, '72237558'),
(51, '2022-04-26 11:21:29', '2022-04-26 15:39:54', 44, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 16', 20000, 1, 0, '858884561'),
(52, '2022-04-26 11:21:33', '2022-04-26 11:33:38', 51, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 35', 75, 1, 0, '706878458'),
(53, '2022-04-26 11:22:08', '2022-04-26 15:39:44', 40, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 11', 28000, 1, 0, '700070770'),
(54, '2022-04-26 11:22:15', '2022-04-26 15:33:37', 62, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 24', 2000, 1, 0, '462453832'),
(55, '2022-04-26 11:22:26', '2022-04-26 15:36:34', 69, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 17', 15000, 1, 0, '153615299'),
(56, '2022-04-26 11:22:32', '2022-04-26 15:35:51', 47, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 37', 33, 1, 0, '801931888'),
(57, '2022-04-26 11:22:36', '2022-04-26 11:33:38', 42, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 34', 54, 1, 0, '539054431'),
(58, '2022-04-26 11:23:00', '2022-04-26 15:33:43', 62, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 12', 50000, 1, 0, '786173524'),
(59, '2022-04-26 11:23:11', '2022-04-26 15:39:18', 37, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 25', 1800, 1, 0, '310370335'),
(60, '2022-04-26 11:23:16', '2022-04-26 15:36:16', 47, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 18', 30000, 1, 0, '212830612'),
(61, '2022-04-26 11:23:39', '2022-04-26 15:39:05', 69, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 38', 66, 1, 0, '86950303'),
(62, '2022-04-26 11:23:51', '2022-04-26 15:40:31', 69, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 33', 65, 1, 0, '853944418'),
(63, '2022-04-26 11:23:58', '2022-04-26 15:35:50', 43, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 20', 80000, 1, 0, '769387255'),
(64, '2022-04-26 11:24:16', '2022-04-26 15:40:07', 44, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 26', 2400, 1, 0, '704297476'),
(65, '2022-04-26 11:24:18', '2022-04-26 15:24:30', 56, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 19', 40000, 1, 0, '685704065'),
(66, '2022-04-26 11:24:47', '2022-04-26 15:41:25', 37, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 27', 55000, 1, 0, '439991033'),
(67, '2022-04-26 11:24:50', '2022-04-26 15:34:30', 48, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 43', 333, 1, 0, '663526893'),
(68, '2022-04-26 11:24:58', '2022-04-26 15:33:49', 52, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 32', 45, 1, 0, '623345999'),
(69, '2022-04-26 11:25:32', '2022-04-26 11:33:38', 37, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 31', 80000, 1, 0, '794845846'),
(70, '2022-04-26 11:26:03', '2022-04-26 15:40:31', 69, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 30', 600000, 1, 0, '842807998'),
(71, '2022-04-26 11:26:20', '2022-04-26 15:34:27', 45, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 42', 100000, 1, 0, '38666445'),
(72, '2022-04-26 11:26:57', '2022-04-26 15:35:09', 41, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 41', 80000, 1, 0, '632564150'),
(73, '2022-04-26 11:27:33', '2022-04-26 15:34:08', 46, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 39', 55000, 1, 0, '924688191'),
(74, '2022-04-26 11:31:11', '2022-04-26 15:33:41', 50, 3, 'Certified seed', 'Stock examination', 'From stock exanination ID: 47', 45000, 1, 0, '122846146'),
(75, '2022-04-26 11:32:03', '2022-04-26 11:33:38', 54, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 44', 300000, 1, 0, '858905153'),
(76, '2022-04-26 13:12:48', '2022-04-26 13:12:48', 52, 3, '-', NULL, NULL, -15, 0, 1, '312598900'),
(77, '2022-04-26 13:14:07', '2022-04-26 13:14:07', 55, 3, '-', 'Damaged.', 'Damaged.', -500, 0, 1, '362103222'),
(78, '2022-04-26 13:14:16', '2022-04-26 13:14:16', 40, 3, '-', 'Damaged', 'Damaged', -100, 0, 1, '801563787'),
(79, '2022-04-26 13:14:44', '2022-04-26 13:14:44', 39, 3, '-', 'stock spoilt', 'stock spoilt', -500, 0, 1, '765858872'),
(80, '2022-04-26 13:14:44', '2022-04-26 13:14:44', 56, 3, '-', 'Damaged', 'Damaged', -20000, 0, 1, '390766828'),
(81, '2022-04-26 13:15:08', '2022-04-26 13:15:08', 43, 3, '-', 'Stolen', 'Stolen', -10000, 0, 1, '89227380'),
(82, '2022-04-26 13:15:10', '2022-04-26 13:15:10', 69, 3, '-', 'damaged', 'damaged', -52000, 0, 1, '913602080'),
(83, '2022-04-26 13:15:22', '2022-04-26 13:15:22', 38, 3, '-', 'Enough', 'Enough', -500, 0, 1, '108193405'),
(84, '2022-04-26 13:16:05', '2022-04-26 13:16:05', 45, 3, '-', 'Lack of rain', 'Lack of rain', -500, 0, 1, '221704826'),
(85, '2022-04-26 13:16:19', '2022-04-26 13:16:19', 53, 3, '-', 'Damaged', 'Damaged', -500, 0, 1, '833485643'),
(86, '2022-04-26 13:16:38', '2022-04-26 13:16:38', 62, 3, '-', NULL, NULL, -2000, 0, 1, '434349436'),
(87, '2022-04-26 13:16:39', '2022-04-26 13:16:39', 48, 3, '-', NULL, NULL, -111, 0, 1, '654337049'),
(88, '2022-04-26 13:18:02', '2022-04-26 13:18:02', 49, 3, '-', 'my stock is too much', 'my stock is too much', -200, 0, 1, '244328946'),
(89, '2022-04-26 13:18:03', '2022-04-26 13:18:03', 54, 3, '-', 'Stock with high moisture', 'Stock with high moisture', -100, 0, 1, '178734992'),
(91, '2022-04-26 13:18:24', '2022-04-26 13:18:24', 39, 3, '-', NULL, NULL, -120000, 0, 1, '34454100'),
(92, '2022-04-26 13:18:25', '2022-04-26 13:18:25', 56, 3, '-', NULL, NULL, -50000, 0, 1, '983255463'),
(93, '2022-04-26 13:18:27', '2022-04-26 13:18:27', 52, 3, '-', 'Sales', 'Sales', -10, 0, 1, '499617108'),
(94, '2022-04-26 13:18:42', '2022-04-26 13:18:42', 43, 3, '-', NULL, NULL, -90000, 0, 1, '36262154'),
(95, '2022-04-26 13:18:42', '2022-04-26 13:18:42', 50, 3, '-', 'Germination is low', 'Germination is low', -30000, 0, 1, '688129902'),
(96, '2022-04-26 13:18:52', '2022-04-26 13:18:52', 47, 3, '-', 'excesss stock', 'excesss stock', -30083, 0, 1, '153987060'),
(97, '2022-04-26 13:18:54', '2022-04-26 13:18:54', 38, 3, '-', NULL, NULL, -50000, 0, 1, '684486620'),
(98, '2022-04-26 13:18:57', '2022-04-26 13:18:57', 63, 3, '-', 'Sell off the old stock', 'Sell off the old stock', -500, 0, 1, '270239863'),
(99, '2022-04-26 13:19:00', '2022-04-26 13:19:00', 42, 3, '-', 'He is buying raw seed', 'He is buying raw seed', -30, 0, 1, '935565682'),
(100, '2022-04-26 13:19:02', '2022-04-26 13:19:02', 44, 3, '-', 'stock is ready', 'stock is ready', -10000, 0, 1, '283720793'),
(101, '2022-04-26 13:19:02', '2022-04-26 13:19:02', 52, 3, '-', NULL, NULL, -30, 0, 1, '593387289'),
(102, '2022-04-26 13:19:25', '2022-04-26 13:19:25', 53, 3, '-', NULL, NULL, -30000, 0, 1, '885795975'),
(103, '2022-04-26 13:21:02', '2022-04-26 13:21:02', 45, 3, '-', NULL, NULL, -500, 0, 1, '847624870'),
(104, '2022-04-26 13:23:11', '2022-04-26 13:23:11', 47, 3, '-', NULL, NULL, -30, 0, 1, '648931505'),
(105, '2022-04-26 13:24:29', '2022-04-26 13:24:29', 47, 3, '-', 'used as raw seed', 'used as raw seed', -20, 0, 1, '459676039'),
(106, '2022-04-26 13:25:37', '2022-04-26 13:25:37', 51, 3, '-', NULL, NULL, -500, 0, 1, '613155329'),
(107, '2022-04-26 15:33:01', '2022-04-26 15:33:01', 49, 3, '-', NULL, NULL, -200, 0, 1, '404189900'),
(108, '2022-04-26 15:35:37', '2022-04-26 15:35:37', 28, 3, '-', 'Stock transfer from Alex Ewinyu, ID: 62', 'Stock transfer from Alex Ewinyu, ID: 62', 5000, 1, 1, '225110940'),
(109, '2022-04-26 15:35:37', '2022-04-26 15:35:37', 62, 3, '-', 'Stock transfer to Isaac Mbabazi, ID: 28', 'Stock transfer to Isaac Mbabazi, ID: 28', -5000, 0, 1, '90996178'),
(110, '2022-04-26 15:35:48', '2022-04-26 15:35:48', 28, 3, '-', 'Stock transfer from Amos Owamani, ID: 41', 'Stock transfer from Amos Owamani, ID: 41', 6900, 1, 1, '90461333'),
(111, '2022-04-26 15:35:48', '2022-04-26 15:35:48', 41, 3, '-', 'Stock transfer to Isaac Mbabazi, ID: 28', 'Stock transfer to Isaac Mbabazi, ID: 28', -6900, 0, 1, '776407548'),
(112, '2022-04-26 15:35:58', '2022-04-26 15:35:58', 28, 3, '-', 'Stock transfer from Ben Kisitu, ID: 48', 'Stock transfer from Ben Kisitu, ID: 48', 15, 1, 1, '788978400'),
(113, '2022-04-26 15:35:58', '2022-04-26 15:35:58', 48, 3, '-', 'Stock transfer to Isaac Mbabazi, ID: 28', 'Stock transfer to Isaac Mbabazi, ID: 28', -15, 0, 1, '873087147'),
(114, '2022-04-26 15:35:59', '2022-04-26 15:35:59', 63, 3, '-', NULL, NULL, -1300, 0, 1, '35502092'),
(115, '2022-04-26 15:36:03', '2022-04-26 15:36:03', 49, 3, '-', NULL, NULL, -800, 0, 1, '350699352'),
(116, '2022-04-26 15:36:37', '2022-04-26 15:36:37', 52, 3, '-', 'Stock transfer from Aliguma Emmanuel, ID: 50', 'Stock transfer from Aliguma Emmanuel, ID: 50', 500, 1, 1, '150724440'),
(117, '2022-04-26 15:36:37', '2022-04-26 15:36:37', 50, 3, '-', 'Stock transfer to Racheal Mbabazi, ID: 52', 'Stock transfer to Racheal Mbabazi, ID: 52', -500, 0, 1, '773751236'),
(118, '2022-04-26 15:37:06', '2022-04-26 15:37:06', 49, 3, '-', 'Stock transfer from Alex Ewinyu, ID: 62', 'Stock transfer from Alex Ewinyu, ID: 62', 3000, 1, 1, '954823542'),
(119, '2022-04-26 15:37:06', '2022-04-26 15:37:06', 62, 3, '-', 'Stock transfer to Mourine Achulu, ID: 49', 'Stock transfer to Mourine Achulu, ID: 49', -3000, 0, 1, '665741681'),
(120, '2022-04-26 15:37:16', '2022-04-26 15:37:16', 28, 3, '-', 'Stock transfer from Ekyasimire Emill, ID: 45', 'Stock transfer from Ekyasimire Emill, ID: 45', 10, 1, 1, '629161535'),
(121, '2022-04-26 15:37:16', '2022-04-26 15:37:16', 45, 3, '-', 'Stock transfer to Isaac Mbabazi, ID: 28', 'Stock transfer to Isaac Mbabazi, ID: 28', -10, 0, 1, '244333242'),
(122, '2022-04-26 15:38:13', '2022-04-26 15:38:13', 42, 3, '-', 'Stock transfer from Aliguma Emmanuel, ID: 50', 'Stock transfer from Aliguma Emmanuel, ID: 50', 300, 1, 1, '329964270'),
(123, '2022-04-26 15:38:13', '2022-04-26 15:38:13', 50, 3, '-', 'Stock transfer to Jacob Mugisa, ID: 42', 'Stock transfer to Jacob Mugisa, ID: 42', -300, 0, 1, '881197010'),
(124, '2022-04-26 15:39:11', '2022-04-26 15:39:11', 39, 3, '-', 'Stock transfer from Alex Ewinyu, ID: 62', 'Stock transfer from Alex Ewinyu, ID: 62', 2000, 1, 1, '26442726'),
(125, '2022-04-26 15:39:11', '2022-04-26 15:39:11', 62, 3, '-', 'Stock transfer to Noah Ntumwa, ID: 39', 'Stock transfer to Noah Ntumwa, ID: 39', -2000, 0, 1, '893677047'),
(126, '2022-04-26 15:39:33', '2022-04-26 15:39:33', 47, 3, '-', 'Stock transfer from Racheal Mbabazi, ID: 52', 'Stock transfer from Racheal Mbabazi, ID: 52', 120, 1, 1, '642533988'),
(127, '2022-04-26 15:39:33', '2022-04-26 15:39:33', 52, 3, '-', 'Stock transfer to MARY KEMIGISA, ID: 47', 'Stock transfer to MARY KEMIGISA, ID: 47', -120, 0, 1, '714402221'),
(128, '2022-04-26 15:39:57', '2022-04-26 15:39:57', 63, 3, '-', 'I transfered my stock to John', 'I transfered my stock to John', -5, 0, 1, '696201528'),
(129, '2022-04-26 15:39:57', '2022-04-26 15:39:57', 39, 3, '-', 'Stock transfer from Mourine Achulu, ID: 49', 'Stock transfer from Mourine Achulu, ID: 49', 100, 1, 1, '348062967'),
(130, '2022-04-26 15:39:57', '2022-04-26 15:39:57', 49, 3, '-', 'Stock transfer to Noah Ntumwa, ID: 39', 'Stock transfer to Noah Ntumwa, ID: 39', -100, 0, 1, '506709060'),
(131, '2022-04-26 15:40:19', '2022-04-26 15:40:19', 69, 3, '-', 'Stock transfer from JOSEPH KIVUMBI, ID: 40', 'Stock transfer from JOSEPH KIVUMBI, ID: 40', 100, 1, 1, '209787808'),
(132, '2022-04-26 15:40:19', '2022-04-26 15:40:19', 40, 3, '-', 'Stock transfer to Owino Isaac, ID: 69', 'Stock transfer to Owino Isaac, ID: 69', -100, 0, 1, '720924243'),
(133, '2022-04-26 15:41:31', '2022-04-26 15:41:31', 40, 3, '-', 'Stock transfer from Owino Isaac, ID: 69', 'Stock transfer from Owino Isaac, ID: 69', 233, 1, 1, '359953946'),
(134, '2022-04-26 15:41:31', '2022-04-26 15:41:31', 69, 3, '-', 'Stock transfer to JOSEPH KIVUMBI, ID: 40', 'Stock transfer to JOSEPH KIVUMBI, ID: 40', -233, 0, 1, '859665752'),
(135, '2022-04-26 15:41:52', '2022-04-26 15:41:52', 45, 3, '-', 'I have transfer to Annet', 'I have transfer to Annet', -1000, 0, 1, '219401075'),
(136, '2022-04-26 15:42:06', '2022-04-26 15:42:06', 52, 3, '-', 'Stock transfer from Mbabazi Isaac, ID: 55', 'Stock transfer from Mbabazi Isaac, ID: 55', 200, 1, 1, '827304275'),
(137, '2022-04-26 15:42:06', '2022-04-26 15:42:06', 55, 3, '-', 'Stock transfer to Racheal Mbabazi, ID: 52', 'Stock transfer to Racheal Mbabazi, ID: 52', -200, 0, 1, '792870559'),
(138, '2022-04-26 15:42:22', '2022-04-26 15:42:22', 44, 3, '-', 'the person is not in the system', 'the person is not in the system', -2001, 0, 1, '858902536'),
(139, '2022-04-26 15:42:59', '2022-04-26 15:42:59', 40, 3, '-', 'Stock transfer from Owino Isaac, ID: 69', 'Stock transfer from Owino Isaac, ID: 69', 200, 1, 1, '918352726'),
(140, '2022-04-26 15:42:59', '2022-04-26 15:42:59', 69, 3, '-', 'Stock transfer to JOSEPH KIVUMBI, ID: 40', 'Stock transfer to JOSEPH KIVUMBI, ID: 40', -200, 0, 1, '99476978'),
(141, '2022-04-26 15:43:00', '2022-04-26 15:43:00', 48, 3, '-', 'Stock transfer from JOSEPH KIVUMBI, ID: 40', 'Stock transfer from JOSEPH KIVUMBI, ID: 40', 200, 1, 1, '672338790'),
(142, '2022-04-26 15:43:00', '2022-04-26 15:43:00', 40, 3, '-', 'Stock transfer to Ben Kisitu, ID: 48', 'Stock transfer to Ben Kisitu, ID: 48', -200, 0, 1, '259122067'),
(143, '2022-04-26 16:12:34', '2022-04-26 16:12:34', 62, 3, '-', 'Stock transfer from Mourine Achulu, ID: 49', 'Stock transfer from Mourine Achulu, ID: 49', 200, 1, 1, '637084944'),
(144, '2022-04-26 16:12:34', '2022-04-26 16:12:34', 49, 3, '-', 'Stock transfer to Alex Ewinyu, ID: 62', 'Stock transfer to Alex Ewinyu, ID: 62', -200, 0, 1, '880764186'),
(145, '2022-04-26 16:33:00', '2022-04-26 16:33:00', 1, 3, NULL, NULL, 'To seed lab. ID 1', 0, 0, 0, '171197469'),
(146, '2022-04-26 16:33:15', '2022-04-26 16:33:15', 39, 15, NULL, NULL, 'To seed lab. ID 23', 0, 0, 0, '82058054'),
(147, '2022-04-26 16:33:22', '2022-04-26 16:33:22', 1, 1, NULL, NULL, 'To seed lab. ID 8', 0, 0, 0, '131891993'),
(148, '2022-04-26 16:33:34', '2022-04-26 16:33:34', 62, 12, NULL, NULL, 'To seed lab. ID 24', 0, 0, 0, '169873909'),
(149, '2022-04-26 16:33:42', '2022-04-26 16:33:42', 1, 1, NULL, NULL, 'To seed lab. ID 5', 0, 0, 0, '587751217'),
(150, '2022-04-26 16:33:52', '2022-04-26 16:33:52', 55, 13, NULL, NULL, 'To seed lab. ID 22', 0, 0, 0, '226214645'),
(151, '2022-04-26 16:34:01', '2022-04-26 16:34:01', 1, 1, NULL, NULL, 'To seed lab. ID 14', 0, 0, 0, '842695857'),
(152, '2022-04-26 16:34:03', '2022-04-26 16:34:03', 1, 1, NULL, NULL, 'To seed lab. ID 3', 0, 0, 0, '585246732'),
(153, '2022-04-26 16:34:07', '2022-04-26 16:34:07', 69, 38, NULL, NULL, 'To seed lab. ID 46', 0, 0, 0, '244778564'),
(154, '2022-04-26 16:34:08', '2022-04-26 16:34:08', 31, 4, NULL, NULL, 'To seed lab. ID 20', 0, 0, 0, '790600235'),
(155, '2022-04-26 16:34:15', '2022-04-26 16:34:15', 1, 1, NULL, NULL, 'To seed lab. ID 6', 0, 0, 0, '206615489'),
(156, '2022-04-26 16:34:23', '2022-04-26 16:34:23', 49, 21, NULL, NULL, 'To seed lab. ID 45', 0, 0, 0, '882772394'),
(157, '2022-04-26 16:34:40', '2022-04-26 16:34:40', 1, 1, NULL, NULL, 'To seed lab. ID 4', 0, 0, 0, '157535585'),
(158, '2022-04-26 16:34:44', '2022-04-26 16:34:44', 41, 41, NULL, NULL, 'To seed lab. ID 47', 0, 0, 0, '19712768'),
(159, '2022-04-26 16:34:49', '2022-04-26 16:34:49', 1, 1, NULL, NULL, 'To seed lab. ID 4', 0, 0, 0, '932385289'),
(160, '2022-04-26 16:35:13', '2022-04-26 16:35:13', 63, 23, NULL, NULL, 'To seed lab. ID 48', 0, 0, 0, '485497861'),
(161, '2022-04-26 16:35:13', '2022-04-26 16:35:13', 62, 24, NULL, NULL, 'To seed lab. ID 37', 0, 0, 0, '427469180'),
(162, '2022-04-26 16:35:13', '2022-04-26 16:35:13', 1, 1, NULL, NULL, 'To seed lab. ID 2', 0, 0, 0, '676619407'),
(163, '2022-04-26 16:35:13', '2022-04-26 16:35:13', 47, 18, NULL, NULL, 'To seed lab. ID 43', 0, 0, 0, '762578498'),
(164, '2022-04-26 16:35:20', '2022-04-26 16:35:20', 1, 1, NULL, NULL, 'To seed lab. ID 16', 0, 0, 0, '358356645'),
(165, '2022-04-26 16:35:39', '2022-04-26 16:35:39', 44, 26, NULL, NULL, 'To seed lab. ID 49', 0, 0, 0, '774140122'),
(166, '2022-04-26 16:35:42', '2022-04-26 16:35:42', 1, 1, NULL, NULL, 'To seed lab. ID 9', 0, 0, 0, '841358401'),
(167, '2022-04-26 16:35:51', '2022-04-26 16:35:51', 53, 40, NULL, NULL, 'To seed lab. ID 42', 0, 0, 0, '633633578'),
(168, '2022-04-26 16:35:57', '2022-04-26 16:35:57', 1, 1, NULL, NULL, 'To seed lab. ID 9', 0, 0, 0, '586759893'),
(169, '2022-04-26 16:36:09', '2022-04-26 16:36:09', 1, 1, NULL, NULL, 'To seed lab. ID 13', 0, 0, 0, '769049599'),
(170, '2022-04-26 16:36:10', '2022-04-26 16:36:10', 51, 35, NULL, NULL, 'To seed lab. ID 52', 0, 0, 0, '983163258'),
(171, '2022-04-26 16:36:29', '2022-04-26 16:36:29', 1, 1, NULL, NULL, 'To seed lab. ID 10', 0, 0, 0, '233310057'),
(172, '2022-04-26 16:36:32', '2022-04-26 16:36:32', 28, 7, NULL, NULL, 'To seed lab. ID 21', 0, 0, 0, '537507106'),
(173, '2022-04-26 16:36:35', '2022-04-26 16:36:35', 51, 35, NULL, NULL, 'To seed lab. ID 52', 0, 0, 0, '696616681'),
(174, '2022-04-26 16:36:38', '2022-04-26 16:36:38', 1, 1, NULL, NULL, 'To seed lab. ID 10', 0, 0, 0, '78393550'),
(175, '2022-04-26 16:37:03', '2022-04-26 16:37:03', 50, 47, NULL, NULL, 'To seed lab. ID 44', 0, 0, 0, '531219270'),
(176, '2022-04-26 16:37:04', '2022-04-26 16:37:04', 1, 1, NULL, NULL, 'To seed lab. ID 15', 0, 0, 0, '498697705'),
(177, '2022-04-26 16:37:08', '2022-04-26 16:37:08', 1, 1, NULL, NULL, 'To seed lab. ID 7', 0, 0, 0, '227864332'),
(178, '2022-04-26 16:37:18', '2022-04-26 16:37:18', 50, 47, NULL, NULL, 'To seed lab. ID 44', 0, 0, 0, '637922374'),
(179, '2022-04-26 16:37:40', '2022-04-26 16:37:40', 56, 19, NULL, NULL, 'To seed lab. ID 27', 0, 0, 0, '685165216'),
(180, '2022-04-26 16:37:41', '2022-04-26 16:37:41', 1, 1, NULL, NULL, 'To seed lab. ID 12', 0, 0, 0, '145290401'),
(181, '2022-04-26 16:37:45', '2022-04-26 16:37:45', 69, 30, NULL, NULL, 'To seed lab. ID 26', 0, 0, 0, '491510342'),
(182, '2022-04-26 16:37:56', '2022-04-26 16:37:56', 41, 10, NULL, NULL, 'To seed lab. ID 33', 0, 0, 0, '223291022'),
(183, '2022-04-26 16:38:07', '2022-04-26 16:38:07', 52, 32, NULL, NULL, 'To seed lab. ID 25', 0, 0, 0, '929139705'),
(184, '2022-04-26 16:38:11', '2022-04-26 16:38:11', 1, 1, NULL, NULL, 'To seed lab. ID 11', 0, 0, 0, '64632224'),
(185, '2022-04-26 16:38:12', '2022-04-26 16:38:12', 43, 20, NULL, NULL, 'To seed lab. ID 30', 0, 0, 0, '560030289'),
(186, '2022-04-26 16:38:27', '2022-04-26 16:38:27', 69, 17, NULL, NULL, 'To seed lab. ID 32', 0, 0, 0, '318545858'),
(187, '2022-04-26 16:38:32', '2022-04-26 16:38:32', 69, 17, NULL, NULL, 'To seed lab. ID 32', 0, 0, 0, '244478447'),
(188, '2022-04-26 16:38:35', '2022-04-26 16:38:35', 37, 25, NULL, NULL, 'To seed lab. ID 36', 0, 0, 0, '66948553'),
(189, '2022-04-26 16:38:44', '2022-04-26 16:38:44', 69, 17, NULL, NULL, 'To seed lab. ID 32', 0, 0, 0, '750856031'),
(190, '2022-04-26 16:38:46', '2022-04-26 16:38:46', 37, 25, NULL, NULL, 'To seed lab. ID 36', 0, 0, 0, '601210621'),
(191, '2022-04-26 16:38:57', '2022-04-26 16:38:57', 40, 11, NULL, NULL, 'To seed lab. ID 28', 0, 0, 0, '341207707'),
(192, '2022-04-26 16:39:10', '2022-04-26 16:39:10', 54, 44, NULL, NULL, 'To seed lab. ID 31', 0, 0, 0, '354584759'),
(193, '2022-04-26 16:39:13', '2022-04-26 16:39:13', 45, 42, NULL, NULL, 'To seed lab. ID 34', 0, 0, 0, '41854567'),
(194, '2022-04-26 16:39:21', '2022-04-26 16:39:21', 45, 42, NULL, NULL, 'To seed lab. ID 34', 0, 0, 0, '332119785'),
(195, '2022-04-26 16:39:22', '2022-04-26 16:39:22', 48, 43, NULL, NULL, 'To seed lab. ID 29', 0, 0, 0, '387106753'),
(196, '2022-04-26 16:39:28', '2022-04-26 16:39:28', 45, 42, NULL, NULL, 'To seed lab. ID 34', 0, 0, 0, '769780631'),
(197, '2022-04-26 16:39:45', '2022-04-26 16:39:45', 42, 34, NULL, NULL, 'To seed lab. ID 35', 0, 0, 0, '364603001'),
(198, '2022-04-26 16:39:48', '2022-04-26 16:39:48', 38, 14, NULL, NULL, 'To seed lab. ID 41', 0, 0, 0, '707346467'),
(199, '2022-04-26 16:39:57', '2022-04-26 16:39:57', 38, 14, NULL, NULL, 'To seed lab. ID 41', 0, 0, 0, '617181587'),
(200, '2022-04-26 16:40:22', '2022-04-26 16:40:22', 38, 14, NULL, NULL, 'To seed lab. ID 41', 0, 0, 0, '403270604'),
(201, '2022-04-26 16:48:00', '2022-04-26 16:48:00', 49, 29, NULL, NULL, 'To seed lab. ID 51', 0, 0, 0, '989548138'),
(202, '2022-04-27 17:50:11', '2022-04-27 17:50:59', 73, 3, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 51', 10000, 1, 0, '989060578'),
(203, '2022-04-27 17:51:38', '2022-04-27 17:51:38', 28, 3, '-', 'Stock transfer from Basic User, ID: 73', 'Stock transfer from Basic User, ID: 73', 200, 1, 1, '840550494'),
(204, '2022-04-27 17:51:38', '2022-04-27 17:51:38', 73, 3, '-', 'Stock transfer to Isaac Mbabazi, ID: 28', 'Stock transfer to Isaac Mbabazi, ID: 28', -200, 0, 1, '995312966'),
(205, '2022-04-28 17:52:54', '2022-04-28 17:52:54', 3, 1, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 52', 1000, 1, 0, '542303574'),
(206, '2022-04-28 18:07:39', '2022-04-28 18:07:39', 76, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 62', 10000, 1, 0, '653460332'),
(207, '2022-04-29 10:44:11', '2022-04-29 10:44:11', 80, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 54', 2000, 1, 0, '617300840'),
(208, '2022-04-29 10:44:19', '2022-04-29 10:44:19', 67, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 49', 25, 1, 0, '995259633'),
(209, '2022-04-29 10:44:53', '2022-04-29 10:44:53', 88, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 74', 3900, 1, 0, '166989096'),
(210, '2022-04-29 10:45:12', '2022-04-29 10:45:12', 89, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 58', 400, 1, 0, '420775415'),
(211, '2022-04-29 10:45:33', '2022-04-29 10:45:33', 84, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 68', 1000, 1, 0, '637995173'),
(212, '2022-04-29 10:45:58', '2022-04-29 10:45:58', 90, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 69', 4300, 1, 0, '906374452'),
(213, '2022-04-29 10:46:10', '2022-04-29 10:46:10', 54, 1, 'Pre-Basic seed', 'Stock examination', 'From stock exanination ID: 50', 50, 1, 0, '877387982'),
(214, '2022-04-29 10:46:34', '2022-04-29 10:46:34', 93, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 63', 400, 1, 0, '924506580'),
(215, '2022-04-29 10:46:58', '2022-04-29 10:46:58', 75, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 70', 450, 1, 0, '856030181'),
(216, '2022-04-29 10:47:17', '2022-04-29 10:47:17', 98, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 60', 48, 1, 0, '761873796'),
(217, '2022-04-29 10:47:21', '2022-04-29 10:47:21', 76, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 73', 2000, 1, 0, '845168764'),
(218, '2022-04-29 10:47:31', '2022-04-29 10:47:31', 74, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 53', 600, 1, 0, '672778110'),
(219, '2022-04-29 10:47:59', '2022-04-29 10:47:59', 74, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 55', 320, 1, 0, '205199101'),
(220, '2022-04-29 10:48:14', '2022-04-29 10:48:14', 91, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 56', 50, 1, 0, '581235188'),
(221, '2022-04-29 10:48:53', '2022-04-29 10:48:53', 79, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 72', 30, 1, 0, '79637325'),
(222, '2022-04-29 10:49:12', '2022-04-29 10:49:12', 79, 1, 'Basic seed', 'Stock examination', 'From stock exanination ID: 66', 50, 1, 0, '979537344'),
(223, '2022-04-29 10:49:18', '2022-04-29 10:49:18', 94, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 57', 460, 1, 0, '508064143'),
(224, '2022-04-29 10:49:41', '2022-04-29 10:49:41', 86, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 64', 500, 1, 0, '334349866'),
(225, '2022-04-29 10:50:06', '2022-04-29 10:50:06', 78, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 67', 400, 1, 0, '966218430'),
(226, '2022-04-29 10:50:41', '2022-04-29 10:50:41', 85, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 65', 1200, 1, 0, '513721826'),
(227, '2022-04-29 10:51:11', '2022-04-29 10:51:11', 92, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 61', 800, 1, 0, '935217714'),
(228, '2022-04-29 10:51:34', '2022-04-29 10:51:34', 95, 1, 'Certified seed', 'Stock examination', 'From stock exanination ID: 59', 5521, 1, 0, '727437579'),
(229, '2022-04-29 11:00:16', '2022-04-29 11:00:16', 78, 1, '-', 'Stock transfer from Isaac Mbabazi, ID: 76', 'Stock transfer from Isaac Mbabazi, ID: 76', 2000, 1, 1, '129972343'),
(230, '2022-04-29 11:00:16', '2022-04-29 11:00:16', 76, 1, '-', 'Stock transfer to Uganda Seed Trade Association, ID: 78', 'Stock transfer to Uganda Seed Trade Association, ID: 78', -2000, 0, 1, '612951554'),
(231, '2022-04-29 11:00:40', '2022-04-29 11:00:40', 28, 1, '-', 'Stock transfer from Dominic Kimara, ID: 84', 'Stock transfer from Dominic Kimara, ID: 84', 500, 1, 1, '653279341'),
(232, '2022-04-29 11:00:40', '2022-04-29 11:00:40', 84, 1, '-', 'Stock transfer to Isaac Mbabazi, ID: 28', 'Stock transfer to Isaac Mbabazi, ID: 28', -500, 0, 1, '909455955'),
(233, '2022-04-29 11:01:32', '2022-04-29 11:01:32', 90, 1, '-', 'Stock transfer from Kenneth Omoding, ID: 75', 'Stock transfer from Kenneth Omoding, ID: 75', 200, 1, 1, '159855204'),
(234, '2022-04-29 11:01:32', '2022-04-29 11:01:32', 75, 1, '-', 'Stock transfer to Atia serogal, ID: 90', 'Stock transfer to Atia serogal, ID: 90', -200, 0, 1, '27946109'),
(235, '2022-04-29 11:01:35', '2022-04-29 11:01:35', 28, 1, '-', 'Stock transfer from walufelo isima, ID: 88', 'Stock transfer from walufelo isima, ID: 88', 900, 1, 1, '398134944'),
(236, '2022-04-29 11:01:35', '2022-04-29 11:01:35', 88, 1, '-', 'Stock transfer to Isaac Mbabazi, ID: 28', 'Stock transfer to Isaac Mbabazi, ID: 28', -900, 0, 1, '604266066'),
(237, '2022-04-29 11:01:36', '2022-04-29 11:01:36', 80, 1, '-', 'Stock transfer from Odongkara Emmanuel, ID: 74', 'Stock transfer from Odongkara Emmanuel, ID: 74', 200, 1, 1, '949290671'),
(238, '2022-04-29 11:01:36', '2022-04-29 11:01:36', 74, 1, '-', 'Stock transfer to MOVA SEED, ID: 80', 'Stock transfer to MOVA SEED, ID: 80', -200, 0, 1, '240283225'),
(239, '2022-04-29 11:01:42', '2022-04-29 11:01:42', 26, 1, '-', 'Stock transfer from kibalama brian, ID: 95', 'Stock transfer from kibalama brian, ID: 95', 100, 1, 1, '348332920'),
(240, '2022-04-29 11:01:42', '2022-04-29 11:01:42', 95, 1, '-', 'Stock transfer to Efulansi Mutesi, ID: 26', 'Stock transfer to Efulansi Mutesi, ID: 26', -100, 0, 1, '116574841'),
(241, '2022-04-29 11:02:00', '2022-04-29 11:02:00', 79, 1, '-', 'Stock transfer from Uganda Seed Trade Association, ID: 78', 'Stock transfer from Uganda Seed Trade Association, ID: 78', 500, 1, 1, '386314228'),
(242, '2022-04-29 11:02:00', '2022-04-29 11:02:00', 78, 1, '-', 'Stock transfer to Uganda Seed Trade Association, ID: 79', 'Stock transfer to Uganda Seed Trade Association, ID: 79', -500, 0, 1, '658240242'),
(243, '2022-04-29 11:02:25', '2022-04-29 11:02:25', 74, 1, '-', 'Stock transfer from MOVA SEED, ID: 80', 'Stock transfer from MOVA SEED, ID: 80', 1000, 1, 1, '201003137'),
(244, '2022-04-29 11:02:25', '2022-04-29 11:02:25', 80, 1, '-', 'Stock transfer to Odongkara Emmanuel, ID: 74', 'Stock transfer to Odongkara Emmanuel, ID: 74', -1000, 0, 1, '697551680'),
(245, '2022-04-29 11:02:29', '2022-04-29 11:02:29', 84, 1, '-', 'Stock transfer from Opio Kelvin, ID: 89', 'Stock transfer from Opio Kelvin, ID: 89', 200, 1, 1, '808875728'),
(246, '2022-04-29 11:02:29', '2022-04-29 11:02:29', 89, 1, '-', 'Stock transfer to Dominic Kimara, ID: 84', 'Stock transfer to Dominic Kimara, ID: 84', -200, 0, 1, '774871845'),
(247, '2022-04-29 11:03:10', '2022-04-29 11:03:10', 26, 1, '-', 'Stock transfer from WESIGA JIMMY, ID: 93', 'Stock transfer from WESIGA JIMMY, ID: 93', 40, 1, 1, '737875157'),
(248, '2022-04-29 11:03:10', '2022-04-29 11:03:10', 93, 1, '-', 'Stock transfer to Efulansi Mutesi, ID: 26', 'Stock transfer to Efulansi Mutesi, ID: 26', -40, 0, 1, '311318833'),
(249, '2022-04-29 11:03:17', '2022-04-29 11:03:17', 75, 1, '-', 'Stock transfer from Atia serogal, ID: 90', 'Stock transfer from Atia serogal, ID: 90', 300, 1, 1, '48026928'),
(250, '2022-04-29 11:03:17', '2022-04-29 11:03:17', 90, 1, '-', 'Stock transfer to Kenneth Omoding, ID: 75', 'Stock transfer to Kenneth Omoding, ID: 75', -300, 0, 1, '552295638'),
(251, '2022-04-29 11:03:19', '2022-04-29 11:03:19', 89, 1, '-', 'Stock transfer from Dominic Kimara, ID: 84', 'Stock transfer from Dominic Kimara, ID: 84', 50, 1, 1, '451443471'),
(252, '2022-04-29 11:03:19', '2022-04-29 11:03:19', 84, 1, '-', 'Stock transfer to Opio Kelvin, ID: 89', 'Stock transfer to Opio Kelvin, ID: 89', -50, 0, 1, '210163793'),
(253, '2022-04-29 11:04:29', '2022-04-29 11:04:29', 94, 1, '-', 'Stock transfer from NARO HOLDINGS LIMITED, ID: 86', 'Stock transfer from NARO HOLDINGS LIMITED, ID: 86', 200, 1, 1, '13343629'),
(254, '2022-04-29 11:04:29', '2022-04-29 11:04:29', 86, 1, '-', 'Stock transfer to WANDA BARNABAS, ID: 94', 'Stock transfer to WANDA BARNABAS, ID: 94', -200, 0, 1, '765222039'),
(255, '2022-04-29 11:04:37', '2022-04-29 11:04:37', 89, 1, '-', 'Stock transfer from SELECT SEED LIMITED, ID: 85', 'Stock transfer from SELECT SEED LIMITED, ID: 85', 500, 1, 1, '161696714'),
(256, '2022-04-29 11:04:37', '2022-04-29 11:04:37', 85, 1, '-', 'Stock transfer to Opio Kelvin, ID: 89', 'Stock transfer to Opio Kelvin, ID: 89', -500, 0, 1, '213468159'),
(257, '2022-04-29 11:04:39', '2022-04-29 11:04:39', 91, 1, '-', 'Stock transfer from Polly Bantel, ID: 92', 'Stock transfer from Polly Bantel, ID: 92', 200, 1, 1, '950104017'),
(258, '2022-04-29 11:04:39', '2022-04-29 11:04:39', 92, 1, '-', 'Stock transfer to Cathy Adong, ID: 91', 'Stock transfer to Cathy Adong, ID: 91', -200, 0, 1, '295818343'),
(259, '2022-04-29 11:05:17', '2022-04-29 11:05:17', 84, 1, '-', 'Stock transfer from WANDA BARNABAS, ID: 94', 'Stock transfer from WANDA BARNABAS, ID: 94', 60, 1, 1, '66538121'),
(260, '2022-04-29 11:05:17', '2022-04-29 11:05:17', 94, 1, '-', 'Stock transfer to Dominic Kimara, ID: 84', 'Stock transfer to Dominic Kimara, ID: 84', -60, 0, 1, '817553015'),
(261, '2022-04-29 11:05:34', '2022-04-29 11:05:34', 92, 1, '-', 'Stock transfer from Cathy Adong, ID: 91', 'Stock transfer from Cathy Adong, ID: 91', 20, 1, 1, '299458048'),
(262, '2022-04-29 11:05:34', '2022-04-29 11:05:34', 91, 1, '-', 'Stock transfer to Polly Bantel, ID: 92', 'Stock transfer to Polly Bantel, ID: 92', -20, 0, 1, '107054907'),
(263, '2022-04-29 11:06:44', '2022-04-29 11:06:44', 76, 1, '-', 'Someone by the name of Patrick Mukasa who is not in the system', 'Someone by the name of Patrick Mukasa who is not in the system', -500, 0, 1, '537913962'),
(264, '2022-04-29 11:07:01', '2022-04-29 11:07:01', 86, 1, '-', 'Stock transfer from WANDA BARNABAS, ID: 94', 'Stock transfer from WANDA BARNABAS, ID: 94', 50, 1, 1, '432832915'),
(265, '2022-04-29 11:07:01', '2022-04-29 11:07:01', 94, 1, '-', 'Stock transfer to NARO HOLDINGS LIMITED, ID: 86', 'Stock transfer to NARO HOLDINGS LIMITED, ID: 86', -50, 0, 1, '523655185'),
(266, '2022-04-29 11:07:37', '2022-04-29 11:07:37', 78, 1, '-', 'To Edson who is not in the system', 'To Edson who is not in the system', -700, 0, 1, '515797712'),
(267, '2022-04-29 11:07:48', '2022-04-29 11:07:48', 89, 1, '-', 'Okello fred', 'Okello fred', -100, 0, 1, '347877730'),
(268, '2022-04-29 11:08:07', '2022-04-29 11:08:07', 80, 1, '-', 'sell as grain', 'sell as grain', -200, 0, 1, '438993213'),
(269, '2022-04-29 11:08:24', '2022-04-29 11:08:24', 95, 1, '-', 'not in the system', 'not in the system', -50, 0, 1, '441554815'),
(270, '2022-04-29 11:08:26', '2022-04-29 11:08:26', 93, 1, '-', 'Transfer to SamSun not in the system', 'Transfer to SamSun not in the system', -20, 0, 1, '175367629'),
(271, '2022-04-29 11:08:27', '2022-04-29 11:08:27', 76, 1, '-', 'Stock expired.', 'Stock expired.', -100, 0, 1, '866982537'),
(272, '2022-04-29 11:08:58', '2022-04-29 11:08:58', 74, 1, '-', 'Stock sold as grains to school', 'Stock sold as grains to school', -500, 0, 1, '946102510'),
(273, '2022-04-29 11:09:27', '2022-04-29 11:09:27', 91, 1, '-', 'Stock expired', 'Stock expired', -100, 0, 1, '890380133'),
(274, '2022-04-29 11:09:40', '2022-04-29 11:09:40', 95, 1, '-', 'transfer to gold seeds', 'transfer to gold seeds', -20, 0, 1, '91274951'),
(275, '2022-04-29 11:09:44', '2022-04-29 11:09:44', 90, 1, '-', 'Christine is agood stock dealers', 'Christine is agood stock dealers', -600, 0, 1, '318405647'),
(276, '2022-04-29 11:09:45', '2022-04-29 11:09:45', 89, 1, '-', 'Stock transfer from WANDA BARNABAS, ID: 94', 'Stock transfer from WANDA BARNABAS, ID: 94', 30, 1, 1, '97315774'),
(277, '2022-04-29 11:09:45', '2022-04-29 11:09:45', 94, 1, '-', 'Stock transfer to Opio Kelvin, ID: 89', 'Stock transfer to Opio Kelvin, ID: 89', -30, 0, 1, '749559874'),
(278, '2022-04-29 11:09:54', '2022-04-29 11:09:54', 88, 1, '-', 'balibuza banuli', 'balibuza banuli', -500, 0, 1, '898972733'),
(279, '2022-04-29 11:10:29', '2022-04-29 11:10:29', 75, 1, '-', 'To Okello David', 'To Okello David', -20, 0, 1, '155602828'),
(280, '2022-04-29 11:12:46', '2022-04-29 11:12:46', 94, 1, '-', 'agrodealer', 'agrodealer', -20, 0, 1, '571866879'),
(281, '2022-04-29 11:15:17', '2022-04-29 11:15:17', 90, 1, '-', 'Stock transfer from Polly Bantel, ID: 92', 'Stock transfer from Polly Bantel, ID: 92', 100, 1, 1, '981850398'),
(282, '2022-04-29 11:15:17', '2022-04-29 11:15:17', 92, 1, '-', 'Stock transfer to Atia serogal, ID: 90', 'Stock transfer to Atia serogal, ID: 90', -100, 0, 1, '942355135'),
(283, '2022-04-29 11:18:29', '2022-04-29 11:18:29', 92, 1, '-', 'Expired', 'Expired', -18, 0, 1, '936544764'),
(284, '2022-04-29 12:21:26', '2022-04-29 12:21:26', 3, 20, NULL, NULL, 'To seed lab. ID 61', -340, 0, 0, '31460705'),
(285, '2022-04-29 13:06:08', '2022-04-29 13:06:08', 85, 1, NULL, NULL, 'To seed lab. ID 77', -700, 0, 0, '509934475'),
(286, '2022-04-29 13:06:30', '2022-04-29 13:06:30', 91, 1, NULL, NULL, 'To seed lab. ID 76', -130, 0, 0, '504807314'),
(287, '2022-04-29 13:06:40', '2022-04-29 13:06:40', 85, 1, NULL, NULL, 'To seed lab. ID 77', -700, 0, 0, '475052039'),
(288, '2022-04-29 13:06:55', '2022-04-29 13:06:55', 91, 1, NULL, NULL, 'To seed lab. ID 76', -130, 0, 0, '547674542'),
(289, '2022-04-29 13:07:04', '2022-04-29 13:07:04', 93, 1, NULL, NULL, 'To seed lab. ID 75', -340, 0, 0, '114543712'),
(290, '2022-04-29 13:07:41', '2022-04-29 13:07:41', 94, 1, NULL, NULL, 'To seed lab. ID 74', -500, 0, 0, '461974830'),
(291, '2022-04-29 13:07:49', '2022-04-29 13:07:49', 86, 1, NULL, NULL, 'To seed lab. ID 72', -350, 0, 0, '802955013'),
(292, '2022-04-29 13:08:08', '2022-04-29 13:08:08', 84, 1, NULL, NULL, 'To seed lab. ID 73', -710, 0, 0, '634030526'),
(293, '2022-04-29 13:08:17', '2022-04-29 13:08:17', 90, 1, NULL, NULL, 'To seed lab. ID 59', -3700, 0, 0, '810284743'),
(294, '2022-04-29 13:08:35', '2022-04-29 13:08:35', 88, 1, NULL, NULL, 'To seed lab. ID 71', -2500, 0, 0, '729517266'),
(295, '2022-04-29 13:08:45', '2022-04-29 13:08:45', 89, 1, NULL, NULL, 'To seed lab. ID 67', -680, 0, 0, '67854640'),
(296, '2022-04-29 13:09:10', '2022-05-19 12:35:31', 47, 1, NULL, NULL, 'To seed lab. ID 50', 0, 0, 0, '653336488'),
(297, '2022-04-29 13:09:39', '2022-04-29 13:09:39', 79, 1, NULL, NULL, 'To seed lab. ID 66', -580, 0, 0, '861910280'),
(298, '2022-04-29 13:09:50', '2022-04-29 13:09:50', 74, 1, NULL, NULL, 'To seed lab. ID 69', -1220, 0, 0, '261012817'),
(299, '2022-04-29 13:10:16', '2022-04-29 13:10:16', 78, 1, NULL, NULL, 'To seed lab. ID 63', -1200, 0, 0, '548726994'),
(300, '2022-04-29 13:10:57', '2022-04-29 13:10:57', 95, 1, NULL, NULL, 'To seed lab. ID 60', -5351, 0, 0, '918112546'),
(301, '2022-04-29 13:11:36', '2022-04-29 13:11:36', 92, 1, NULL, NULL, 'To seed lab. ID 68', -502, 0, 0, '623741988'),
(302, '2022-04-29 13:12:22', '2022-04-29 13:12:22', 76, 1, NULL, NULL, 'To seed lab. ID 62', -9400, 0, 0, '12171322'),
(303, '2022-04-29 13:12:52', '2022-04-29 13:12:52', 80, 1, NULL, NULL, 'To seed lab. ID 65', -1000, 0, 0, '123936369'),
(304, '2022-04-29 13:12:55', '2022-04-29 13:12:55', 80, 1, NULL, NULL, 'To seed lab. ID 65', -1000, 0, 0, '498643637'),
(305, '2022-04-29 13:16:41', '2022-04-29 13:16:41', 98, 1, NULL, NULL, 'To seed lab. ID 64', -48, 0, 0, '710982604'),
(306, '2022-04-29 13:16:54', '2022-04-29 13:16:54', 98, 1, NULL, NULL, 'To seed lab. ID 64', -48, 0, 0, '654240277');

-- --------------------------------------------------------

--
-- Table structure for table `sub_growers`
--

CREATE TABLE `sub_growers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `crop` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variety` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcourty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planting_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_planted` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_yield` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gps_latitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gps_longitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inspector` int(11) DEFAULT NULL,
  `status_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `village` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filed_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seed_class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_yield` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `further_remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `general_condition_of_the_crop` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proposed_isolation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isolation_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proposed_distance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isolation_distance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivar_characteristics_noxious_weeds` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivar_characteristics_features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivar_characteristics_disease` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cultivar_characteristics_types` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_of_field` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crop_cultivar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
-- Table structure for table `test_trees`
--

CREATE TABLE `test_trees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_trees`
--

INSERT INTO `test_trees` (`id`, `created_at`, `updated_at`, `parent_id`, `order`, `title`, `description`, `logo`) VALUES
(1, '2021-11-24 09:12:36', '2021-11-24 09:12:36', 1, 1, 'Uganda', NULL, NULL),
(2, '2021-11-24 09:48:54', '2021-11-24 09:49:55', 3, 2, 'Uganda', NULL, 'WhatsApp Image 2021-10-29 at 13.41.47.jpeg'),
(3, '2021-11-24 09:49:46', '2021-11-24 09:49:55', 0, 1, 'East Africa', NULL, NULL),
(4, '2021-11-24 09:50:48', '2021-11-24 09:52:26', 2, 4, 'Kasese', NULL, NULL),
(5, '2021-11-24 09:50:59', '2021-11-24 09:52:26', 2, 3, 'Kampala', NULL, NULL),
(6, '2021-11-24 09:51:28', '2021-11-24 09:52:26', 4, 5, 'Bukonzo East', NULL, NULL),
(7, '2021-11-24 09:51:43', '2021-11-24 09:52:26', 4, 6, 'Bukonzo west', NULL, NULL),
(8, '2021-11-24 09:52:48', '2021-11-24 09:53:04', 2, 7, 'Mbarara', NULL, NULL);

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
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `pre_orders`
--
ALTER TABLE `pre_orders`
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
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
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
-- Indexes for table `sub_growers`
--
ALTER TABLE `sub_growers`
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
-- Indexes for table `test_trees`
--
ALTER TABLE `test_trees`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `crop_inspection_types`
--
ALTER TABLE `crop_inspection_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `crop_types`
--
ALTER TABLE `crop_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crop_varieties`
--
ALTER TABLE `crop_varieties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_crop_declarations`
--
ALTER TABLE `form_crop_declarations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `form_crop_declarations_has_crop_varieties`
--
ALTER TABLE `form_crop_declarations_has_crop_varieties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `form_qds`
--
ALTER TABLE `form_qds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `form_sr4s`
--
ALTER TABLE `form_sr4s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `form_sr6s`
--
ALTER TABLE `form_sr6s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `form_sr6_has_crops`
--
ALTER TABLE `form_sr6_has_crops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `form_sr10s`
--
ALTER TABLE `form_sr10s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `form_sr10_has_variety_inspections`
--
ALTER TABLE `form_sr10_has_variety_inspections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_stock_examination_requests`
--
ALTER TABLE `form_stock_examination_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `import_export_permits_has_crops`
--
ALTER TABLE `import_export_permits_has_crops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `marketable_seeds`
--
ALTER TABLE `marketable_seeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planting_returns`
--
ALTER TABLE `planting_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `planting_return_crops`
--
ALTER TABLE `planting_return_crops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pre_orders`
--
ALTER TABLE `pre_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `seed_label`
--
ALTER TABLE `seed_label`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seed_labels`
--
ALTER TABLE `seed_labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `seed_label_packages`
--
ALTER TABLE `seed_label_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seed_labs`
--
ALTER TABLE `seed_labs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `stock_records`
--
ALTER TABLE `stock_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `sub_growers`
--
ALTER TABLE `sub_growers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

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
-- AUTO_INCREMENT for table `test_trees`
--
ALTER TABLE `test_trees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Constraints for table `planting_return_crops`
--
ALTER TABLE `planting_return_crops`
  ADD CONSTRAINT `planting_return_crops_crop_variety_id_foreign` FOREIGN KEY (`crop_variety_id`) REFERENCES `crop_varieties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planting_return_crops_planting_return_id_foreign` FOREIGN KEY (`planting_return_id`) REFERENCES `planting_returns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
