-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 13, 2022 at 10:56 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mk_hospitals`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_reg`
--

DROP TABLE IF EXISTS `admin_reg`;
CREATE TABLE IF NOT EXISTS `admin_reg` (
  `admin_id` int(100) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(100) NOT NULL,
  `a_age` int(100) NOT NULL,
  `a_address` varchar(100) NOT NULL,
  `a_email` varchar(100) NOT NULL,
  `a_phone_number` int(10) NOT NULL,
  `a_password` varchar(100) NOT NULL,
  `a_department` varchar(100) NOT NULL,
  `a_position` varchar(100) NOT NULL,
  `a_user_type` varchar(20) NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_reg`
--

INSERT INTO `admin_reg` (`admin_id`, `a_name`, `a_age`, `a_address`, `a_email`, `a_phone_number`, `a_password`, `a_department`, `a_position`, `a_user_type`) VALUES
(2, 'Imam Nazar', 25, '88/A, Hapugaspitiya Road, Keerapane, Gampola', 'imam@mail.com', 766949496, 'beeccdb438355c029a66dbec333fa1c8', 'IT', 'IT Administrator', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `patient_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `address` varchar(500) NOT NULL,
  `d_name` varchar(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `scheduled_on` datetime NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `name`, `email`, `phone_number`, `address`, `d_name`, `placed_on`, `scheduled_on`, `status`) VALUES
(13, 5, 'Arunodhani', 'sasu@mail.com', 711234567, 'Kalubowila, Dehiwala', 'DR Martin', '31-07-22', '2022-08-03 08:30:00', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `patient_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `patient_id`, `name`, `description`, `price`, `quantity`, `image`) VALUES
(1, 6, 'Atorvastatin', 'Atorvastatin Oral: Uses, Side Effects, Interactions, Pictures, Warnings & Dosing (Price per Tablet/Capsule)', 9, 1, 'atorvastatin_40_mg_tablets.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_reg`
--

DROP TABLE IF EXISTS `doctor_reg`;
CREATE TABLE IF NOT EXISTS `doctor_reg` (
  `doctor_id` int(100) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(100) NOT NULL,
  `d_age` int(100) NOT NULL,
  `d_address` varchar(500) NOT NULL,
  `d_email` varchar(100) NOT NULL,
  `d_phone_number` int(10) NOT NULL,
  `d_specialized_in` varchar(500) NOT NULL,
  `d_qualifications` varchar(200) NOT NULL,
  `d_password` varchar(100) NOT NULL,
  `d_user_type` varchar(50) NOT NULL DEFAULT 'doctor',
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_reg`
--

INSERT INTO `doctor_reg` (`doctor_id`, `d_name`, `d_age`, `d_address`, `d_email`, `d_phone_number`, `d_specialized_in`, `d_qualifications`, `d_password`, `d_user_type`) VALUES
(1, 'DR Susila Amaraa', 45, 'Colombo-04, Dehiwala', 'susila@mkhospitals.lk', 111234567, 'Cardiac Electrophysiologist', 'Bachelors Degree of Medicine and Surgery', '5fd0996d9a3a512b6f17f026e6e63c1d', 'doctor'),
(2, 'DR Martin', 46, 'Col-8', 'martin@mkhospitals.lk', 76949496, 'Cardiac Electrophysiologist', 'Bsc in Medicines', '34f74c049edea51851c6924f4a386762', 'doctor');

-- --------------------------------------------------------

--
-- Table structure for table `instant_payment`
--

DROP TABLE IF EXISTS `instant_payment`;
CREATE TABLE IF NOT EXISTS `instant_payment` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `patient_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `card_number` int(16) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `zip_code` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `exp_month` int(10) NOT NULL,
  `exp_date` int(10) NOT NULL,
  `cvv` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medical_store`
--

DROP TABLE IF EXISTS `medical_store`;
CREATE TABLE IF NOT EXISTS `medical_store` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medical_store`
--

INSERT INTO `medical_store` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'Atorvastatin', 'Atorvastatin Oral: Uses, Side Effects, Interactions, Pictures, Warnings & Dosing (Price per Tablet/Capsule)', 9, 'atorvastatin_40_mg_tablets.jpg'),
(3, 'Losartan Tabs', 'Losartan is used to treat high BP (hypertension) and to help protect the kidneys. (price per tablet)', 10, 'Losartan.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `patient_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `patient_id`, `name`, `phone_number`, `email`, `address`, `message`) VALUES
(2, 5, 'Arunodhani', 711234567, 'sasu@gmail.com', '95, Kalubowila', 'Hi, this is a test message');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `patient_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(500) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(100) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `patient_id`, `name`, `phone_number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(4, 5, 'Arunodhani Sasuwanthika', 711234567, 'sasu@gmail.com', 'cash on delivery', 'no. 88, Waidhya Road, Colombo, Western Province, Sri Lanka - 10300', ', Atorvastatin (1) ', 9, '22-07-22', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `patient_reg`
--

DROP TABLE IF EXISTS `patient_reg`;
CREATE TABLE IF NOT EXISTS `patient_reg` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(1000) NOT NULL DEFAULT 'patient',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_reg`
--

INSERT INTO `patient_reg` (`id`, `name`, `age`, `address`, `email`, `phone_number`, `password`, `user_type`) VALUES
(6, 'Arunodhani Sasuwanthika', 22, '64, Kalubowila, Dehiwala, Colombo', 'sasu@gmail.com', 750751818, '3e950f57194e2d46059a5fe1286e3a12', 'patient');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
