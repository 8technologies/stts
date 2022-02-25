-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2021 at 05:15 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
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
(1, 0, 11, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2021-10-05 08:50:45'),
(2, 0, 12, 'Admin', 'fa-tasks', '', NULL, NULL, '2021-10-05 08:50:45'),
(3, 0, 1, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2021-10-05 08:50:45'),
(4, 2, 13, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2021-10-05 08:50:45'),
(5, 2, 14, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-10-05 08:50:45'),
(6, 2, 15, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2021-10-05 08:50:45'),
(7, 2, 16, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2021-10-05 08:50:45'),
(8, 0, 3, 'categories', 'fa-bars', 'categories', NULL, '2021-09-17 18:07:30', '2021-10-05 08:50:45'),
(9, 8, 4, 'All categories', 'fa-bars', 'categories', NULL, '2021-09-17 18:08:07', '2021-10-05 08:50:45'),
(10, 8, 5, 'attributes', 'fa-adjust', 'attributes', NULL, '2021-09-17 18:08:40', '2021-10-05 08:50:45'),
(11, 0, 6, 'Locatios', 'fa-bars', 'countries', NULL, '2021-09-23 07:33:49', '2021-10-05 08:50:45'),
(12, 11, 7, 'countries', 'fa-bars', 'countries', NULL, '2021-09-23 07:34:27', '2021-10-05 08:50:45'),
(13, 11, 8, 'Cities', 'fa-bars', 'cities', NULL, '2021-09-23 07:46:07', '2021-10-05 08:50:45'),
(14, 0, 9, 'products', 'fa-american-sign-language-interpreting', 'products', NULL, '2021-10-02 19:04:16', '2021-10-05 08:50:45'),
(15, 0, 10, 'users', 'fa-users', 'users', NULL, '2021-10-05 08:50:05', '2021-10-05 08:50:45'),
(16, 3, 2, 'users', 'fa-bars', 'users', NULL, '2021-10-05 08:50:37', '2021-10-05 08:50:45'),
(17, 3, 0, 'profiles', 'fa-bars', 'profiles', NULL, '2021-10-05 08:52:39', '2021-10-05 08:52:39');

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
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-09-17 18:06:21', '2021-09-17 18:06:21'),
(2, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:06:28', '2021-09-17 18:06:28'),
(3, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:06:35', '2021-09-17 18:06:35'),
(4, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-09-17 18:06:47', '2021-09-17 18:06:47'),
(5, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:06:52', '2021-09-17 18:06:52'),
(6, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:07:00', '2021-09-17 18:07:00'),
(7, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"categories\",\"icon\":\"fa-bars\",\"uri\":\"categories\",\"roles\":[null],\"permission\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\"}', '2021-09-17 18:07:30', '2021-09-17 18:07:30'),
(8, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:07:30', '2021-09-17 18:07:30'),
(9, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"All categories\",\"icon\":\"fa-bars\",\"uri\":\"categories\",\"roles\":[null],\"permission\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\"}', '2021-09-17 18:08:07', '2021-09-17 18:08:07'),
(10, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:07', '2021-09-17 18:08:07'),
(11, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:20', '2021-09-17 18:08:20'),
(12, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:24', '2021-09-17 18:08:24'),
(13, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"attributes\",\"icon\":\"fa-adjust\",\"uri\":\"attributes\",\"roles\":[null],\"permission\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\"}', '2021-09-17 18:08:40', '2021-09-17 18:08:40'),
(14, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:40', '2021-09-17 18:08:40'),
(15, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:44', '2021-09-17 18:08:44'),
(16, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:08:52', '2021-09-17 18:08:52'),
(17, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:08:54', '2021-09-17 18:08:54'),
(18, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Apartments\",\"description\":\"Rent or sell apartments\",\"slug\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-09-17 18:13:44', '2021-09-17 18:13:44'),
(19, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-09-17 18:13:45', '2021-09-17 18:13:45'),
(20, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":null,\"name\":\"Houses\",\"description\":\"Rent or sell Houses in Uganda\",\"slug\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\",\"after-save\":\"2\"}', '2021-09-17 18:16:29', '2021-09-17 18:16:29'),
(21, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-09-17 18:16:30', '2021-09-17 18:16:30'),
(22, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":null,\"name\":\"Land\",\"description\":\"Rent or sell land within Uganda\",\"slug\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\"}', '2021-09-17 18:17:42', '2021-09-17 18:17:42'),
(23, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-09-17 18:17:43', '2021-09-17 18:17:43'),
(24, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-09-17 18:21:16', '2021-09-17 18:21:16'),
(25, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-09-23 07:22:38', '2021-09-23 07:22:38'),
(26, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:22:47', '2021-09-23 07:22:47'),
(27, 1, 'admin/countries', 'GET', '127.0.0.1', '[]', '2021-09-23 07:33:07', '2021-09-23 07:33:07'),
(28, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:33:14', '2021-09-23 07:33:14'),
(29, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Locatios\",\"icon\":\"fa-bars\",\"uri\":\"countries\",\"roles\":[null],\"permission\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:33:49', '2021-09-23 07:33:49'),
(30, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:33:49', '2021-09-23 07:33:49'),
(31, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:34:01', '2021-09-23 07:34:01'),
(32, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"countries\",\"icon\":\"fa-bars\",\"uri\":\"countries\",\"roles\":[null],\"permission\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:34:27', '2021-09-23 07:34:27'),
(33, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:34:27', '2021-09-23 07:34:27'),
(34, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:34:36', '2021-09-23 07:34:36'),
(35, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:34:41', '2021-09-23 07:34:41'),
(36, 1, 'admin/countries/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:34:45', '2021-09-23 07:34:45'),
(37, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"Uganda\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/countries\"}', '2021-09-23 07:36:36', '2021-09-23 07:36:36'),
(38, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:36:36', '2021-09-23 07:36:36'),
(39, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"Uganda\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:37:44', '2021-09-23 07:37:44'),
(40, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:37:45', '2021-09-23 07:37:45'),
(41, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"Uganda\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"after-save\":\"2\"}', '2021-09-23 07:38:25', '2021-09-23 07:38:25'),
(42, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:38:26', '2021-09-23 07:38:26'),
(43, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"Turkey\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Turkey, officially the Republic of Turkey, is a country bridging Europe and Asia. It shares borders with Greece and Bulgaria to the northwest; the Black Sea to the north; Georgia to the northeast;\",\"code\":\"+90\",\"listed\":\"1\",\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"after-save\":\"2\"}', '2021-09-23 07:41:16', '2021-09-23 07:41:16'),
(44, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:41:16', '2021-09-23 07:41:16'),
(45, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:45:30', '2021-09-23 07:45:30'),
(46, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:45:32', '2021-09-23 07:45:32'),
(47, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"Cities\",\"icon\":\"fa-bars\",\"uri\":\"cities\",\"roles\":[null],\"permission\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:46:07', '2021-09-23 07:46:07'),
(48, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:46:07', '2021-09-23 07:46:07'),
(49, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:46:17', '2021-09-23 07:46:17'),
(50, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:46:22', '2021-09-23 07:46:22'),
(51, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:46:24', '2021-09-23 07:46:24'),
(52, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-09-23 07:46:44', '2021-09-23 07:46:44'),
(53, 1, 'admin/cities/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:46:44', '2021-09-23 07:46:44'),
(54, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Jinja\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:46:58', '2021-09-23 07:46:58'),
(55, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-09-23 07:46:58', '2021-09-23 07:46:58'),
(56, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:47:02', '2021-09-23 07:47:02'),
(57, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Mbale\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-09-23 07:47:11', '2021-09-23 07:47:11'),
(58, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-09-23 07:47:11', '2021-09-23 07:47:11'),
(59, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:47:13', '2021-09-23 07:47:13'),
(60, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kasese\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-09-23 07:47:22', '2021-09-23 07:47:22'),
(61, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-09-23 07:47:22', '2021-09-23 07:47:22'),
(62, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 09:43:30', '2021-09-23 09:43:30'),
(63, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-02 10:26:22', '2021-10-02 10:26:22'),
(64, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 10:27:03', '2021-10-02 10:27:03'),
(65, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 10:27:08', '2021-10-02 10:27:08'),
(66, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 10:27:40', '2021-10-02 10:27:40'),
(67, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-02 10:34:11', '2021-10-02 10:34:11'),
(68, 1, 'admin/countries/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:34:04', '2021-10-02 11:34:04'),
(69, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"China\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/countries\"}', '2021-10-02 11:36:43', '2021-10-02 11:36:43'),
(70, 1, 'admin/countries', 'GET', '127.0.0.1', '[]', '2021-10-02 11:36:44', '2021-10-02 11:36:44'),
(71, 1, 'admin/countries/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:36:50', '2021-10-02 11:36:50'),
(72, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"UAE\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"code\":\"441188\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/countries\"}', '2021-10-02 11:38:02', '2021-10-02 11:38:02'),
(73, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-10-02 11:38:03', '2021-10-02 11:38:03'),
(74, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:38:29', '2021-10-02 11:38:29'),
(75, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:38:49', '2021-10-02 11:38:49'),
(76, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:41:45', '2021-10-02 11:41:45'),
(77, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:41:45', '2021-10-02 11:41:45'),
(78, 1, 'admin/cities/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:42:15', '2021-10-02 11:42:15'),
(79, 1, 'admin/cities/2', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Mbarara\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:43:36', '2021-10-02 11:43:36'),
(80, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:43:36', '2021-10-02 11:43:36'),
(81, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:43:44', '2021-10-02 11:43:44'),
(82, 1, 'admin/cities/3', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Dubai\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:46:22', '2021-10-02 11:46:22'),
(83, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 11:46:23', '2021-10-02 11:46:23'),
(84, 1, 'admin/cities/3', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Dubai\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\"}', '2021-10-02 11:47:43', '2021-10-02 11:47:43'),
(85, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 11:47:44', '2021-10-02 11:47:44'),
(86, 1, 'admin/cities/3', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Dubai\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\"}', '2021-10-02 11:52:54', '2021-10-02 11:52:54'),
(87, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:52:54', '2021-10-02 11:52:54'),
(88, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:53:10', '2021-10-02 11:53:10'),
(89, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"2\",\"name\":\"Istanbul\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:55:41', '2021-10-02 11:55:41'),
(90, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:55:42', '2021-10-02 11:55:42'),
(91, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:56:01', '2021-10-02 11:56:01'),
(92, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Qatar\",\"longitude\":\"16.2212\",\"latitude\":\"18.2222\",\"details\":null,\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:56:41', '2021-10-02 11:56:41'),
(93, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:56:42', '2021-10-02 11:56:42'),
(94, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:57:13', '2021-10-02 11:57:13'),
(95, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:57:20', '2021-10-02 11:57:20'),
(96, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:58:08', '2021-10-02 11:58:08'),
(97, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:58:13', '2021-10-02 11:58:13'),
(98, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:59:59', '2021-10-02 11:59:59'),
(99, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:00:13', '2021-10-02 12:00:13'),
(100, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:00:26', '2021-10-02 12:00:26'),
(101, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:00:34', '2021-10-02 12:00:34'),
(102, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:00:47', '2021-10-02 12:00:47'),
(103, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"3\",\"name\":\"China\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 12:03:52', '2021-10-02 12:03:52'),
(104, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 12:03:53', '2021-10-02 12:03:53'),
(105, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:04:03', '2021-10-02 12:04:03'),
(106, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:04:05', '2021-10-02 12:04:05'),
(107, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 13:10:38', '2021-10-02 13:10:38'),
(108, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 13:10:45', '2021-10-02 13:10:45'),
(109, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 13:11:15', '2021-10-02 13:11:15'),
(110, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:11:15', '2021-10-02 13:11:15'),
(111, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:11:18', '2021-10-02 13:11:18'),
(112, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:12:47', '2021-10-02 13:12:47'),
(113, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 13:13:07', '2021-10-02 13:13:07'),
(114, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:13:07', '2021-10-02 13:13:07'),
(115, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:14:33', '2021-10-02 13:14:33'),
(116, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 13:14:43', '2021-10-02 13:14:43'),
(117, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:14:44', '2021-10-02 13:14:44'),
(118, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 13:17:21', '2021-10-02 13:17:21'),
(119, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:17:21', '2021-10-02 13:17:21'),
(120, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:19:21', '2021-10-02 13:19:21'),
(121, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 13:19:31', '2021-10-02 13:19:31'),
(122, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:19:31', '2021-10-02 13:19:31'),
(123, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:14:50', '2021-10-02 15:14:50'),
(124, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 15:15:15', '2021-10-02 15:15:15'),
(125, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:15:15', '2021-10-02 15:15:15'),
(126, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:17:26', '2021-10-02 15:17:26'),
(127, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 15:17:38', '2021-10-02 15:17:38'),
(128, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:17:38', '2021-10-02 15:17:38'),
(129, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 15:19:53', '2021-10-02 15:19:53'),
(130, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:19:53', '2021-10-02 15:19:53'),
(131, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 15:20:51', '2021-10-02 15:20:51'),
(132, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:20:51', '2021-10-02 15:20:51'),
(133, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:21:52', '2021-10-02 15:21:52'),
(134, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:22:42', '2021-10-02 15:22:42'),
(135, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:23:01', '2021-10-02 15:23:01'),
(136, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:23:21', '2021-10-02 15:23:21'),
(137, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:33:31', '2021-10-02 15:33:31'),
(138, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 18:58:42', '2021-10-02 18:58:42'),
(139, 1, 'admin/cities/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 18:59:04', '2021-10-02 18:59:04'),
(140, 1, 'admin/cities/2', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Mbarara\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 18:59:13', '2021-10-02 18:59:13'),
(141, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 18:59:13', '2021-10-02 18:59:13'),
(142, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 18:59:38', '2021-10-02 18:59:38'),
(143, 1, 'admin/cities/3', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Dubai\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 18:59:51', '2021-10-02 18:59:51'),
(144, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 18:59:51', '2021-10-02 18:59:51'),
(145, 1, 'admin/cities/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 18:59:56', '2021-10-02 18:59:56'),
(146, 1, 'admin/cities/7', 'PUT', '127.0.0.1', '{\"country_id\":\"3\",\"name\":\"China\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 19:00:05', '2021-10-02 19:00:05'),
(147, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 19:00:05', '2021-10-02 19:00:05'),
(148, 1, 'admin/cities/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:00:16', '2021-10-02 19:00:16'),
(149, 1, 'admin/cities/6', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Qatar\",\"longitude\":\"16.2212\",\"latitude\":\"18.2222\",\"details\":null,\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 19:00:35', '2021-10-02 19:00:35'),
(150, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 19:00:35', '2021-10-02 19:00:35'),
(151, 1, 'admin/cities/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:00:43', '2021-10-02 19:00:43'),
(152, 1, 'admin/cities/4', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kasese\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":\"0\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 19:01:02', '2021-10-02 19:01:02'),
(153, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 19:01:02', '2021-10-02 19:01:02'),
(154, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:01:10', '2021-10-02 19:01:10'),
(155, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:01:15', '2021-10-02 19:01:15'),
(156, 1, 'admin/cities/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:01:28', '2021-10-02 19:01:28'),
(157, 1, 'admin/cities/5', 'PUT', '127.0.0.1', '{\"country_id\":\"2\",\"name\":\"Istanbul\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 19:01:55', '2021-10-02 19:01:55'),
(158, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 19:01:56', '2021-10-02 19:01:56'),
(159, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:03:36', '2021-10-02 19:03:36'),
(160, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-10-02 19:03:44', '2021-10-02 19:03:44'),
(161, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:04:04', '2021-10-02 19:04:04'),
(162, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"products\",\"icon\":\"fa-bars\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\"}', '2021-10-02 19:04:16', '2021-10-02 19:04:16'),
(163, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-02 19:04:16', '2021-10-02 19:04:16'),
(164, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:04:23', '2021-10-02 19:04:23'),
(165, 1, 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"products\",\"icon\":\"fa-american-sign-language-interpreting\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}', '2021-10-02 19:04:38', '2021-10-02 19:04:38'),
(166, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-02 19:04:39', '2021-10-02 19:04:39'),
(167, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-02 19:04:43', '2021-10-02 19:04:43'),
(168, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:04:50', '2021-10-02 19:04:50'),
(169, 1, 'admin/products/4,5,6,7,8', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\"}', '2021-10-02 19:05:04', '2021-10-02 19:05:04'),
(170, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:05:04', '2021-10-02 19:05:04'),
(171, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-10-02 19:05:08', '2021-10-02 19:05:08'),
(172, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:05:20', '2021-10-02 19:05:20'),
(173, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-05 08:44:16', '2021-10-05 08:44:16'),
(174, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:45:00', '2021-10-05 08:45:00'),
(175, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:45:07', '2021-10-05 08:45:07'),
(176, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:45:11', '2021-10-05 08:45:11'),
(177, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:45:55', '2021-10-05 08:45:55'),
(178, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2021-10-05 08:48:26', '2021-10-05 08:48:26'),
(179, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:49:41', '2021-10-05 08:49:41'),
(180, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"users\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\"}', '2021-10-05 08:50:05', '2021-10-05 08:50:05'),
(181, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-05 08:50:05', '2021-10-05 08:50:05'),
(182, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"3\",\"title\":\"users\",\"icon\":\"fa-bars\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\"}', '2021-10-05 08:50:36', '2021-10-05 08:50:36'),
(183, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-05 08:50:37', '2021-10-05 08:50:37'),
(184, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\",\"_order\":\"[{\\\"id\\\":3,\\\"children\\\":[{\\\"id\\\":16}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-10-05 08:50:44', '2021-10-05 08:50:44'),
(185, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:50:45', '2021-10-05 08:50:45'),
(186, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-05 08:52:22', '2021-10-05 08:52:22'),
(187, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"3\",\"title\":\"profiles\",\"icon\":\"fa-bars\",\"uri\":\"profiles\",\"roles\":[null],\"permission\":null,\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\"}', '2021-10-05 08:52:39', '2021-10-05 08:52:39'),
(188, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-05 08:52:39', '2021-10-05 08:52:39'),
(189, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-05 08:52:43', '2021-10-05 08:52:43'),
(190, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:52:47', '2021-10-05 08:52:47'),
(191, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:53:24', '2021-10-05 08:53:24'),
(192, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"first_name,last_name,status,user_id\",\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:54:19', '2021-10-05 08:54:19'),
(193, 1, 'admin/profiles/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:54:29', '2021-10-05 08:54:29'),
(194, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"first_name,last_name,status,user_id\",\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:54:52', '2021-10-05 08:54:52'),
(195, 1, 'admin/profiles/6', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:54:58', '2021-10-05 08:54:58'),
(196, 1, 'admin/profiles/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:55:17', '2021-10-05 08:55:17'),
(197, 1, 'admin/profiles/6', 'PUT', '127.0.0.1', '{\"user_id\":\"3\",\"first_name\":\"Muhindo\",\"last_name\":\"Mubaraka\",\"company_name\":\"IUT\",\"email\":\"mubahood360@gmail.com\",\"phone_number\":\"+256706638494\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam\",\"services\":null,\"longitude\":null,\"latitude\":null,\"division\":null,\"opening_hours\":null,\"profile_photo\":\"{\\\"src\\\":\\\"public\\\\\\/bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg\\\",\\\"user_id\\\":3}\",\"cover_photo\":\"{\\\"src\\\":\\\"public\\\\\\/WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png\\\",\\\"user_id\\\":3}\",\"facebook\":null,\"twitter\":null,\"whatsapp\":null,\"youtube\":null,\"instagram\":null,\"last_seen\":\"1633426861\",\"status\":\"active\",\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles\\/6\"}', '2021-10-05 08:55:34', '2021-10-05 08:55:34'),
(198, 1, 'admin/profiles/6', 'GET', '127.0.0.1', '[]', '2021-10-05 08:55:34', '2021-10-05 08:55:34'),
(199, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:55:40', '2021-10-05 08:55:40'),
(200, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"about,company_name,division,email,first_name,id,last_name,latitude,location,longitude,opening_hours,phone_number,profile_photo,services,status,user_id\",\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:56:01', '2021-10-05 08:56:01'),
(201, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-07 20:32:48', '2021-10-07 20:32:48'),
(202, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:34:04', '2021-10-07 20:34:04'),
(203, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:34:22', '2021-10-07 20:34:22'),
(204, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:34:31', '2021-10-07 20:34:31'),
(205, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:36:57', '2021-10-07 20:36:57'),
(206, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:37:10', '2021-10-07 20:37:10'),
(207, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"apartments\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-07 20:53:27', '2021-10-07 20:53:27'),
(208, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 20:53:27', '2021-10-07 20:53:27'),
(209, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:54:04', '2021-10-07 20:54:04'),
(210, 1, 'admin/categories/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:54:08', '2021-10-07 20:54:08'),
(211, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:54:20', '2021-10-07 20:54:20'),
(212, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:16:31', '2021-10-07 21:16:31'),
(213, 1, 'admin/categories/2', 'PUT', '127.0.0.1', '{\"parent\":null,\"name\":\"Property\",\"description\":\"Rent or sell Houses in Uganda\",\"slug\":\"houses\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-07 21:18:09', '2021-10-07 21:18:09'),
(214, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:18:10', '2021-10-07 21:18:10'),
(215, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:18:23', '2021-10-07 21:18:23'),
(216, 1, 'admin/categories/3', 'PUT', '127.0.0.1', '{\"parent\":null,\"name\":\"Mobiles\",\"description\":\"Mobiles details go here\",\"slug\":\"land\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-07 21:21:30', '2021-10-07 21:21:30'),
(217, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:21:31', '2021-10-07 21:21:31'),
(218, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:21:43', '2021-10-07 21:21:43'),
(219, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:21:49', '2021-10-07 21:21:49'),
(220, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:21:51', '2021-10-07 21:21:51'),
(221, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:06', '2021-10-07 21:22:06'),
(222, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:10', '2021-10-07 21:22:10'),
(223, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:12', '2021-10-07 21:22:12'),
(224, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:15', '2021-10-07 21:22:15'),
(225, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:18', '2021-10-07 21:22:18'),
(226, 1, 'admin/countries/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:21', '2021-10-07 21:22:21'),
(227, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:31', '2021-10-07 21:22:31'),
(228, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:33', '2021-10-07 21:22:33'),
(229, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:36', '2021-10-07 21:22:36'),
(230, 1, 'admin/profiles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:38', '2021-10-07 21:22:38'),
(231, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:41', '2021-10-07 21:22:41'),
(232, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:37:20', '2021-10-07 21:37:20'),
(233, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:37:21', '2021-10-07 21:37:21'),
(234, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:38:35', '2021-10-07 21:38:35'),
(235, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:45:43', '2021-10-07 21:45:43'),
(236, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:46:44', '2021-10-07 21:46:44'),
(237, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:49:01', '2021-10-07 21:49:01'),
(238, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:49:34', '2021-10-07 21:49:34'),
(239, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:49:55', '2021-10-07 21:49:55'),
(240, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:50:29', '2021-10-07 21:50:29'),
(241, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:51:07', '2021-10-07 21:51:07'),
(242, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:53:25', '2021-10-07 21:53:25'),
(243, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"0\",\"name\":null,\"description\":null,\"slug\":null,\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\"}', '2021-10-07 21:53:29', '2021-10-07 21:53:29'),
(244, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:53:29', '2021-10-07 21:53:29'),
(245, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:54:06', '2021-10-07 21:54:06'),
(246, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"3\",\"name\":\"Mobile Phones\",\"description\":\"Mobile Phones Details\",\"slug\":\"Mobile Phones\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"after-save\":\"2\"}', '2021-10-07 21:56:10', '2021-10-07 21:56:10'),
(247, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:56:10', '2021-10-07 21:56:10'),
(248, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"3\",\"name\":\"Mobile Phone Accessories\",\"description\":\"Mobile Phone Accessories\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"after-save\":\"2\"}', '2021-10-07 21:56:46', '2021-10-07 21:56:46'),
(249, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:56:47', '2021-10-07 21:56:47'),
(250, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"3\",\"name\":\"Mobile Phone Services\",\"description\":\"Mobile Phone Services\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\"}', '2021-10-07 21:57:10', '2021-10-07 21:57:10'),
(251, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:57:10', '2021-10-07 21:57:10'),
(252, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:57:52', '2021-10-07 21:57:52'),
(253, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:58:33', '2021-10-07 21:58:33'),
(254, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:59:25', '2021-10-07 21:59:25'),
(255, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:59:41', '2021-10-07 21:59:41'),
(256, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:05:10', '2021-10-07 22:05:10'),
(257, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:05:30', '2021-10-07 22:05:30'),
(258, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:06:03', '2021-10-07 22:06:03'),
(259, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:07:18', '2021-10-07 22:07:18'),
(260, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:07:41', '2021-10-07 22:07:41'),
(261, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:07:51', '2021-10-07 22:07:51'),
(262, 1, 'admin/categories/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:08:20', '2021-10-07 22:08:20'),
(263, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:08:30', '2021-10-07 22:08:30'),
(264, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:10:01', '2021-10-07 22:10:01'),
(265, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:10:26', '2021-10-07 22:10:26'),
(266, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:12:48', '2021-10-07 22:12:48'),
(267, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:13:03', '2021-10-07 22:13:03'),
(268, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:13:12', '2021-10-07 22:13:12');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(269, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:13:33', '2021-10-07 22:13:33'),
(270, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:13:46', '2021-10-07 22:13:46'),
(271, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:14:09', '2021-10-07 22:14:09'),
(272, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:14:17', '2021-10-07 22:14:17'),
(273, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:14:26', '2021-10-07 22:14:26'),
(274, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:14:52', '2021-10-07 22:14:52'),
(275, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:12:55', '2021-10-07 23:12:55'),
(276, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:13:00', '2021-10-07 23:13:00'),
(277, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:13:06', '2021-10-07 23:13:06'),
(278, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:13:10', '2021-10-07 23:13:10'),
(279, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:13:13', '2021-10-07 23:13:13'),
(280, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-07 23:16:25', '2021-10-07 23:16:25'),
(281, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-07 23:17:10', '2021-10-07 23:17:10'),
(282, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 06:59:21', '2021-10-08 06:59:21'),
(283, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"3\",\"options\":null,\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:00:24', '2021-10-08 08:00:24'),
(284, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 08:00:27', '2021-10-08 08:00:27'),
(285, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:00:33', '2021-10-08 08:00:33'),
(286, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:00:43', '2021-10-08 08:00:43'),
(287, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Condition\",\"type\":\"2\",\"options\":null,\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:01:06', '2021-10-08 08:01:06'),
(288, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:01:11', '2021-10-08 08:01:11'),
(289, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Condition\",\"type\":\"2\",\"options\":null,\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 08:01:23', '2021-10-08 08:01:23'),
(290, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:01:27', '2021-10-08 08:01:27'),
(291, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"3\",\"options\":\"Used,New\",\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:12:42', '2021-10-08 08:12:42'),
(292, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 08:24:06', '2021-10-08 08:24:06'),
(293, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:24:09', '2021-10-08 08:24:09'),
(294, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:37:41', '2021-10-08 08:37:41'),
(295, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:39:21', '2021-10-08 08:39:21'),
(296, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:42:12', '2021-10-08 08:42:12'),
(297, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:45:32', '2021-10-08 08:45:32'),
(298, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:46:01', '2021-10-08 08:46:01'),
(299, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:47:07', '2021-10-08 08:47:07'),
(300, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:47:25', '2021-10-08 08:47:25'),
(301, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:47:37', '2021-10-08 08:47:37'),
(302, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:48:50', '2021-10-08 08:48:50'),
(303, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:48:57', '2021-10-08 08:48:57'),
(304, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:49:07', '2021-10-08 08:49:07'),
(305, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:49:29', '2021-10-08 08:49:29'),
(306, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:49:47', '2021-10-08 08:49:47'),
(307, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":null,\"type\":\"3\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:54:35', '2021-10-08 08:54:35'),
(308, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:54:35', '2021-10-08 08:54:35'),
(309, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"3\",\"options\":[\"Uses\",\"New\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:55:07', '2021-10-08 08:55:07'),
(310, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 08:55:41', '2021-10-08 08:55:41'),
(311, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:55:43', '2021-10-08 08:55:43'),
(312, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"3\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 08:56:27', '2021-10-08 08:56:27'),
(313, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 08:56:27', '2021-10-08 08:56:27'),
(314, 1, 'admin/attributes/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:57:43', '2021-10-08 08:57:43'),
(315, 1, 'admin/attributes/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-08 08:57:58', '2021-10-08 08:57:58'),
(316, 1, 'admin/attributes/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-08 09:03:53', '2021-10-08 09:03:53'),
(317, 1, 'admin/attributes/1', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"6\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_method\":\"PUT\"}', '2021-10-08 09:04:29', '2021-10-08 09:04:29'),
(318, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:04:30', '2021-10-08 09:04:30'),
(319, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Authenticity\",\"type\":\"5\",\"options\":[\"Original\",\"Refurbished\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/1\\/edit\"}', '2021-10-08 09:05:07', '2021-10-08 09:05:07'),
(320, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:05:07', '2021-10-08 09:05:07'),
(321, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[\"Acer\",\"Apple\",\"Asus\",\"Blackberry\",\"Blu\",\"China mobile\",\"Dell\",\"G-Five\",\"HTC\",\"Huawei\",\"Infinix\",\"Itel\",\"Lava\",\"Lenovo\",\"LG\",\"Motorola\",\"Nokia\",\"Oneplus\",\"OPPO\",null],\"units\":\"single\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:35:01', '2021-10-08 09:35:01'),
(322, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:35:01', '2021-10-08 09:35:01'),
(323, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Model\",\"type\":null,\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:37:03', '2021-10-08 09:37:03'),
(324, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:37:04', '2021-10-08 09:37:04'),
(325, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Model\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:37:20', '2021-10-08 09:37:20'),
(326, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:37:21', '2021-10-08 09:37:21'),
(327, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Features\",\"type\":\"6\",\"options\":[\"Bluetooth\",\"Camera\",\"Dual-Lens Camera\",\"Dual SIM\",\"Expandable Memory\",\"Fingerprint Sensor\",\"GPS\",\"Physical keyboard\",\"Motion Sensors\",\"3G\",\"4G\",\"GSM\",\"Touch screen\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:39:35', '2021-10-08 09:39:35'),
(328, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:39:35', '2021-10-08 09:39:35'),
(329, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Description\",\"type\":\"2\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:42:14', '2021-10-08 09:42:14'),
(330, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:42:15', '2021-10-08 09:42:15'),
(331, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:43:11', '2021-10-08 09:43:11'),
(332, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:43:11', '2021-10-08 09:43:11'),
(333, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:43:46', '2021-10-08 09:43:46'),
(334, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:44:40', '2021-10-08 09:44:40'),
(335, 1, 'admin/attributes/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:44:52', '2021-10-08 09:44:52'),
(336, 1, 'admin/attributes/2', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Authenticity\",\"type\":\"5\",\"options\":[\"Original\",\"Refurbished\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/\"}', '2021-10-08 09:45:04', '2021-10-08 09:45:04'),
(337, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:45:04', '2021-10-08 09:45:04'),
(338, 1, 'admin/attributes/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:10', '2021-10-08 09:45:10'),
(339, 1, 'admin/attributes/3', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[\"Acer\",\"Apple\",\"Asus\",\"Blackberry\",\"Blu\",\"China mobile\",\"Dell\",\"G-Five\",\"HTC\",\"Huawei\",\"Infinix\",\"Itel\",\"Lava\",\"Lenovo\",\"LG\",\"Motorola\",\"Nokia\",\"Oneplus\",\"OPPO\",null],\"units\":\"single\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/\"}', '2021-10-08 09:45:17', '2021-10-08 09:45:17'),
(340, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:45:17', '2021-10-08 09:45:17'),
(341, 1, 'admin/attributes/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:22', '2021-10-08 09:45:22'),
(342, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:26', '2021-10-08 09:45:26'),
(343, 1, 'admin/attributes/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:30', '2021-10-08 09:45:30'),
(344, 1, 'admin/attributes/4', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Model\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/\"}', '2021-10-08 09:45:35', '2021-10-08 09:45:35'),
(345, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:45:35', '2021-10-08 09:45:35'),
(346, 1, 'admin/attributes/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:39', '2021-10-08 09:45:39'),
(347, 1, 'admin/attributes/7', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/\"}', '2021-10-08 09:45:45', '2021-10-08 09:45:45'),
(348, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:45:45', '2021-10-08 09:45:45'),
(349, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:46:17', '2021-10-08 09:46:17'),
(350, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:48:50', '2021-10-08 09:48:50'),
(351, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_export_\":\"all\"}', '2021-10-08 09:49:21', '2021-10-08 09:49:21'),
(352, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:50:08', '2021-10-08 09:50:08'),
(353, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-08 09:56:32', '2021-10-08 09:56:32'),
(354, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 09:58:20', '2021-10-08 09:58:20'),
(355, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:58:30', '2021-10-08 09:58:30'),
(356, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:58:39', '2021-10-08 09:58:39'),
(357, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,email,first_name,id,last_name,location,profile_photo,services,status,user_id\",\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:59:18', '2021-10-08 09:59:18'),
(358, 1, 'admin/profiles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:59:25', '2021-10-08 09:59:25'),
(359, 1, 'admin/profiles/1', 'PUT', '127.0.0.1', '{\"user_id\":\"1\",\"first_name\":\"Muhindo\",\"last_name\":\"Mubaraka\",\"company_name\":\"IUT\",\"email\":\"mubahood360@gmail.com\",\"phone_number\":\"+256706638494\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":\"2694351585\",\"services\":\"Rentals, Car hiring, Apartments\",\"longitude\":\"2694351585\",\"latitude\":null,\"division\":null,\"opening_hours\":null,\"profile_photo\":\"{\\\"src\\\":\\\"public\\\\\\/u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png\\\",\\\"user_id\\\":1}\",\"cover_photo\":\"{\\\"src\\\":\\\"public\\\\\\/c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png\\\",\\\"user_id\\\":1}\",\"facebook\":null,\"twitter\":null,\"whatsapp\":null,\"youtube\":null,\"instagram\":null,\"last_seen\":\"1633697886\",\"status\":\"active\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles?_columns_=created_at%2Cemail%2Cfirst_name%2Cid%2Clast_name%2Clocation%2Cprofile_photo%2Cservices%2Cstatus%2Cuser_id\"}', '2021-10-08 09:59:32', '2021-10-08 09:59:32'),
(360, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,email,first_name,id,last_name,location,profile_photo,services,status,user_id\"}', '2021-10-08 09:59:32', '2021-10-08 09:59:32'),
(361, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:02:00', '2021-10-08 10:02:00'),
(362, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"3\",\"name\":\"Mobile Phone Accessories\",\"description\":\"Mobile Phone Accessories details...\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 10:04:07', '2021-10-08 10:04:07'),
(363, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 10:04:07', '2021-10-08 10:04:07'),
(364, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"7\",\"_model\":\"App_Models_category\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-10-08 10:04:19', '2021-10-08 10:04:19'),
(365, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:04:20', '2021-10-08 10:04:20'),
(366, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:05:30', '2021-10-08 10:05:30'),
(367, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:05:33', '2021-10-08 10:05:33'),
(368, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Item type\",\"type\":\"4\",\"options\":[\"Power bank\",\"Screen protector\",\"Chargers\",\"Cables\",\"Holders and\",\"Stands\",\"VR Box\",\"Selfie Sticks\",\"Others\",null],\"units\":\"single\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 10:08:19', '2021-10-08 10:08:19'),
(369, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:08:20', '2021-10-08 10:08:20'),
(370, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:09:20', '2021-10-08 10:09:20'),
(371, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:09:21', '2021-10-08 10:09:21'),
(372, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:10:06', '2021-10-08 10:10:06'),
(373, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 10:10:39', '2021-10-08 10:10:39'),
(374, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:10:39', '2021-10-08 10:10:39'),
(375, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Condition_\",\"type\":\"5\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 10:36:30', '2021-10-08 10:36:30'),
(376, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:36:30', '2021-10-08 10:36:30'),
(377, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 10:37:14', '2021-10-08 10:37:14'),
(378, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:37:15', '2021-10-08 10:37:15'),
(379, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,email,first_name,id,last_name,location,profile_photo,services,status,user_id\"}', '2021-10-08 10:37:25', '2021-10-08 10:37:25'),
(380, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Negotiable_\",\"type\":\"6\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 10:40:21', '2021-10-08 10:40:21'),
(381, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:40:21', '2021-10-08 10:40:21'),
(382, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:41:26', '2021-10-08 10:41:26'),
(383, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:42:03', '2021-10-08 10:42:03'),
(384, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"1\",\"name\":\"Cars\",\"description\":\"Car category details go here...\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 10:42:37', '2021-10-08 10:42:37'),
(385, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:42:38', '2021-10-08 10:42:38'),
(386, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:43:58', '2021-10-08 10:43:58'),
(387, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:44:00', '2021-10-08 10:44:00'),
(388, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"New\",\"Used\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 10:44:59', '2021-10-08 10:44:59'),
(389, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:44:59', '2021-10-08 10:44:59'),
(390, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Condition__\",\"type\":\"5\",\"options\":[\"New\",\"Used\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 10:49:43', '2021-10-08 10:49:43'),
(391, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:49:43', '2021-10-08 10:49:43'),
(392, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-08 11:19:27', '2021-10-08 11:19:27'),
(393, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:20:34', '2021-10-08 11:20:34'),
(394, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:20:49', '2021-10-08 11:20:49'),
(395, 1, 'admin/attributes/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:20:55', '2021-10-08 11:20:55'),
(396, 1, 'admin/attributes/11', 'PUT', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"New\",\"Used\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:21:04', '2021-10-08 11:21:04'),
(397, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:21:04', '2021-10-08 11:21:04'),
(398, 1, 'admin/attributes/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:10', '2021-10-08 11:21:10'),
(399, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:14', '2021-10-08 11:21:14'),
(400, 1, 'admin/attributes/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:23', '2021-10-08 11:21:23'),
(401, 1, 'admin/attributes/10', 'PUT', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:21:26', '2021-10-08 11:21:26'),
(402, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:21:26', '2021-10-08 11:21:26'),
(403, 1, 'admin/attributes/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:31', '2021-10-08 11:21:31'),
(404, 1, 'admin/attributes/9', 'PUT', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:21:34', '2021-10-08 11:21:34'),
(405, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:21:34', '2021-10-08 11:21:34'),
(406, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:39', '2021-10-08 11:21:39'),
(407, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:43', '2021-10-08 11:21:43'),
(408, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:48', '2021-10-08 11:21:48'),
(409, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[\"Audi\",\"BMW\",\"Dodge\",\"Ferrari\",\"Hino\",\"Honder\",\"Hummer\",\"Isuzu\",\"Jaguar\",\"Honda\",\"Toyota\",null],\"units\":\"single\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:24:12', '2021-10-08 11:24:12'),
(410, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:24:13', '2021-10-08 11:24:13'),
(411, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Model\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:24:51', '2021-10-08 11:24:51'),
(412, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:24:52', '2021-10-08 11:24:52'),
(413, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:25:30', '2021-10-08 11:25:30'),
(414, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Trim \\/ Edition\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:26:00', '2021-10-08 11:26:00'),
(415, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:26:01', '2021-10-08 11:26:01'),
(416, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Year of Manufacture\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:26:24', '2021-10-08 11:26:24'),
(417, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:26:24', '2021-10-08 11:26:24'),
(418, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Kilometers run\",\"type\":\"3\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:26:57', '2021-10-08 11:26:57'),
(419, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:26:58', '2021-10-08 11:26:58'),
(420, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Engine capacity\",\"type\":\"1\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:27:24', '2021-10-08 11:27:24'),
(421, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:27:24', '2021-10-08 11:27:24'),
(422, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Fuel type\",\"type\":\"4\",\"options\":[\"Diesel\",\"Petrol\",\"CNG\",\"Hybrid\",\"Electric\",\"Octane\",\"LPG\",\"Other\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:29:14', '2021-10-08 11:29:14'),
(423, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:29:14', '2021-10-08 11:29:14'),
(424, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Transmission\",\"type\":\"5\",\"options\":[\"Manual\",\"Automatic\",\"Other transmission\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:29:47', '2021-10-08 11:29:47'),
(425, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:29:47', '2021-10-08 11:29:47'),
(426, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Body type\",\"type\":\"4\",\"options\":[null],\"units\":\"Saloon\",\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 11:30:34', '2021-10-08 11:30:34'),
(427, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:30:35', '2021-10-08 11:30:35'),
(428, 1, 'admin/attributes/20/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:30:45', '2021-10-08 11:30:45'),
(429, 1, 'admin/attributes/20', 'PUT', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Body type\",\"type\":\"4\",\"options\":[\"Saloon\",\"Hatchback\",\"Estate\",\"Sports\",\"SUV\",\"MPV\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:31:47', '2021-10-08 11:31:47'),
(430, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:31:48', '2021-10-08 11:31:48'),
(431, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/20\\/edit\"}', '2021-10-08 11:32:33', '2021-10-08 11:32:33'),
(432, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:32:34', '2021-10-08 11:32:34'),
(433, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:34:45', '2021-10-08 11:34:45'),
(434, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:34:58', '2021-10-08 11:34:58'),
(435, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"1\",\"name\":\"Motorbikes\",\"description\":\"Motorbikes DETAILS GO HERE.....\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 11:35:36', '2021-10-08 11:35:36'),
(436, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 11:35:37', '2021-10-08 11:35:37'),
(437, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:36:28', '2021-10-08 11:36:28'),
(438, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2021-10-08 11:36:33', '2021-10-08 11:36:33'),
(439, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:36:35', '2021-10-08 11:36:35'),
(440, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Bike type\",\"type\":\"5\",\"options\":[\"Motorcycle\",\"Scooters\",\"E-bikes\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes?&page=2\"}', '2021-10-08 11:37:24', '2021-10-08 11:37:24'),
(441, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:37:24', '2021-10-08 11:37:24'),
(442, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:38:24', '2021-10-08 11:38:24'),
(443, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:38:25', '2021-10-08 11:38:25'),
(444, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[null],\"units\":\"Akij\",\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 11:39:44', '2021-10-08 11:39:44'),
(445, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:39:44', '2021-10-08 11:39:44'),
(446, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:39:50', '2021-10-08 11:39:50'),
(447, 1, 'admin/attributes/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:39:54', '2021-10-08 11:39:54'),
(448, 1, 'admin/attributes/24', 'PUT', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[null],\"units\":\"Akij\",\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes?page=2\"}', '2021-10-08 11:40:00', '2021-10-08 11:40:00'),
(449, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2021-10-08 11:40:00', '2021-10-08 11:40:00'),
(450, 1, 'admin/attributes/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:40:06', '2021-10-08 11:40:06'),
(451, 1, 'admin/attributes/24', 'PUT', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[null],\"units\":\"Akij,\",\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes?page=2\"}', '2021-10-08 11:40:09', '2021-10-08 11:40:09'),
(452, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2021-10-08 11:40:09', '2021-10-08 11:40:09'),
(453, 1, 'admin/attributes/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:40:13', '2021-10-08 11:40:13'),
(454, 1, 'admin/attributes/24', 'PUT', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[\"Akij\",\"Alliance\",\"Bajaj\",\"Senke\",\"Suzuki\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes?page=2\"}', '2021-10-08 11:41:27', '2021-10-08 11:41:27'),
(455, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:41:28', '2021-10-08 11:41:28'),
(456, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Trim \\/ Edition\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/24\\/edit\"}', '2021-10-08 11:41:56', '2021-10-08 11:41:56'),
(457, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:41:56', '2021-10-08 11:41:56'),
(458, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Year of Manufacture\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:42:33', '2021-10-08 11:42:33'),
(459, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:42:33', '2021-10-08 11:42:33'),
(460, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Kilometers run\",\"type\":\"3\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:42:50', '2021-10-08 11:42:50'),
(461, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:42:50', '2021-10-08 11:42:50'),
(462, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Engine capacity\",\"type\":\"3\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:43:38', '2021-10-08 11:43:38'),
(463, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:43:38', '2021-10-08 11:43:38'),
(464, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 11:44:18', '2021-10-08 11:44:18'),
(465, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:44:18', '2021-10-08 11:44:18'),
(466, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:48:03', '2021-10-08 11:48:03'),
(467, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:48:06', '2021-10-08 11:48:06'),
(468, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"2\",\"name\":\"Land\",\"description\":\"Land DETAILS GO HERE\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 11:48:37', '2021-10-08 11:48:37'),
(469, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 11:48:37', '2021-10-08 11:48:37'),
(470, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:48:41', '2021-10-08 11:48:41'),
(471, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:48:46', '2021-10-08 11:48:46'),
(472, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land type\",\"type\":\"5\",\"options\":[\"Agricultural\",\"Commercial\",\"Residential\",\"Other\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:50:18', '2021-10-08 11:50:18'),
(473, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:50:19', '2021-10-08 11:50:19'),
(474, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land size\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:51:24', '2021-10-08 11:51:24'),
(475, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:51:24', '2021-10-08 11:51:24'),
(476, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land size unit\",\"type\":\"4\",\"options\":[\"Acres\",\"Dedimal\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:52:52', '2021-10-08 11:52:52'),
(477, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:52:53', '2021-10-08 11:52:53'),
(478, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land Address\",\"type\":\"2\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:54:12', '2021-10-08 11:54:12'),
(479, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:54:13', '2021-10-08 11:54:13'),
(480, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:56:11', '2021-10-08 11:56:11'),
(481, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:56:15', '2021-10-08 11:56:15'),
(482, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"2\",\"name\":\"Apartments For Sale\",\"description\":\"Apartments For Sale details go here\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 11:56:53', '2021-10-08 11:56:53'),
(483, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 11:56:54', '2021-10-08 11:56:54'),
(484, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:56:57', '2021-10-08 11:56:57'),
(485, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:57:01', '2021-10-08 11:57:01'),
(486, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"11\",\"name\":\"Beds\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:57:48', '2021-10-08 11:57:48'),
(487, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:57:49', '2021-10-08 11:57:49'),
(488, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"11\",\"name\":\"Baths\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:58:33', '2021-10-08 11:58:33'),
(489, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:58:34', '2021-10-08 11:58:34'),
(490, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"11\",\"name\":\"Size\",\"type\":\"3\",\"options\":[null],\"units\":\"sqft\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:59:10', '2021-10-08 11:59:10'),
(491, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:59:11', '2021-10-08 11:59:11'),
(492, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"11\",\"name\":\"Address\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:59:44', '2021-10-08 11:59:44'),
(493, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:59:45', '2021-10-08 11:59:45'),
(494, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 12:00:05', '2021-10-08 12:00:05');

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
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

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
(1, 'Administrator', 'administrator', '2021-09-17 18:04:27', '2021-09-17 18:04:27');

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
(1, 2, NULL, NULL);

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
(1, 1, NULL, NULL);

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
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$omiZ3CJUzWf/QGmwiLplGuDz2KT8Tf2fSa22oicpuP9H2kuOi45vS', 'Administrator', NULL, '40yu4laX91zms0Sq6G09Pj35uOPPbTkK5C8zajECi1YTg5jM41ViqAtmkwsE', '2021-09-17 18:04:26', '2021-09-17 18:04:26');

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

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `created_at`, `updated_at`, `category_id`, `name`, `type`, `options`, `is_required`, `units`) VALUES
(1, '2021-10-08 08:56:27', '2021-10-08 09:04:30', 4, 'Condition', '6', 'New,Used', 1, NULL),
(2, '2021-10-08 09:05:07', '2021-10-08 09:45:04', 4, 'Authenticity', '5', 'Original,Refurbished', 1, NULL),
(3, '2021-10-08 09:35:01', '2021-10-08 09:45:17', 4, 'Brand', '4', 'Acer,Apple,Asus,Blackberry,Blu,China mobile,Dell,G-Five,HTC,Huawei,Infinix,Itel,Lava,Lenovo,LG,Motorola,Nokia,Oneplus,OPPO', 1, 'single'),
(4, '2021-10-08 09:37:20', '2021-10-08 09:45:35', 4, 'Model', '1', '', 1, NULL),
(5, '2021-10-08 09:39:35', '2021-10-08 09:39:35', 4, 'Features', '6', 'Bluetooth,Camera,Dual-Lens Camera,Dual SIM,Expandable Memory,Fingerprint Sensor,GPS,Physical keyboard,Motion Sensors,3G,4G,GSM,Touch screen', 0, NULL),
(6, '2021-10-08 09:42:14', '2021-10-08 09:42:14', 4, 'Description', '2', '', 1, NULL),
(7, '2021-10-08 09:43:11', '2021-10-08 09:45:45', 4, 'Negotiable', '6', '', 0, NULL),
(8, '2021-10-08 10:08:19', '2021-10-08 10:08:19', 5, 'Item type', '4', 'Power bank,Screen protector,Chargers,Cables,Holders and,Stands,VR Box,Selfie Sticks,Others', 1, 'single'),
(9, '2021-10-08 10:36:30', '2021-10-08 11:21:34', 5, 'Condition', '5', 'New,Used', 1, NULL),
(10, '2021-10-08 10:40:21', '2021-10-08 11:21:26', 5, 'Negotiable', '6', 'Negotiable', 0, NULL),
(11, '2021-10-08 10:49:43', '2021-10-08 11:21:04', 8, 'Condition', '5', 'New,Used,Reconditioned', 1, NULL),
(12, '2021-10-08 11:24:12', '2021-10-08 11:24:12', 8, 'Brand', '4', 'Audi,BMW,Dodge,Ferrari,Hino,Honder,Hummer,Isuzu,Jaguar,Honda,Toyota', 1, 'single'),
(13, '2021-10-08 11:24:51', '2021-10-08 11:24:51', 8, 'Model', '1', '', 1, NULL),
(14, '2021-10-08 11:26:00', '2021-10-08 11:26:00', 8, 'Trim / Edition', '1', '', 1, NULL),
(15, '2021-10-08 11:26:24', '2021-10-08 11:26:24', 8, 'Year of Manufacture', '3', '', 1, NULL),
(16, '2021-10-08 11:26:57', '2021-10-08 11:26:57', 8, 'Kilometers run', '3', '', 1, 'KM'),
(17, '2021-10-08 11:27:24', '2021-10-08 11:27:24', 8, 'Engine capacity', '1', '', 1, 'CC'),
(18, '2021-10-08 11:29:14', '2021-10-08 11:29:14', 8, 'Fuel type', '4', 'Diesel,Petrol,CNG,Hybrid,Electric,Octane,LPG,Other', 1, NULL),
(19, '2021-10-08 11:29:47', '2021-10-08 11:29:47', 8, 'Transmission', '5', 'Manual,Automatic,Other transmission', 1, NULL),
(20, '2021-10-08 11:30:34', '2021-10-08 11:31:47', 8, 'Body type', '4', 'Saloon,Hatchback,Estate,Sports,SUV,MPV', 0, NULL),
(21, '2021-10-08 11:32:34', '2021-10-08 11:32:34', 8, 'Negotiable', '6', '', 0, NULL),
(22, '2021-10-08 11:37:24', '2021-10-08 11:37:24', 9, 'Bike type', '5', 'Motorcycle,Scooters,E-bikes', 1, NULL),
(23, '2021-10-08 11:38:25', '2021-10-08 11:38:25', 9, 'Condition', '5', 'Used,New', 1, NULL),
(24, '2021-10-08 11:39:44', '2021-10-08 11:41:27', 9, 'Brand', '4', 'Akij,Alliance,Bajaj,Senke,Suzuki', 1, NULL),
(25, '2021-10-08 11:41:56', '2021-10-08 11:41:56', 9, 'Trim / Edition', '1', '', 1, NULL),
(26, '2021-10-08 11:42:33', '2021-10-08 11:42:33', 9, 'Year of Manufacture', '3', '', 1, NULL),
(27, '2021-10-08 11:42:50', '2021-10-08 11:42:50', 9, 'Kilometers run', '3', '', 1, 'KM'),
(28, '2021-10-08 11:43:38', '2021-10-08 11:43:38', 9, 'Engine capacity', '3', '', 1, 'CC'),
(29, '2021-10-08 11:44:18', '2021-10-08 11:44:18', 9, 'Negotiable', '6', 'Negotiable', 0, NULL),
(30, '2021-10-08 11:50:18', '2021-10-08 11:50:18', 10, 'Land type', '5', 'Agricultural,Commercial,Residential,Other', 1, NULL),
(31, '2021-10-08 11:51:24', '2021-10-08 11:51:24', 10, 'Land size', '3', '', 1, NULL),
(32, '2021-10-08 11:52:52', '2021-10-08 11:52:52', 10, 'Land size unit', '4', 'Acres,Dedimal', 1, NULL),
(33, '2021-10-08 11:54:12', '2021-10-08 11:54:12', 10, 'Land Address', '2', '', 1, NULL),
(34, '2021-10-08 11:57:49', '2021-10-08 11:57:49', 11, 'Beds', '3', '', 1, NULL),
(35, '2021-10-08 11:58:33', '2021-10-08 11:58:33', 11, 'Baths', '3', '', 1, NULL),
(36, '2021-10-08 11:59:10', '2021-10-08 11:59:10', 11, 'Size', '3', '', 1, 'sqft'),
(37, '2021-10-08 11:59:44', '2021-10-08 11:59:44', 11, 'Address', '1', '', 1, NULL);

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

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `parent`, `name`, `description`, `slug`, `image`) VALUES
(1, '2021-09-17 18:13:44', '2021-10-07 20:53:27', 0, 'Vehicles', '🚘 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!', 'vehicles', 'icons8-people-in-car-96.png'),
(2, '2021-09-17 18:16:29', '2021-10-07 21:18:09', NULL, 'Property', 'Rent or sell Houses in Uganda', 'property', 'icons8-real-estate-96.png'),
(3, '2021-09-17 18:17:43', '2021-10-07 21:21:30', NULL, 'Mobiles', 'Mobiles details go here', 'mobiles', 'icons8-google-mobile-96.png'),
(4, '2021-10-07 21:56:10', '2021-10-07 21:56:10', 3, 'Mobile Phones', 'Mobile Phones Details', 'mobile-phones', 'a14188077bf80ebe46e8c75de417258e.png'),
(5, '2021-10-07 21:56:46', '2021-10-07 21:56:46', 3, 'Mobile Phone Accessories', 'Mobile Phone Accessories', 'mobile-phone-accessories', 'de78188edc49be947f3c2eb67cb0736f.png'),
(6, '2021-10-07 21:57:10', '2021-10-07 21:57:10', 3, 'Mobile Phone Services', 'Mobile Phone Services', 'mobile-phone-services', '8d290b2fa4f011db2bda82184b48b25d.png'),
(8, '2021-10-08 10:42:37', '2021-10-08 10:42:37', 1, 'Cars', 'Car category details go here...', 'cars', 'ebb971fd3e31549be8219e0517e5a361.png'),
(9, '2021-10-08 11:35:36', '2021-10-08 11:35:36', 1, 'Motorbikes', 'Motorbikes DETAILS GO HERE.....', 'motorbikes', '237c6e8d45d2af96d996e44bdfcd9563.png'),
(10, '2021-10-08 11:48:37', '2021-10-08 11:48:37', 2, 'Land', 'Land DETAILS GO HERE', 'land', 'bee9a5bba9b6c842cfe0853ccab835f8.png'),
(11, '2021-10-08 11:56:53', '2021-10-08 11:56:53', 2, 'Apartments For Sale', 'Apartments For Sale details go here', 'apartments-for-sale', '42b99e0e6e61c502b32f970f87707db2.png');

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
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `country_id`, `name`, `longitude`, `latitude`, `details`, `image`, `listed`) VALUES
(1, '2021-09-23 07:46:44', '2021-10-02 15:20:51', 1, 'Kampala', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'd8fd9f28af0cdfa8b8f213d347c4fb78.jpg', '1'),
(2, '2021-09-23 07:46:58', '2021-10-02 18:59:13', 1, 'Mbarara', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'city-mbarara.jpg', '1'),
(3, '2021-09-23 07:47:11', '2021-10-02 18:59:51', 4, 'Dubai', '16.2212.', '18.2222', 'Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.', 'city-dubai.jpg', '1'),
(4, '2021-09-23 07:47:22', '2021-10-02 19:01:02', 1, 'Kasese', NULL, NULL, NULL, '01.jpg', '0'),
(5, '2021-10-02 11:55:41', '2021-10-02 19:01:55', 2, 'Istanbul', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'city-istanbul.jpg', '1'),
(6, '2021-10-02 11:56:42', '2021-10-02 19:00:35', 4, 'Qatar', '16.2212', '18.2222', NULL, 'city-qatar.jpg', '1'),
(7, '2021-10-02 12:03:52', '2021-10-02 19:00:05', 3, 'China', '16.2212.', '18.2222', 'Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.', 'city-quanzhou.jpg', '1');

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

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `created_at`, `updated_at`, `name`, `longitude`, `latitude`, `details`, `image`, `code`, `listed`) VALUES
(1, '2021-09-23 07:38:25', '2021-09-23 07:38:25', 'Uganda', '16.2212.', '18.2222', 'Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.', NULL, '256', '1'),
(2, '2021-09-23 07:41:16', '2021-09-23 07:41:16', 'Turkey', '16.2212.', '18.2222', 'Turkey, officially the Republic of Turkey, is a country bridging Europe and Asia. It shares borders with Greece and Bulgaria to the northwest; the Black Sea to the north; Georgia to the northeast;', 'images/Flag_of_Turkey.svg.png', '+90', '1'),
(3, '2021-10-02 11:36:43', '2021-10-02 11:36:43', 'China', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'images/city-quanzhou.jpg', '256', '1'),
(4, '2021-10-02 11:38:03', '2021-10-02 11:38:03', 'UAE', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'images/city-dubai.jpg', '441188', '1');

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

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `created_at`, `updated_at`, `user_id`, `product_id`, `size`, `width`, `height`, `src`, `name`, `thumbnail`) VALUES
(1, '2021-09-18 09:37:41', '2021-09-18 09:37:41', 1, NULL, NULL, NULL, NULL, 'public/MgW7hmTnfXm1CaEdV525VsU9oAa0h2zjvAa2fDJ1.png', NULL, 'public/thumb_MgW7hmTnfXm1CaEdV525VsU9oAa0h2zjvAa2fDJ1.png'),
(2, '2021-09-18 09:39:09', '2021-09-18 09:39:09', 1, NULL, NULL, NULL, NULL, 'public/cNznQD2kbTcXZZ31JxUGcjElBv6UhI37OCzGl1hk.png', NULL, 'public/thumb_cNznQD2kbTcXZZ31JxUGcjElBv6UhI37OCzGl1hk.png'),
(3, '2021-09-18 09:39:32', '2021-09-18 09:39:32', 1, NULL, NULL, NULL, NULL, 'public/fbJ4qhkrq2rhopxEAZ7ACWLOv3e8Xgv60IvNyZ32.png', NULL, 'public/thumb_fbJ4qhkrq2rhopxEAZ7ACWLOv3e8Xgv60IvNyZ32.png'),
(4, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/CnZXzyFFJTAfZCjXXaS2zb5w8zHhu7o8ZOwMmWzy.png', NULL, 'public/thumb_CnZXzyFFJTAfZCjXXaS2zb5w8zHhu7o8ZOwMmWzy.png'),
(5, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/lC3ldkuqylg9kIipPLUGXhqmMUCqGrX1aziiPy5P.png', NULL, 'public/thumb_lC3ldkuqylg9kIipPLUGXhqmMUCqGrX1aziiPy5P.png'),
(6, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/vQTtt1DYr8TNH4O6y3TckvSonicJz4HNMuvoH4vK.png', NULL, 'public/thumb_vQTtt1DYr8TNH4O6y3TckvSonicJz4HNMuvoH4vK.png'),
(7, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/BR8lmoFdMjyDilLtXLho6kiaLZelR5YsrLskgCUP.png', NULL, 'public/thumb_BR8lmoFdMjyDilLtXLho6kiaLZelR5YsrLskgCUP.png'),
(8, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/ThltVNoMhDQGShBcdyBBWprzUa1yBjR7YmJjNoOl.png', NULL, 'public/thumb_ThltVNoMhDQGShBcdyBBWprzUa1yBjR7YmJjNoOl.png'),
(9, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/DHy7TBDHBitLcjFu5IvXITOPXoKV3VZMTFGv89m0.png', NULL, 'public/thumb_DHy7TBDHBitLcjFu5IvXITOPXoKV3VZMTFGv89m0.png'),
(10, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/qGpwxVmSC31FpSq5yI6OU1YRuVJcAQFTWd1WlXjv.png', NULL, 'public/thumb_qGpwxVmSC31FpSq5yI6OU1YRuVJcAQFTWd1WlXjv.png'),
(11, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/J4d505h4y0skY5qr7pKrJMJSpJQYIGNiAqkNLvRQ.png', NULL, 'public/thumb_J4d505h4y0skY5qr7pKrJMJSpJQYIGNiAqkNLvRQ.png'),
(12, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/yu62gPXVRTuEO3TpL0XBDi335BVYCCDEZzZk4mxK.png', NULL, 'public/thumb_yu62gPXVRTuEO3TpL0XBDi335BVYCCDEZzZk4mxK.png'),
(13, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/z5dSFMAdAdOUs0J585w8hDMI8GMPh0i0KthmVhY2.png', NULL, 'public/thumb_z5dSFMAdAdOUs0J585w8hDMI8GMPh0i0KthmVhY2.png'),
(14, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/PwjUhGyuwcPVog92OrW4WahLHcDddXybqarVYTR0.png', NULL, 'public/thumb_PwjUhGyuwcPVog92OrW4WahLHcDddXybqarVYTR0.png'),
(15, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/bs2lNXPppvL2ClcZ05PRLJO20FQ9PfbK5kxJO8Hy.png', NULL, 'public/thumb_bs2lNXPppvL2ClcZ05PRLJO20FQ9PfbK5kxJO8Hy.png'),
(16, '2021-09-18 11:44:10', '2021-09-18 11:44:10', 1, NULL, NULL, NULL, NULL, 'public/khirV2BKPl15UsNNynUhZmAdxlBv31vnyryM5Y0y.png', NULL, 'public/thumb_khirV2BKPl15UsNNynUhZmAdxlBv31vnyryM5Y0y.png'),
(17, '2021-09-18 11:44:11', '2021-09-18 11:44:11', 1, NULL, NULL, NULL, NULL, 'public/PDoI1DJOK0x8rPESYTNe5vJAGuvA8IQkQVdidHhU.png', NULL, 'public/thumb_PDoI1DJOK0x8rPESYTNe5vJAGuvA8IQkQVdidHhU.png'),
(18, '2021-09-18 11:44:11', '2021-09-18 11:44:11', 1, NULL, NULL, NULL, NULL, 'public/9meMaBZ52fbiX7HvFYl7zTMbabUk3n62VYEwOGfN.png', NULL, 'public/thumb_9meMaBZ52fbiX7HvFYl7zTMbabUk3n62VYEwOGfN.png'),
(19, '2021-09-18 11:44:11', '2021-09-18 11:44:11', 1, NULL, NULL, NULL, NULL, 'public/l8fuEDd5xZaMydC2K1LANr1yaE0r2lPRBjzUgeLF.png', NULL, 'public/thumb_l8fuEDd5xZaMydC2K1LANr1yaE0r2lPRBjzUgeLF.png'),
(20, '2021-09-18 11:46:12', '2021-09-18 11:46:12', 1, NULL, NULL, NULL, NULL, 'public/IhFh607BR9MSGvQik7WOhPSg5qto3u2yHuXjjkOv.png', NULL, 'public/thumb_IhFh607BR9MSGvQik7WOhPSg5qto3u2yHuXjjkOv.png'),
(21, '2021-09-18 11:46:12', '2021-09-18 11:46:12', 1, NULL, NULL, NULL, NULL, 'public/WS2WLUPZF6UiwMG3QmAzAXyEqlpqpEv8hnX4lqdh.png', NULL, 'public/thumb_WS2WLUPZF6UiwMG3QmAzAXyEqlpqpEv8hnX4lqdh.png'),
(22, '2021-09-18 11:46:12', '2021-09-18 11:46:12', 1, NULL, NULL, NULL, NULL, 'public/3FwKJlTHNkZeClCfxf13Dx1B73NXcwUGLC5fP3oq.png', NULL, 'public/thumb_3FwKJlTHNkZeClCfxf13Dx1B73NXcwUGLC5fP3oq.png'),
(23, '2021-09-18 11:46:13', '2021-09-18 11:46:13', 1, NULL, NULL, NULL, NULL, 'public/3tO5AHTdlVf2GsdTZ1gQHVIEDTntd0GhntOefhgV.png', NULL, 'public/thumb_3tO5AHTdlVf2GsdTZ1gQHVIEDTntd0GhntOefhgV.png'),
(24, '2021-09-18 11:46:55', '2021-09-18 11:46:55', 1, NULL, NULL, NULL, NULL, 'public/fljgtgldZIOwtUSY48Q71NcUh2uJL0gQNC1RSB5H.png', NULL, 'public/thumb_fljgtgldZIOwtUSY48Q71NcUh2uJL0gQNC1RSB5H.png'),
(25, '2021-09-18 11:46:55', '2021-09-18 11:46:55', 1, NULL, NULL, NULL, NULL, 'public/TSvVTYQKx9P0bFlcrH8FIYGZaw32UUkWpoNX3HVy.png', NULL, 'public/thumb_TSvVTYQKx9P0bFlcrH8FIYGZaw32UUkWpoNX3HVy.png'),
(26, '2021-09-18 11:46:55', '2021-09-18 11:46:55', 1, NULL, NULL, NULL, NULL, 'public/cy4k0swa4UfGEr9Zv3x0SAeAZVelLOG31vn94ASQ.png', NULL, 'public/thumb_cy4k0swa4UfGEr9Zv3x0SAeAZVelLOG31vn94ASQ.png'),
(27, '2021-09-18 11:46:56', '2021-09-18 11:46:56', 1, NULL, NULL, NULL, NULL, 'public/khkWLMtHsGgN0z2JEba7qD7BuYPzmdegNMd1Zxjl.png', NULL, 'public/thumb_khkWLMtHsGgN0z2JEba7qD7BuYPzmdegNMd1Zxjl.png'),
(28, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/l9S2oGnT00rO2ITzF9e7GWZNPPGw9ziVZgx1ngeb.png', NULL, 'public/thumb_l9S2oGnT00rO2ITzF9e7GWZNPPGw9ziVZgx1ngeb.png'),
(29, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/r9NubfRpUUEOqfmmPD3QwoMEBc1AwHQenxs3sJW0.png', NULL, 'public/thumb_r9NubfRpUUEOqfmmPD3QwoMEBc1AwHQenxs3sJW0.png'),
(30, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/kmQL2oTcuUnOZ1tC87d7Fo2pDnZQfMxlCeFTJFUR.png', NULL, 'public/thumb_kmQL2oTcuUnOZ1tC87d7Fo2pDnZQfMxlCeFTJFUR.png'),
(31, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/oZKGft8wix9mHsN7Tmd3OIoCYBMrjZlv6IgLf1yM.png', NULL, 'public/thumb_oZKGft8wix9mHsN7Tmd3OIoCYBMrjZlv6IgLf1yM.png'),
(32, '2021-09-18 12:22:38', '2021-09-18 12:22:38', 1, NULL, NULL, NULL, NULL, 'public/yMFwGKCrRlBsAcHisUAbMJWzE45QS6jiyfeyM6em.png', NULL, 'public/thumb_yMFwGKCrRlBsAcHisUAbMJWzE45QS6jiyfeyM6em.png'),
(33, '2021-09-18 12:22:38', '2021-09-18 12:22:38', 1, NULL, NULL, NULL, NULL, 'public/reYG0O5DUYKXdD2NqiCbyTR0E12A5ezJN9EyGruu.png', NULL, 'public/thumb_reYG0O5DUYKXdD2NqiCbyTR0E12A5ezJN9EyGruu.png'),
(34, '2021-09-18 12:22:39', '2021-09-18 12:22:39', 1, NULL, NULL, NULL, NULL, 'public/RQLgkoaKZ3jXbBvFyHhm2c9r7udXQCu2yxiWMVe0.png', NULL, 'public/thumb_RQLgkoaKZ3jXbBvFyHhm2c9r7udXQCu2yxiWMVe0.png'),
(35, '2021-09-18 12:22:39', '2021-09-18 12:22:39', 1, NULL, NULL, NULL, NULL, 'public/8HMiKmLVh0UQxGTKikIMd3fuFIwxvm2O1lSpa6WS.png', NULL, 'public/thumb_8HMiKmLVh0UQxGTKikIMd3fuFIwxvm2O1lSpa6WS.png'),
(36, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/c817KrTtcQxt52rRgSkapKRxYRsiXutcxO8WQDsJ.png', NULL, 'public/thumb_c817KrTtcQxt52rRgSkapKRxYRsiXutcxO8WQDsJ.png'),
(37, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/8QK2VQFmzhn5UYFVdIFsfttxjGgDUAezG70PqWG1.png', NULL, 'public/thumb_8QK2VQFmzhn5UYFVdIFsfttxjGgDUAezG70PqWG1.png'),
(38, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/EocRmDOgNeXOiMbxUP2AeACoJER2Rm1TBnxNw4u1.png', NULL, 'public/thumb_EocRmDOgNeXOiMbxUP2AeACoJER2Rm1TBnxNw4u1.png'),
(39, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/6W9jaVttNUh3XIvSW6lGLLAwQnDSL1O3ItgJ5DI0.png', NULL, 'public/thumb_6W9jaVttNUh3XIvSW6lGLLAwQnDSL1O3ItgJ5DI0.png'),
(40, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/Ww1HdM9pY2hxH2BVBKirgQlFSRUUyYjm77ZITGRv.png', NULL, 'public/thumb_Ww1HdM9pY2hxH2BVBKirgQlFSRUUyYjm77ZITGRv.png'),
(41, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/buyPGy0x1Y2qejNDEPEOP70txqDZegk3OQEpfn4t.png', NULL, 'public/thumb_buyPGy0x1Y2qejNDEPEOP70txqDZegk3OQEpfn4t.png'),
(42, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/KoHri5TwnWjdRJ0e6P0Yl7wZRKArqyUOXt2BGI1Z.png', NULL, 'public/thumb_KoHri5TwnWjdRJ0e6P0Yl7wZRKArqyUOXt2BGI1Z.png'),
(43, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/04mN7VwyyMKd7jk46RBMUfbzZO4OqiyO0asfG1Oh.png', NULL, 'public/thumb_04mN7VwyyMKd7jk46RBMUfbzZO4OqiyO0asfG1Oh.png'),
(44, '2021-09-20 00:51:04', '2021-09-20 00:51:04', 1, NULL, NULL, NULL, NULL, 'public/3oziXAFWN6lQ0zOkN9y7AoDAMKu0Ki4y9mQ7soNb.png', NULL, 'public/thumb_3oziXAFWN6lQ0zOkN9y7AoDAMKu0Ki4y9mQ7soNb.png'),
(45, '2021-09-20 00:54:21', '2021-09-20 00:54:21', 1, NULL, NULL, NULL, NULL, 'public/3pBDpQK4MJsE8haVxQJOXyemTXl2SjSo67F7nJpt.png', NULL, 'public/thumb_3pBDpQK4MJsE8haVxQJOXyemTXl2SjSo67F7nJpt.png'),
(46, '2021-09-20 00:56:16', '2021-09-20 00:56:16', 1, NULL, NULL, NULL, NULL, 'public/GGbxgOxcjhF5HpxVEmSZhzDKwP0yN0KKddRbAlzt.png', NULL, 'public/thumb_GGbxgOxcjhF5HpxVEmSZhzDKwP0yN0KKddRbAlzt.png'),
(47, '2021-09-20 00:56:59', '2021-09-20 00:56:59', 1, NULL, NULL, NULL, NULL, 'public/4iHSG16IOqxN1nP1JPfh7zXRBplN4DRyKpQGaGQZ.png', NULL, 'public/thumb_4iHSG16IOqxN1nP1JPfh7zXRBplN4DRyKpQGaGQZ.png'),
(48, '2021-09-20 00:57:17', '2021-09-20 00:57:17', 1, NULL, NULL, NULL, NULL, 'public/C3CitkxRADTxd5nrKQhrfsgeMhBOyStEKW4kx9tn.png', NULL, 'public/thumb_C3CitkxRADTxd5nrKQhrfsgeMhBOyStEKW4kx9tn.png'),
(49, '2021-09-20 00:58:30', '2021-09-20 00:58:30', 1, NULL, NULL, NULL, NULL, 'public/oYVPXeRKGCmZWCwwfDQhXzpswABstgvSGNa7JTkG.png', NULL, 'public/thumb_oYVPXeRKGCmZWCwwfDQhXzpswABstgvSGNa7JTkG.png'),
(50, '2021-09-21 16:53:31', '2021-09-21 16:53:31', 1, NULL, NULL, NULL, NULL, 'public/XXUoVwPjpifkAqD9o2H4kfI9fi3cfbhTH9Gtnnp6.png', NULL, 'public/thumb_XXUoVwPjpifkAqD9o2H4kfI9fi3cfbhTH9Gtnnp6.png'),
(51, '2021-09-21 16:53:31', '2021-09-21 16:53:31', 1, NULL, NULL, NULL, NULL, 'public/ju3prU7l73aYBPQf1NHZXFSZ3MazNgrEs67byPap.png', NULL, 'public/thumb_ju3prU7l73aYBPQf1NHZXFSZ3MazNgrEs67byPap.png'),
(52, '2021-09-25 05:28:47', '2021-09-25 05:28:47', 1, NULL, NULL, NULL, NULL, 'public/X3ReN7ebnBNTepANKsuggBBXBepb9f0DTfQRZ4ay.jpg', NULL, 'public/thumb_X3ReN7ebnBNTepANKsuggBBXBepb9f0DTfQRZ4ay.jpg'),
(53, '2021-09-25 05:28:47', '2021-09-25 05:28:47', 1, NULL, NULL, NULL, NULL, 'public/YnJMC3fHyFa8fJLsQSPlr6vglN2dxJY21L0QdWTP.png', NULL, 'public/thumb_YnJMC3fHyFa8fJLsQSPlr6vglN2dxJY21L0QdWTP.png'),
(54, '2021-09-25 05:31:12', '2021-09-25 05:31:12', 1, NULL, NULL, NULL, NULL, 'public/rXJjZzCSyeDRDuLmlvTP5t8sofywsCPXqsfu7Sh3.jpg', NULL, 'public/thumb_rXJjZzCSyeDRDuLmlvTP5t8sofywsCPXqsfu7Sh3.jpg'),
(55, '2021-09-25 05:31:12', '2021-09-25 05:31:12', 1, NULL, NULL, NULL, NULL, 'public/dIgyd4LMsFP1viJJ50fEqelfN1CoAUj7RIsLzbWV.png', NULL, 'public/thumb_dIgyd4LMsFP1viJJ50fEqelfN1CoAUj7RIsLzbWV.png'),
(56, '2021-09-25 05:32:07', '2021-09-25 05:32:07', 1, NULL, NULL, NULL, NULL, 'public/9w4QGG18IHqQVQYoouZhbEnTqxGyLFKYWI4o8NOT.jpg', NULL, 'public/thumb_9w4QGG18IHqQVQYoouZhbEnTqxGyLFKYWI4o8NOT.jpg'),
(57, '2021-09-25 05:32:07', '2021-09-25 05:32:07', 1, NULL, NULL, NULL, NULL, 'public/mESlrH7suOqCQiyMZ1qLQKsyPq23mK09O2S92Ecf.png', NULL, 'public/thumb_mESlrH7suOqCQiyMZ1qLQKsyPq23mK09O2S92Ecf.png'),
(58, '2021-09-25 05:32:38', '2021-09-25 05:32:38', 1, NULL, NULL, NULL, NULL, 'public/s3bshfVHW2q06eGP6DF0UjOKp8m0gNOjoDeoTb8f.jpg', NULL, 'public/thumb_s3bshfVHW2q06eGP6DF0UjOKp8m0gNOjoDeoTb8f.jpg'),
(59, '2021-09-25 05:32:38', '2021-09-25 05:32:38', 1, NULL, NULL, NULL, NULL, 'public/peyvC3eGvqKaFRh5fiwy0nFzkkes4Dcd8BNlVAIg.png', NULL, 'public/thumb_peyvC3eGvqKaFRh5fiwy0nFzkkes4Dcd8BNlVAIg.png'),
(60, '2021-09-25 05:42:00', '2021-09-25 05:42:00', 1, NULL, NULL, NULL, NULL, 'public/xvmmMep1TbkOkQrlSZcqa5k7hMhnHNPIVObvW1t7.jpg', NULL, 'public/thumb_xvmmMep1TbkOkQrlSZcqa5k7hMhnHNPIVObvW1t7.jpg'),
(61, '2021-09-25 05:42:00', '2021-09-25 05:42:00', 1, NULL, NULL, NULL, NULL, 'public/FTkNLMT54AfMZgnh5DsFom884MS0EZDXuth4mqep.png', NULL, 'public/thumb_FTkNLMT54AfMZgnh5DsFom884MS0EZDXuth4mqep.png'),
(62, '2021-09-25 05:42:46', '2021-09-25 05:42:46', 1, NULL, NULL, NULL, NULL, 'public/Qz0GVpbL1xTaHyh7O7WEsd3zF1cmbOQ0xWRO1EOL.jpg', NULL, 'public/thumb_Qz0GVpbL1xTaHyh7O7WEsd3zF1cmbOQ0xWRO1EOL.jpg'),
(63, '2021-09-25 05:42:46', '2021-09-25 05:42:46', 1, NULL, NULL, NULL, NULL, 'public/ZKhdiCNJSSNKeE2oxeG8eZRZreuvep9WQNJYjLhT.png', NULL, 'public/thumb_ZKhdiCNJSSNKeE2oxeG8eZRZreuvep9WQNJYjLhT.png'),
(64, '2021-09-25 05:46:15', '2021-09-25 05:46:15', 1, NULL, NULL, NULL, NULL, 'public/hJCAUMc9PY0UtkISE6yKbsngRg07s4H8oDwi5nZx.jpg', NULL, 'public/thumb_hJCAUMc9PY0UtkISE6yKbsngRg07s4H8oDwi5nZx.jpg'),
(65, '2021-09-25 05:49:07', '2021-09-25 05:49:07', 1, NULL, NULL, NULL, NULL, 'public/zDzmG8wVcxDhMhV9KFuRvvNvTvD6zQswPqdaPIQI.jpg', NULL, 'public/thumb_zDzmG8wVcxDhMhV9KFuRvvNvTvD6zQswPqdaPIQI.jpg'),
(66, '2021-09-25 05:49:25', '2021-09-25 05:49:25', 1, NULL, NULL, NULL, NULL, 'public/ywppVSZgDi5ByJS8ksk3twaagSplzOZj9Nwhk6zj.jpg', NULL, 'public/thumb_ywppVSZgDi5ByJS8ksk3twaagSplzOZj9Nwhk6zj.jpg'),
(67, '2021-09-25 05:49:53', '2021-09-25 05:49:53', 1, NULL, NULL, NULL, NULL, 'public/hAXkhd3r0IZf4zIaiiQv0o067wfXncLTSbFNSxWe.jpg', NULL, 'public/thumb_hAXkhd3r0IZf4zIaiiQv0o067wfXncLTSbFNSxWe.jpg'),
(68, '2021-09-25 05:51:09', '2021-09-25 05:51:09', 1, NULL, NULL, NULL, NULL, 'public/6BBxxNO8SIBoljFBPlKVxAKW320za3nKgu7eb9PZ.jpg', NULL, 'public/thumb_6BBxxNO8SIBoljFBPlKVxAKW320za3nKgu7eb9PZ.jpg'),
(69, '2021-09-25 05:52:27', '2021-09-25 05:52:27', 1, NULL, NULL, NULL, NULL, 'public/owo6TT9idZ0rGLgIdO0YezpF1QL3Oxm7Bal7hFui.jpg', NULL, 'public/thumb_owo6TT9idZ0rGLgIdO0YezpF1QL3Oxm7Bal7hFui.jpg'),
(70, '2021-09-27 07:07:52', '2021-09-27 07:07:52', 1, NULL, NULL, NULL, NULL, 'public/ld36auATg0mejq1hSIZFiohvWyjSjU7I1b3aftAU.jpg', NULL, 'public/thumb_ld36auATg0mejq1hSIZFiohvWyjSjU7I1b3aftAU.jpg'),
(71, '2021-09-27 07:08:05', '2021-09-27 07:08:05', 1, NULL, NULL, NULL, NULL, 'public/B2kzOh4fT5xbOR9X7pY1m7L6TAOkWYWogVu1SsWR.jpg', NULL, 'public/thumb_B2kzOh4fT5xbOR9X7pY1m7L6TAOkWYWogVu1SsWR.jpg'),
(72, '2021-09-27 07:08:28', '2021-09-27 07:08:28', 1, NULL, NULL, NULL, NULL, 'public/j50VqfP0ORNODNpSKCp1gE4B3h7hDGbSS6DMJOgT.jpg', NULL, 'public/thumb_j50VqfP0ORNODNpSKCp1gE4B3h7hDGbSS6DMJOgT.jpg'),
(73, '2021-09-27 07:08:37', '2021-09-27 07:08:37', 1, NULL, NULL, NULL, NULL, 'public/muOh8DsTN7N9PNeWpBtF0aKGYaVnuNGnBDOrDuWY.jpg', NULL, 'public/thumb_muOh8DsTN7N9PNeWpBtF0aKGYaVnuNGnBDOrDuWY.jpg'),
(74, '2021-09-27 07:09:13', '2021-09-27 07:09:13', 1, NULL, NULL, NULL, NULL, 'public/tL5Ut6HKnI6JvhYDng0BsQzmi7OBoFCxsBS76Xsw.jpg', NULL, 'public/thumb_tL5Ut6HKnI6JvhYDng0BsQzmi7OBoFCxsBS76Xsw.jpg'),
(75, '2021-09-27 07:10:33', '2021-09-27 07:10:33', 1, NULL, NULL, NULL, NULL, 'public/U4GislZKRNPTrc7HusJO25gmYkYHldYkQnmqf9un.jpg', NULL, 'public/thumb_U4GislZKRNPTrc7HusJO25gmYkYHldYkQnmqf9un.jpg'),
(76, '2021-09-27 07:11:08', '2021-09-27 07:11:08', 1, NULL, NULL, NULL, NULL, 'public/GDS9KfrsQLlersfsr7H5zdf5SubRjDPsLxk7kTEQ.jpg', NULL, 'public/thumb_GDS9KfrsQLlersfsr7H5zdf5SubRjDPsLxk7kTEQ.jpg'),
(77, '2021-09-27 07:11:18', '2021-09-27 07:11:18', 1, NULL, NULL, NULL, NULL, 'public/1QhOMCBa9dori86Kwv0Qkhqe0hV1Y71aiZMJrqn0.jpg', NULL, 'public/thumb_1QhOMCBa9dori86Kwv0Qkhqe0hV1Y71aiZMJrqn0.jpg'),
(78, '2021-09-27 07:13:38', '2021-09-27 07:13:38', 1, NULL, NULL, NULL, NULL, 'public/CUwezVyzB8AJnc7xGaoYXIvbgARGTC0XWNcXBG4p.jpg', NULL, 'public/thumb_CUwezVyzB8AJnc7xGaoYXIvbgARGTC0XWNcXBG4p.jpg'),
(79, '2021-09-27 07:14:23', '2021-09-27 07:14:23', 1, NULL, NULL, NULL, NULL, 'public/I1jpc3r9NoAWfn8OGZsebZNzbucL9Aufqv3V8S2J.jpg', NULL, 'public/thumb_I1jpc3r9NoAWfn8OGZsebZNzbucL9Aufqv3V8S2J.jpg'),
(80, '2021-09-27 07:14:43', '2021-09-27 07:14:43', 1, NULL, NULL, NULL, NULL, 'public/buPeQAY7DI1ycJ6pYfPukfXtQTyGEomGYqEbRHg0.jpg', NULL, 'public/thumb_buPeQAY7DI1ycJ6pYfPukfXtQTyGEomGYqEbRHg0.jpg'),
(81, '2021-09-27 07:17:29', '2021-09-27 07:17:29', 1, NULL, NULL, NULL, NULL, 'public/0pakZtRnkziyRSTEplfERBUmu3pe23LmTrbLjxoK.jpg', NULL, 'public/thumb_0pakZtRnkziyRSTEplfERBUmu3pe23LmTrbLjxoK.jpg'),
(82, '2021-09-27 07:18:00', '2021-09-27 07:18:00', 1, NULL, NULL, NULL, NULL, 'public/wEqwYW6ogcy1BebTC2PUcejXerRT6P9N3yWKDk7L.jpg', NULL, 'public/thumb_wEqwYW6ogcy1BebTC2PUcejXerRT6P9N3yWKDk7L.jpg'),
(83, '2021-09-27 07:18:34', '2021-09-27 07:18:34', 1, NULL, NULL, NULL, NULL, 'public/zvp7e77Sm2TU5MXAP8lZNvbz8wYmzPeQ4fm5KKQM.jpg', NULL, 'public/thumb_zvp7e77Sm2TU5MXAP8lZNvbz8wYmzPeQ4fm5KKQM.jpg'),
(84, '2021-09-27 07:19:19', '2021-09-27 07:19:19', 1, NULL, NULL, NULL, NULL, 'public/LTznCqoVY5fauWJHgISBRJJjY3XMs4N54zfoUl1S.jpg', NULL, 'public/thumb_LTznCqoVY5fauWJHgISBRJJjY3XMs4N54zfoUl1S.jpg'),
(85, '2021-09-27 07:20:07', '2021-09-27 07:20:07', 1, NULL, NULL, NULL, NULL, 'public/Db3PZfIuOeOMjFc41AixbTe7lPEP6fIs1HAPeL5C.jpg', NULL, 'public/thumb_Db3PZfIuOeOMjFc41AixbTe7lPEP6fIs1HAPeL5C.jpg'),
(86, '2021-09-27 07:20:51', '2021-09-27 07:20:51', 1, NULL, NULL, NULL, NULL, 'public/LY1c5URxBk7wN678NIptajs4wUtAcZLgKTld1qVB.jpg', NULL, 'public/thumb_LY1c5URxBk7wN678NIptajs4wUtAcZLgKTld1qVB.jpg'),
(87, '2021-09-27 07:21:25', '2021-09-27 07:21:25', 1, NULL, NULL, NULL, NULL, 'public/4SlQgLVqpxKvtjSzwthQOAKcm4vkf1RuLiWDzBRw.jpg', NULL, 'public/thumb_4SlQgLVqpxKvtjSzwthQOAKcm4vkf1RuLiWDzBRw.jpg'),
(88, '2021-09-27 07:21:48', '2021-09-27 07:21:48', 1, NULL, NULL, NULL, NULL, 'public/tGb9q9zSrFlD6z8rxVh4NkVakbjmWFxOnMs45fDn.jpg', NULL, 'public/thumb_tGb9q9zSrFlD6z8rxVh4NkVakbjmWFxOnMs45fDn.jpg'),
(89, '2021-09-27 07:22:12', '2021-09-27 07:22:12', 1, NULL, NULL, NULL, NULL, 'public/nKMfw6Da9dEeAoMhHyt3bx3lcnjsmid9do9Ccv5r.jpg', NULL, 'public/thumb_nKMfw6Da9dEeAoMhHyt3bx3lcnjsmid9do9Ccv5r.jpg'),
(90, '2021-09-27 07:22:44', '2021-09-27 07:22:44', 1, NULL, NULL, NULL, NULL, 'public/IUDqZ0HVcaOql01E25UdpsIj83h6PKfyBXHZk2iz.jpg', NULL, 'public/thumb_IUDqZ0HVcaOql01E25UdpsIj83h6PKfyBXHZk2iz.jpg'),
(91, '2021-09-27 07:23:21', '2021-09-27 07:23:21', 1, NULL, NULL, NULL, NULL, 'public/RPFOd2PhhHbVdcS7ikb4VEQSwCXp1ebG0xhMKyt7.jpg', NULL, 'public/thumb_RPFOd2PhhHbVdcS7ikb4VEQSwCXp1ebG0xhMKyt7.jpg'),
(92, '2021-09-27 07:23:32', '2021-09-27 07:23:32', 1, NULL, NULL, NULL, NULL, 'public/uOPIsJLobuePhFhbH4BJ7GoyQM5EnbT290gH3CkH.jpg', NULL, 'public/thumb_uOPIsJLobuePhFhbH4BJ7GoyQM5EnbT290gH3CkH.jpg'),
(93, '2021-09-27 16:42:33', '2021-09-27 16:42:33', 1, NULL, NULL, NULL, NULL, 'public/E28l7a3vzAjA7uam1BJtrUTbN5e3VyPMzT5Zydkq.jpg', NULL, 'public/thumb_E28l7a3vzAjA7uam1BJtrUTbN5e3VyPMzT5Zydkq.jpg'),
(94, '2021-09-27 16:47:22', '2021-09-27 16:47:22', 1, NULL, NULL, NULL, NULL, 'public/tjhCWvAuF1pQhwhkmqxJcMr7O8L9hLszz26UM7ze.jpg', NULL, 'public/thumb_tjhCWvAuF1pQhwhkmqxJcMr7O8L9hLszz26UM7ze.jpg'),
(95, '2021-09-27 16:48:06', '2021-09-27 16:48:06', 1, NULL, NULL, NULL, NULL, 'public/yuVTxuBKFaHmFZN88sHILmYArxFRExrRkebmkl9d.jpg', NULL, 'public/thumb_yuVTxuBKFaHmFZN88sHILmYArxFRExrRkebmkl9d.jpg'),
(96, '2021-09-27 16:48:19', '2021-09-27 16:48:19', 1, NULL, NULL, NULL, NULL, 'public/uqwD0wj71fBG2oNsbiKh41UnIfh0yrw4jzJXOcRW.jpg', NULL, 'public/thumb_uqwD0wj71fBG2oNsbiKh41UnIfh0yrw4jzJXOcRW.jpg'),
(97, '2021-09-27 16:50:46', '2021-09-27 16:50:46', 1, NULL, NULL, NULL, NULL, 'public/hqssxhKHSnmOPqIv8RrKTK8j80TER0kQq8dW6GI7.jpg', NULL, 'public/thumb_hqssxhKHSnmOPqIv8RrKTK8j80TER0kQq8dW6GI7.jpg'),
(98, '2021-09-27 16:51:31', '2021-09-27 16:51:31', 1, NULL, NULL, NULL, NULL, 'public/lYceYCTOMZpn3m7qbIFT6INmpkGQBZs78eJaQqzB.jpg', NULL, 'public/thumb_lYceYCTOMZpn3m7qbIFT6INmpkGQBZs78eJaQqzB.jpg'),
(99, '2021-09-27 17:00:03', '2021-09-27 17:00:03', 1, NULL, NULL, NULL, NULL, 'public/CxSUW0gpm2pWJZj1lbucNkgCpJcJHKj7YTsgCecr.jpg', NULL, 'public/thumb_CxSUW0gpm2pWJZj1lbucNkgCpJcJHKj7YTsgCecr.jpg'),
(100, '2021-09-27 17:03:29', '2021-09-27 17:03:29', 1, NULL, NULL, NULL, NULL, 'public/WuLWDW0WwOMKNtqMcYjM8PxKYmclcxCSv0CFYrlV.jpg', NULL, 'public/thumb_WuLWDW0WwOMKNtqMcYjM8PxKYmclcxCSv0CFYrlV.jpg'),
(101, '2021-09-27 17:04:35', '2021-09-27 17:04:35', 1, NULL, NULL, NULL, NULL, 'public/gX3G4B3JAHbARghknoI8BgnpoYBzcIQNNjc2Zjft.jpg', NULL, 'public/thumb_gX3G4B3JAHbARghknoI8BgnpoYBzcIQNNjc2Zjft.jpg'),
(102, '2021-09-27 17:04:36', '2021-09-27 17:04:36', 1, NULL, NULL, NULL, NULL, 'public/AtFwLkeNkk8rtmL0H8270MKTgX7iF1RjGVA6jG3E.jpg', NULL, 'public/thumb_AtFwLkeNkk8rtmL0H8270MKTgX7iF1RjGVA6jG3E.jpg'),
(103, '2021-10-02 19:10:31', '2021-10-02 19:10:31', 1, NULL, NULL, NULL, NULL, 'public/KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg', NULL, 'public/thumb_KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg'),
(104, '2021-10-02 19:16:53', '2021-10-02 19:16:53', 1, NULL, NULL, NULL, NULL, 'public/ycCtSvqYlLmEs2TY4foTKLxG7vfa2KJ6MTUKwijM.jpg', NULL, 'public/thumb_ycCtSvqYlLmEs2TY4foTKLxG7vfa2KJ6MTUKwijM.jpg'),
(105, '2021-10-02 19:16:53', '2021-10-02 19:16:53', 1, NULL, NULL, NULL, NULL, 'public/xdCG2VbeeMiBDCfSAjfjdD6EXgd7Fi7insYIHZVF.jpg', NULL, 'public/thumb_xdCG2VbeeMiBDCfSAjfjdD6EXgd7Fi7insYIHZVF.jpg'),
(106, '2021-10-02 19:18:45', '2021-10-02 19:18:45', 1, NULL, NULL, NULL, NULL, 'public/WNFHiCoemfngoPaV7LAgoc6jMjcDlBK7p9fUveA0.jpg', NULL, 'public/thumb_WNFHiCoemfngoPaV7LAgoc6jMjcDlBK7p9fUveA0.jpg'),
(107, '2021-10-02 19:18:45', '2021-10-02 19:18:45', 1, NULL, NULL, NULL, NULL, 'public/IIEZcl7lGNtzEMjc30tS7yKHj584wSiFd9QUfDps.jpg', NULL, 'public/thumb_IIEZcl7lGNtzEMjc30tS7yKHj584wSiFd9QUfDps.jpg'),
(108, '2021-10-03 01:39:16', '2021-10-03 01:39:16', 1, NULL, NULL, NULL, NULL, 'public/Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg', NULL, 'public/thumb_Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg'),
(109, '2021-10-03 04:13:20', '2021-10-03 04:13:20', 1, NULL, NULL, NULL, NULL, 'public/UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg', NULL, 'public/thumb_UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg'),
(110, '2021-10-03 04:17:10', '2021-10-03 04:17:10', 1, NULL, NULL, NULL, NULL, 'public/orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg', NULL, 'public/thumb_orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg'),
(111, '2021-10-03 04:34:39', '2021-10-03 04:34:39', 1, NULL, NULL, NULL, NULL, 'public/1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg', NULL, 'public/thumb_1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg'),
(112, '2021-10-03 04:36:21', '2021-10-03 04:36:21', 1, NULL, NULL, NULL, NULL, 'public/FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg', NULL, 'public/thumb_FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg'),
(113, '2021-10-03 04:44:55', '2021-10-03 04:44:55', 1, NULL, NULL, NULL, NULL, 'public/lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg', NULL, 'public/thumb_lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg'),
(114, '2021-10-03 04:49:01', '2021-10-03 04:49:01', 1, NULL, NULL, NULL, NULL, 'public/rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg', NULL, 'public/thumb_rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg'),
(115, '2021-10-05 06:28:48', '2021-10-05 06:28:48', 3, NULL, NULL, NULL, NULL, 'public/UZ1ViUC6zJjHQ7dMcCSnzHv0W7YGjK6W4RcxhN9y.jpg', NULL, 'public/thumb_UZ1ViUC6zJjHQ7dMcCSnzHv0W7YGjK6W4RcxhN9y.jpg'),
(116, '2021-10-05 06:28:49', '2021-10-05 06:28:49', 3, NULL, NULL, NULL, NULL, 'public/xew3iJYzRk8JUQET6A35MYlFfdZsPxN751MUADFr.png', NULL, 'public/thumb_xew3iJYzRk8JUQET6A35MYlFfdZsPxN751MUADFr.png'),
(117, '2021-10-05 06:34:29', '2021-10-05 06:34:29', 3, NULL, NULL, NULL, NULL, 'public/WXjhSyifSfK1GkViPFdvONr2pKGbkeXSilH4SDWq.jpg', NULL, 'public/thumb_WXjhSyifSfK1GkViPFdvONr2pKGbkeXSilH4SDWq.jpg'),
(118, '2021-10-05 06:34:29', '2021-10-05 06:34:29', 3, NULL, NULL, NULL, NULL, 'public/t5QVdLAcyiZknx1qzCT09RKyGu5tiEiCpHpejzEi.png', NULL, 'public/thumb_t5QVdLAcyiZknx1qzCT09RKyGu5tiEiCpHpejzEi.png'),
(119, '2021-10-05 06:35:53', '2021-10-05 06:35:53', 3, NULL, NULL, NULL, NULL, 'public/DvOwJS2CWnrvyQgYjgZ8xqKgYZhlpK6THiPfpxdI.jpg', NULL, 'public/thumb_DvOwJS2CWnrvyQgYjgZ8xqKgYZhlpK6THiPfpxdI.jpg'),
(120, '2021-10-05 06:35:53', '2021-10-05 06:35:53', 3, NULL, NULL, NULL, NULL, 'public/XMuIvMbt4klKzPE8KcAi72T7UxfXkTkUW58GZsGZ.png', NULL, 'public/thumb_XMuIvMbt4klKzPE8KcAi72T7UxfXkTkUW58GZsGZ.png'),
(121, '2021-10-05 06:39:30', '2021-10-05 06:39:30', 3, NULL, NULL, NULL, NULL, 'public/fuMlVlP2Xy26k0PB3LBYGPoJmQGbyDniZU7rmd2B.jpg', NULL, 'public/thumb_fuMlVlP2Xy26k0PB3LBYGPoJmQGbyDniZU7rmd2B.jpg'),
(122, '2021-10-05 06:39:31', '2021-10-05 06:39:31', 3, NULL, NULL, NULL, NULL, 'public/i4SyIbVYgOykndqfrPRGFKLGwlg7CGqst4Gp2jDm.png', NULL, 'public/thumb_i4SyIbVYgOykndqfrPRGFKLGwlg7CGqst4Gp2jDm.png'),
(123, '2021-10-05 06:41:01', '2021-10-05 06:41:01', 3, NULL, NULL, NULL, NULL, 'public/bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg', NULL, 'public/thumb_bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg'),
(124, '2021-10-05 06:41:02', '2021-10-05 06:41:02', 3, NULL, NULL, NULL, NULL, 'public/WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png', NULL, 'public/thumb_WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png'),
(125, '2021-10-05 09:25:17', '2021-10-05 09:25:17', 3, NULL, NULL, NULL, NULL, 'public/7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg', NULL, 'public/thumb_7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg'),
(126, '2021-10-08 09:58:06', '2021-10-08 09:58:06', 1, NULL, NULL, NULL, NULL, 'public/u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png', NULL, 'public/thumb_u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png'),
(127, '2021-10-08 09:58:07', '2021-10-08 09:58:07', 1, NULL, NULL, NULL, NULL, 'public/c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png', NULL, 'public/thumb_c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png');

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
(10, '2021_09_18_100139_create_images_table', 2),
(11, '2021_09_15_220048_create_profiles_table', 3),
(13, '2021_09_23_092138_create_cities_table', 5),
(15, '2021_09_23_091308_create_countries_table', 6),
(18, '2021_09_05_211930_create_products_table', 7);

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
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `name`, `category_id`, `user_id`, `country_id`, `city_id`, `price`, `slug`, `status`, `description`, `quantity`, `images`, `thumbnail`, `attributes`, `sub_category_id`) VALUES
(9, '2021-10-02 19:10:31', '2021-10-02 19:10:31', 'I will your land in mbarara', 1, 1, 1, 1, '800', 'your-land-in-mbarara', '0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', NULL, '[{\"src\":\"public\\/KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg\",\"thumbnail\":\"public\\/thumb_KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg\",\"user_id\":1}]', '{\"src\":\"public\\/KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg\",\"thumbnail\":\"public\\/thumb_KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg\",\"user_id\":1}', '[]', NULL),
(10, '2021-10-03 01:39:16', '2021-10-03 01:39:16', 'I will lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', 1, 1, 1, 1, '800', 'lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit-debitis-odio-perferendis-placeat-at-aperiam', '0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', NULL, '[{\"src\":\"public\\/Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg\",\"thumbnail\":\"public\\/thumb_Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg\",\"user_id\":1}]', '{\"src\":\"public\\/Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg\",\"thumbnail\":\"public\\/thumb_Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg\",\"user_id\":1}', '[]', NULL),
(11, '2021-10-03 04:13:20', '2021-10-03 04:13:20', 'I will lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', 1, 1, 2, 5, '800', 'lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit-debitis-odio-perferendis-placeat-at-aperiam', '0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', NULL, '[{\"src\":\"public\\/UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg\",\"thumbnail\":\"public\\/thumb_UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg\",\"user_id\":1}]', '{\"src\":\"public\\/UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg\",\"thumbnail\":\"public\\/thumb_UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg\",\"user_id\":1}', '[]', NULL),
(12, '2021-10-03 04:17:10', '2021-10-03 04:17:10', 'I will  sell your car in china', 2, 1, 3, 7, '1300', 'i-will-sell-your-car-in-china', '0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', NULL, '[{\"src\":\"public\\/orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg\",\"thumbnail\":\"public\\/thumb_orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg\",\"user_id\":1}]', '{\"src\":\"public\\/orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg\",\"thumbnail\":\"public\\/thumb_orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg\",\"user_id\":1}', '[]', NULL),
(13, '2021-10-03 04:34:39', '2021-10-03 04:34:39', 'I will  sell your car in turkey', 3, 1, 2, 2, '32000', 'i-will-sell-your-car-in-turkey', '0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', NULL, '[{\"src\":\"public\\/1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg\",\"thumbnail\":\"public\\/thumb_1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg\",\"user_id\":1}]', '{\"src\":\"public\\/1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg\",\"thumbnail\":\"public\\/thumb_1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg\",\"user_id\":1}', '[]', NULL),
(14, '2021-10-03 04:36:21', '2021-10-03 04:36:21', 'I will sell your car in kampala', 2, 1, 1, 2, '1200', 'sell-your-car-in-kampala', '0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', NULL, '[{\"src\":\"public\\/FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg\",\"thumbnail\":\"public\\/thumb_FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg\",\"user_id\":1}]', '{\"src\":\"public\\/FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg\",\"thumbnail\":\"public\\/thumb_FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg\",\"user_id\":1}', '[]', NULL),
(15, '2021-10-03 04:44:55', '2021-10-03 04:44:55', 'I will  sell your usd at best price', 3, 1, 2, 2, '800', 'i-will-sell-your-usd-at-best-price', '0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', NULL, '[{\"src\":\"public\\/lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg\",\"thumbnail\":\"public\\/thumb_lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg\",\"user_id\":1}]', '{\"src\":\"public\\/lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg\",\"thumbnail\":\"public\\/thumb_lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg\",\"user_id\":1}', '[]', NULL),
(16, '2021-10-03 04:49:01', '2021-10-03 04:49:01', 'I will  market your phones to international market', 2, 1, 2, 5, '3200', 'i-will-market-your-phones-to-international-market', '0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', NULL, '[{\"src\":\"public\\/rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg\",\"thumbnail\":\"public\\/thumb_rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg\",\"user_id\":1}]', '{\"src\":\"public\\/rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg\",\"thumbnail\":\"public\\/thumb_rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg\",\"user_id\":1}', '[]', NULL),
(17, '2021-10-05 09:25:17', '2021-10-05 09:25:17', 'I will  sell your house in china', 1, 3, 1, 3, '1300', 'i-will-sell-your-house-in-china', '0', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.', NULL, '[{\"src\":\"public\\/7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg\",\"thumbnail\":\"public\\/thumb_7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg\",\"user_id\":3}]', '{\"src\":\"public\\/7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg\",\"thumbnail\":\"public\\/thumb_7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg\",\"user_id\":3}', '[]', NULL);

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
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `created_at`, `updated_at`, `user_id`, `first_name`, `last_name`, `company_name`, `email`, `phone_number`, `location`, `about`, `services`, `longitude`, `latitude`, `division`, `opening_hours`, `profile_photo`, `cover_photo`, `facebook`, `twitter`, `whatsapp`, `youtube`, `instagram`, `last_seen`, `status`) VALUES
(1, '2021-09-20 00:45:45', '2021-10-08 09:59:32', 1, 'Muhindo', 'Mubaraka', 'IUT', 'mubahood360@gmail.com', '+256706638494', 'Kibuli, Kampala, Uganda', '2694351585', 'Rentals, Car hiring, Apartments', '2694351585', NULL, NULL, NULL, '{\"src\":\"public\\/u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png\",\"thumbnail\":\"public\\/thumb_u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png\",\"user_id\":1}', '{\"src\":\"public\\/c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png\",\"thumbnail\":\"public\\/thumb_c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png\",\"user_id\":1}', NULL, NULL, NULL, NULL, NULL, '1633697886', 'active'),
(2, '2021-09-21 07:35:22', '2021-09-21 07:35:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(3, '2021-09-21 07:42:25', '2021-09-21 07:42:25', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(4, '2021-09-21 13:57:24', '2021-09-21 13:57:24', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(5, '2021-09-21 13:59:46', '2021-09-21 13:59:46', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(6, '2021-10-05 02:43:27', '2021-10-05 08:55:34', 3, 'Muhindo', 'Mubaraka', 'IUT', 'mubahood360@gmail.com', '+256706638494', 'Kibuli, Kampala, Uganda', 'Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam', NULL, NULL, NULL, NULL, NULL, '{\"src\":\"public\\/bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg\",\"thumbnail\":\"public\\/thumb_bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg\",\"user_id\":3}', '{\"src\":\"public\\/WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png\",\"thumbnail\":\"public\\/thumb_WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png\",\"user_id\":3}', NULL, NULL, NULL, NULL, NULL, '1633426861', 'active');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '', '2694351585', NULL, '$2y$10$9QWoWWeqniAe.Ewo3/3zYuJoNuzlIc.krDef/5BLkhhnJIWMuWLwS', NULL, '2021-09-21 13:59:46', '2021-09-21 13:59:46'),
(3, '', '+256706638494', NULL, '$2y$10$N8eUsqFWDHzxxJWnYO0HWuejsqAUZhhiatdh5FRIam0fjFEGh3nZm', NULL, '2021-10-05 02:43:26', '2021-10-05 02:43:26');

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=495;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
