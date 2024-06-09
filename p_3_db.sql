-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2024 at 04:47 AM
-- Server version: 8.0.36-2ubuntu3
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `p_3`
--

-- --------------------------------------------------------

--
-- Table structure for table `archives`
--

CREATE TABLE `archives` (
  `ID` int NOT NULL,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `qty` int NOT NULL,
  `borrow_date` datetime NOT NULL,
  `return_date` datetime NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `archives`
--

INSERT INTO `archives` (`ID`, `user_id`, `item_id`, `qty`, `borrow_date`, `return_date`, `created_date`) VALUES
(6, 1, 6, 1, '2023-11-05 00:00:00', '2023-11-12 00:00:00', '2024-06-09 03:36:00'),
(7, 2, 2, 1, '2023-11-15 00:00:00', '2023-11-25 00:00:00', '2024-06-09 03:36:04'),
(8, 2, 7, 1, '2023-12-01 00:00:00', '2023-12-08 00:00:00', '2024-06-09 03:36:07'),
(9, 1, 3, 1, '2023-12-15 00:00:00', '2023-12-22 00:00:00', '2024-06-09 03:36:10'),
(10, 4, 8, 1, '2023-12-10 00:00:00', '2023-12-20 00:00:00', '2024-06-09 03:36:14'),
(11, 5, 2, 1, '2024-02-01 00:00:00', '2024-02-10 00:00:00', '2024-06-09 03:36:17'),
(12, 4, 4, 1, '2024-03-15 00:00:00', '2024-03-25 00:00:00', '2024-06-09 03:36:21'),
(13, 3, 8, 1, '2024-01-05 00:00:00', '2024-01-15 00:00:00', '2024-06-09 03:36:24'),
(14, 5, 7, 1, '2024-02-15 00:00:00', '2024-02-25 00:00:00', '2024-06-09 03:36:26'),
(15, 3, 2, 2, '2024-02-10 00:00:00', '2024-02-20 00:00:00', '2024-06-09 03:36:30'),
(16, 5, 1, 1, '2024-04-10 00:00:00', '2024-04-20 00:00:00', '2024-06-09 03:36:33'),
(17, 3, 3, 1, '2024-01-10 00:00:00', '2024-01-20 00:00:00', '2024-06-09 03:36:36'),
(18, 2, 5, 1, '2024-01-20 00:00:00', '2024-01-27 00:00:00', '2024-06-09 03:36:39'),
(19, 1, 4, 1, '2024-01-20 00:00:00', '2024-02-01 00:00:00', '2024-06-09 03:36:42'),
(20, 1, 1, 1, '2024-06-19 00:00:00', '2024-06-28 00:00:00', '2024-06-09 04:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ID` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_qty` int NOT NULL,
  `image` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ID`, `name`, `stock_qty`, `image`) VALUES
(1, 'โน็ตบุ๊ค HP Pavilion', 7, 'https://images-ext-1.discordapp.net/external/MCWh5SjcCLWMpLmWHwm0T7yc8TfdOMlm86uXz51Wek8/https/www.jib.co.th/img_master/product/original/20190903175958_35046_287_1.jpg?format=webp&width=905&height=905'),
(2, 'เมาส์ปากกา Walcom', 38, 'https://media-cdn.bnn.in.th/38578/4949268706124-3-square_medium.jpg'),
(3, 'กล้องถ่ายรูป', 1, 'https://images-ext-1.discordapp.net/external/7Nj4q2KhmZ2jwRF7xbksL79UVpkPjtH8sppKJ-955QY/https/www.zoomcamera.net/wp-content/uploads/2018/11/Nikon-D5600-1.jpg?format=webp&width=905&height=905'),
(4, 'Memory Card สำหรับกล้องถ่ายรูป', 3, 'https://images-ext-1.discordapp.net/external/3VXXxrzwweWCAEgUtvS96UtN_uwpR4UOthXl9QQdNP8/https/www.ec-mall.com/wp-content/uploads/2021/05/SanDisk-Extreme-Pro-SDXC-UHS-II-300MBs-260-MBS-3.jpg?format=webp&width=905&height=905'),
(5, 'เสื้อคลุม ANT', 2, 'https://images-ext-1.discordapp.net/external/ZV0DJULJK5aSVXrlhbU7cIvm2NIqLWXsBcSmJGGoGwk/%3FodnHeight%3D768%26odnWidth%3D768%26odnBg%3DFFFFFF/https/i5.walmartimages.com/seo/LEEy-world-Mens-Jacket-Slim-Fit-Lightweight-Jacket-Casual-Bomber-Jacket-Sportswear-Black-XL_ee446a1e-5564-468a-b64f-4417cd801993.eea5257f326d48576bf8d133d646ee87.jpeg?format=webp&width=905&height=905'),
(6, 'ฉาก Green Screen', 1, 'https://images-ext-1.discordapp.net/external/vEXqpHkC47W76UryK8USeHR_1eAblrzBKieDP6rw5co/%3Fv%3D1653608465/https/topicrentals.co.nz/cdn/shop/products/greenscreen.jpg?format=webp&width=905&height=905'),
(7, 'แว่น VR Oculus Quest 2', 2, 'https://images-ext-1.discordapp.net/external/oc5JeAKLb0cYv6IDx3tZYMNBiLT6MRjDCz8-VwBV8u0/https/i5.walmartimages.com/seo/Meta-Quest-2-Advanced-All-In-One-Virtual-Reality-Headset-256-GB_a3c190a4-4115-4f33-a996-e771be8df2f7.ac98c92791feda09a4d31279631a853a.jpeg?format=webp&width=905&height=905'),
(8, 'ไฟ Studio', 1, 'https://images-ext-1.discordapp.net/external/fuqnwvu4qyCcNIT2tvjf0wrOvc4AzzeUi1jHysF2ACM/%3Fv%3D1596416340/https/cameracommons.ph/cdn/shop/products/S_f590c891-3ab0-4cb5-bd90-7b70dba0099a.jpg?format=webp&width=905&height=905');

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `ID` int NOT NULL,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `qty` int NOT NULL,
  `borrow_date` datetime NOT NULL,
  `return_date` datetime NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`ID`, `user_id`, `item_id`, `qty`, `borrow_date`, `return_date`, `created_date`) VALUES
(21, 4, 8, 1, '2024-06-06 00:00:00', '2024-06-16 00:00:00', '2024-06-09 03:38:56'),
(22, 2, 7, 1, '2024-06-02 00:00:00', '2024-06-18 00:00:00', '2024-06-09 03:39:00'),
(23, 1, 4, 1, '2024-07-01 00:00:00', '2024-07-10 00:00:00', '2024-06-09 03:39:04'),
(24, 5, 6, 1, '2024-06-04 00:00:00', '2024-06-20 00:00:00', '2024-06-09 03:39:07'),
(25, 3, 2, 2, '2024-06-08 00:00:00', '2024-06-25 00:00:00', '2024-06-09 03:39:13'),
(26, 4, 3, 1, '2024-06-01 00:00:00', '2024-06-12 00:00:00', '2024-06-09 03:39:16'),
(27, 2, 1, 1, '2024-06-05 00:00:00', '2024-06-15 00:00:00', '2024-06-09 03:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password_hash`) VALUES
(1, 'Supachai', '52f5b5f0e85922a454bd18a4fc4488a2'),
(2, 'Tanapol', '5f751c221f33ff007809e8f8e10b1460'),
(3, 'Apinya', '457e792b761b2ded2df2ca615c2c4621'),
(4, 'Kamolwan', '55064fadc7a3f5e241f108b7a8a94e1f'),
(5, 'Jitra', '8fe58b141061feff35a62838d89f3c7f');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archives`
--
ALTER TABLE `archives`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archives`
--
ALTER TABLE `archives`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
