-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 10, 2024 at 07:56 PM
-- Server version: 10.6.16-MariaDB-log
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `themoons_xber`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `prefix` varchar(10) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `bnum` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `origin_num` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`prefix`, `fname`, `lname`, `bnum`, `created_at`, `updated_at`, `origin_num`) VALUES
('นาย', 'วิ่งจับ', 'ขับฟีโน่หนี', 'xxx-xxx-xxxx', '2023-02-11 07:48:46', '2023-02-13 12:32:56', 'XXXXXXXXXX');

-- --------------------------------------------------------

--
-- Table structure for table `boxlog`
--

CREATE TABLE `boxlog` (
  `id` int(11) NOT NULL,
  `date` datetime(2) NOT NULL,
  `username` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `prize_name` varchar(255) NOT NULL,
  `uid` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `box_product`
--

CREATE TABLE `box_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `img` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `percent` int(3) NOT NULL DEFAULT 100,
  `salt_prize` varchar(255) NOT NULL DEFAULT 'ไม่ได้รับรางวัล',
  `c_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `box_stock`
--

CREATE TABLE `box_stock` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` int(3) NOT NULL,
  `p_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `id` int(11) NOT NULL,
  `link` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`id`, `link`) VALUES
(9, 'https://cdn.discordapp.com/attachments/1205479084696797184/1205485543010467870/20230519_014829_copy.jpg?ex=65d88ae6&is=65c615e6&hm=d7db479208a654343d856ce74be32c40a2e4fd7494f1b549d358695f2ce0150f&');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crecom`
--

CREATE TABLE `crecom` (
  `recom_1` int(11) NOT NULL DEFAULT 0,
  `recom_2` int(11) NOT NULL DEFAULT 0,
  `recom_3` int(11) NOT NULL DEFAULT 0,
  `recom_4` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kbank_trans`
--

