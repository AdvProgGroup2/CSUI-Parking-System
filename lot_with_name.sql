-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2015 at 03:43 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `parking`
--
CREATE DATABASE IF NOT EXISTS `parking` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `parking`;

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int(2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user` char(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lot`
--

INSERT INTO `lot` (`id`, `status`, `user`) VALUES
(1, 0, ''),
(2, 0, ''),
(3, 0, ''),
(4, 0, ''),
(5, 0, ''),
(6, 0, ''),
(7, 0, ''),
(8, 0, ''),
(9, 0, ''),
(10, 0, ''),
(11, 0, ''),
(12, 0, ''),
(13, 0, ''),
(14, 0, ''),
(15, 0, ''),
(16, 0, ''),
(17, 0, ''),
(18, 0, ''),
(19, 0, ''),
(20, 0, ''),
(21, 0, ''),
(22, 0, ''),
(23, 0, ''),
(24, 0, ''),
(25, 0, ''),
(26, 0, ''),
(27, 0, ''),
(28, 0, ''),
(29, 0, ''),
(30, 0, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
