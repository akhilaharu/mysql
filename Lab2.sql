-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2022 at 04:07 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent_table`
--

CREATE TABLE `agent_table` (
  `agent_id` int(11) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `complaint` varchar(100) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `agent_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_table`
--

CREATE TABLE `employee_table` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(40) DEFAULT NULL,
  `complaint_id` int(11) NOT NULL,
  `complaint` varchar(100) NOT NULL,
  `employee_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `username` varchar(30) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `complaint` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent_table`
--
ALTER TABLE `agent_table`
  ADD PRIMARY KEY (`agent_id`),
  ADD KEY `complaint_id` (`complaint_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `employee_table`
--
ALTER TABLE `employee_table`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `complaint_id` (`complaint_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`complaint_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent_table`
--
ALTER TABLE `agent_table`
  ADD CONSTRAINT `agent_table_ibfk_1` FOREIGN KEY (`complaint_id`) REFERENCES `user_table` (`complaint_id`),
  ADD CONSTRAINT `agent_table_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee_table` (`emp_id`);

--
-- Constraints for table `employee_table`
--
ALTER TABLE `employee_table`
  ADD CONSTRAINT `employee_table_ibfk_1` FOREIGN KEY (`complaint_id`) REFERENCES `user_table` (`complaint_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