CREATE TABLE `kbank_trans` (
  `id` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `date` datetime(2) NOT NULL,
  `sender` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recom`
--

CREATE TABLE `recom` (
  `recom_1` int(11) NOT NULL DEFAULT 0,
  `recom_2` int(11) NOT NULL DEFAULT 0,
  `recom_3` int(11) NOT NULL DEFAULT 0,
  `recom_4` int(11) NOT NULL DEFAULT 0,
  `recom_5` int(11) NOT NULL DEFAULT 0,
  `recom_6` int(11) NOT NULL DEFAULT 0,
  `recom_7` int(11) NOT NULL DEFAULT 0,
  `recom_8` int(11) NOT NULL DEFAULT 0,
  `recom_9` int(11) NOT NULL DEFAULT 0,
  `recom_10` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recom`
--

INSERT INTO `recom` (`recom_1`, `recom_2`, `recom_3`, `recom_4`, `recom_5`, `recom_6`, `recom_7`, `recom_8`, `recom_9`, `recom_10`) VALUES
(51, 51, 51, 51, 51, 51, 51, 51, 51, 51);

-- --------------------------------------------------------

--
-- Table structure for table `redeem`
--

CREATE TABLE `redeem` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `max_count` int(11) NOT NULL,
  `prize` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `redeem`
--

INSERT INTO `redeem` (`id`, `code`, `count`, `max_count`, `prize`) VALUES
(7, 'Namo', 1, 1, 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `redeem_his`
--

CREATE TABLE `redeem_his` (
  `id` int(11) NOT NULL,
  `uid` varchar(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date` datetime(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `wallet` varchar(255) NOT NULL,
  `fee` enum('on','off') NOT NULL DEFAULT 'off',
  `name` varchar(255) NOT NULL,
  `ann` varchar(255) NOT NULL,
  `main_color` varchar(255) NOT NULL,
  `sec_color` varchar(255) NOT NULL,
  `discord` varchar(255) NOT NULL,
  `widget_discord` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `date` datetime(2) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `bg2` varchar(255) NOT NULL DEFAULT 'https://somoskudasai.com/wp-content/uploads/2022/11/portada_k-on-16.jpg',
  `bg3` varchar(255) NOT NULL,
  `webhook_dc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`wallet`, `fee`, `name`, `ann`, `main_color`, `sec_color`, `discord`, `widget_discord`, `facebook`, `des`, `date`, `ip`, `logo`, `bg2`, `bg3`, `webhook_dc`) VALUES
('0624760173', 'off', 'THEMOON STORE', 'THEMOON DEV เว็บนี้ขาย 100 บาทจ้าาา', '#88c9f1', '#0084ff', 'https://discord.gg/U87ZQ7bE', '1111111111111', 'https://www.facebook.com/dx.2005.17', 'เว็บขายแอพพรีเมียมถูกที่สุด!!!', '2022-12-25 12:30:39.00', '::1', 'https://cdn.discordapp.com/attachments/1160578369688195105/1205458761897222204/Minimalist_Digital_Service_Developer_Logo_1.png?ex=65d871f5&is=65c5fcf5&hm=5c1f02d7b63a2074eff516e0cbde3d2de1733c59025339c0ba3ac098c1939c8c&', 'https://cdn.discordapp.com/attachments/1160578369688195105/1205462753473732628/360_F_316993729_luly2isTtUxnQYt7j8P3obf0j5lzAn3l.jpg?ex=65d875ac&is=65c600ac&hm=6a7778022aea0b8dca72f7a3208eecea570cff4720374cae47ed5cc0c085b852&', 'undefined', 'https://discord.com/api/webhooks');

-- --------------------------------------------------------

--
-- Table structure for table `static`
--

CREATE TABLE `static` (
  `s_count` int(11) NOT NULL DEFAULT 2575,
  `b_count` int(11) NOT NULL DEFAULT 3525,
  `m_count` int(11) NOT NULL DEFAULT 5468,
  `last_change` datetime(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `static`
--

INSERT INTO `static` (`s_count`, `b_count`, `m_count`, `last_change`) VALUES
(5, 10, 1, '2023-04-12 18:03:59.00');

-- --------------------------------------------------------

--
-- Table structure for table `stock_wheel`
--

CREATE TABLE `stock_wheel` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `p_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_wheel`
--

INSERT INTO `stock_wheel` (`id`, `username`, `p_id`) VALUES
(60, 'เกลือ~ ', '3'),
(61, 'เกลือ', '3'),
(62, 'เกลืออีกแย้ว', '3'),
(63, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(64, 'เกลืออีกแล้วง่ะ', '3'),
(65, 'เกลือ~ ', '3'),
(66, 'เกลือ', '3'),
(67, 'เกลืออีกแย้ว', '3'),
(68, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(69, 'เกลืออีกแล้วง่ะ', '3'),
(70, 'เกลือ~ ', '3'),
(71, 'เกลือ', '3'),
(72, 'เกลืออีกแย้ว', '3'),
(73, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(74, 'เกลืออีกแล้วง่ะ', '3'),
(75, 'เกลือ~ ', '3'),
(76, 'เกลือ', '3'),
(77, 'เกลืออีกแย้ว', '3'),
(78, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(79, 'เกลืออีกแล้วง่ะ', '3'),
(80, 'เกลือ~ ', '3'),
(81, 'เกลือ', '3'),
(82, 'เกลืออีกแย้ว', '3'),
(83, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(84, 'เกลืออีกแล้วง่ะ', '3'),
(85, 'เกลือ~ ', '3'),
(86, 'เกลือ', '3'),
(87, 'เกลืออีกแย้ว', '3'),
(88, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(89, 'เกลืออีกแล้วง่ะ', '3'),
(90, 'เกลือ~ ', '3'),
(91, 'เกลือ', '3'),
(92, 'เกลืออีกแย้ว', '3'),
(93, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(94, 'เกลืออีกแล้วง่ะ', '3'),
(95, 'เกลือ~ ', '3'),
(96, 'เกลือ', '3'),
(97, 'เกลืออีกแย้ว', '3'),
(98, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(99, 'เกลืออีกแล้วง่ะ', '3'),
(100, 'เกลือ~ ', '3'),
(101, 'เกลือ', '3'),
(102, 'เกลืออีกแย้ว', '3'),
(103, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(104, 'เกลืออีกแล้วง่ะ', '3'),
(105, 'เกลือ~ ', '3'),
(106, 'เกลือ', '3'),
(107, 'เกลืออีกแย้ว', '3'),
(108, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(109, 'เกลืออีกแล้วง่ะ', '3'),
(110, 'เกลือ~ ', '3'),
(111, 'เกลือ', '3'),
(112, 'เกลืออีกแย้ว', '3'),
(113, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(114, 'เกลืออีกแล้วง่ะ', '3'),
(115, 'เกลือ~ ', '3'),
(116, 'เกลือ', '3'),
(117, 'เกลืออีกแย้ว', '3'),
(118, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(119, 'เกลืออีกแล้วง่ะ', '3'),
(120, 'เกลือ~ ', '3'),
(121, 'เกลือ', '3'),
(122, 'เกลืออีกแย้ว', '3'),
(123, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(124, 'เกลืออีกแล้วง่ะ', '3'),
(125, 'เกลือ~ ', '3'),
(126, 'เกลือ', '3'),
(127, 'เกลืออีกแย้ว', '3'),
(128, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(129, 'เกลืออีกแล้วง่ะ', '3'),
(130, 'เกลือ~ ', '3'),
(131, 'เกลือ', '3'),
(132, 'เกลืออีกแย้ว', '3'),
(133, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(134, 'เกลืออีกแล้วง่ะ', '3'),
(135, 'เกลือ~ ', '3'),
(136, 'เกลือ', '3'),
(137, 'เกลืออีกแย้ว', '3'),
(138, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(139, 'เกลืออีกแล้วง่ะ', '3'),
(140, 'เกลือ~ ', '3'),
(141, 'เกลือ', '3'),
(142, 'เกลืออีกแย้ว', '3'),
(143, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(144, 'เกลืออีกแล้วง่ะ', '3'),
(145, 'เกลือ~ ', '3'),
(146, 'เกลือ', '3'),
(147, 'เกลืออีกแย้ว', '3'),
(148, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '3'),
(149, 'เกลืออีกแล้วง่ะ', '3'),
(178, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(179, 'เกลืออีกแล้วง่ะ', '5'),
(180, 'เกลือ~ ', '5'),
(181, 'เกลือ', '5'),
(182, 'เกลืออีกแย้ว', '5'),
(183, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(184, 'เกลืออีกแล้วง่ะ', '5'),
(185, 'เกลือ~ ', '5'),
(186, 'เกลือ', '5'),
(187, 'เกลืออีกแย้ว', '5'),
(188, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(189, 'เกลืออีกแล้วง่ะ', '5'),
(190, 'เกลือ~ ', '5'),
(191, 'เกลือ', '5'),
(192, 'เกลืออีกแย้ว', '5'),
(193, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(194, 'เกลืออีกแล้วง่ะ', '5'),
(195, 'เกลือ~ ', '5'),
(196, 'เกลือ', '5'),
(197, 'เกลืออีกแย้ว', '5'),
(198, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(199, 'เกลืออีกแล้วง่ะ', '5'),
(200, 'เกลือ~ ', '5'),
(201, 'เกลือ', '5'),
(202, 'เกลืออีกแย้ว', '5'),
(203, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(204, 'เกลืออีกแล้วง่ะ', '5'),
(205, 'เกลือ~ ', '5'),
(206, 'เกลือ', '5'),
(207, 'เกลืออีกแย้ว', '5'),
(208, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(209, 'เกลืออีกแล้วง่ะ', '5'),
(210, 'เกลือ~ ', '5'),
(211, 'เกลือ', '5'),
(212, 'เกลืออีกแย้ว', '5'),
(213, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(214, 'เกลืออีกแล้วง่ะ', '5'),
(215, 'เกลือ~ ', '5'),
(216, 'เกลือ', '5'),
(217, 'เกลืออีกแย้ว', '5'),
(218, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(219, 'เกลืออีกแล้วง่ะ', '5'),
(220, 'เกลือ~ ', '5'),
(221, 'เกลือ', '5'),
(222, 'เกลืออีกแย้ว', '5'),
(223, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(224, 'เกลืออีกแล้วง่ะ', '5'),
(225, 'เกลือ~ ', '5'),
(226, 'เกลือ', '5'),
(227, 'เกลืออีกแย้ว', '5'),
(228, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(229, 'เกลืออีกแล้วง่ะ', '5'),
(230, 'เกลือ~ ', '5'),
(231, 'เกลือ', '5'),
(232, 'เกลืออีกแย้ว', '5'),
(233, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(234, 'เกลืออีกแล้วง่ะ', '5'),
(235, 'เกลือ~ ', '5'),
(236, 'เกลือ', '5'),
(237, 'เกลืออีกแย้ว', '5'),
(238, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(239, 'เกลืออีกแล้วง่ะ', '5'),
(240, 'เกลือ~ ', '5'),
(241, 'เกลือ', '5'),
(242, 'เกลืออีกแย้ว', '5'),
(243, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(244, 'เกลืออีกแล้วง่ะ', '5'),
(245, 'เกลือ~ ', '5'),
(246, 'เกลือ', '5'),
(247, 'เกลืออีกแย้ว', '5'),
(248, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(249, 'เกลืออีกแล้วง่ะ', '5'),
(250, 'เกลือ~ ', '5'),
(251, 'เกลือ', '5'),
(252, 'เกลืออีกแย้ว', '5'),
(253, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(254, 'เกลืออีกแล้วง่ะ', '5'),
(255, 'เกลือ~ ', '5'),
(256, 'เกลือ', '5'),
(257, 'เกลืออีกแย้ว', '5'),
(258, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(259, 'เกลืออีกแล้วง่ะ', '5'),
(260, 'เกลือ~ ', '5'),
(261, 'เกลือ', '5'),
(262, 'เกลืออีกแย้ว', '5'),
(263, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(264, 'เกลืออีกแล้วง่ะ', '5'),
(265, 'เกลือ~ ', '5'),
(266, 'เกลือ', '5'),
(267, 'เกลืออีกแย้ว', '5'),
(268, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(269, 'เกลืออีกแล้วง่ะ', '5'),
(270, 'เกลือ~ ', '5'),
(271, 'เกลือ', '5'),
(272, 'เกลืออีกแย้ว', '5'),
(273, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(274, 'เกลืออีกแล้วง่ะ', '5'),
(275, 'เกลือ~ ', '5'),
(276, 'เกลือ', '5'),
(277, 'เกลืออีกแย้ว', '5'),
(278, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(279, 'เกลืออีกแล้วง่ะ', '5'),
(280, 'เกลือ~ ', '5'),
(281, 'เกลือ', '5'),
(282, 'เกลืออีกแย้ว', '5'),
(283, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(284, 'เกลืออีกแล้วง่ะ', '5'),
(285, 'เกลือ~ ', '5'),
(286, 'เกลือ', '5'),
(287, 'เกลืออีกแย้ว', '5'),
(288, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(289, 'เกลืออีกแล้วง่ะ', '5'),
(290, 'เกลือ~ ', '5'),
(291, 'เกลือ', '5'),
(292, 'เกลืออีกแย้ว', '5'),
(293, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(294, 'เกลืออีกแล้วง่ะ', '5'),
(295, 'เกลือ~ ', '5'),
(296, 'เกลือ', '5'),
(297, 'เกลืออีกแย้ว', '5'),
(298, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(299, 'เกลืออีกแล้วง่ะ', '5'),
(300, 'เกลือ~ ', '5'),
(301, 'เกลือ', '5'),
(302, 'เกลืออีกแย้ว', '5'),
(303, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(304, 'เกลืออีกแล้วง่ะ', '5'),
(305, 'เกลือ~ ', '5'),
(306, 'เกลือ', '5'),
(307, 'เกลืออีกแย้ว', '5'),
(308, 'ขอบคุณสำหรับค่าขนมแมวเลีย', '5'),
(309, 'เกลืออีกแล้วง่ะ', '5'),
(311, 'เงิน 20 บาท💰', '4'),
(312, 'เงิน 20 บาท💰', '4'),
(313, 'เงิน 20 บาท💰', '4'),
(314, 'เงิน 20 บาท💰', '4'),
(315, 'เงิน 20 บาท💰', '4'),
(316, 'เงิน 20 บาท💰', '4'),
(317, 'เงิน 20 บาท💰', '4'),
(318, 'เงิน 20 บาท💰', '4'),
(319, 'เงิน 20 บาท💰', '4'),
(320, 'เงิน 20 บาท💰', '4'),
(321, 'เงิน 20 บาท💰', '4'),
(322, 'เงิน 20 บาท💰', '4'),
(323, 'เงิน 20 บาท💰', '4'),
(324, 'เงิน 20 บาท💰', '4'),
(325, 'เงิน 20 บาท💰', '4'),
(326, 'เงิน 20 บาท💰', '4'),
(327, 'เงิน 20 บาท💰', '4'),
(338, 'เงิน 30 บาท💰', '6'),
(339, 'เงิน 30 บาท💰', '6'),
(340, 'เงิน 30 บาท💰', '6'),
(341, 'เงิน 30 บาท💰', '6'),
(342, 'เงิน 30 บาท💰', '6'),
(343, 'เงิน 30 บาท💰', '7'),
(344, 'เงิน 30 บาท💰', '7'),
(345, 'เงิน 30 บาท💰', '7'),
(346, 'เงิน 30 บาท💰', '7'),
(347, 'เงิน 30 บาท💰', '7'),
(348, 'เงิน 30 บาท💰', '7'),
(349, 'เงิน 30 บาท💰', '7'),
(350, 'เงิน 30 บาท💰', '7'),
(351, 'เงิน 30 บาท💰', '7'),
(352, 'เงิน 30 บาท💰', '7'),
(353, 'เงิน 30 บาท💰', '7'),
(354, 'เงิน 30 บาท💰', '7'),
(357, 'ควยยยย', '9'),
(358, 'ควยยย', '9'),
(359, 'ควยย', '9'),
(362, '1', '8'),
(363, '1', '8'),
(366, '1', '15'),
(367, '1', '16'),
(368, '1', '14'),
(369, '1', '13');

-- --------------------------------------------------------

--
-- Table structure for table `topup_his`
--

CREATE TABLE `topup_his` (
  `id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `amount` int(20) NOT NULL,
  `date` datetime NOT NULL,
  `uid` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `point` float NOT NULL,
  `total` float NOT NULL,
  `pin` varchar(6) NOT NULL,
  `rank` int(1) NOT NULL DEFAULT 0,
  `imglogo` varchar(255) DEFAULT 'https://cdn.discordapp.com/attachments/1160578369688195105/1205458761897222204/Minimalist_Digital_Service_Developer_Logo_1.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `date`, `point`, `total`, `pin`, `rank`, `imglogo`) VALUES
(15, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2024-02-09', 10600, 2000, '', 1, 'https://cdn.discordapp.com/attachments/1160578369688195105/1205458761897222204/Minimalist_Digital_Service_Developer_Logo_1.png'),
(16, 'test666', 'fbb2b408b46ae729f4896f41f79ec758', '2024-02-09', 0, 0, '', 0, 'https://cdn.discordapp.com/attachments/1160578369688195105/1205458761897222204/Minimalist_Digital_Service_Developer_Logo_1.png'),
(17, 'Bangnus', '854d428395eaa9e5bb2a9b035f2776dd', '2024-02-10', 0, 0, '', 0, 'https://cdn.discordapp.com/attachments/1160578369688195105/1205458761897222204/Minimalist_Digital_Service_Developer_Logo_1.png'),
(18, 'Ktest', 'e10adc3949ba59abbe56e057f20f883e', '2024-02-10', 0, 0, '', 0, 'https://cdn.discordapp.com/attachments/1160578369688195105/1205458761897222204/Minimalist_Digital_Service_Developer_Logo_1.png'),
(19, 'm0236', '9bc322dfa8fe3243301c7f1bf9805304', '2024-02-10', 0, 0, '', 0, 'https://cdn.discordapp.com/attachments/1160578369688195105/1205458761897222204/Minimalist_Digital_Service_Developer_Logo_1.png'),
(20, 'SPY', '26603be432851b073017db0d4b5f549d', '2024-02-10', 0, 0, '', 0, 'https://cdn.discordapp.com/attachments/1160578369688195105/1205458761897222204/Minimalist_Digital_Service_Developer_Logo_1.png');

-- --------------------------------------------------------

--
-- Table structure for table `wheel`
--

CREATE TABLE `wheel` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wheel`
--

INSERT INTO `wheel` (`id`, `name`, `price`, `img`) VALUES
(5, 'สุ่มตัวALL STAR', 1, 'https://cdn.discordapp.com/attachments/1121083158197182495/1121083239331807233/a4f5045f89fd4574d59534b42e141465.jpg'),
(7, 'สุ่มเงินน', 1, 'https://cdn.discordapp.com/attachments/1121083158197182495/1121083248240504872/e55052356134580a010a37cadf756a67.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wheel_item`
--

CREATE TABLE `wheel_item` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `percent` int(3) NOT NULL DEFAULT 100,
  `w_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wheel_item`
--

INSERT INTO `wheel_item` (`id`, `name`, `img`, `percent`, `w_id`) VALUES
(12, 'เกลือออ', 'https://cdn.discordapp.com/attachments/1121083158197182495/1121273855391043604/59360b2d5a6567891a8f1823dbdbc285.jpg', 75, 5),
(16, '20บาท', 'https://cdn.discordapp.com/attachments/1121083158197182495/1121756975768809512/received_182331937855503.jpg', 50, 5),
(17, 'เกลืออ', 'https://cdn.discordapp.com/attachments/1121083158197182495/1121273855391043604/59360b2d5a6567891a8f1823dbdbc285.jpg', 70, 5),
(18, 'ชาโด้', 'https://cdn.discordapp.com/attachments/1121083158197182495/1121756945867616317/received_1482303832313520.jpg', 15, 5),
(19, 'เกลือ', 'https://cdn.discordapp.com/attachments/1121083158197182495/1121273855391043604/59360b2d5a6567891a8f1823dbdbc285.jpg', 70, 5),
(20, 'ดาบิ', 'https://cdn.discordapp.com/attachments/1121083158197182495/1121756917396672522/received_659863445956719.jpg', 35, 5),
(21, 'เกลือ', 'https://cdn.discordapp.com/attachments/1121083158197182495/1121273855391043604/59360b2d5a6567891a8f1823dbdbc285.jpg', 70, 5),
(22, 'ซาโบ้', 'https://cdn.discordapp.com/attachments/1121083158197182495/1121756894332198972/received_221647064084009.jpg', 30, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boxlog`
--
ALTER TABLE `boxlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `box_product`
--
ALTER TABLE `box_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `box_stock`
--
ALTER TABLE `box_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `kbank_trans`
--
ALTER TABLE `kbank_trans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `redeem`
--
ALTER TABLE `redeem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `redeem_his`
--
ALTER TABLE `redeem_his`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_wheel`
--
ALTER TABLE `stock_wheel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topup_his`
--
ALTER TABLE `topup_his`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wheel`
--
ALTER TABLE `wheel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wheel_item`
--
ALTER TABLE `wheel_item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boxlog`
--
ALTER TABLE `boxlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2279;

--
-- AUTO_INCREMENT for table `box_product`
--
ALTER TABLE `box_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `box_stock`
--
ALTER TABLE `box_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kbank_trans`
--
ALTER TABLE `kbank_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `redeem`
--
ALTER TABLE `redeem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `redeem_his`
--
ALTER TABLE `redeem_his`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `stock_wheel`
--
ALTER TABLE `stock_wheel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

--
-- AUTO_INCREMENT for table `topup_his`
--
ALTER TABLE `topup_his`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wheel`
--
ALTER TABLE `wheel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wheel_item`
--
ALTER TABLE `wheel_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
