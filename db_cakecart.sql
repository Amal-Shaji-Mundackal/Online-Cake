-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2022 at 03:26 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_cakecart`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(55) NOT NULL,
  `admin_password` varchar(55) NOT NULL,
  `recoverymail` varchar(55) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_username`, `admin_password`, `recoverymail`) VALUES
(1, 'Admin', 'Admin123', 'admin123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE IF NOT EXISTS `tbl_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) NOT NULL,
  `bdate` date NOT NULL,
  `bcode` varchar(55) NOT NULL,
  `adamt` double NOT NULL,
  `balamt` double NOT NULL,
  `bstatus` varchar(55) NOT NULL,
  `reqdate` date NOT NULL,
  `status` varchar(55) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`booking_id`, `cus_id`, `bdate`, `bcode`, `adamt`, `balamt`, `bstatus`, `reqdate`, `status`) VALUES
(16, 17, '2021-12-19', '2038', 240, 960, 'Payment Success', '2021-12-21', 'Accept'),
(17, 18, '2021-12-19', '2039', 400, 80, 'Payment Success', '2021-12-21', 'pending'),
(18, 17, '2021-12-19', '2038', 3000, 1440, 'Payment Success', '2021-12-21', 'Accept'),
(19, 19, '2021-12-20', '2040', 192, 768, 'Payment Success', '2021-12-22', 'pending'),
(20, 20, '2021-12-20', '2041', 576, 2304, 'Payment Success', '2021-12-22', 'pending'),
(21, 1, '2021-12-31', '2022', 96, 384, 'Payment Success', '2022-01-02', 'Accept'),
(22, 2, '2022-01-01', '2024', 800, 160, 'Payment Success', '2022-01-03', 'pending'),
(23, 2, '2022-01-04', '2024', 192, 768, 'Payment Success', '2022-01-06', 'pending'),
(24, 2, '2022-01-04', '2024', 288, 1152, 'Payment Success', '2022-01-06', 'pending'),
(25, 2, '2022-03-18', '2024', 96, 384, 'Payment Success', '2022-03-20', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking_detail`
--

CREATE TABLE IF NOT EXISTS `tbl_booking_detail` (
  `booking_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `cake_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`booking_detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `tbl_booking_detail`
--

INSERT INTO `tbl_booking_detail` (`booking_detail_id`, `cake_id`, `booking_id`, `count`) VALUES
(12, 3, 16, 2),
(13, 4, 17, 1),
(14, 3, 18, 3),
(15, 4, 18, 3),
(16, 3, 18, 2),
(17, 4, 19, 2),
(18, 4, 20, 6),
(19, 4, 21, 1),
(20, 4, 22, 2),
(21, 4, 23, 2),
(22, 4, 24, 3),
(23, 4, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cake`
--

CREATE TABLE IF NOT EXISTS `tbl_cake` (
  `cake_id` int(11) NOT NULL AUTO_INCREMENT,
  `cake_name` varchar(55) NOT NULL,
  `cake_weight` double NOT NULL,
  `camount` double NOT NULL,
  `expiry_date` date NOT NULL,
  `flavour_id` int(11) NOT NULL,
  `cake_image` varchar(55) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`cake_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_cake`
--

INSERT INTO `tbl_cake` (`cake_id`, `cake_name`, `cake_weight`, `camount`, `expiry_date`, `flavour_id`, `cake_image`, `category_id`, `stock`) VALUES
(2, 'White Forest Cake', 2, 550, '0000-00-00', 2, 'white-forest-cake.jpeg', 2, 0),
(3, 'Red Velvet Cake', 1, 600, '0000-00-00', 3, 'red velvet.jpg', 3, 0),
(4, 'Black Forest Cake', 1, 480, '0000-00-00', 1, 'black-forest-cake.jpg', 1, 0),
(5, 'Angel Food Cake', 1, 1200, '0000-00-00', 4, 'angel_food_cake.jpg', 4, 0),
(6, 'Black Forest', 45, 5656, '0000-00-00', 1, 'full_size_20161211153642.jpg', 1, 0),
(7, '', 0, 0, '0000-00-00', 4, 'full_size_20161211153642.jpg', 1, 0),
(8, '', 0, 0, '0000-00-00', 1, 'full_size_20161211153228.jpg', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) NOT NULL,
  `tot_price` double NOT NULL,
  `date` date NOT NULL,
  `status` varchar(55) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart_details`
--

CREATE TABLE IF NOT EXISTS `tbl_cart_details` (
  `cart_detailid` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `cake_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `item_price` double NOT NULL,
  PRIMARY KEY (`cart_detailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE IF NOT EXISTS `tbl_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(55) NOT NULL,
  `description` varchar(55) NOT NULL,
  `image` varchar(55) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `description`, `image`) VALUES
(1, 'Black Forest', 'Chocolate sponge cake with a rich cherry filling', 'black-forest-cake.jpg'),
(2, 'White Forest', 'vanilla sponge cake are filled with sour cherries', 'white-forest-cake.jpeg'),
(3, 'Red Velvet', 'Mild cocoa with a slightly tart edge', 'red velvet.jpg'),
(4, 'Angel Food Cake', 'Angel food cake is a low fat cake', 'angel_food_cake.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(55) NOT NULL,
  `housename` varchar(55) NOT NULL,
  `district_id` int(11) NOT NULL,
  `gender` varchar(55) NOT NULL,
  `place_id` int(11) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `email` varchar(55) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `adhar_no` bigint(11) NOT NULL,
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`cus_id`, `cus_name`, `housename`, `district_id`, `gender`, `place_id`, `contact_no`, `email`, `username`, `password`, `adhar_no`) VALUES
(1, 'Jokxy', 'Pampakuda', 10, 'female', 6, 7876545434, 'jokxyjoy@gmail.com', 'Jokxy', 'custJokxy.00@#120', 112233445566),
(2, 'Amal', 'Kodappanamkunnel', 10, 'male', 6, 9496250906, 'amalshaji2022@gmail.com', 'amal', 'Amal@123', 190021091161),
(3, 'Salman T A', 'Thadathil', 14, 'male', 12, 8943523288, 'amalshajimundackal@gmail.com', 'Salmansalam', 'Salman@123', 673423456787);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE IF NOT EXISTS `tbl_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(55) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(10, 'Idukki'),
(11, 'Ernakulam'),
(12, 'Kannur'),
(13, 'Thiruvananthapuram'),
(14, 'Thrissur'),
(15, 'Kottayam'),
(16, 'Alappuzha'),
(17, 'Malappuram'),
(18, 'Kozhikode'),
(19, 'Kollam'),
(20, 'Pathanamthitta'),
(21, 'Wayanad'),
(22, 'Kasaragod'),
(23, 'Palakkad');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_flavour`
--

CREATE TABLE IF NOT EXISTS `tbl_flavour` (
  `flavour_id` int(11) NOT NULL AUTO_INCREMENT,
  `flavour_name` varchar(55) NOT NULL,
  `category_id` int(11) NOT NULL,
  `fdescription` varchar(55) NOT NULL,
  PRIMARY KEY (`flavour_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_flavour`
--

INSERT INTO `tbl_flavour` (`flavour_id`, `flavour_name`, `category_id`, `fdescription`) VALUES
(1, 'Dark Chocolate', 1, 'chocolate sponge cake'),
(2, 'Vanilla', 2, 'Vanilla sponge cake are filled with sour cherries'),
(3, 'Mild cocoa', 3, 'Mild cocoa with a slightly tart edge'),
(4, 'Orange dream angel food cake', 4, 'Angel food cake is a low fat cake');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE IF NOT EXISTS `tbl_place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(55) NOT NULL,
  `pin_no` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `pin_no`, `district_id`) VALUES
(5, 'Palayam', 747564, 6),
(6, 'Thodupuzha', 685605, 10),
(7, 'Kongad', 747564, 9),
(8, 'Kakkanad', 657843, 11),
(9, 'Athicode', 678554, 9),
(10, 'Alavil', 670008, 12),
(11, 'Anjengo', 695309, 13),
(12, 'Adat', 680554, 14),
(13, 'Anthinad', 686651, 15),
(14, 'Akamkudy', 690513, 16),
(15, 'Alathiyur', 676102, 17),
(16, 'Abhayagiri', 673517, 18),
(17, 'Asramam', 691002, 19),
(18, 'Adur Kla', 691523, 20),
(19, 'Kakka Vayal', 673122, 21),
(20, 'Karadka B O', 671542, 22),
(21, 'Alanallur', 678601, 23);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock`
--

CREATE TABLE IF NOT EXISTS `tbl_stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `cake_id` int(11) NOT NULL,
  `s_quantity` int(11) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tbl_stock`
--

INSERT INTO `tbl_stock` (`stock_id`, `cake_id`, `s_quantity`) VALUES
(1, 4, 5),
(2, 2, 10),
(3, 4, 5),
(4, 3, 6),
(5, 3, 6),
(6, 4, 5),
(7, 6, 0),
(8, 7, 0),
(9, 8, 0),
(10, 8, 0),
(11, 8, 0),
(12, 8, 0),
(13, 8, 0),
(14, 8, 0),
(15, 8, 0),
(16, 8, 0),
(17, 8, 0),
(18, 3, 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
