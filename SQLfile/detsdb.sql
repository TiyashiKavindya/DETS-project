-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2026 at 08:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `detsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL DEFAULT 1,
  `AdminName` varchar(45) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `RoleId`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 1, 'Test', 'admin', '7894561238', 'test@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2021-08-28 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblbudget`
--

CREATE TABLE `tblbudget` (
  `ID` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `BudgetMonth` varchar(7) NOT NULL COMMENT 'Format: YYYY-MM',
  `BudgetAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbudget`
--

INSERT INTO `tblbudget` (`ID`, `UserId`, `CategoryId`, `BudgetMonth`, `BudgetAmount`, `CreatedAt`) VALUES
(1, 2, 6, '2026-01', 150.00, '2026-03-30 18:13:13'),
(2, 2, 14, '2026-01', 30.00, '2026-03-30 18:13:13'),
(3, 2, 7, '2026-01', 50.00, '2026-03-30 18:13:13'),
(4, 2, 11, '2026-01', 20.00, '2026-03-30 18:13:13'),
(5, 2, 10, '2026-01', 50.00, '2026-03-30 18:13:13'),
(6, 2, 6, '2026-02', 150.00, '2026-03-30 18:13:13'),
(7, 2, 14, '2026-02', 30.00, '2026-03-30 18:13:13'),
(8, 2, 7, '2026-02', 50.00, '2026-03-30 18:13:13'),
(9, 2, 11, '2026-02', 20.00, '2026-03-30 18:13:13'),
(10, 2, 10, '2026-02', 30.00, '2026-03-30 18:13:13'),
(11, 2, 6, '2026-03', 150.00, '2026-03-30 18:13:13'),
(12, 2, 14, '2026-03', 30.00, '2026-03-30 18:13:13'),
(13, 2, 7, '2026-03', 50.00, '2026-03-30 18:13:13'),
(14, 2, 11, '2026-03', 25.00, '2026-03-30 18:13:13'),
(15, 2, 10, '2026-03', 50.00, '2026-03-30 18:13:13'),
(16, 3, 6, '2026-01', 130.00, '2026-03-30 18:22:51'),
(17, 3, 13, '2026-01', 60.00, '2026-03-30 18:22:51'),
(18, 3, 11, '2026-01', 25.00, '2026-03-30 18:22:51'),
(19, 3, 10, '2026-01', 40.00, '2026-03-30 18:22:51'),
(20, 3, 15, '2026-01', 30.00, '2026-03-30 18:22:51'),
(21, 3, 6, '2026-02', 130.00, '2026-03-30 18:22:51'),
(22, 3, 13, '2026-02', 20.00, '2026-03-30 18:22:51'),
(23, 3, 11, '2026-02', 30.00, '2026-03-30 18:22:51'),
(24, 3, 10, '2026-02', 15.00, '2026-03-30 18:22:51'),
(25, 3, 15, '2026-02', 30.00, '2026-03-30 18:22:51'),
(26, 3, 6, '2026-03', 150.00, '2026-03-30 18:22:51'),
(27, 3, 13, '2026-03', 50.00, '2026-03-30 18:22:51'),
(28, 3, 11, '2026-03', 30.00, '2026-03-30 18:22:51'),
(29, 3, 10, '2026-03', 25.00, '2026-03-30 18:22:51'),
(30, 3, 15, '2026-03', 30.00, '2026-03-30 18:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `categoryName` varchar(180) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CreatedBy`, `categoryName`, `postingDate`) VALUES
(1, 1, 'Grocery', '2021-09-16 16:45:07'),
(2, 1, 'Electronics', '2021-09-16 16:46:03'),
(3, 1, 'Other', '2021-09-22 05:11:47'),
(5, 1, 'Electricity Bills', '2026-03-30 17:36:05'),
(6, 1, 'Groceries', '2026-03-30 18:13:13'),
(7, 1, 'Transport', '2026-03-30 18:13:13'),
(8, 1, 'Rent', '2026-03-30 18:13:13'),
(9, 1, 'Healthcare', '2026-03-30 18:13:13'),
(10, 1, 'Education', '2026-03-30 18:13:13'),
(11, 1, 'Leisure', '2026-03-30 18:13:13'),
(12, 1, 'Utilities', '2026-03-30 18:13:13'),
(13, 1, 'Clothing', '2026-03-30 18:13:13'),
(14, 1, 'Eating Out', '2026-03-30 18:13:13'),
(15, 1, 'Subscriptions', '2026-03-30 18:13:13');

-- --------------------------------------------------------

--
-- Table structure for table `tblexpense`
--

CREATE TABLE `tblexpense` (
  `ID` int(10) NOT NULL,
  `UserId` int(10) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `PaymentMethodId` int(11) DEFAULT NULL,
  `BudgetId` int(11) DEFAULT NULL,
  `ExpenseDate` date DEFAULT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `ExpenseItem` varchar(200) DEFAULT NULL,
  `Notes` varchar(500) DEFAULT NULL,
  `ExpenseCost` varchar(200) DEFAULT NULL,
  `NoteDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblexpense`
--

INSERT INTO `tblexpense` (`ID`, `UserId`, `CategoryId`, `PaymentMethodId`, `BudgetId`, `ExpenseDate`, `CategoryName`, `ExpenseItem`, `Notes`, `ExpenseCost`, `NoteDate`) VALUES
(1, 1, 1, 1, NULL, '2021-09-19', 'Grocery', 'Tea', NULL, '120', '2021-09-22 16:28:16'),
(2, 1, 2, 1, NULL, '2021-09-19', 'Electronics', 'Mobile', NULL, '10000', '2021-09-22 16:28:39'),
(3, 1, 3, 1, NULL, '2021-09-20', 'Other', 'Test Product', NULL, '100', '2021-09-22 16:31:10'),
(4, 1, 1, 1, NULL, '2021-09-22', 'Grocery', 'Milk', NULL, '25', '2021-09-22 17:34:11'),
(5, 2, 8, 3, NULL, '2026-01-01', 'Rent', 'Monthly rent payment', 'Student apartment January', '450.00', '2026-03-30 18:13:13'),
(6, 2, 6, 1, NULL, '2026-01-03', 'Groceries', 'K-Market weekly shop', 'Weekly groceries', '42.50', '2026-03-30 18:13:13'),
(7, 2, 7, 2, NULL, '2026-01-04', 'Transport', 'Bus monthly pass', 'January bus pass', '35.00', '2026-03-30 18:13:13'),
(8, 2, 10, 2, NULL, '2026-01-05', 'Education', 'Programming textbook', 'Required course material', '38.90', '2026-03-30 18:13:13'),
(9, 2, 6, 1, NULL, '2026-01-08', 'Groceries', 'Lidl weekly shop', '', '28.75', '2026-03-30 18:13:13'),
(10, 2, 14, 2, NULL, '2026-01-10', 'Eating Out', 'Lunch at university cafeteria', '', '8.50', '2026-03-30 18:13:13'),
(11, 2, 12, 3, NULL, '2026-01-12', 'Utilities', 'Phone bill', 'Monthly phone plan', '22.90', '2026-03-30 18:13:13'),
(12, 2, 15, 2, NULL, '2026-01-13', 'Subscriptions', 'Spotify Premium', 'Monthly subscription', '9.99', '2026-03-30 18:13:13'),
(13, 2, 6, 1, NULL, '2026-01-15', 'Groceries', 'K-Market weekly shop', '', '35.20', '2026-03-30 18:13:13'),
(14, 2, 14, 1, NULL, '2026-01-17', 'Eating Out', 'Pizza with friends', 'Friday dinner', '12.00', '2026-03-30 18:13:13'),
(15, 2, 9, 2, NULL, '2026-01-18', 'Healthcare', 'Pharmacy - vitamins', '', '14.50', '2026-03-30 18:13:13'),
(16, 2, 6, 1, NULL, '2026-01-22', 'Groceries', 'Lidl weekly shop', '', '31.40', '2026-03-30 18:13:13'),
(17, 2, 11, 1, NULL, '2026-01-24', 'Leisure', 'Cinema ticket', 'Movie night', '14.00', '2026-03-30 18:13:13'),
(18, 2, 7, 1, NULL, '2026-01-25', 'Transport', 'Taxi home', 'Late night taxi', '11.50', '2026-03-30 18:13:13'),
(19, 2, 6, 1, NULL, '2026-01-28', 'Groceries', 'K-Market weekly shop', '', '39.80', '2026-03-30 18:13:13'),
(20, 2, 14, 2, NULL, '2026-01-30', 'Eating Out', 'Coffee and cake', 'Study break', '6.80', '2026-03-30 18:13:13'),
(21, 2, 13, 2, NULL, '2026-01-31', 'Clothing', 'Winter jacket sale', 'H&M sale', '45.00', '2026-03-30 18:13:13'),
(22, 2, 8, 3, NULL, '2026-02-01', 'Rent', 'Monthly rent payment', 'Student apartment February', '450.00', '2026-03-30 18:13:13'),
(23, 2, 7, 2, NULL, '2026-02-01', 'Transport', 'Bus monthly pass', 'February bus pass', '35.00', '2026-03-30 18:13:13'),
(24, 2, 6, 1, NULL, '2026-02-02', 'Groceries', 'K-Market weekly shop', '', '44.30', '2026-03-30 18:13:13'),
(25, 2, 15, 2, NULL, '2026-02-03', 'Subscriptions', 'Netflix', 'Shared with flatmate', '12.99', '2026-03-30 18:13:13'),
(26, 2, 10, 2, NULL, '2026-02-05', 'Education', 'Printing and stationery', 'Assignment printing', '8.60', '2026-03-30 18:13:13'),
(27, 2, 6, 1, NULL, '2026-02-09', 'Groceries', 'Lidl weekly shop', '', '29.90', '2026-03-30 18:13:13'),
(28, 2, 14, 2, NULL, '2026-02-11', 'Eating Out', 'Valentines dinner', 'Restaurant with partner', '38.00', '2026-03-30 18:13:13'),
(29, 2, 12, 3, NULL, '2026-02-12', 'Utilities', 'Phone bill', 'Monthly phone plan', '22.90', '2026-03-30 18:13:13'),
(30, 2, 15, 2, NULL, '2026-02-13', 'Subscriptions', 'Spotify Premium', 'Monthly subscription', '9.99', '2026-03-30 18:13:13'),
(31, 2, 6, 1, NULL, '2026-02-16', 'Groceries', 'K-Market weekly shop', '', '36.70', '2026-03-30 18:13:13'),
(32, 2, 9, 2, NULL, '2026-02-17', 'Healthcare', 'Doctor visit copay', 'Student health service', '18.00', '2026-03-30 18:13:13'),
(33, 2, 11, 1, NULL, '2026-02-20', 'Leisure', 'Ice skating', 'Winter activity', '9.00', '2026-03-30 18:13:13'),
(34, 2, 6, 1, NULL, '2026-02-23', 'Groceries', 'Lidl weekly shop', '', '33.50', '2026-03-30 18:13:13'),
(35, 2, 14, 1, NULL, '2026-02-25', 'Eating Out', 'Lunch with classmates', '', '10.50', '2026-03-30 18:13:13'),
(36, 2, 10, 2, NULL, '2026-02-26', 'Education', 'Online course subscription', 'Udemy course', '19.99', '2026-03-30 18:13:13'),
(37, 2, 6, 1, NULL, '2026-02-28', 'Groceries', 'K-Market weekly shop', 'Month end top up', '41.20', '2026-03-30 18:13:13'),
(38, 2, 8, 3, NULL, '2026-03-01', 'Rent', 'Monthly rent payment', 'Student apartment March', '450.00', '2026-03-30 18:13:13'),
(39, 2, 7, 2, NULL, '2026-03-01', 'Transport', 'Bus monthly pass', 'March bus pass', '35.00', '2026-03-30 18:13:13'),
(40, 2, 6, 1, NULL, '2026-03-02', 'Groceries', 'K-Market weekly shop', '', '38.90', '2026-03-30 18:13:13'),
(41, 2, 15, 2, NULL, '2026-03-03', 'Subscriptions', 'Spotify Premium', 'Monthly subscription', '9.99', '2026-03-30 18:13:13'),
(42, 2, 10, 2, NULL, '2026-03-04', 'Education', 'Database design book', 'Thesis research material', '42.00', '2026-03-30 18:13:13'),
(43, 2, 12, 3, NULL, '2026-03-05', 'Utilities', 'Internet bill', 'Home broadband', '26.90', '2026-03-30 18:13:13'),
(44, 2, 6, 1, NULL, '2026-03-09', 'Groceries', 'Lidl weekly shop', '', '27.60', '2026-03-30 18:13:13'),
(45, 2, 14, 2, NULL, '2026-03-11', 'Eating Out', 'Lunch at university cafeteria', '', '8.50', '2026-03-30 18:13:13'),
(46, 2, 9, 2, NULL, '2026-03-12', 'Healthcare', 'Pharmacy - cold medicine', '', '11.90', '2026-03-30 18:13:13'),
(47, 2, 12, 3, NULL, '2026-03-12', 'Utilities', 'Phone bill', 'Monthly phone plan', '22.90', '2026-03-30 18:13:13'),
(48, 2, 6, 1, NULL, '2026-03-16', 'Groceries', 'K-Market weekly shop', '', '43.10', '2026-03-30 18:13:13'),
(49, 2, 11, 1, NULL, '2026-03-18', 'Leisure', 'Gym monthly membership', 'Sports centre', '29.90', '2026-03-30 18:13:13'),
(50, 2, 14, 2, NULL, '2026-03-19', 'Eating Out', 'Coffee shop study session', '', '7.20', '2026-03-30 18:13:13'),
(51, 2, 13, 2, NULL, '2026-03-21', 'Clothing', 'Spring shoes', 'Verkkokauppa sale', '52.00', '2026-03-30 18:13:13'),
(52, 2, 6, 1, NULL, '2026-03-23', 'Groceries', 'Lidl weekly shop', '', '31.80', '2026-03-30 18:13:13'),
(53, 2, 7, 1, NULL, '2026-03-25', 'Transport', 'Train to Helsinki', 'Day trip', '24.50', '2026-03-30 18:13:13'),
(54, 2, 14, 2, NULL, '2026-03-26', 'Eating Out', 'Restaurant in Helsinki', 'Day trip lunch', '22.00', '2026-03-30 18:13:13'),
(55, 2, 6, 1, NULL, '2026-03-30', 'Groceries', 'K-Market weekly shop', 'Month end shop', '36.40', '2026-03-30 18:13:13'),
(56, 3, 8, 3, NULL, '2026-01-01', 'Rent', 'Monthly rent payment', 'Student apartment January', '420.00', '2026-03-30 18:22:51'),
(57, 3, 12, 3, NULL, '2026-01-03', 'Utilities', 'Electricity bill', 'Winter heating costs', '34.50', '2026-03-30 18:22:51'),
(58, 3, 6, 1, NULL, '2026-01-05', 'Groceries', 'Prisma weekly shop', '', '52.30', '2026-03-30 18:22:51'),
(59, 3, 10, 2, NULL, '2026-01-07', 'Education', 'University library fine', 'Overdue book', '5.00', '2026-03-30 18:22:51'),
(60, 3, 9, 2, NULL, '2026-01-09', 'Healthcare', 'Gym registration fee', 'New year gym membership', '45.00', '2026-03-30 18:22:51'),
(61, 3, 13, 2, NULL, '2026-01-12', 'Clothing', 'Winter boots', 'Verkkokauppa', '89.90', '2026-03-30 18:22:51'),
(62, 3, 15, 2, NULL, '2026-01-13', 'Subscriptions', 'Adobe Creative Cloud', 'Student discount plan', '29.99', '2026-03-30 18:22:51'),
(63, 3, 7, 2, NULL, '2026-01-14', 'Transport', 'Bus monthly pass', 'January pass', '35.00', '2026-03-30 18:22:51'),
(64, 3, 14, 1, NULL, '2026-01-16', 'Eating Out', 'Sushi restaurant', 'Dinner with friends', '24.50', '2026-03-30 18:22:51'),
(65, 3, 11, 1, NULL, '2026-01-18', 'Leisure', 'Board game cafe', 'Weekend activity', '12.00', '2026-03-30 18:22:51'),
(66, 3, 6, 1, NULL, '2026-01-20', 'Groceries', 'Lidl weekly shop', '', '38.70', '2026-03-30 18:22:51'),
(67, 3, 10, 2, NULL, '2026-01-22', 'Education', 'Design software book', 'Course material', '32.00', '2026-03-30 18:22:51'),
(68, 3, 14, 2, NULL, '2026-01-25', 'Eating Out', 'University cafeteria', '', '9.20', '2026-03-30 18:22:51'),
(69, 3, 11, 1, NULL, '2026-01-27', 'Leisure', 'Museum entry', 'Art exhibition', '8.00', '2026-03-30 18:22:51'),
(70, 3, 6, 1, NULL, '2026-01-29', 'Groceries', 'K-Market top up', '', '22.40', '2026-03-30 18:22:51'),
(71, 3, 8, 3, NULL, '2026-02-01', 'Rent', 'Monthly rent payment', 'Student apartment February', '420.00', '2026-03-30 18:22:51'),
(72, 3, 7, 2, NULL, '2026-02-01', 'Transport', 'Bus monthly pass', 'February pass', '35.00', '2026-03-30 18:22:51'),
(73, 3, 12, 3, NULL, '2026-02-04', 'Utilities', 'Phone bill', 'Monthly plan', '19.90', '2026-03-30 18:22:51'),
(74, 3, 6, 1, NULL, '2026-02-05', 'Groceries', 'Prisma weekly shop', '', '47.80', '2026-03-30 18:22:51'),
(75, 3, 9, 2, NULL, '2026-02-07', 'Healthcare', 'Gym monthly fee', 'Monthly membership', '29.90', '2026-03-30 18:22:51'),
(76, 3, 15, 2, NULL, '2026-02-08', 'Subscriptions', 'Adobe Creative Cloud', 'Monthly subscription', '29.99', '2026-03-30 18:22:51'),
(77, 3, 13, 2, NULL, '2026-02-10', 'Clothing', 'Scarf and gloves', 'H&M sale', '18.50', '2026-03-30 18:22:51'),
(78, 3, 14, 1, NULL, '2026-02-14', 'Eating Out', 'Valentines brunch', 'Special occasion', '32.00', '2026-03-30 18:22:51'),
(79, 3, 6, 1, NULL, '2026-02-16', 'Groceries', 'Lidl weekly shop', '', '41.20', '2026-03-30 18:22:51'),
(80, 3, 11, 2, NULL, '2026-02-18', 'Leisure', 'Bowling night', 'Friends outing', '14.00', '2026-03-30 18:22:51'),
(81, 3, 10, 2, NULL, '2026-02-20', 'Education', 'Printing thesis drafts', 'University print shop', '12.50', '2026-03-30 18:22:51'),
(82, 3, 14, 2, NULL, '2026-02-23', 'Eating Out', 'Coffee and pastry', 'Study session', '7.80', '2026-03-30 18:22:51'),
(83, 3, 6, 1, NULL, '2026-02-26', 'Groceries', 'K-Market top up', '', '29.60', '2026-03-30 18:22:51'),
(84, 3, 11, 1, NULL, '2026-02-28', 'Leisure', 'Spotify concert ticket', 'Live music event', '35.00', '2026-03-30 18:22:51'),
(85, 3, 8, 3, NULL, '2026-03-01', 'Rent', 'Monthly rent payment', 'Student apartment March', '420.00', '2026-03-30 18:22:51'),
(86, 3, 7, 2, NULL, '2026-03-01', 'Transport', 'Bus monthly pass', 'March pass', '35.00', '2026-03-30 18:22:51'),
(87, 3, 9, 2, NULL, '2026-03-03', 'Healthcare', 'Gym monthly fee', 'Monthly membership', '29.90', '2026-03-30 18:22:51'),
(88, 3, 6, 1, NULL, '2026-03-04', 'Groceries', 'Prisma weekly shop', 'Bigger shop this week', '55.30', '2026-03-30 18:22:51'),
(89, 3, 15, 2, NULL, '2026-03-05', 'Subscriptions', 'Adobe Creative Cloud', 'Monthly subscription', '29.99', '2026-03-30 18:22:51'),
(90, 3, 12, 3, NULL, '2026-03-06', 'Utilities', 'Electricity bill', 'Spring rates lower', '28.40', '2026-03-30 18:22:51'),
(91, 3, 10, 2, NULL, '2026-03-08', 'Education', 'Thesis binding and printing', 'Final submission copy', '22.00', '2026-03-30 18:22:51'),
(92, 3, 14, 2, NULL, '2026-03-10', 'Eating Out', 'Lunch with supervisor', 'Thesis meeting', '15.50', '2026-03-30 18:22:51'),
(93, 3, 13, 2, NULL, '2026-03-13', 'Clothing', 'Spring jacket', 'Stockmann sale', '65.00', '2026-03-30 18:22:51'),
(94, 3, 6, 1, NULL, '2026-03-16', 'Groceries', 'Lidl weekly shop', '', '39.90', '2026-03-30 18:22:51'),
(95, 3, 11, 1, NULL, '2026-03-19', 'Leisure', 'Escape room', 'Group activity', '22.00', '2026-03-30 18:22:51'),
(96, 3, 14, 1, NULL, '2026-03-21', 'Eating Out', 'Pizza night', 'Weekend treat', '16.00', '2026-03-30 18:22:51'),
(97, 3, 6, 1, NULL, '2026-03-24', 'Groceries', 'K-Market weekly shop', '', '44.10', '2026-03-30 18:22:51'),
(98, 3, 7, 1, NULL, '2026-03-26', 'Transport', 'Train to Tampere', 'Day trip', '28.50', '2026-03-30 18:22:51'),
(99, 3, 11, 2, NULL, '2026-03-28', 'Leisure', 'Tampere art museum', 'Day trip activity', '10.00', '2026-03-30 18:22:51'),
(100, 3, 6, 1, NULL, '2026-03-30', 'Groceries', 'Prisma month end shop', '', '48.70', '2026-03-30 18:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblexpense_budget`
--

CREATE TABLE `tblexpense_budget` (
  `ID` int(11) NOT NULL,
  `ExpenseId` int(11) NOT NULL,
  `BudgetId` int(11) NOT NULL,
  `AmountUsed` decimal(10,2) NOT NULL DEFAULT 0.00,
  `RecordedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpasswordreset`
--

CREATE TABLE `tblpasswordreset` (
  `ID` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `AdminId` int(11) DEFAULT NULL,
  `Token` varchar(255) NOT NULL,
  `ExpiresAt` datetime NOT NULL,
  `Used` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpaymentmethod`
--

CREATE TABLE `tblpaymentmethod` (
  `ID` int(11) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `MethodName` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpaymentmethod`
--

INSERT INTO `tblpaymentmethod` (`ID`, `CreatedBy`, `MethodName`, `Description`) VALUES
(1, 1, 'Cash', 'Physical cash payment'),
(2, 1, 'Card', 'Debit or credit card'),
(3, 1, 'Bank Transfer', 'Direct bank transfer'),
(4, 1, 'Mobile Pay', 'Mobile payment app');

-- --------------------------------------------------------

--
-- Table structure for table `tblroles`
--

CREATE TABLE `tblroles` (
  `ID` int(11) NOT NULL,
  `RoleName` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblroles`
--

INSERT INTO `tblroles` (`ID`, `RoleName`, `Description`, `CreatedAt`) VALUES
(1, 'Admin', 'System administrator with full access', '2026-03-30 16:53:21'),
(2, 'User', 'Standard user who can track their own expenses', '2026-03-30 16:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `RoleId` int(11) NOT NULL DEFAULT 2,
  `CreatedBy` int(11) DEFAULT NULL,
  `FullName` varchar(150) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `RoleId`, `CreatedBy`, `FullName`, `Email`, `MobileNumber`, `Password`, `RegDate`) VALUES
(1, 2, NULL, 'Test', 'anujk30@gmail.com', '9632587410', 'f925916e2754e5e03f75dd58a5733251', '2021-09-22 16:27:29'),
(2, 2, NULL, 'John Doe', 'jondeo@test.com', '1234567890', 'f925916e2754e5e03f75dd58a5733251', '2021-09-24 01:26:32'),
(3, 2, NULL, 'AKna Dona', 'akna@gmail.com', '0771234567', '067fb963fd279d4b630467e4d3e01a15', '2026-03-30 17:34:17'),
(4, 2, NULL, 'Tiyashi Kavindya', 'tiyashi@student.xamk.fi', '0441234567', '45e4e4668c8838adbea1db8b0d8e4c8a', '2026-03-30 18:13:13'),
(5, 2, NULL, 'Mikael Virtanen', 'mikael@student.xamk.fi', '0449876543', '45e4e4668c8838adbea1db8b0d8e4c8a', '2026-03-30 18:13:13'),
(6, 2, NULL, 'Sofia Korhonen', 'sofia@student.xamk.fi', '0445556677', '45e4e4668c8838adbea1db8b0d8e4c8a', '2026-03-30 18:13:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_admin_role` (`RoleId`);

--
-- Indexes for table `tblbudget`
--
ALTER TABLE `tblbudget`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_budget_user` (`UserId`),
  ADD KEY `fk_budget_category` (`CategoryId`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryName` (`categoryName`),
  ADD KEY `fk_category_admin` (`CreatedBy`);

--
-- Indexes for table `tblexpense`
--
ALTER TABLE `tblexpense`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_expense_category` (`CategoryId`),
  ADD KEY `fk_expense_payment` (`PaymentMethodId`),
  ADD KEY `fk_expense_budget` (`BudgetId`);

--
-- Indexes for table `tblexpense_budget`
--
ALTER TABLE `tblexpense_budget`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_eb_expense` (`ExpenseId`),
  ADD KEY `fk_eb_budget` (`BudgetId`);

--
-- Indexes for table `tblpasswordreset`
--
ALTER TABLE `tblpasswordreset`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Token` (`Token`),
  ADD KEY `fk_pr_user` (`UserId`),
  ADD KEY `fk_pr_admin` (`AdminId`);

--
-- Indexes for table `tblpaymentmethod`
--
ALTER TABLE `tblpaymentmethod`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `MethodName` (`MethodName`),
  ADD KEY `fk_payment_admin` (`CreatedBy`);

--
-- Indexes for table `tblroles`
--
ALTER TABLE `tblroles`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RoleName` (`RoleName`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_user_role` (`RoleId`),
  ADD KEY `fk_user_admin` (`CreatedBy`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbudget`
--
ALTER TABLE `tblbudget`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblexpense`
--
ALTER TABLE `tblexpense`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `tblexpense_budget`
--
ALTER TABLE `tblexpense_budget`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblpasswordreset`
--
ALTER TABLE `tblpasswordreset`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblpaymentmethod`
--
ALTER TABLE `tblpaymentmethod`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblroles`
--
ALTER TABLE `tblroles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD CONSTRAINT `fk_admin_role` FOREIGN KEY (`RoleId`) REFERENCES `tblroles` (`ID`);

--
-- Constraints for table `tblbudget`
--
ALTER TABLE `tblbudget`
  ADD CONSTRAINT `fk_budget_category` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`),
  ADD CONSTRAINT `fk_budget_user` FOREIGN KEY (`UserId`) REFERENCES `tbluser` (`ID`);

--
-- Constraints for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD CONSTRAINT `fk_category_admin` FOREIGN KEY (`CreatedBy`) REFERENCES `tbladmin` (`ID`);

--
-- Constraints for table `tblexpense`
--
ALTER TABLE `tblexpense`
  ADD CONSTRAINT `fk_expense_budget` FOREIGN KEY (`BudgetId`) REFERENCES `tblbudget` (`ID`),
  ADD CONSTRAINT `fk_expense_category` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`),
  ADD CONSTRAINT `fk_expense_payment` FOREIGN KEY (`PaymentMethodId`) REFERENCES `tblpaymentmethod` (`ID`);

--
-- Constraints for table `tblexpense_budget`
--
ALTER TABLE `tblexpense_budget`
  ADD CONSTRAINT `fk_eb_budget` FOREIGN KEY (`BudgetId`) REFERENCES `tblbudget` (`ID`),
  ADD CONSTRAINT `fk_eb_expense` FOREIGN KEY (`ExpenseId`) REFERENCES `tblexpense` (`ID`);

--
-- Constraints for table `tblpasswordreset`
--
ALTER TABLE `tblpasswordreset`
  ADD CONSTRAINT `fk_pr_admin` FOREIGN KEY (`AdminId`) REFERENCES `tbladmin` (`ID`),
  ADD CONSTRAINT `fk_pr_user` FOREIGN KEY (`UserId`) REFERENCES `tbluser` (`ID`);

--
-- Constraints for table `tblpaymentmethod`
--
ALTER TABLE `tblpaymentmethod`
  ADD CONSTRAINT `fk_payment_admin` FOREIGN KEY (`CreatedBy`) REFERENCES `tbladmin` (`ID`);

--
-- Constraints for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD CONSTRAINT `fk_user_admin` FOREIGN KEY (`CreatedBy`) REFERENCES `tbladmin` (`ID`),
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`RoleId`) REFERENCES `tblroles` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
