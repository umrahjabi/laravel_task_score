-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 21, 2021 at 05:01 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
CREATE TABLE IF NOT EXISTS `matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team1` int(11) NOT NULL,
  `team2` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `team1`, `team2`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2021-01-21 10:07:35', '2021-01-21 21:56:02'),
(3, 3, 4, 0, '2021-01-21 10:37:11', '2021-01-21 16:07:11'),
(5, 1, 2, 0, '2021-01-21 11:13:55', '2021-01-21 16:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_12_25_004127_slot_booking_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(500) NOT NULL,
  `last_name` varchar(500) NOT NULL,
  `image` varchar(500) NOT NULL,
  `jersey_number` varchar(500) NOT NULL,
  `country` varchar(500) NOT NULL,
  `history` varchar(500) NOT NULL,
  `team_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `first_name`, `last_name`, `image`, `jersey_number`, `country`, `history`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 'kamal', 'verma', 'logo', '3', 'india', '0', 1, '2021-01-21 13:11:40', '2021-01-21 18:41:40'),
(2, 'Rohit', 'verma', 'logo', '3', 'india', '0', 1, '2021-01-21 14:27:17', '2021-01-21 19:57:17'),
(3, 'Ravi', 'verma', 'logo', '3', 'india', '0', 2, '2021-01-21 14:27:26', '2021-01-21 19:57:26'),
(4, 'Sumit', 'verma', 'logo', '3', 'india', '0', 2, '2021-01-21 14:27:31', '2021-01-21 19:57:31'),
(5, 'Vishal', 'verma', 'logo', '3', 'india', '0', 3, '2021-01-21 14:27:37', '2021-01-21 19:57:37'),
(6, 'Govind', 'verma', 'logo', '3', 'india', '0', 3, '2021-01-21 14:27:45', '2021-01-21 19:57:45'),
(7, 'Deepak', 'verma', 'logo', '3', 'india', '0', 4, '2021-01-21 14:27:50', '2021-01-21 19:57:50'),
(8, 'Shekhar', 'verma', 'logo', '3', 'india', '0', 4, '2021-01-21 14:28:26', '2021-01-21 19:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `logo` varchar(500) NOT NULL,
  `club_state` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `logo`, `club_state`, `created_at`, `updated_at`) VALUES
(1, 'India', 'logo', 'delhi', '2021-01-21 13:09:33', '2021-01-21 18:39:33'),
(2, 'South Africa', 'logo', 'South', '2021-01-21 13:10:19', '2021-01-21 18:40:34'),
(3, 'Australia', 'logo', 'australia', '2021-01-21 13:10:19', '2021-01-21 18:40:53'),
(4, 'Pakistan', 'logo', 'delhi', '2021-01-21 13:10:19', '2021-01-21 18:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `team_matches`
--

DROP TABLE IF EXISTS `team_matches`;
CREATE TABLE IF NOT EXISTS `team_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team_matches`
--

INSERT INTO `team_matches` (`id`, `match_id`, `player_id`, `score`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, '2021-01-21 10:07:35', '2021-01-21 21:32:32'),
(2, 1, 2, 1, '2021-01-21 10:07:35', '2021-01-21 21:13:25'),
(3, 1, 3, 0, '2021-01-21 10:07:35', '2021-01-21 15:37:35'),
(4, 1, 4, 0, '2021-01-21 10:07:35', '2021-01-21 15:37:35'),
(12, 3, 8, 0, '2021-01-21 10:37:11', '2021-01-21 16:07:11'),
(11, 3, 7, 0, '2021-01-21 10:37:11', '2021-01-21 16:07:11'),
(10, 3, 6, 0, '2021-01-21 10:37:11', '2021-01-21 16:07:11'),
(9, 3, 5, 0, '2021-01-21 10:37:11', '2021-01-21 16:07:11'),
(20, 5, 4, 0, '2021-01-21 11:13:55', '2021-01-21 16:43:55'),
(19, 5, 3, 0, '2021-01-21 11:13:55', '2021-01-21 16:43:55'),
(18, 5, 2, 0, '2021-01-21 11:13:55', '2021-01-21 16:43:55'),
(17, 5, 1, 7, '2021-01-21 11:13:55', '2021-01-21 22:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'umrah', 'umrah@gmail.com', NULL, '$2y$10$zPSRo9m8HsTWmWnRjq3q..yXhZ2o54qH9j6YTyYqwaERHuLff8TnW', NULL, '2020-12-29 05:48:15', '2020-12-29 05:48:15');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
