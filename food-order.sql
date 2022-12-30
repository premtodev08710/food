-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 30, 2022 at 12:53 PM
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
-- Database: `food-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(1, 'สมปอง  น่ารัก', '1', 'c4ca4238a0b923820dcc509a6f75849b'),
(9, 'Sasha Mendez', '2', 'c4ca4238a0b923820dcc509a6f75849b'),
(10, 'Vijay Thapa', '3', 'c4ca4238a0b923820dcc509a6f75849b'),
(12, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(4, 'พิซซา', 'Food_Category_790.jpg', 'Yes', 'Yes'),
(5, 'เบอร์เกอร์', 'Food_Category_344.jpg', 'Yes', 'Yes'),
(6, ' โมโม่', 'Food_Category_77.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(3, 'เกี๊ยวพิเศษ', 'เกี๊ยวพิเศษเกี๊ยวพิเศษเกี๊ยวพิเศษเกี๊ยวพิเศษเกี๊ยวพิเศษ', '5.00', 'Food-Name-3649.jpg', 6, 'Yes', 'Yes'),
(4, 'เบอร์เกอร์ที่ดีที่สุด', 'เบอร์เกอร์ที่ดีที่สุดเบอร์เกอร์ที่ดีที่สุดเบอร์เกอร์ที่ดีที่สุดเบอร์เกอร์ที่ดีที่สุดเบอร์เกอร์ที่ดีที่สุดเบอร์เกอร์ที่ดีที่สุด', '4.00', 'Food-Name-6340.jpg', 5, 'Yes', 'Yes'),
(5, 'พิซซ่าบาร์บีคิวรมควัน', 'พิซซ่าบาร์บีคิวรมควันพิซซ่าบาร์บีคิวรมควันพิซซ่าบาร์บีคิวรมควันพิซซ่าบาร์บีคิวรมควัน', '6.00', 'Food-Name-8298.jpg', 4, 'No', 'Yes'),
(6, 'ซาเดโกะ โมโมะ', 'ซาเดโกะ โมโมะซาเดโกะ โมโมะซาเดโกะ โมโมะซาเดโกะ โมโมะ', '6.00', 'Food-Name-7387.jpg', 6, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `order_time`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(1, 'Sadeko Momo', '6.00', 3, '18.00', '2020-11-30', '00:00:00', 'Cancelled', 'Bradley Farrell', '+1 (576) 504-4657', 'zuhafiq@mailinator.com', 'Duis aliqua Qui lor'),
(2, 'Best Burger', '4.00', 4, '16.00', '2020-11-30', '00:00:00', 'Delivered', 'Kelly Dillard', '+1 (908) 914-3106', 'fexekihor@mailinator.com', 'Incidunt ipsum ad d'),
(3, 'Mixed Pizza', '10.00', 2, '20.00', '2020-11-30', '00:00:00', 'On Delivery', 'Jana Bush', '+1 (562) 101-2028', 'tydujy@mailinator.com', 'Minima iure ducimus'),
(4, 'Sed ipsum cillum in', '52.00', 1, '52.00', '2022-12-26', '00:00:00', 'Ordered', '128888', ' 2222222221', '2@qq', '1'),
(5, 'Sed ipsum cillum in', '52.00', 1, '52.00', '2022-12-26', '00:00:00', 'Ordered', '128888', '2222222221', '2@qq', '1'),
(6, 'Best Burger', '4.00', 3, '12.00', '2022-12-26', '00:00:00', 'Delivered', '00', '00', '00@wdf', '12'),
(7, 'เบอร์เกอร์ที่ดีที่สุด', '4.00', 1, '4.00', '2022-12-30', '508', 'Ordered', 'สสส', '1', 'tese@hmsik.vo', '11'),
(8, 'เบอร์เกอร์ที่ดีที่สุด', '4.00', 1, '4.00', '2022-12-30', '2022-30-12 05:11:59', 'Ordered', '2', '2', 'tese@hmsik.vo', '2'),
(9, 'เกี๊ยวพิเศษ', '5.00', 1, '5.00', '2022-12-30', '2022-30-12 05:13:18', 'Ordered', 'oo', '111', 'tese@hmsik.vo', '1'),
(10, 'เบอร์เกอร์ที่ดีที่สุด', '4.00', 1, '4.00', '2022-12-30', '2022-30-12 12:18:21', 'Ordered', '3', '33', 'tese@hmsik.vo', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
