-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2015 at 07:53 AM
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
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE IF NOT EXISTS `guest` (
  `guest` char(30) NOT NULL,
  `phone_number` bigint(15) NOT NULL,
  UNIQUE KEY `guest` (`guest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guest`, `phone_number`) VALUES
('Daud', 812764818),
('Naning', 81257386012);

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int(2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lot`
--

INSERT INTO `lot` (`id`, `status`, `user`) VALUES
(1, 0, NULL),
(2, 0, NULL),
(3, 0, NULL),
(4, 0, NULL),
(5, 0, NULL),
(6, 0, NULL),
(7, 0, NULL),
(8, 0, NULL),
(9, 0, NULL),
(10, 0, NULL),
(11, 0, NULL),
(12, 0, NULL),
(13, 0, NULL),
(14, 0, NULL),
(15, 0, NULL),
(16, 0, NULL),
(17, 0, NULL),
(18, 0, NULL),
(19, 0, NULL),
(20, 0, NULL),
(21, 0, NULL),
(22, 0, NULL),
(23, 0, NULL),
(24, 0, NULL),
(25, 0, NULL),
(26, 0, NULL),
(27, 0, NULL),
(28, 0, NULL),
(29, 0, NULL),
(30, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `npm` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `full_name` varchar(40) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`npm`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`npm`, `username`, `password`, `full_name`, `role`) VALUES
('1306387916', 'hakeem', '1234', 'Hakeem', 'Student'),
('1306387941', 'tsabita.cyavrilla', 'tsabtsab', 'Tsabita Cyavrilla', 'Student'),
('1306439251', 'yohana.fransiska', 'yaya', 'Yohana Fransiska', 'Student'),
('4543918572', 'ed', 'pass', 'Eddarius', 'Staff');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
