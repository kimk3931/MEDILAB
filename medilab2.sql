-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2023 at 10:26 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medilab2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `booked_for` varchar(100) NOT NULL,
  `dependant_id` int(11) DEFAULT NULL,
  `test_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `where_taken` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT '\'Pending\'',
  `lab_id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`book_id`, `member_id`, `booked_for`, `dependant_id`, `test_id`, `appointment_date`, `appointment_time`, `where_taken`, `reg_date`, `latitude`, `longitude`, `status`, `lab_id`, `invoice_no`) VALUES
(1, 11, 'Dependant', 7, 1, '2023-06-15', '99:47:10', 'Home', '2023-06-12 13:07:49', NULL, NULL, '\'Pending\'', 2, '6547'),
(3, 3, 'Dependant', 5, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 08:39:02', '1.456789', '32.3456789o', 'Pending', 2, '5454545'),
(4, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 08:44:27', '1.456789', '32.3456789o', 'Pending', 1, '5454545'),
(5, 11, 'Dependant', 5, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 08:55:47', '', '', '\'Pending\'', 1, '5454545'),
(6, 4, 'Dependant', 4, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 09:15:23', '', '', '\'Pending\'', 1, '5454545'),
(7, 4, 'Dependant', 4, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 09:16:17', '1.456789', '32.3456789o', '\'Pending\'', 1, '5454545'),
(8, 4, 'Dependant', 4, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 09:20:35', '1.456789', '32.3456789o', '\'Pending\'', 1, '5454545'),
(9, 4, 'Dependant', 4, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 09:21:15', '1.456789', '32.3456789', '\'Pending\'', 1, '5454545'),
(10, 5, 'Dependant', 8, 2, '2023-01-08', '10:00:00', 'Home', '2023-06-12 09:23:00', '1.456789', '32.3456789', '\'Pending\'', 1, '5454545'),
(11, 5, 'Dependant', 8, 2, '2023-01-08', '10:00:00', 'Home', '2023-06-12 12:51:38', '1.456789', '32.3456789', '\'Pending\'', 1, '5454545'),
(12, 5, 'Dependant', 8, 2, '2023-01-08', '10:00:00', 'Home', '2023-06-12 13:00:18', '1.456789', '32.3456789', '\'Pending\'', 1, '5454545'),
(13, 5, 'Dependant', 8, 2, '2023-01-08', '10:00:00', 'Home', '2023-06-12 13:01:59', '1.456789', '32.3456789', '\'Pending\'', 1, '5454545'),
(14, 11, 'Dependant', 7, 1, '2023-06-15', '99:47:10', 'Home', '2023-06-12 13:09:27', '1.456789', '32.3456789o', '\'Pending\'', 2, '6547'),
(15, 11, 'Dependant', 7, 1, '2023-06-15', '99:47:10', 'Home', '2023-06-12 13:10:39', '1.456789', '32.3456789o', '\'Pending\'', 2, '6547'),
(16, 11, 'Dependant', 7, 1, '2023-06-15', '99:47:10', 'Home', '2023-06-12 13:11:38', '1.456789', '32.3456789o', '\'Pending\'', 2, '6547'),
(17, 11, 'Dependant', 7, 1, '2023-06-15', '99:47:10', 'Home', '2023-06-12 13:28:44', '1.456789', '32.3456789o', '\'Pending\'', 2, '6547'),
(18, 11, 'Dependant', 7, 1, '2023-06-15', '99:47:10', 'Home', '2023-06-12 13:29:02', '', '', '\'Pending\'', 2, '6547'),
(19, 11, 'Dependant', 7, 1, '2023-06-15', '99:47:10', 'Home', '2023-06-12 13:30:06', '', '', '\'Pending\'', 2, '6547'),
(20, 11, 'Dependant', 7, 1, '2023-06-15', '99:47:10', 'Home', '2023-06-12 13:52:45', '', '', '\'Pending\'', 2, '6547'),
(21, 11, 'Dependant', 7, 1, '2023-06-15', '99:47:10', 'Home', '2023-06-12 13:55:22', '', '', '\'Pending\'', 2, '6547'),
(22, 3, 'Dependant', 5, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 14:01:12', '1.456789', '32.3456789o', '\'Pending\'', 1, '5454545'),
(23, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 14:03:06', '1.456789', '32.3456789o', '\'Pending\'', 1, '5454545'),
(24, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 14:15:44', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(25, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 14:15:47', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(26, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 14:25:15', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(27, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-12 14:25:52', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(28, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 06:00:53', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(29, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 06:04:29', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(30, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 06:06:22', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(31, 11, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 06:09:12', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(38, 3, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 07:37:25', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(39, 3, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 07:39:11', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(40, 4, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 07:41:16', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(41, 5, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 07:41:44', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(42, 12, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 07:43:22', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(43, 12, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 09:20:00', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(44, 12, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-13 09:20:38', '1.1', '8.8', '\'Pending\'', 1, '5454545'),
(45, 14, 'Dependant', 2, 1, '2023-01-08', '10:00:00', 'Home', '2023-06-19 07:56:14', '1.1', '8.8', '\'Pending\'', 2, '5454545'),
(46, 14, 'Dependant', 2, 6, '0000-00-00', '00:00:00', '', '2023-06-20 08:04:45', NULL, NULL, '\'Pending\'', 1, '5555');

-- --------------------------------------------------------

--
-- Table structure for table `dependants`
--

CREATE TABLE `dependants` (
  `dependant_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `surname` text NOT NULL,
  `others` text NOT NULL,
  `dob` date NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dependants`
--

INSERT INTO `dependants` (`dependant_id`, `member_id`, `surname`, `others`, `dob`, `reg_date`) VALUES
(2, 6, 'Renee', 'Malaika', '0000-00-00', '2023-06-12 08:41:12'),
(4, 4, 'alex', 'Doe', '2000-08-05', '2023-06-08 07:25:41'),
(5, 4, 'Joy', 'Doe', '1990-08-05', '2023-06-08 07:29:29'),
(6, 4, 'Eric', 'Doe', '1980-08-05', '2023-06-08 07:29:46'),
(7, 5, 'Tom', 'Glen', '1980-08-05', '2023-06-08 07:50:37'),
(8, 5, 'Alice', 'Glen', '1980-08-05', '2023-06-08 07:50:46'),
(9, 4, 'Jonah', 'Griffith', '1988-08-05', '2023-06-10 14:55:57'),
(10, 4, 'Alen', 'Griffith', '1988-08-05', '2023-06-10 15:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `laboratories`
--

CREATE TABLE `laboratories` (
  `lab_id` int(11) NOT NULL,
  `lab_name` text NOT NULL,
  `permit_id` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laboratories`
--

INSERT INTO `laboratories` (`lab_id`, `lab_name`, `permit_id`, `email`, `phone`, `password`, `role`, `reg_date`) VALUES
(1, 'Lancet Labs Kenya', '454545454', 'lancet@lancet.org', '0729225710', '123456', 'admin', '2023-05-31 09:08:17'),
(2, 'medicross', NULL, '', '', '', 'admin', '2023-06-12 07:49:21'),
(3, 'Medipath', '6695LL', 'medipath@gmail.com', 'gAAAAABkirnGv932BgCoeceM8nvUt6N2ZL0F3rmE2qg2xxtnwt_1m8YDxC-O4Usoga0JGsI0WvP9lH9qTkabfif6zEN44DkVGQ==', '$2b$12$wPmYO.vaz1LHDg5B8.abxuilxoRcEAD4G41qGOvzJcb93.yh3Q572', '\'admin\'', '2023-06-15 07:12:07'),
(5, 'Mediheal', '6695LL', 'mediheal@gmail.com', 'gAAAAABkiruh4r4ARsrlzvf4RKV8z-kL0Fjti8QYGBltX-FyVLJ2ApANN6UK2v1vwAm6QomZXSQqWoFnB_GraA3jWH_qiiQPvQ==', '$2b$12$a21jWHedM0/1rqA06lOBO.O/WYRv8m2zmBSc1xBQAkSrSelBDTe/q', '\'admin\'', '2023-06-15 07:20:01'),
(6, 'Lancetlab', '6698L', 'lancetlab@gmail.com', 'gAAAAABkitN-r6wkirBFqq90uV1HJU5Iffjqpu5oR3GocJtcJ6X1zGhdy1L9jEitthOigYGVAytUyF1iCyci0fRSNZpD7iDkTQ==', '$2b$12$ewEVDU0SUwACNvRI4Ni5kOKtufwr7o.7pnoW2vFpC3iVzfeZnPZQa', '\'admin\'', '2023-06-15 09:01:51');

-- --------------------------------------------------------

--
-- Table structure for table `lab_tests`
--

CREATE TABLE `lab_tests` (
  `test_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `test_name` text NOT NULL,
  `test_description` text NOT NULL,
  `test_cost` int(11) NOT NULL,
  `test_discount` int(11) NOT NULL,
  `availability` text NOT NULL,
  `more_info` varchar(100) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lab_tests`
--

INSERT INTO `lab_tests` (`test_id`, `lab_id`, `test_name`, `test_description`, `test_cost`, `test_discount`, `availability`, `more_info`, `reg_date`) VALUES
(1, 1, 'Covid 19 Test', 'This is a sample test', 350, 10, '', NULL, '2023-05-31 08:08:30'),
(2, 1, 'Example test2', 'This is a test example', 1200, 14, '', NULL, '2023-06-12 06:47:42'),
(3, 2, 'example test 5', 'This is test 5', 0, 0, '', NULL, '2023-06-12 06:49:33'),
(4, 6, 'Malaria Test', 'This is a test for the Malaria Plasmodium', 3800, 70, 'Yes', 'Contact the reception for more information at 8:00am', '0000-00-00 00:00:00'),
(5, 3, 'Covid Test', 'This is a test for the Covid_19 virus', 4700, 80, 'Yes', 'Contact the reception for more information from 8:00am', '0000-00-00 00:00:00'),
(6, 3, 'Covid Test', 'This is a test for the Covid_19 virus', 4700, 80, 'Yes', 'Contact the reception for more information from 8:00am', '2023-06-15 09:12:47');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location`) VALUES
(1, 'Nairobi'),
(2, 'Nakuru');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `surname` text NOT NULL,
  `others` text NOT NULL,
  `gender` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(100) NOT NULL,
  `location_id` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `surname`, `others`, `gender`, `email`, `phone`, `dob`, `status`, `password`, `location_id`, `reg_date`) VALUES
(3, 'Jane', 'Doe', 'Female', 'gAAAAABkgDdTRBAsOqUVgtPEtfaLao6JxYzy034uwiUyAh1OtBE_XLKJmnz-EIc_0Yu2uSIM5UtlU4Y2bB4qeaAPM0EFtYTs5g==', 'gAAAAABjLX8d8JAsCS9ipJ8mO44Px4hb6GgfydOllU7P1JJqHWTQXEXchS-CMqsE2sSz2mDhrlGDjmmCYFCn4Em7X7F6nHVBTQ==', '2000-08-05', 1, '$2b$12$urbBQMaUmlVZ/19FAjhpgujnotT1T.Gn3yunVm6Oa1iiP3Izyri0S', 1, '2023-06-13 07:38:58'),
(4, 'alex', 'Doe', 'Female', 'gAAAAABkgEtE_uOHLLko1hulYkizV2uBUEsNA60dN5Mo1L9rueUzPOgT5r-mhaT_DvZBx87vNGaAncHzLkEpeHhA7J4wbBb-0Q==', 'gAAAAABkgEtEhZy_F7Rk6iqBEtmAxPB9nah9lEKkFiS4CXvDky7psTKi1339jLIF41THA5k1hs_NypRGWp2_Z8Lq3mRPRb0RAA==', '2000-08-05', 1, '$2b$12$yNrJe/w32J9.rUKSiQEsxO.w6pYAOcgWHiWqlDiORdBQKCXLojrSe', 1, '2023-06-07 09:17:57'),
(5, 'Glen', 'Doe', 'Female', 'gAAAAABkgYgc-vDzoAlC4GOqhv7-b54jh5jevbTy4-FwisRx1aAu-vYWSDeHhUSGdStoZixsAwVS5XMWzEDeve_tPMDNkNTdHQ==', 'gAAAAABkgYgcdMSoyiuc7o6B1srd1Qh0-nQPvf446GmEirRhxsU76HFs6DjmgoHw68_JFH0FxmtO6D4WXf6cCga2gKiM8W0w9A==', '2000-08-05', 1, '$2b$12$.asbTpAPyjD.sgHKant0Jez22It4cEaLTuxG3WC2bf7tbJxbN2N9e', 1, '2023-06-08 07:49:49'),
(6, 'Malaika', 'Renee', 'female', 'gAAAAABkhsyxPyNkZOTSmSI35bnbWnYSds9lFB2RgtCiKiWLpNtKCefEvO6wWS3nfWM6CdaFp_r6IcQDYgVaitm78BZBxugqhw==', 'gAAAAABkhsyx5_RO3KjOaTJEifz_u9O3wWp4dTjp3T7xpdk9TFY8rlQEdh1GbiY8RlZXmIPE4fQNBz7XihQ8s8TpQY-QP6UFyA==', '2004-08-03', 1, '$2b$12$Gc/Q.uyFrbE..8a5sEzfZOo3vJI4Tnuw96CgkLgJQge3JgsLUabI.', 1, '2023-06-12 07:43:46'),
(11, 'Hope', 'Njeri', 'female', 'hopenjeri@gmail.com', '+254722457273', '0000-00-00', 1, 'karema10.', 2, '2023-06-12 08:43:17'),
(12, 'Mala', 'Ren', 'female', 'gAAAAABkiB3jgMR4ZwEVetVz_gG1ea9N47v41QlKfRWxl7HeE1KKdYKaSgSaCtkKH6_dVDfnZ3eY4pXEEMQ70JaRkA3k1R39gA==', 'gAAAAABkiB3jFeNXd5vVJ7Ctt7x0ln1zDWP1FGRGAMPXYeeodKj9opTrpu1FGE_WWc-UImgdhhnY4QVJSTJG0TLE_T4QKQjHOg==', '2004-08-03', 1, '$2b$12$54CHa6n3dXIJ.ijJ/goI0ejm0s03dVyiFTfx7ZVEPqp4SE3Vv6QvW', 1, '2023-06-13 07:42:28'),
(13, 'livefast', 'ke', 'female', 'gAAAAABkiZfmhlUpi34hNwWqg0I-ioH0MaiAgj_TpSWz6asOgUJETMVjpHGIt2ODmAK0FMBZMHb408vupkZ5I6C0tjJFvkuFaw==', 'gAAAAABkiZfmUzA1rX2836NI8qkzX8FBXrJid2Rf5O8vjr0aO68NFU4roErKPxwiEJRCVX0NNzvsBFH9iQbO7pDYKW98V2Msnw==', '2004-08-03', 1, '$2b$12$tIUZBcdrOviqyZM/G/YPkO9C90pcozn082Hm6T6LkYNURJ8dvV2Sm', 1, '2023-06-14 10:35:19'),
(14, 'matheki', 'ke', 'female', 'gAAAAABkkAn6Tkb4RlFYDQx09hpRp9m_Vca7SEK4GeGQBv3k9ambRbq3jXlaHU_6f_y1LMxYvXsEP6k3M8ElYCx66AGTeKDhQ98tiLDzGwPins_axgVbRwE=', 'gAAAAABkkAn67cnY4dug0b7W8T3rIPCmjpKOJ7NPLjO79zEUAu38QyYY1PxM2sr-ZBJfjlQ1nEc-zjqi_cAyNwUTnUYnqcATeg==', '2004-08-03', 1, '$2b$12$ezlSzMJwV/YNzF4K62HM.eBK1vHymBUo.hyPWwAty9TO.zEaKrs/i', 1, '2023-06-19 07:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `nurses`
--

CREATE TABLE `nurses` (
  `nurse_id` int(11) NOT NULL,
  `surname` text NOT NULL,
  `others` text NOT NULL,
  `lab_id` int(11) NOT NULL,
  `gender` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurses`
--

INSERT INTO `nurses` (`nurse_id`, `surname`, `others`, `lab_id`, `gender`, `email`, `phone`, `password`, `reg_date`) VALUES
(1, 'Jackline', 'Boss', 1, 'Female', '', '', '', '2023-05-31 09:15:55'),
(2, 'Jacob', 'Johnaon', 1, 'Male', '', '', '', '2023-05-31 09:16:17'),
(3, 'Makena', 'Sheila', 2, 'Female', 'gAAAAABkkBQFQUV3ffOoXMZcM2KVpBuxxudnFJNiBAlJ1v9DR4LZY25eJGyM4-JMNVaEXRk35zNMoVvvjQewfjitFgOdmJtVWg3kb5zRswK6ioVjH_lTglg=', 'gAAAAABkkBQFaLxnOm7qJFNZoBxgY9U0eZOCK1zXeLBVMZ3Nle-KalFCyoqMarIYDB03hHiFJt6gs0tUJiF0I53ONjUklVz-Vg==', '$2b$12$hm0V.A208vFCfv26rI1WaeTnQXL2yosZQ6iYOJli9dxYyfcvLE97G', '2023-06-19 08:38:29'),
(4, 'Lisa', 'Sheila', 2, 'Female', 'gAAAAABkkBREcTTxP7PJ5n7wPWGjC6_6bR4IHvpigEqIaoWTEEcj-XrAxjjfT8nbL6duw750ulV1llG5KdAQ3ysmg6JSWglCwul9mFN_b4w1L8TszRRGsW0=', 'gAAAAABkkBREHXv6X7Znk1TaQFe2EmAnxpEzw7A5WYFN-0DbtfvGMHFJhoaOpTz9b9g7YC8Imy26jkSOUF1ALkobNGxM_QG-Nw==', '$2b$12$39VL0FbN3nioMNPIzRAIye1fUndZL7KeMr.PhLB7LG9kZrooMhlce', '2023-06-19 08:39:32'),
(5, 'Kim', 'Sheila', 2, 'Female', 'gAAAAABkkWXoB987AX5l6OximMpbw-ifmr_K68VxQ4feYgXAbZH35I5Fnxlw9KppY8jiC_IVux3IUOfR_TAxgLud0xKBTURX9sltFcjEXEHp9lAmOsbzVh0=', 'gAAAAABkkWXomndKQYVYdu8_JNjin0pQX5ilLjMyIF804hkzViD0Ygk8rbbqjKexD8gCfkZ53ldHlXAuGWuS6ZeQXrzNvzfB6g==', '$2b$12$jfMzaILPcpAVp7op5pdQM.KlZ3iOQsguBf.aoqtXCZ7VkFjyHHxrq', '2023-06-20 08:40:09'),
(6, 'Kelsy', 'kim', 6, 'female', 'kelsy@gmail.com', '+254714687873', 'kelsy@123', '2023-06-20 08:44:40'),
(7, 'Kimberly', 'Sheila', 2, 'Female', 'gAAAAABkkWdnEnv8jZUf7dTFlMDzsRbbWI67vG-P69m-gLa8Hn5HhdrTWNQvMWEGVDrYhNspkH3tZUgukHUCN7iJFP9Au05K25K3jqmOz3mFC2CMxP96ADw=', 'gAAAAABkkWdn2TN6qWVtB56Yb7YiAMUt3BrwgyfuJbKEIxFEsHjT6GoblEBnVYp1XDXG9GM66VBoBBje0A4tZecwcPYVEocE7Q==', '$2b$12$zAJ8LDRw6KKt3TiZtOIMPuM7IefbQRB4Hk7XSH.Lj.NPcBijj8Eli', '2023-06-20 08:46:32'),
(8, 'Kimsol', 'Sheila', 2, 'Female', 'gAAAAABkkqEKbJAnjWFdxzpq_wNfVnxSEyJ_1ZEQNggbIDCXqpcWxHFMPkDdG6oVlhIqwDb3PB4yUuMltLpPME2JGe1x418fFnnl2gJ__RwXTXOdkRj4cd8=', 'gAAAAABkkqEKhkYENu7XUbRH6TTUFCPOmdbjLhMcQmEIMpyi6cnOvBlAXaEtoyLjwGTpqp2YBMiJikQmuakHZ4EEYqJ6xxxXsg==', '$2b$12$bKhgQvuctWyZP1hQlvnxQ.ex1JfU3hLWx39lajYXgS2SSFWYIOHU6', '2023-06-21 07:04:43');

-- --------------------------------------------------------

--
-- Table structure for table `nurse_lab_allocations`
--

CREATE TABLE `nurse_lab_allocations` (
  `allocation_id` int(11) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `flag` varchar(50) NOT NULL DEFAULT 'Active',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurse_lab_allocations`
--

INSERT INTO `nurse_lab_allocations` (`allocation_id`, `nurse_id`, `invoice_no`, `flag`, `reg_date`) VALUES
(3, 3, '6547', 'inactive', '2023-06-20 07:55:30'),
(4, 2, '5454545', 'Active', '2023-06-20 08:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `bookings_fk0` (`member_id`),
  ADD KEY `bookings_fk1` (`dependant_id`),
  ADD KEY `bookings_fk2` (`test_id`),
  ADD KEY `bookings_fk3` (`lab_id`),
  ADD KEY `invoice_no` (`invoice_no`);

--
-- Indexes for table `dependants`
--
ALTER TABLE `dependants`
  ADD PRIMARY KEY (`dependant_id`),
  ADD KEY `dependants_fk0` (`member_id`);

--
-- Indexes for table `laboratories`
--
ALTER TABLE `laboratories`
  ADD PRIMARY KEY (`lab_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `lab_tests`
--
ALTER TABLE `lab_tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `lab_tests_fk0` (`lab_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `members_fk0` (`location_id`);

--
-- Indexes for table `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`nurse_id`),
  ADD UNIQUE KEY `surname` (`surname`) USING HASH,
  ADD KEY `nurses_fk0` (`lab_id`);

--
-- Indexes for table `nurse_lab_allocations`
--
ALTER TABLE `nurse_lab_allocations`
  ADD PRIMARY KEY (`allocation_id`),
  ADD KEY `nurse_id` (`nurse_id`),
  ADD KEY `invoice_no` (`invoice_no`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `invoice_no` (`invoice_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `dependants`
--
ALTER TABLE `dependants`
  MODIFY `dependant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `laboratories`
--
ALTER TABLE `laboratories`
  MODIFY `lab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lab_tests`
--
ALTER TABLE `lab_tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `nurses`
--
ALTER TABLE `nurses`
  MODIFY `nurse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `nurse_lab_allocations`
--
ALTER TABLE `nurse_lab_allocations`
  MODIFY `allocation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_fk0` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `bookings_fk1` FOREIGN KEY (`dependant_id`) REFERENCES `dependants` (`dependant_id`),
  ADD CONSTRAINT `bookings_fk2` FOREIGN KEY (`test_id`) REFERENCES `lab_tests` (`test_id`),
  ADD CONSTRAINT `bookings_fk3` FOREIGN KEY (`lab_id`) REFERENCES `laboratories` (`lab_id`);

--
-- Constraints for table `dependants`
--
ALTER TABLE `dependants`
  ADD CONSTRAINT `dependants_fk0` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `lab_tests`
--
ALTER TABLE `lab_tests`
  ADD CONSTRAINT `lab_tests_fk0` FOREIGN KEY (`lab_id`) REFERENCES `laboratories` (`lab_id`);

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_fk0` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `nurses_fk0` FOREIGN KEY (`lab_id`) REFERENCES `laboratories` (`lab_id`);

--
-- Constraints for table `nurse_lab_allocations`
--
ALTER TABLE `nurse_lab_allocations`
  ADD CONSTRAINT `nurse_lab_allocations_fk0` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`nurse_id`),
  ADD CONSTRAINT `nurse_lab_allocations_fk1` FOREIGN KEY (`invoice_no`) REFERENCES `bookings` (`invoice_no`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_fk0` FOREIGN KEY (`invoice_no`) REFERENCES `bookings` (`invoice_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
