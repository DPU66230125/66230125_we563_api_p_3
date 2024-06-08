-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: give-me-names-db
-- Generation Time: Jun 08, 2024 at 03:18 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.17

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
(1, 1, 1, 3, '2024-05-15 21:51:00', '2024-06-05 21:51:00', '2024-06-08 14:51:15'),
(2, 1, 1, 1, '2024-06-08 14:50:31', '2024-06-19 21:50:31', '2024-06-08 15:03:26');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ID` int NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_qty` int NOT NULL,
  `image` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ID`, `name`, `stock_qty`, `image`) VALUES
(1, 'ขาตั้งกล้อง PRO TRIPOD', 6, 'https://www.lomocliplens.com/uploads/product/medium/b9d80671f052de9ec24365adc3290691.jpg'),
(2, 'กล้อง Nikon Z7', 6, 'https://www.ec-mall.com/wp-content/uploads/2018/09/Nikon-Z-7-1.jpg'),
(3, 'แลปท็อป ASUS ROG Strix G17', 8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvJ5lfIS-IuwZTP5SzfbeB5GwCjoMRc9E5wg&s'),
(4, 'เมาส์ไร้สาย Razer Basilisk', 12, 'https://mercular.s3.ap-southeast-1.amazonaws.com/images/products/2022/09/Product/razer-basilisk-v3-pro-wireless-gaming-mouse-front-view.jpg');

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
(2, 1, 3, 1, '2024-06-08 00:00:00', '2024-06-10 00:00:00', '2024-06-08 15:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
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
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
