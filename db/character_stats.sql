-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2014 at 02:15 AM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `character_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `character_stats`
--

DROP TABLE IF EXISTS `character_stats`;
CREATE TABLE IF NOT EXISTS `character_stats` (
  `health` int(11) NOT NULL,
  `guard_gauge` int(11) NOT NULL,
  `tier_rank` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `utility` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `play_style` enum('Zoning','Grappler','Rushdown') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `character_stats`
--

INSERT INTO `character_stats` (`health`, `guard_gauge`, `tier_rank`, `attack`, `speed`, `utility`, `id`, `character_id`, `difficulty`, `play_style`) VALUES
(100, 100, 1, 130, 130, 140, 1, 1, 10, 'Zoning'),
(100, 100, 2, 140, 130, 120, 2, 2, 7, 'Zoning'),
(100, 100, 3, 130, 130, 125, 3, 3, 6, 'Rushdown'),
(100, 100, 4, 120, 120, 120, 4, 4, 3, 'Zoning'),
(100, 100, 5, 130, 140, 130, 7, 5, 2, 'Rushdown'),
(100, 150, 6, 150, 80, 90, 8, 6, 1, 'Grappler'),
(100, 100, 7, 135, 100, 100, 9, 7, 4, 'Zoning'),
(100, 100, 8, 120, 120, 110, 10, 8, 5, 'Zoning'),
(100, 100, 9, 100, 130, 150, 11, 9, 8, 'Zoning'),
(100, 150, 10, 150, 50, 70, 12, 10, 9, 'Grappler');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
