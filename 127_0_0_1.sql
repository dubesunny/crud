-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 09:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud`
--
CREATE DATABASE IF NOT EXISTS `crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud`;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `photo` varchar(90) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `hobby` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `photo`, `email`, `phone`, `hobby`, `gender`, `address`, `added_on`) VALUES
(38, 'Sumit Goswami', '6004_icon-5359553_640.webp', 's@gmail.com', 8866372528, 'cricket', 'male', 'gOMTIPUR', '2024-12-18 07:34:38'),
(46, 'Mitesh', '2231_icon-5359553_640.webp', 'mi@gmail.com', 9876554321, 'cricket', 'male', 'Maninagar', '2024-12-18 08:26:44'),
(47, 'seren', '3499_icon-5359553_640.webp', 'du@gmail.com', 8866372528, 'cricket', 'male', 'Maninagar', '2024-12-18 08:30:48'),
(48, 'Dubey Dharmesh', '2397_icon-5359553_640.webp', 'dd@gmail.com', 9876543234, 'cricket', 'male', 'Maninagar', '2024-12-18 08:37:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- Database: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `password`) VALUES
(1, 'Dharmesh', '123');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(15) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `prod_id`, `prod_qty`, `created_at`) VALUES
(16, 1, 23, 1, '2023-04-22 11:20:17'),
(18, 1, 20, 2, '2023-04-22 11:20:47'),
(20, 2, 18, 4, '2023-04-23 06:26:44'),
(22, 1, 18, 2, '2023-04-24 05:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(5, 'Topwear', 1),
(8, 'Bottomwear', 1),
(24, 'Accessories', 1),
(25, 'Perfumes', 1),
(27, 'cat6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(2, 'Dubey Dharmesh', 'dubeydharmesh171@gmail.com', '8141633911', 'Website not working.', '2023-03-18 06:21:01'),
(7, 'Dubey Dharmesh', 'dp@gmail.com', '8141633911', 'amazing products', '2023-04-21 10:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tracking_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` mediumtext NOT NULL,
  `pincode` int(10) NOT NULL,
  `total_price` int(20) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `tracking_no`, `user_id`, `name`, `email`, `phone`, `address`, `pincode`, `total_price`, `payment_mode`, `payment_id`, `status`, `created_at`) VALUES
(2, 'fashionhub259966372528', 1, 'Dubey Piyush', 'dp@gmail.com', '8866372528', 'testing address', 380026, 30000, 'COD', 0, 1, '2023-03-26 10:50:23'),
(3, 'fashionhub721541633911', 1, 'Dharmesh', 'dd@gmail.com', '8141633911', 'nhvm,kn.', 380026, 30000, 'COD', 0, 1, '2023-03-26 11:01:08'),
(4, 'fashionhub402076998754', 1, 'vishal', 'vish@gmail.com', '9876998754', 'Zfdxg ', 380026, 30000, 'COD', 0, 1, '2023-03-26 11:13:08'),
(5, 'fashionhub478676543211', 1, 'karan', 'kk@gmail.com', '9876543211', 'kgjwdfed', 380026, 30000, 'COD', 0, 1, '2023-03-26 11:16:45'),
(6, 'fashionhub690976998754', 1, 'vishal', 'vish@gmail.com', '9876998754', 'testing address', 380026, 30000, 'COD', 0, 0, '2023-03-26 11:17:46'),
(7, 'fashionhub688341633911', 2, 'Dubey Dharmesh', 'dubeydharmesh171@gmail.com', '8141633911', 'test address', 380026, 500, 'COD', 0, 0, '2023-03-26 14:41:17'),
(8, 'fashionhub384041633911', 1, 'Dubey Dharmesh', 'dubeydharmesh171@gmail.com', '8141633911', 'adsfgdgsgd', 380026, 1000, 'COD', 0, 1, '2023-04-17 16:20:02'),
(9, 'fashionhub436366372528', 1, 'Dubey Dharmesh', 'dd@gmail.com', '8866372528', 'aszdgfxhcszffg', 380026, 500, 'COD', 0, 1, '2023-04-18 10:43:57'),
(10, 'fashionhub658279587289', 3, 'Kamalaben ', 'buddyvishal290@gmail.com', '9979587289', 'dgergdgrtgrtgrtgrtgrtg', 370205, 360, 'COD', 0, 1, '2023-04-24 13:19:40'),
(11, 'fashionhub520576543234', 4, 'Dubey Dharmesh', 'dubeydharmesh171@gmail.com', '9876543234', 'Sukhramnagar', 380021, 120, 'COD', 0, 0, '2024-10-15 04:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(25) NOT NULL,
  `prod_id` int(25) NOT NULL,
  `qty` int(100) NOT NULL,
  `price` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `qty`, `price`, `created_at`) VALUES
(1, 1, 17, 3, 10000, '2023-03-26 10:48:43'),
(2, 2, 17, 3, 10000, '2023-03-26 10:50:23'),
(3, 3, 17, 3, 10000, '2023-03-26 11:01:08'),
(4, 4, 17, 3, 10000, '2023-03-26 11:13:09'),
(5, 5, 17, 3, 10000, '2023-03-26 11:16:45'),
(6, 6, 17, 3, 10000, '2023-03-26 11:17:46'),
(7, 7, 18, 1, 500, '2023-03-26 14:41:17'),
(8, 8, 18, 2, 500, '2023-04-17 16:20:03'),
(9, 9, 18, 1, 500, '2023-04-18 10:43:58'),
(10, 10, 50, 2, 180, '2023-04-24 13:19:40'),
(11, 11, 23, 1, 120, '2024-10-15 04:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `subcategories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_desc` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `subcategories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(14, 5, 10, 'Gucci', 250, 500, 12, '7709479200_hoodies.jpg', 'hoodies', 'hoodies', 'hoodies', 'hoodies', 'hoodies', 1),
(17, 24, 11, 'Apple', 12000, 7000, 8, '425916837_apple1.jpg', 'Apple Watch is a wearable smartwatch that allows users to accomplish a variety of tasks, including making phone calls, sending text messages and reading email.', 'Apple Watch is a line of smartwatches produced by Apple Inc. It incorporates fitness tracking, health-oriented capabilities, and wireless telecommunication, and integrates with iOS and other Apple products and services. The Apple Watch was released in April 2015,[18][19] and quickly became the best-selling wearable device: 4.2 million were sold in the second quarter of fiscal 2015,[20] and more than 101 million people were estimated to use an Apple Watch as of December 2020.', 'i-watches', 'i-watches', 'i-watches', 1),
(18, 5, 8, 'Pattern Blue shirt', 800, 500, 8, '600342762_shirts2.jpg', 'Marvel\r\nRegular Fit / Slim Fit Cutway Collar\r\ncotton\r\nComposition - 100% Cotton', 'Multitude - Multitude has layers, interpreted by leaders only, who search for performers. Similarly, these deigns of cut way colors and square cuffs in vibrant square checks prints of cotton yarns confirm the layers of excellence, added with the fabric with imported. Duro horn buttons, a perfect choice for work-style fashion', 'pattern shirt', 'pattern shirt', 'pattern shirt', 1),
(19, 25, 14, 'DENVER Hamilton', 249, 150, 8, '583217834_41a+KgcHPTL._SY300_SX300_.jpg', 'DENVER Hamilton Gift Set - Perfume (60ML) + Deodorant (165ML) | Long Lasting Perfume Scent for Men', 'DEODORANT - Long-lasting Defense Deo for Men. Safe for use on body and clothes.\r\nPREVENT BODY ODOUR - Stops the development of body odour\r\nATTRACTIVE DEO - You may experience the impression of boundless strength thanks to this superb, powerful fragrance that personifies pure desire.\r\nAROMA - The energizing male fragrance keeps your mood up all day.\r\nKEEPS YOU ENGAGED: Energetic is a pleasant delight that keeps you engaged throughout the whole day longer due to its luxury passionate fragrances. Blow stress and fatigue a long goodbye for each sprinkling!\r\nQAUNTITY - Deo (165ML) + Perfume (60ML)', 'DENVER Hamilton', 'DENVER Hamilton', 'DENVER Hamilton', 1),
(20, 5, 17, 'plain black t-shirt', 249, 180, 8, '991854743_blackt-shirt.jpg', 'London Hills Solid Men Half Sleeve Pure Cotton Round Neck T-Shirt', 'Fit Type: Regular Fit\r\nFabric: Cotton\r\nStyle: Regular\r\nNeck Style: Round Neck\r\nPattern: Striped\r\nSleeve Type: Half Sleeve', 'London Hills Solid Men Half Sleeve Pure Cotton Round Neck T-Shirt', 'London Hills Solid Men Half Sleeve Pure Cotton Round Neck T-Shirt', 'London Hills Solid Men Half Sleeve Pure Cotton Round Neck T-Shirt', 1),
(21, 24, 11, 'Titan', 800, 740, 6, '988069675_titan.jpg', 'Titan Analog Silver Dial Men\'s Watch-NL1584SL03/NP1584SL03', 'Dial Color: Silver, Case Shape: Round, Dial Glass Material: Mineral\r\nBand Color: Brown, Band Material: Leather\r\nWatch Movement Type: Quartz, Watch Display Type: Analog. Moonphase : No\r\nCase Diameter :42mm,Case Length(6H-12H):49.50mm ,Case Width(3H-9H):42mm ,Case Thickness:9mm ,Case Material: Brass\r\nWater Resistance Depth: 50 meters\r\n24 Months manufacturer warranty on manufacturing defects\r\nRemove plastic at crown to start the watch\r\nIdeal for birthday, anniversary and wedding gif', 'Titan Analog Silver Dial Men\'s Watch-NL1584SL03/NP1584SL03', 'Titan Analog Silver Dial Men\'s Watch-NL1584SL03/NP1584SL03', 'Titan Analog Silver Dial Men\'s Watch-NL1584SL03/NP1584SL03', 1),
(22, 25, 15, 'Wild Stone Edge Perfume', 3000, 2500, 12, '472006844_wildstone.jpg', 'Wild Stone Edge Perfume, 100ml', 'Fragrance Family: Woody Marine\r\n\r\nPost bath freshness fragrance\r\n\r\nPerfect casual wear perfume\r\n\r\nApply on pulse points, such as your inner wrists and neck.\r\n\r\nRe-spray if required', 'Wild Stone Edge Perfume, 100ml', 'Wild Stone Edge Perfume, 100ml', 'Wild Stone Edge Perfume, 100ml', 1),
(23, 5, 8, 'Laxeric Casual shirt', 180, 120, 11, '219978563_shirt.jpg', 'Laxeric Casual Shirt for Men|| Shirt for Men|| Men Stylish Shirt || Men Printed Shirt', 'Care Instructions: Dry Clean Only\r\nFit Type: Slim Fit\r\nCare Instructions: Dry Clean Only\r\nFit Type: Regular Fit\r\nShirt for men || casual shirt for men || men stylish shirt || men Printed Shirt\r\nPrinted Shirt, Note : Inner Tshirt and chain not included\r\nStyle - Enhance your look by wearing this Casual Stylish Men\'s shirt, Team it with a pair of tapered denims Or Solid Chinos and Loafers for a fun Smart Casual look\r\nClosure Type: Button; Collar Style: Printed', 'Laxeric Casual Shirt for Men|| Shirt for Men|| Men Stylish Shirt || Men Printed Shirt', 'Laxeric Casual Shirt for Men|| Shirt for Men|| Men Stylish Shirt || Men Printed Shirt', 'Laxeric Casual Shirt for Men|| Shirt for Men|| Men Stylish Shirt || Men Printed Shirt', 1),
(24, 5, 8, 'HammerSmith  Shirt', 150, 110, 20, '739042127_shirt2.jpg', 'HammerSmith Men Casual Shirt', 'Care Instructions: Machine Wash\r\nFit Type: Regular Fit\r\nStyle note: Stylish and trending full sleeve casual shirt for casual & smart casual wear\r\nLook & feel: 100% cotton with soft finish and rich look\r\nProduct elements: Double yoke for extra durability & stiffness; Pocket at chest\r\nWash instructions: Machine wash cold, wash with like colors, tumble dry medium or hang dry in shade, warm iron, turn inside out when washing, do not iron directly on print & embroidery\r\nDisclaimer: product colour may vary due to photographic lighting sources or your display settings', 'HammerSmith Men Casual Shirt', 'HammerSmith Men Casual Shirt', 'HammerSmith Men Casual Shirt', 1),
(25, 5, 8, 'Look Mark', 190, 130, 25, '726857974_shirt3.jpg', 'LookMark Men\'s Poly Cotton Digital Printed Stitched Half Sleeve Shirt', 'Care Instructions: Hand Wash Only\r\nFit Type: Regular Fit\r\nStylish Half sleeve Casual Printed Shirts & Party Wear Casual shirts\r\n100% Premium Poly Cottton, Pre Washed for an extremely soft finish and Rich look\r\nDisclaimer: Product colour may slightly vary due to photographic lighting sources or your monitor settings\r\nModern slim fit ( we have updated our size chart, please refer the size chart for new measurements before ordering)\r\nBreathable : Truly comfortable and easy to wear in every season it is insulating in winter and breathable in summer.', 'LookMark Men\'s Poly Cotton Digital Printed Stitched Half Sleeve Shirt', 'LookMark Men\'s Poly Cotton Digital Printed Stitched Half Sleeve Shirt', 'LookMark Men\'s Poly Cotton Digital Printed Stitched Half Sleeve Shirt', 1),
(26, 5, 8, 'LookMark Rama', 130, 115, 20, '685266225_shirt4.jpg', 'LookMark Men\'s Poly Cotton Digital Printed Half Sleeve Shirt', 'Care Instructions: Hand Wash Only\r\nFit Type: Regular Fit\r\nStylish Full sleeve Casual Shirts & Office Wear Casual shirts\r\n100% Premium Poly Cottton, Pre Washed for an extremely soft finish and Rich look\r\nDisclaimer: Product colour may slightly vary due to photographic lighting sources or your monitor settings\r\nModern slim fit (we have updated our size chart, please refer the size chart for new measurements before ordering)\r\nBreathable : Truly comfortable and easy to wear in every season it is insulating in winter and breathable in summer.', 'LookMark Men\'s Poly Cotton Digital Printed Half Sleeve Shirt', 'LookMark Men\'s Poly Cotton Digital Printed Half Sleeve Shirt', 'LookMark Men\'s Poly Cotton Digital Printed Half Sleeve Shirt', 1),
(27, 5, 8, 'Dennis', 120, 95, 18, '577403117_shirt5.jpg', 'Dennis Lingo Men\'s Checkered Slim fit Casual Shirt', 'Care Instructions: Machine Wash\r\nFit Type: Slim Fit\r\n100% Premium Cottton, Pre Washed for an extremely soft finish and Rich look\r\nStylish Checkered Full Sleeve Casual Shirt\r\nModern Slim Fit ( We have Updated our size chart, please Refer the size chart for new measurements before ordering)\r\nBest for casual & smart casual wear\r\nSize chart - S-38, M-40, L-42, XL-44, XXL-46', 'Dennis Lingo Men\'s Checkered Slim fit Casual Shirt', 'Dennis Lingo Men\'s Checkered Slim fit Casual Shirt', 'Dennis Lingo Men\'s Checkered Slim fit Casual Shirt', 1),
(28, 5, 8, 'Leriya Fashion', 120, 85, 10, '832640823_shirt6.jpg', 'Leriya Fashion Shirts for Men || Rayon Batik Printed Casual Men\'s Shirt || Full Sleeves Hawaiian Regular Fit Men\'s Casual Shirt || Beach || Party || Outing Wear Cool Shirts for Boys', 'Care Instructions: Hand Wash Only\r\nFit Type: Regular Fit\r\nFabric:- Rayon || Color:- Grey || Pattern:- Batik Print || Sleeves:- Full Sleeve || Fit Type:- Regular\r\nPackage Content:- 1 Shirt For Men || Type: Stylish Printed Shirts ( Kota Kam Shirt) || Shirt Length :- Hip Length || Neck:- Hawaiian Collar Design\r\nSize:- Our Shirts Have XS, S, M, L, XL, And XXL Sizes Available. Select as Per Your Requirement\r\nOcassion:- Beach wear, Casual Wear, Office Wear, Party wear, Evening wear, Travelling Wear, Hangout Wear', 'Leriya Fashion Shirts for Men || Rayon Batik Printed Casual Men\'s Shirt || Full Sleeves Hawaiian Regular Fit Men\'s Casual Shirt || Beach || Party || Outing Wear Cool Shirts for Boys', 'Leriya Fashion Shirts for Men || Rayon Batik Printed Casual Men\'s Shirt || Full Sleeves Hawaiian Regular Fit Men\'s Casual Shirt || Beach || Party || Outing Wear Cool Shirts for Boys', 'Leriya Fashion Shirts for Men || Rayon Batik Printed Casual Men\'s Shirt || Full Sleeves Hawaiian Regular Fit Men\'s Casual Shirt || Beach || Party || Outing Wear Cool Shirts for Boys', 1),
(29, 5, 8, 'RK HUB', 150, 120, 20, '845095209_shirt7.jpg', 'RK HUB Men\'s Lycra Cottton Digital Print Casual Shirt', 'Care Instructions: Dry Clean Only\r\nFit Type: Regular Fit\r\nFit Type: Slim; soft, comfy and breathable.\r\nLook trendy and feel comfortable with this Shirt.\r\nThis Shirt will cater a rich in-class and genuine appearance in any kind of ambience and will comfort you with saving time.', 'RK HUB Men\'s Lycra Cottton Digital Print Casual Shirt', 'RK HUB Men\'s Lycra Cottton Digital Print Casual Shirt', 'RK HUB Men\'s Lycra Cottton Digital Print Casual Shirt', 1),
(30, 5, 9, 'Allen Solly', 110, 80, 12, '764672603_ts1.jpg', 'Allen Solly Men\'s Regular Fit Polo', 'Care Instructions: Wash with mild detergent, do not bleach, dry in shade\r\nFit Type: Regular Fit\r\nOccasion : Casual\r\nFit : Regular Fit\r\nMaterial : 60% Cotton and 40% Polyester\r\nNeck : Polo Neck; Pattern : Solid\r\nSleeve Type: Half Sleeve; \r\nCollar Style: Band Collar; Material Composition: 60% Cotton, 40% Polyester; Closure Type: Button', 'Allen Solly Men\'s Regular Fit Polo', 'Allen Solly Men\'s Regular Fit Polo', 'Allen Solly Men\'s Regular Fit Polo', 1),
(31, 5, 9, 'LEOTUDE', 100, 60, 18, '760430028_ts-2.jpg', 'LEOTUDE Cotton Blend Half Sleeve Printed Oversized T-Shirts for Men', 'Care Instructions: Hand Wash Only\r\nFit Type: Regular Fit\r\nFabric: Matty; Neck Style: Polo Neck<br>\r\nSleeve Type: Half Sleeve<br>\r\nPattern : Color Block<br>\r\nColor : Mustard<br>\r\nOccasion Type: Casual; Material Composition: Cotton Blend; Collar Style: Classic Collar', 'LEOTUDE Cotton Blend Half Sleeve Printed Oversized T-Shirts for Men', 'LEOTUDE Cotton Blend Half Sleeve Printed Oversized T-Shirts for Men', 'LEOTUDE Cotton Blend Half Sleeve Printed Oversized T-Shirts for Men', 1),
(32, 5, 9, 'American Crew', 180, 100, 20, '559180767_51igIF8AeJL._UX679_.jpg', 'AMERICAN CREW Men\'s Regular Fit Polos', 'Care Instructions: Machine Wash\r\nFit Type: Regular Fit\r\nRegular Fit Half Sleeve Polo is made of comfortable, Bio Washed cotton-poly pique fabric, a three-button placket, and ribbed cuffs for a classic look.<br>\r\nFabric Composition - Cotton Poly Blend, Bio Wash Pique Fabric.; Pattern - Color Block Color Men’s Polo T-Shirt, Rib Collar & Sleeve for Amazing Fit.<br>\r\nClassic \"American Crew\" Signature Polo with Logo Embroidery on Chest.<br>\r\n“Made In India” by Socially Compliant MSME Factory. All Components Used to make this T-Shirt are Proudly \"Made in India\".<br>\r\nOccasion Type: Casual; Collar Style: Button Down; Material Type: Polycotton; Material Composition: 60% Cotton, 40% Polyester', 'AMERICAN CREW Men\'s Regular Fit Polos', 'AMERICAN CREW Men\'s Regular Fit Polos', 'AMERICAN CREW Men\'s Regular Fit Polos', 1),
(33, 5, 9, 'American polo', 180, 120, 12, '624654691_61n02QV2f9L._UY741_.jpg', 'AMERICAN CREW Polo Collar Cotton Poly Striped T-Shirt for Men', 'Care Instructions: Machine Wash\r\nFit Type: Regular Fit\r\nRegular Fit Half Sleeve Polo is made of comfortable, Bio Washed cotton-poly Jersey fabric, a three-button placket, and ribbed cuffs for a classic look.\r\nFabric Composition – Cotton 60% Poly 40% Blend, Bio Wash Jersey Fabric.\r\nPattern - Striped Men’s Polo Tshirt, Rib Collar & Sleeve for Amazing Fit.\r\nClassic \"American Crew\" Signature Polo with Logo Embroidery on Chest.\r\n“Made In India” by Socially Compliant MSME Factory. All Components Used to make this T-Shirt are Proudly \"Made in India\".', 'AMERICAN CREW Polo Collar Cotton Poly Striped T-Shirt for Men', 'AMERICAN CREW Polo Collar Cotton Poly Striped T-Shirt for Men', 'AMERICAN CREW Polo Collar Cotton Poly Striped T-Shirt for Men', 1),
(34, 5, 9, 'DAMENSCH', 150, 80, 18, '336187383_51vPNwGBvQL._UX569_.jpg', 'DAMENSCH Men’s Regular Fit Half Sleeve Polo T-Shirt | 3 Button Polos for Men', 'Care Instructions: Machine Wash\r\nFit Type: Regular Fit\r\nSuperior Thermoregulation: The Coolmax Eco is a modern all weather thermoregulating fiber tech that allows for great breathability and moisture wicking, thus pulling and drying sweat much faster. This also allows for lesser microbial formation.\r\nFiber from recycled plastic: The Coolmax Eco is how fashion returns to mother earth. It’s not only cool on your body but it’s also made completely from recycled plastic. Thus making it cool on nature too.\r\nButton up : The Constant Polo comes in an accented imitation shell 3-button and 2-button style ending in a sturdy self-fabric collar.\r\nSmoother, Shinier Pique: A Gold Finish to the pique fabric lends the Polo T Shirts a much classier look, with an extra shine and smoothness for more vibrant colour and style.\r\nTested to last 500 Days: Using high grade dyes and superior knitting, the Polos feature long lasting colours that are fade-proof for 500 Days', 'DAMENSCH Men’s Regular Fit Half Sleeve Polo T-Shirt | 3 Button Polos for Men', 'DAMENSCH Men’s Regular Fit Half Sleeve Polo T-Shirt | 3 Button Polos for Men', 'DAMENSCH Men’s Regular Fit Half Sleeve Polo T-Shirt | 3 Button Polos for Men', 1),
(35, 5, 9, 'Veirdo Polo', 249, 120, 12, '959288424_51i84HTi9kL._UX569_.jpg', 'Veirdo Polo T Shirts for Men, Cotton Polo Neck T Shirts for Men, Half Sleeves Men Polo Tshirt, Classic Polo T Shirts for Men, Men\'s Regular Polo Shirt', 'ATTRACTIVE: Pair this polo cotton tshirt for men with jeans for classic everyday look. This stylish & attractive mens t shirts with collar is suitable for all body types. Best collar tshirt for men. We are taking care of your comfortness, this men polo tshirt will provide you highly comfort feeling when wearing it\r\nUSAGE: This attractive stylish aesthetic trendy polo tees for men will make you look attractive and will make you stand out of the crowd. You can wear this polo t shirt for men for going to a party, club, date, casual meetings & will definitely gives you comfort feeling', 'Veirdo Polo T Shirts for Men, Cotton Polo Neck T Shirts for Men, Half Sleeves Men Polo Tshirt, Classic Polo T Shirts for Men, Men\'s Regular Polo Shirt', 'Veirdo Polo T Shirts for Men, Cotton Polo Neck T Shirts for Men, Half Sleeves Men Polo Tshirt, Classic Polo T Shirts for Men, Men\'s Regular Polo Shirt', 'Veirdo Polo T Shirts for Men, Cotton Polo Neck T Shirts for Men, Half Sleeves Men Polo Tshirt, Classic Polo T Shirts for Men, Men\'s Regular Polo Shirt', 1),
(36, 5, 9, 'Alan Jones', 150, 120, 12, '761731261_81DmqRHh-aL._UX679_.jpg', 'Alan Jones Clothing Men\'s Slim Fit Polo T-Shirt', 'Care Instructions: Machine Wash\r\nPattern: Solid; Neck: Collar Neck Polo T-Shirt\r\nFIT: Slim Fit; Closure: Button\r\nSleeves: Half Sleeves, Fabric: Cotton Blend\r\nProudly Made in India, Kindly Check the Size Chart for Perfect Fit\r\nCare Instructions: Wash with mild detergent, do not bleach, dry in shade', 'Alan Jones Clothing Men\'s Slim Fit Polo T-Shirt', 'Alan Jones Clothing Men\'s Slim Fit Polo T-Shirt', 'Alan Jones Clothing Men\'s Slim Fit Polo T-Shirt', 1),
(37, 5, 9, 'BULLMER', 100, 80, 12, '122535120_715TeteH0mL._UY879_.jpg', 'BULLMER Mens Regular Fit Printed Cotton Polo Tshirt', 'Care Instructions: Machine Wash\r\nFit Type: Regular Fit\r\nPremium Quality Printed Cotton Polo Tshirt For Men<br>\r\nTshirt With All Over Printed Design Gives Good Appeal<br>\r\nPair It With Loafers And Blue Jeans To Look Dashing<br>\r\nCollar Style: Round Collar', 'BULLMER Mens Regular Fit Printed Cotton Polo Tshirt', 'BULLMER Mens Regular Fit Printed Cotton Polo Tshirt', 'BULLMER Mens Regular Fit Printed Cotton Polo Tshirt', 1),
(39, 5, 10, 'Avenger  Hoodie', 150, 120, 12, '478376491_61S99Wdk71L._UX569_.jpg', 'More & More Unisex-Adult Cotton Hooded Neck Avenger Printed Hoodie', 'Care Instructions: Machine Wash\r\nFit Type: Regular\r\n<br>Fabric: 100% Cotton<br><br>\r\n<br>Sleeve: Long Sleeve<br>; <br>Neck Style: Hooded<br><br>\r\n<br>Closure: No Closure<br><br>\r\n<br>Pattern: Graphic Print<br><br>\r\nPattern Type: Solid; Fit Type: Regular', 'More & More Unisex-Adult Cotton Hooded Neck Avenger Printed Hoodie', 'More & More Unisex-Adult Cotton Hooded Neck Avenger Printed Hoodie', 'More & More Unisex-Adult Cotton Hooded Neck Avenger Printed Hoodie', 1),
(40, 5, 10, 'Jones', 150, 80, 12, '561928946_61TQiA49VoL._UY741_.jpg', 'Alan Jones Clothing Men\'s Fleece Hooded Hoodie', 'Care Instructions: Machine Wash\r\nFit Type: Regular Fit\r\nComfort & Style : Best Fashionably Comfortable that you have wore till now, Fabric is so soft over the skin. High Fashion rich culture look will get just teaming up with washed jeans.<br>\r\nFabric: 100% Pure Cotton ; Premium Export Quality Branded Full Sleeve sweatshirt for Men; Unique Collection to your wardrobe casuals a hit of effortless cool with this best looking Sweatshirt<br>\r\nSleeve Type: Full Sleeve; Pockets : Side Pockets which is enough of cover your palm, when you feel cold; Style: Fashionable Hoodie. Perfect for Trending Stylish Look.; Perfect for Winters, Night Highways long drive. Note: Check the Size chart in the product images for perfect fit.<br>\r\nQuality: All garments are subjected to the following tests Fabric dimensional stability test and quality inspection for colours and wash fastness. To maintain the Color please dry in shades. Usual Machine wash or Regular wash is preferable.<br>\r\nAge Range Description: Adult; Closure Type: Drawstring; Pattern Type: Solid; Fit Type: Regular Fit', 'Alan Jones Clothing Men\'s Fleece Hooded Hoodie', 'Alan Jones Clothing Men\'s Fleece Hooded Hoodie', 'Alan Jones Clothing Men\'s Fleece Hooded Hoodie', 1),
(41, 25, 14, 'DENVER Pride', 150, 80, 25, '761310258_61UQX6N786L._SX522_.jpg', 'DENVER Hamilton Pride Perfume (EDP) - 100ML | Long Lasting Perfume Body Scent for Men', 'STOP ODOURS - Stops the development of body odour\\r\\nLONG LASTING EDP: Denver Hamilton Pride EDP is a supersaturated perfume which lasts a lot longer than an EDT.\\r\\nATTRACTIVE SCENT - It offers a good combination and formulation to keep you smelling fantastic and feeling energetic all day.   Because of its aroma , you can wear it all the day. The attractive accent that continues with you throughout the duration of your day.\\r\\nPRIDE PERFUME - Eau De Parfum 100ml has a pleasant and long-lasting fragrance scent. Its perfume has been created to improve your presence in the present moment, giving support, personality, and passion to your identity.\\r\\nQuantity -100ML | Perfume Type - Eau De Parfum (EDP) | Gender - Men | Package - Perfume for Men (Pack of 1)', 'DENVER Hamilton Pride Perfume (EDP) - 100ML | Long Lasting Perfume Body Scent for Men', 'DENVER Hamilton Pride Perfume (EDP) - 100ML | Long Lasting Perfume Body Scent for Men', 'DENVER Hamilton Pride Perfume (EDP) - 100ML | Long Lasting Perfume Body Scent for Men', 1),
(42, 5, 18, 'Cello', 200, 80, 12, '307047017_61inpBi8f4L._UX569_.jpg', 'Formal Shirts for Men Regular Fit Cotton Plain Solid Full Sleeves', 'Care Instructions: Machine Wash\r\nFit Type: Regular Fit\r\nFit Type: Regular Fit\r\nMaterial - 100% Cotton ; Pattern: Plain Solid Shirt\r\nPremium Quality Fabric and Stitching Full sleeves shirt\r\nCollar style - Classic / spread ; Cuff style - Single cuff\r\nCare Instructions: Machine wash warm, wash dark colors separately, do not bleach, tumble dry low, warm iron', 'Formal Shirts for Men Regular Fit Cotton Plain Solid Full Sleeves', 'Formal Shirts for Men Regular Fit Cotton Plain Solid Full Sleeves', 'Formal Shirts for Men Regular Fit Cotton Plain Solid Full Sleeves', 1),
(43, 25, 14, 'DENVER Sporting Club', 300, 210, 12, '584257636_61EQznpIEIL._SX522_PIbundle-3,TopRight,0,0_AA522SH20_.jpg', 'DENVER Sporting Club Goal + Rider & Victor Deodorant for Men -165ML Each (Pack of 3) | Long Lasting Fragrance Deo Combo Set of 3', 'DEODORANT - DENVER Long lasting Defense Deodorant Body Spray\r\nPREVENT BODY ODOUR - Stops the development of body odour\r\nATTRACTIVE DEO - You may experience the impression of boundless strength thanks to this superb, powerful fragrance that personifies pure desire.\r\nAROMA - The energizing male fragrance keeps your mood up all day.\r\nKEEPS YOU ENGAGED: Energetic is a pleasant delight that keeps you engaged throughout the whole day longer due to its luxury passionate fragrances. Blow stress and fatigue a long goodbye for each sprinkling!\r\nQUANTITY - 165ML | Gender - Man | Product - Deodorant', 'DENVER Sporting Club Goal + Rider & Victor Deodorant for Men -165ML Each (Pack of 3) | Long Lasting Fragrance Deo Combo Set of 3', 'DENVER Sporting Club Goal + Rider & Victor Deodorant for Men -165ML Each (Pack of 3) | Long Lasting Fragrance Deo Combo Set of 3', 'DENVER Sporting Club Goal + Rider & Victor Deodorant for Men -165ML Each (Pack of 3) | Long Lasting Fragrance Deo Combo Set of 3', 1),
(44, 25, 14, 'DENVER Black Code', 130, 80, 18, '647769310_51WxZVf1gsL._SX522_.jpg', 'DENVER Black Code Deo - (150ML) | Long Lasting Deodorant Body Spray for Men', 'REDUCES BODY ODOR : One of the primary benefits of deodorant is that it helps reduce body odor. Deodorants contain antimicrobial agents that help control the growth of odor-causing bacteria.\r\nKEEPS YOU FEELING FRESH : Using deodorant can help you feel fresh and clean throughout the day. It helps to mask unpleasant odors and can give you a sense of confidence.\r\nPREVENTS SWEAT STAINS : Deodorant can also help prevent sweat stains on your clothes. Some deodorants also contain antiperspirant agents that help reduce sweating.\r\nAROMA - The energizing male fragrance keeps your mood up all day. Energetic is a pleasant delight that keeps you engaged throughout the whole day longer due to its luxury passionate fragrances.', 'DENVER Black Code Deo - (150ML) | Long Lasting Deodorant Body Spray for Men', 'DENVER Black Code Deo - (150ML) | Long Lasting Deodorant Body Spray for Men', 'DENVER Black Code Deo - (150ML) | Long Lasting Deodorant Body Spray for Men', 1),
(45, 25, 14, 'DENVER Imperial', 199, 110, 18, '528673692_51eGHoaKSlL._SX522_.jpg', 'DENVER Imperial Deodorant (165ML) | Long Lasting Deo Body Spray for Men', 'REDUCES BODY ODOR : One of the primary benefits of deodorant is that it helps reduce body odor. Deodorants contain antimicrobial agents that help control the growth of odor-causing bacteria.\r\nKEEPS YOU FEELING FRESH : Using deodorant can help you feel fresh and clean throughout the day. It helps to mask unpleasant odors and can give you a sense of confidence.\r\nPREVENTS SWEAT STAINS : Deodorant can also help prevent sweat stains on your clothes. Some deodorants also contain antiperspirant agents that help reduce sweating.\r\nAROMA - The energizing male fragrance keeps your mood up all day. Energetic is a pleasant delight that keeps you engaged throughout the whole day longer due to its luxury passionate fragrances. Blow stress and fatigue a long goodbye for each sprinkling!\r\nVARIETY OF FRAGRANCES : Deodorants come in a variety of fragrances, which can help you find a scent that you enjoy and that suits your personality.', 'DENVER Imperial Deodorant (165ML) | Long Lasting Deo Body Spray for Men', 'DENVER Imperial Deodorant (165ML) | Long Lasting Deo Body Spray for Men', 'DENVER Imperial Deodorant (165ML) | Long Lasting Deo Body Spray for Men', 1),
(46, 25, 14, 'DENVER  Club', 300, 210, 18, '358968385_61+a+vlGOaL._SX522_PIbundle-2,TopRight,0,0_SX522SY607SH20_.jpg', 'DENVER Sporting Club Goal Gift Set for Men - Deo (165ML) + Perfume (60ML) | Long Lasting Fragrance Scent Gift Pack', 'REDUCES BODY ODOR : One of the primary benefits of deodorant is that it helps reduce body odor. Deodorants contain antimicrobial agents that help control the growth of odor-causing bacteria.\r\nKEEPS YOU FEELING FRESH : Using deodorant can help you feel fresh and clean throughout the day. It helps to mask unpleasant odors and can give you a sense of confidence.\r\nPREVENTS SWEAT STAINS : Deodorant can also help prevent sweat stains on your clothes. Some deodorants also contain antiperspirant agents that help reduce sweating.', 'DENVER Sporting Club Goal Gift Set for Men - Deo (165ML) + Perfume (60ML) | Long Lasting Fragrance Scent Gift Pack', 'DENVER Sporting Club Goal Gift Set for Men - Deo (165ML) + Perfume (60ML) | Long Lasting Fragrance Scent Gift Pack', 'DENVER Sporting Club Goal Gift Set for Men - Deo (165ML) + Perfume (60ML) | Long Lasting Fragrance Scent Gift Pack', 1),
(47, 25, 14, 'DENVER Royal', 134, 85, 18, '533470090_61cltwuhhtL._SX522_.jpg', 'DENVER Royal Oud Deodorant Body Spray for Men (150ML) | Long Lasting Body Spray for Men', 'REDUCES BODY ODOR : One of the primary benefits of deodorant is that it helps reduce body odor. Deodorants contain antimicrobial agents that help control the growth of odor-causing bacteria.\r\nKEEPS YOU FEELING FRESH : Using deodorant can help you feel fresh and clean throughout the day. It helps to mask unpleasant odors and can give you a sense of confidence.\r\nPREVENTS SWEAT STAINS : Deodorant can also help prevent sweat stains on your clothes. Some deodorants also contain antiperspirant agents that help reduce sweating.\r\nAROMA - The energizing male fragrance keeps your mood up all day. Energetic is a pleasant delight that keeps you engaged throughout the whole day longer due to its luxury passionate fragrances. Blow stress and fatigue a long goodbye for each sprinkling!', 'DENVER Royal Oud Deodorant Body Spray for Men (150ML) | Long Lasting Body Spray for Men', 'DENVER Royal Oud Deodorant Body Spray for Men (150ML) | Long Lasting Body Spray for Men', 'DENVER Royal Oud Deodorant Body Spray for Men (150ML) | Long Lasting Body Spray for Men', 1),
(48, 25, 14, 'DENVER SRK Maestro', 220, 145, 18, '837086466_6172DrkofIL._SX522_.jpg', 'DENVER SRK Maestro Autograph Collection Deodorant Spray - For Men (140ML) | Long Lasting Luxury Deo Body Spray', 'REDUCES BODY ODOR : One of the primary benefits of deodorant is that it helps reduce body odor. Deodorants contain antimicrobial agents that help control the growth of odor-causing bacteria.\r\nKEEPS YOU FEELING FRESH : Using deodorant can help you feel fresh and clean throughout the day. It helps to mask unpleasant odors and can give you a sense of confidence.\r\nPREVENTS SWEAT STAINS : Deodorant can also help prevent sweat stains on your clothes. Some deodorants also contain antiperspirant agents that help reduce sweating.\r\nAROMA - The energizing male fragrance keeps your mood up all day. Energetic is a pleasant delight that keeps you engaged throughout the whole day longer due to its luxury passionate fragrances. Blow stress and fatigue a long goodbye for each sprinkling!', 'DENVER SRK Maestro Autograph Collection Deodorant Spray - For Men (140ML) | Long Lasting Luxury Deo Body Spray', 'DENVER SRK Maestro Autograph Collection Deodorant Spray - For Men (140ML) | Long Lasting Luxury Deo Body Spray', 'DENVER SRK Maestro Autograph Collection Deodorant Spray - For Men (140ML) | Long Lasting Luxury Deo Body Spray', 1),
(49, 8, 22, 'Men\'s Straight Trousers', 280, 200, 12, '917762222_61QmabcrTHL._UX466_.jpg', 'Men\'s Straight Casual Trousers', 'Care Instructions: Machine Wash\r\nFit Type: Regular\r\n100% Cotton soft breathable fabric\r\nSolid pattern\r\nSide slant pockets and back welt pockets - 2 each\r\nZip fly with button closure\r\nPair it up with a solid casual shirt or a Polo and white sneakers for a stylish casual look.', 'Men\'s Straight Casual Trousers', 'Men\'s Straight Casual Trousers', 'Men\'s Straight Casual Trousers', 1),
(50, 5, 20, 'The Indian Garage', 450, 180, 16, '892479088_61wkDbzbMWL._UX679_.jpg', 'The Indian Garage Co Mens Jacket', 'Care Instructions: Machine Wash\r\nFit Type: Slim\r\nBlue washed solid denim jacket, has a spread collar, 4 pockets ,has a button closure, long sleeves, straight hemline, without lining\r\nCotton/Poly-Comfortable fitting with rich & quality fabric\r\nTop off your personal wardrobe with this trendsetting jacket. About our Brand TIGC - One stop shop for premium fast fashion essential clothing for everyday use at lowest prices.\r\nCountry of Origin: Proudly made in India', 'The Indian Garage Co Mens Jacket', 'The Indian Garage Co Mens Jacket', 'The Indian Garage Co Mens Jacket', 1),
(51, 5, 10, 'FEARLESS HOODIES', 300, 200, 12, '154267451_hoody.jpg', 'ADRO Men\'s Cotton Hooded Neck Hoodies', 'Product Dimensions ‏ : ‎ 30 x 23 x 3 cm; 475 Grams\r\nDate First Available ‏ : ‎ 29 November 2022\r\nManufacturer ‏ : ‎ Belsi Retail Pvt ltd\r\nASIN ‏ : ‎ B0BNLK9MKK\r\nItem model number ‏ : ‎ H22\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Belsi Retail Pvt ltd, BELSI RETAIL PRIVATE LIMITED\r\nItem Weight ‏ : ‎ 475 g\r\nItem Dimensions LxWxH ‏ : ‎ 30 x 23 x 3 Centimeters', 'ADRO Men\'s Cotton Hooded Neck Hoodies', 'ADRO Men\'s Cotton Hooded Neck Hoodies', 'ADRO Men\'s Cotton Hooded Neck Hoodies', 1),
(52, 5, 10, 'ADRO BLUE', 250, 180, 12, '758571241_H.jpg', 'ADRO Mens Solid Cotton Hooded Sweatshirt', 'Product Dimensions ‏ : ‎ 30 x 23 x 3 cm; 475 Grams\r\nDate First Available ‏ : ‎ 9 August 2022\r\nManufacturer ‏ : ‎ Belsi Retail Pvt ltd\r\nASIN ‏ : ‎ B0B942L3Y4\r\nItem model number ‏ : ‎ H22\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Belsi Retail Pvt ltd, BELSI RETAIL PRIVATE LIMITED\r\nItem Weight ‏ : ‎ 475 g\r\nItem Dimensions LxWxH ‏ : ‎ 30 x 23 x 3 Centimeters', 'ADRO Mens Solid Cotton Hooded Sweatshirt', 'ADRO Mens Solid Cotton Hooded Sweatshirt', 'ADRO Mens Solid Cotton Hooded Sweatshirt', 1),
(53, 5, 10, 'BTS HOODIE', 500, 300, 12, '480985162_71W0dSVwqIL._UL1500_.jpg', 'More & More Unisex-Child Cotton Hooded Neck BTS Printed Hoodie', 'Product Dimensions ‏ : ‎ 5.08 x 12.7 x 5.08 cm; 390 Grams\r\nDate First Available ‏ : ‎ 10 October 2016\r\nManufacturer ‏ : ‎ More & More\r\nASIN ‏ : ‎ B08L6FBCLP\r\nItem part number ‏ : ‎ BTS Hoodie Maroon-34\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Unisex-child\r\nManufacturer ‏ : ‎ More & More\r\nItem Weight ‏ : ‎ 390 g\r\nItem Dimensions LxWxH ‏ : ‎ 5.1 x 12.7 x 5.1 Centimeters', 'More & More Unisex-Child Cotton Hooded Neck BTS Printed Hoodie', 'More & More Unisex-Child Cotton Hooded Neck BTS Printed Hoodie', 'More & More Unisex-Child Cotton Hooded Neck BTS Printed Hoodie', 1),
(54, 5, 10, 'KASTO HOODIE', 400, 250, 12, '579077675_61wGLkmg2GL._UL1500_.jpg', 'Katso Men\'s Cotton Hooded Hoodie', 'Package Dimensions ‏ : ‎ 24.8 x 23 x 4.9 cm; 230 Grams\r\nDate First Available ‏ : ‎ 26 May 2020\r\nManufacturer ‏ : ‎ Katso\r\nASIN ‏ : ‎ B085MDJVY4\r\nItem part number ‏ : ‎ RLC-NGPC-BLK-M\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Katso\r\nItem Weight ‏ : ‎ 230 g', 'Katso Men\'s Cotton Hooded Hoodie', 'Katso Men\'s Cotton Hooded Hoodie', 'Katso Men\'s Cotton Hooded Hoodie', 1),
(55, 5, 10, 'WEARINDIA', 350, 250, 12, '948494433_61YWB-llUbL._UL1500_.jpg', 'WearIndia Men\'s & Women\'s Cotton Hooded Hoodies', 'Product Dimensions ‏ : ‎ 24 x 22 x 2 cm; 340 Grams\r\nDate First Available ‏ : ‎ 12 September 2019\r\nASIN ‏ : ‎ B0821FXLSK\r\nItem part number ‏ : ‎ Plain Hoodies Aqua-1-XS\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Unisex-adult\r\nItem Weight ‏ : ‎ 340 g\r\nItem Dimensions LxWxH ‏ : ‎ 24 x 22 x 2 Centimeters', 'WearIndia Men\'s & Women\'s Cotton Hooded Hoodies', 'WearIndia Men\'s & Women\'s Cotton Hooded Hoodies', 'WearIndia Men\'s & Women\'s Cotton Hooded Hoodies', 1),
(56, 5, 17, 'AMAZON WHITE', 200, 100, 12, '182710548_71tOFBNH2XL._UL1500_.jpg', 'Amazon Brand - Symbol Men\'s Regular Fit T-Shirt', 'Package Dimensions ‏ : ‎ 25.3 x 13.3 x 3.8 cm; 250 Grams\r\nDate First Available ‏ : ‎ 13 July 2017\r\nManufacturer ‏ : ‎ Amazon Brand - Symbol\r\nASIN ‏ : ‎ B073X4KMH6\r\nItem model number ‏ : ‎ SS20SYMTEE33\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Amazon Brand - Symbol, PRATIBHA SYNTEX LIMITED,PLOT NO 4: INDUSTRIAL GROWTH CENTRE, KHEDA, PITHAMPUR-454774, DHAR DIST, MADHYA PRADESH\r\nPacker ‏ : ‎ PRATIBHA SYNTEX LIMITED,PLOT NO 4: INDUSTRIAL GROWTH CENTRE, KHEDA, PITHAMPUR-454774, DHAR DIST, MADHYA PRADESH\r\nImporter ‏ : ‎ PRATIBHA SYNTEX LIMITED,PLOT NO 4: INDUSTRIAL GROWTH CENTRE, KHEDA, PITHAMPUR-454774, DHAR DIST, MADHYA PRADESH\r\nItem Weight ‏ : ‎ 250 g', 'Amazon Brand - Symbol Men\'s Regular Fit T-Shirt', 'Amazon Brand - Symbol Men\'s Regular Fit T-Shirt', 'Amazon Brand - Symbol Men\'s Regular Fit T-Shirt', 1),
(57, 5, 17, 'AMAZON FIT TSHIRT', 200, 100, 12, '950837046_71NouPWUdoL._UL1500_.jpg', 'Amazon Brand - Symbol Men\'s Regular Fit T-Shirt', 'Package Dimensions ‏ : ‎ 23.1 x 9.8 x 4 cm; 170 Grams\r\nDate First Available ‏ : ‎ 13 July 2017\r\nManufacturer ‏ : ‎ Amazon Brand - Symbol\r\nASIN ‏ : ‎ B073X4MJ7Z\r\nItem model number ‏ : ‎ SS20SYMTEE33\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Amazon Brand - Symbol\r\nItem Weight ‏ : ‎ 170 g\r\nGeneric Name ‏ : ‎ T-Shirt', 'Amazon Brand - Symbol Men\'s Regular Fit T-Shirt', 'Amazon Brand - Symbol Men\'s Regular Fit T-Shirt', 'Amazon Brand - Symbol Men\'s Regular Fit T-Shirt', 1),
(58, 5, 17, 'JOCKY', 250, 100, 12, '606681402_71l-IzX+gFL._UL1500_.jpg', 'Jockey 2714 Men\'s Super Combed Cotton Rich Solid Round Neck Half Sleeve T-Shirt', 'Product Dimensions ‏ : ‎ 2.4 x 24.6 x 22.6 cm; 200 Grams\r\nDate First Available ‏ : ‎ 1 March 2016\r\nManufacturer ‏ : ‎ PAGE INDUSTRIES LIMITED\r\nASIN ‏ : ‎ B01CE7X9T0\r\nItem model number ‏ : ‎ 2726\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ PAGE INDUSTRIES LIMITED, PAGE INDUSTRIES LIMITED, Umiya Business Bay-Tower-1, 7th Floor, Cessna Business Park, Kadubeesanahalli, Varthur Hobli, Bengaluru- 560103; Contact no : 080-4945-4545\r\nPacker ‏ : ‎ PAGE INDUSTRIES LIMITED, Umiya Business Bay-Tower-1, 7th Floor, Cessna Business Park, Kadubeesanahalli, Varthur Hobli, Bengaluru- 560103; Contact no : 080-4945-4545\r\nItem Weight ‏ : ‎ 200 g\r\nItem Dimensions LxWxH ‏ : ‎ 24 x 246 x 226 Millimeters', 'Jockey 2714 Men\'s Super Combed Cotton Rich Solid Round Neck Half Sleeve T-Shirt', 'Jockey 2714 Men\'s Super Combed Cotton Rich Solid Round Neck Half Sleeve T-Shirt', 'Jockey 2714 Men\'s Super Combed Cotton Rich Solid Round Neck Half Sleeve T-Shirt', 1),
(59, 5, 17, 'JOCKY NECK', 250, 120, 12, '511312817_712Oync83rL._UL1500_.jpg', 'Jockey AM95 Men\'s Super Combed Cotton Rich Solid Round Neck Full Sleeve T-Shirt', 'Product Dimensions ‏ : ‎ 26 x 24 x 1 cm; 240 Grams\r\nDate First Available ‏ : ‎ 1 October 2019\r\nManufacturer ‏ : ‎ Jockey\r\nASIN ‏ : ‎ B07YN3VCH5\r\nItem model number ‏ : ‎ AM95\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Jockey\r\nItem Weight ‏ : ‎ 240 g\r\nItem Dimensions LxWxH ‏ : ‎ 26 x 24 x 1 Centimeters', 'Jockey AM95 Men\'s Super Combed Cotton Rich Solid Round Neck Full Sleeve T-Shirt', 'Jockey AM95 Men\'s Super Combed Cotton Rich Solid Round Neck Full Sleeve T-Shirt', 'Jockey AM95 Men\'s Super Combed Cotton Rich Solid Round Neck Full Sleeve T-Shirt', 1),
(60, 5, 17, 'POOPLU', 250, 120, 120, '182575124_41c+5Jgj24L.jpg', 'Pooplu Men\'s Regular Fit Plain Round Neck Long Sleeves 100% Cotton Graphic Printed Pootlu Tshirt', 'Product Dimensions ‏ : ‎ 25.4 x 30.48 x 2.54 cm; 250 Grams\r\nDate First Available ‏ : ‎ 8 April 2019\r\nManufacturer ‏ : ‎ Pooplu\r\nASIN ‏ : ‎ B07QGP7FFM\r\nItem part number ‏ : ‎ TVP-Male-XL-Pooplu-13-Turquoise\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Women\r\nManufacturer ‏ : ‎ Pooplu\r\nItem Weight ‏ : ‎ 250 g\r\nItem Dimensions LxWxH ‏ : ‎ 25.4 x 30.5 x 2.5 Centimeters', 'Pooplu Men\'s Regular Fit Plain Round Neck Long Sleeves 100% Cotton Graphic Printed Pootlu Tshirt', 'Pooplu Men\'s Regular Fit Plain Round Neck Long Sleeves 100% Cotton Graphic Printed Pootlu Tshirt', 'Pooplu Men\'s Regular Fit Plain Round Neck Long Sleeves 100% Cotton Graphic Printed Pootlu Tshirt', 1),
(61, 5, 17, 'ZU TSHIRT', 260, 110, 12, '147770996_31WIRxbJ9bL.jpg', 'ZU Regular Fit 100% Cotton Casual Full Sleeves Stylish Solid T-Shirt for Mens/Boys', 'Package Dimensions ‏ : ‎ 30.6 x 26.8 x 2 cm; 250 Grams\r\nDate First Available ‏ : ‎ 22 September 2021\r\nManufacturer ‏ : ‎ HANNU KNITTERS PVT LTD\r\nASIN ‏ : ‎ B09H3D7WKJ\r\nItem part number ‏ : ‎ Z B2B 2-DB_XL\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ HANNU KNITTERS PVT LTD\r\nItem Weight ‏ : ‎ 250 g', 'ZU Regular Fit 100% Cotton Casual Full Sleeves Stylish Solid T-Shirt for Mens/Boys', 'ZU Regular Fit 100% Cotton Casual Full Sleeves Stylish Solid T-Shirt for Mens/Boys', 'ZU Regular Fit 100% Cotton Casual Full Sleeves Stylish Solid T-Shirt for Mens/Boys', 1),
(62, 5, 17, 'VIMAL JONNEY', 260, 100, 12, '264680572_41C2myk8C1L.jpg', 'VIMAL JONNEY Men\'s V Neck Cotton Tshirt', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 10 x 8 x 2 cm; 90 Grams\r\nDate First Available ‏ : ‎ 31 March 2018\r\nManufacturer ‏ : ‎ Vimal\r\nASIN ‏ : ‎ B07BVBNXGD\r\nItem part number ‏ : ‎ VEE-ANTHRA01-L\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Vimal', 'VIMAL JONNEY Men\'s V Neck Cotton Tshirt', 'VIMAL JONNEY Men\'s V Neck Cotton Tshirt', 'VIMAL JONNEY Men\'s V Neck Cotton Tshirt', 1),
(63, 5, 18, 'ARROW', 250, 110, 12, '276588124_61638LZT5XL._UL1500_.jpg', 'Arrow Men Shirt', 'Product Dimensions ‏ : ‎ 55.9 x 38.1 x 12.7 cm; 400 Grams\r\nDate First Available ‏ : ‎ 10 August 2022\r\nManufacturer ‏ : ‎ Arvind Fashions Ltd.\r\nASIN ‏ : ‎ B0B97SF5K8\r\nItem model number ‏ : ‎ ARADOSH0491\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Arvind Fashions Ltd., M/S. Aurora Apparel Pvt Ltd, R.S No.18 D/E/F/G, Adarsh Nagar, Nipani, Karnataka - 591237\r\nPacker ‏ : ‎ Arvind Fashions Ltd, Duparc Trinity Bengaluru 560001\r\nImporter ‏ : ‎ Arvind Fashions Ltd, Duparc Trinity Bengaluru 560001\r\nItem Weight ‏ : ‎ 400 g\r\nItem Dimensions LxWxH ‏ : ‎ 55.9 x 38.1 x 12.7 Centimeters', 'Arrow Men Shirt', 'Arrow Men Shirt', 'Arrow Men Shirt', 1),
(64, 5, 18, 'DIVERSE', 260, 110, 12, '496414190_81mQwlj3ZaL._UL1500_.jpg', 'Diverse Men\'s Regular Fit Formal Shirt', 'Package Dimensions ‏ : ‎ 23.62 x 22.6 x 7.62 cm; 270 Grams\r\nDate First Available ‏ : ‎ 7 April 2020\r\nManufacturer ‏ : ‎ Diverse\r\nASIN ‏ : ‎ B07D6YTCSL\r\nItem model number ‏ : ‎ DVF01F2L01-263\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Diverse\r\nItem Weight ‏ : ‎ 270 g', 'Diverse Men\'s Regular Fit Formal Shirt', 'Diverse Men\'s Regular Fit Formal Shirt', 'Diverse Men\'s Regular Fit Formal Shirt', 1),
(65, 5, 18, 'Park Avenue', 260, 120, 120, '645185971_41dibsk8vhL.jpg', 'Park Avenue Blue Slim Fit Cotton Blend Shirt', 'Product Dimensions ‏ : ‎ 37 x 24 x 1.5 cm; 280 Grams\r\nDate First Available ‏ : ‎ 24 April 2018\r\nManufacturer ‏ : ‎ Radhe Krishna Clothings Private\r\nASIN ‏ : ‎ B07CMHJJ54\r\nItem model number ‏ : ‎ PMSX11328-B3\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Radhe Krishna Clothings Private, RADHE KRISHNA CLOTHINGS PRIVATE LIMITED, 68&69, SY NO.31/13, BERATENA AGRAHARA, BEGUR HOBLI, BANGALORE, Pin Code-560100 Phone No-9900083538\r\nPacker ‏ : ‎ RADHE KRISHNA CLOTHINGS PRIVATE LIMITED, 68&69, SY NO.31/13, BERATENA AGRAHARA, BEGUR HOBLI, BANGALORE, Pin Code-560100 Phone No-9900083538\r\nItem Weight ‏ : ‎ 280 g\r\nItem Dimensions LxWxH ‏ : ‎ 37 x 24 x 1.5 Centimeters', 'Park Avenue Blue Slim Fit Cotton Blend Shirt', 'Park Avenue Blue Slim Fit Cotton Blend Shirt', 'Park Avenue Blue Slim Fit Cotton Blend Shirt', 1),
(66, 5, 18, 'Van Heusen Men Shirt', 300, 150, 12, '606100654_71s0a2Wcx0L._UL1500_.jpg', 'Van Heusen Men Shirt', 'Product Dimensions ‏ : ‎ 26 x 21 x 2 cm; 300 Grams\r\nDate First Available ‏ : ‎ 20 June 2022\r\nManufacturer ‏ : ‎ ABFRL\r\nASIN ‏ : ‎ B0B4K9TJJK\r\nItem model number ‏ : ‎ VHSFRSLBL08478\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ ABFRL, ABFRL, Building No.288/2 ,Begur,Bangalore-560068\r\nPacker ‏ : ‎ Aditya Birla Fashion & Retail Limited(Madura F & L Division, Regd. Office: Piramal Agastya Corporate park, Building \'A\', 4th and 5th Floor,Unit No.401,403,501,502, L.B.S Road, Kurla, Mumbai - 400070\r\nItem Weight ‏ : ‎ 300 g\r\nItem Dimensions LxWxH ‏ : ‎ 26 x 21 x 2 Centimeters\r\nGeneric Name ‏ : ‎ Shirt', 'Van Heusen Men Shirt', 'Van Heusen Men Shirt', 'Van Heusen Men Shirt', 1),
(67, 5, 18, 'DENIS', 260, 160, 12, '772553270_61hq+LfAdOS._UL1440_.jpg', 'Dennis Lingo Men\'s Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves', 'Product Dimensions ‏ : ‎ 25 x 20 x 4.5 cm; 500 Grams\r\nDate First Available ‏ : ‎ 24 October 2018\r\nManufacturer ‏ : ‎ Swastik Creation\r\nASIN ‏ : ‎ B07HK7SMGC\r\nItem model number ‏ : ‎ C301\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Swastik Creation, Swastik Creation -B-21, Bharat Ind. Estate, Sewree (w) ,Mumbai-15, Email - dennislingoshirts@gmail.com, Phone No. 022-22010742\r\nPacker ‏ : ‎ Swastik Creation -B-21, Bharat Ind. Estate, Sewree (w) ,Mumbai-15, Email - dennislingoshirts@gmail.com, Phone No. 022-22010742\r\nItem Weight ‏ : ‎ 500 g\r\nItem Dimensions LxWxH ‏ : ‎ 25 x 20 x 4.5 Centimeters', 'Dennis Lingo Men\'s Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves', 'Dennis Lingo Men\'s Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves', 'Dennis Lingo Men\'s Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves', 1),
(68, 5, 20, 'DENIM JACKET', 400, 280, 12, '247670621_61G1ZLzdBeS._UL1500_.jpg', 'VOXATI Men\'s Denim Jacket', 'Date First Available ‏ : ‎ 25 January 2023\r\nManufacturer ‏ : ‎ VOXATI\r\nASIN ‏ : ‎ B0BT1N4YNJ\r\nItem part number ‏ : ‎ kjt210new-m\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ VOXATI', 'VOXATI Men\'s Denim Jacket', 'VOXATI Men\'s Denim Jacket', 'VOXATI Men\'s Denim Jacket', 1),
(69, 5, 20, 'RIGID US POLO', 500, 400, 12, '510254401_41VYWXGatUL.jpg', 'U.S. POLO ASSN. Rigid Denim Jacket', 'Package Dimensions ‏ : ‎ 33.71 x 29.59 x 5.99 cm; 730 Grams\r\nDate First Available ‏ : ‎ 21 December 2021\r\nASIN ‏ : ‎ B09MKDTP8C\r\nItem part number ‏ : ‎ 11A566DB-DKWS\r\nCountry of Origin ‏ : ‎ USA\r\nDepartment ‏ : ‎ Mens\r\nItem Weight ‏ : ‎ 730 g', 'U.S. POLO ASSN. Rigid Denim Jacket', 'U.S. POLO ASSN. Rigid Denim Jacket', 'U.S. POLO ASSN. Rigid Denim Jacket', 1),
(70, 5, 20, 'CAMPUS JACKET', 500, 350, 12, '397652730_417pHuFubQL.jpg', 'Campus Sutra Men Colorblock Full Sleeve Grey Stylish Casual Denim Jacket', 'Product Dimensions ‏ : ‎ 22 x 30 x 3.5 cm; 300 Grams\r\nDate First Available ‏ : ‎ 16 October 2021\r\nASIN ‏ : ‎ B09JLW6X94\r\nItem part number ‏ : ‎ AZ_WIN21CS_JKDENIM_M_PLN_GRBL_M\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nItem Weight ‏ : ‎ 300 g\r\nItem Dimensions LxWxH ‏ : ‎ 22 x 30 x 3.5 Centimeters', 'Campus Sutra Men Colorblock Full Sleeve Grey Stylish Casual Denim Jacket', 'Campus Sutra Men Colorblock Full Sleeve Grey Stylish Casual Denim Jacket', 'Campus Sutra Men Colorblock Full Sleeve Grey Stylish Casual Denim Jacket', 1),
(71, 5, 20, 'VEIRDO', 600, 400, 12, '354917292_71gnaXHeuoL._UL1500_.jpg', 'Veirdo® Paisley Printed Zip Up Cotton Shacket/Jacket for Men (VSK01NBPT001)', 'Product Dimensions ‏ : ‎ 25 x 20 x 4.5 cm; 500 Grams\r\nDate First Available ‏ : ‎ 2 January 2023\r\nManufacturer ‏ : ‎ Awesomefab Shopping Pvt Ltd\r\nASIN ‏ : ‎ B0BRJFZ9L9\r\nItem model number ‏ : ‎ VSK01NBPT001_New_L\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Awesomefab Shopping Pvt Ltd, Awesomefab Shopping Pvt Ltd\r\nPacker ‏ : ‎ Awesomefab Shopping Private Limited A-101 ANZ OPP BALHANUHAM NR CHRUCH, Nr. COZY HOTEL STREET, Ahmedabad, Gujarat 382405\r\nImporter ‏ : ‎ Awesomefab Shopping Private Limited A-101 ANZ OPP BALHANUHAM NR CHRUCH, Nr. COZY HOTEL STREET, Ahmedabad, Gujarat 382405\r\nItem Weight ‏ : ‎ 500 g\r\nItem Dimensions LxWxH ‏ : ‎ 25 x 20 x 4.5 Centimeters\r\nGeneric Name ‏ : ‎ Shirt', 'Veirdo® Paisley Printed Zip Up Cotton Shacket/Jacket for Men (VSK01NBPT001)', 'Veirdo® Paisley Printed Zip Up Cotton Shacket/Jacket for Men (VSK01NBPT001)', 'Veirdo® Paisley Printed Zip Up Cotton Shacket/Jacket for Men (VSK01NBPT001)', 1),
(72, 5, 20, 'VOXATI', 400, 250, 12, '867713042_71r8btOsbZS._UL1500_.jpg', 'VOXATI Men\'s Denim Jacket', 'Date First Available ‏ : ‎ 9 July 2021\r\nManufacturer ‏ : ‎ VOXATI\r\nASIN ‏ : ‎ B0992QPJ2W\r\nItem part number ‏ : ‎ kjt316e-xxxl\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ VOXATI', 'VOXATI Men\'s Denim Jacket', 'VOXATI Men\'s Denim Jacket', 'VOXATI Men\'s Denim Jacket', 1),
(73, 5, 20, 'Leather JACKET', 500, 350, 12, '777804352_41EP3es9csS.jpg', 'Leather Retail Men\'s Solid Jacket', 'Product Dimensions ‏ : ‎ 75 x 52 x 1 cm; 470 Grams\r\nDate First Available ‏ : ‎ 8 July 2021\r\nManufacturer ‏ : ‎ NK ENTERPRISES\r\nASIN ‏ : ‎ B0992CCXXC\r\nItem part number ‏ : ‎ LRM33BL2X15\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ NK ENTERPRISES\r\nItem Weight ‏ : ‎ 470 g\r\nItem Dimensions LxWxH ‏ : ‎ 75 x 52 x 1 Centimeters', 'Leather Retail Men\'s Solid Jacket', 'Leather Retail Men\'s Solid Jacket', 'Leather Retail Men\'s Solid Jacket', 1),
(74, 5, 20, 'BERMUDA', 450, 399, 12, '645801564_41BiNVqIKtL.jpg', 'Bermuda Mens Solid Leather Biker Biker Riding Jacket', 'Package Dimensions ‏ : ‎ 55.1 x 36.29 x 12.4 cm; 1.32 Kilograms\r\nDate First Available ‏ : ‎ 24 October 2021\r\nManufacturer ‏ : ‎ Bermuda\r\nASIN ‏ : ‎ B09KPNHDR7\r\nItem part number ‏ : ‎ Ryder_Biker Jacket\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Boys\r\nManufacturer ‏ : ‎ Bermuda\r\nPacker ‏ : ‎ Bermuda\r\nItem Weight ‏ : ‎ 1 kg 320 g\r\nGeneric Name ‏ : ‎ Biker\'s Leather Jacket\r\nBest Sellers Rank: #671,037 in Clothing & Accessories (See Top 100 in Clothing & Accessories)\r\n#5,181 in Men\'s Jackets', 'Bermuda Mens Solid Leather Biker Biker Riding Jacket', 'Bermuda Mens Solid Leather Biker Biker Riding Jacket', 'Bermuda Mens Solid Leather Biker Biker Riding Jacket', 1),
(75, 8, 21, 'VEGO', 400, 250, 12, '922790524_51EtOEhZSsL._UL1400_.jpg', 'VEGO Mens 4 Way Lycra Strechable Formal Trousers & Pant', 'Package Dimensions ‏ : ‎ 45.2 x 22.8 x 4.9 cm; 350 Grams\r\nDate First Available ‏ : ‎ 22 September 2022\r\nManufacturer ‏ : ‎ VEGA KNIT FABS , TIRUPUR\r\nASIN ‏ : ‎ B0BGBQ25BJ\r\nItem model number ‏ : ‎ 4 Way Lycra Formal Pant & Trousers\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ VEGA KNIT FABS , TIRUPUR, VEGA KNIT FABS , TIRUPUR\r\nPacker ‏ : ‎ VEGA KNIT FABS , TIRUPUR\r\nItem Weight ‏ : ‎ 350 g', 'VEGO Mens 4 Way Lycra Strechable Formal Trousers & Pant', 'VEGO Mens 4 Way Lycra Strechable Formal Trousers & Pant', 'VEGO Mens 4 Way Lycra Strechable Formal Trousers & Pant', 1),
(76, 8, 21, 'MANCREW', 400, 250, 12, '556378672_51zUNTWqEaL._UL1440_.jpg', 'MANCREW Formal Pants for Men Regular fit - Formal Trousers for Men', 'Product Dimensions ‏ : ‎ 40 x 12 x 1 cm; 300 Grams\r\nDate First Available ‏ : ‎ 7 March 2023\r\nManufacturer ‏ : ‎ Basanta Fabrics, Bhilwara\r\nASIN ‏ : ‎ B0BXSVYHF8\r\nItem part number ‏ : ‎ PR-LTG-34\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Basanta Fabrics, Bhilwara\r\nPacker ‏ : ‎ Basanta Fabrics, Bhilwara\r\nItem Weight ‏ : ‎ 300 g\r\nItem Dimensions LxWxH ‏ : ‎ 40 x 12 x 1 Centimeters', 'MANCREW Formal Pants for Men Regular fit - Formal Trousers for Men', 'MANCREW Formal Pants for Men Regular fit - Formal Trousers for Men', 'MANCREW Formal Pants for Men Regular fit - Formal Trousers for Men', 1),
(77, 8, 21, 'MANQ PENTS', 600, 400, 12, '258047286_51plBID8usL._UL1440_.jpg', 'MANQ Men\'s Slim Fit Formal Trousers', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nPackage Dimensions ‏ : ‎ 30.7 x 28.8 x 5.3 cm; 230 Grams\r\nDate First Available ‏ : ‎ 26 March 2016\r\nManufacturer ‏ : ‎ ManQ\r\nASIN ‏ : ‎ B01DI2AQ0K\r\nItem part number ‏ : ‎ TR-22-34-Black\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ ManQ\r\nItem Weight ‏ : ‎ 230 g\r\nGeneric Name ‏ : ‎ Pants', 'MANQ Men\'s Slim Fit Formal Trousers', 'MANQ Men\'s Slim Fit Formal Trousers', 'MANQ Men\'s Slim Fit Formal Trousers', 1);
INSERT INTO `product` (`id`, `categories_id`, `subcategories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(78, 8, 21, 'McHenry', 400, 300, 12, '501976416_81wqp2ohC9L._UL1500_.jpg', 'McHenry Men\'s Solid Formal Regular Fit Wrinkle Free PolyViscose Trousers', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 33.53 x 38.1 x 2.54 cm; 300 Grams\r\nDate First Available ‏ : ‎ 31 August 2016\r\nManufacturer ‏ : ‎ McHenry\r\nASIN ‏ : ‎ B01LCXH5TC\r\nItem model number ‏ : ‎ 4000\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ McHenry\r\nItem Weight ‏ : ‎ 300 g\r\nItem Dimensions LxWxH ‏ : ‎ 33.5 x 38.1 x 2.5 Centimeters', 'McHenry Men\'s Solid Formal Regular Fit Wrinkle Free PolyViscose Trousers', 'McHenry Men\'s Solid Formal Regular Fit Wrinkle Free PolyViscose Trousers', 'McHenry Men\'s Solid Formal Regular Fit Wrinkle Free PolyViscose Trousers', 1),
(79, 8, 21, 'RR PENTS', 500, 350, 12, '773437851_31nk4KyjhUL.jpg', 'RR Fashion Men\'s Regular Formal Trouser', 'Product Dimensions ‏ : ‎ 30 x 28 x 2 cm; 350 Grams\r\nDate First Available ‏ : ‎ 5 January 2023\r\nManufacturer ‏ : ‎ RR FASHION\r\nASIN ‏ : ‎ B0BRZT69HF\r\nItem model number ‏ : ‎ RRF-06\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ RR FASHION, RR FASHION , bhilwara Rajasthan (india) contect no. 80944-55566\r\nPacker ‏ : ‎ RR FASHION , bhilwara Rajasthan (india)\r\nItem Weight ‏ : ‎ 350 g\r\nItem Dimensions LxWxH ‏ : ‎ 30 x 28 x 2 Centimeters', 'RR Fashion Men\'s Regular Formal Trouser', 'RR Fashion Men\'s Regular Formal Trouser', 'RR Fashion Men\'s Regular Formal Trouser', 1),
(80, 8, 21, 'BLACKBERRY PENTS', 300, 150, 12, '309501573_31EBUzItRIL.jpg', 'blackberrys Men\'s Formal B-95 Slim Fit Non-Stretch Trousers-BP-DO-MANDIS', 'Product Dimensions ‏ : ‎ 115.5 x 41 x 115.5 cm; 400 Grams\r\nDate First Available ‏ : ‎ 28 September 2022\r\nManufacturer ‏ : ‎ KRISHNA LABELS PVT. LTD.,162- UDYOG VIHAR PHASE-1-,GURGAON,HARYANA,122016\r\nASIN ‏ : ‎ B0BGPY8B58\r\nItem model number ‏ : ‎ A22LPM2165Z1IFE004\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ KRISHNA LABELS PVT. LTD.,162- UDYOG VIHAR PHASE-1-,GURGAON,HARYANA,122016, KRISHNA LABELS PVT. LTD.,162- UDYOG VIHAR PHASE-1-,GURGAON,HARYANA,122016\r\nPacker ‏ : ‎ KRISHNA LABELS PVT. LTD.,162- UDYOG VIHAR PHASE-1-,GURGAON,HARYANA,122016\r\nImporter ‏ : ‎ KRISHNA LABELS PVT. LTD.,162- UDYOG VIHAR PHASE-1-,GURGAON,HARYANA,122016\r\nItem Weight ‏ : ‎ 400 g', 'blackberrys Men\'s Formal B-95 Slim Fit Non-Stretch Trousers-BP-DO-MANDIS', 'blackberrys Men\'s Formal B-95 Slim Fit Non-Stretch Trousers-BP-DO-MANDIS', 'blackberrys Men\'s Formal B-95 Slim Fit Non-Stretch Trousers-BP-DO-MANDIS', 1),
(81, 8, 21, 'ssh Shiv', 400, 250, 12, '455969810_41MCsnIw-tL.jpg', 'ssh Shiv Collection Men\'s Slim Fit Formal Trousers Pant', 'Product Dimensions ‏ : ‎ 5 x 5 x 5 cm\r\nDate First Available ‏ : ‎ 11 March 2023\r\nASIN ‏ : ‎ B0BY4V748S\r\nItem part number ‏ : ‎ Shiv Collection\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nItem Dimensions LxWxH ‏ : ‎ 50 x 50 x 50 Millimeters', 'ssh Shiv Collection Men\'s Slim Fit Formal Trousers Pant', 'ssh Shiv Collection Men\'s Slim Fit Formal Trousers Pant', 'ssh Shiv Collection Men\'s Slim Fit Formal Trousers Pant', 1),
(82, 8, 21, 'Jack and Jini', 500, 400, 12, '476148514_31X0BUN+8sL.jpg', 'Jack and Jini Formal Stretchable Pant Navy Blue with Expandable Waist for Men.', 'Product Dimensions ‏ : ‎ 37 x 29 x 2 cm; 510 Grams\r\nDate First Available ‏ : ‎ 14 October 2022\r\nManufacturer ‏ : ‎ Huge Sales and Impex\r\nASIN ‏ : ‎ B0BJ7K2F8X\r\nItem model number ‏ : ‎ Lycra Black 2022\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Huge Sales and Impex, Huge Sales and Impex, Udaipur\r\nPacker ‏ : ‎ Huge Sales and Impex, Udaipur\r\nImporter ‏ : ‎ Huge Sales and Impex, Udaipur\r\nItem Weight ‏ : ‎ 510 g\r\nItem Dimensions LxWxH ‏ : ‎ 37 x 29 x 2 Centimeters', 'Jack and Jini Formal Stretchable Pant Navy Blue with Expandable Waist for Men.', 'Jack and Jini Formal Stretchable Pant Navy Blue with Expandable Waist for Men.', 'Jack and Jini Formal Stretchable Pant Navy Blue with Expandable Waist for Men.', 1),
(83, 8, 23, 'JOCKY TRACK', 300, 150, 12, '826036736_71gzUlcf9iL._UL1500_.jpg', 'Jockey Men\'s Regular Track Pants', 'Product Dimensions ‏ : ‎ 31.5 x 24.5 x 2.5 cm; 355 Grams\r\nDate First Available ‏ : ‎ 29 November 2021\r\nManufacturer ‏ : ‎ PAGE INDUSTRIES LIMITED\r\nASIN ‏ : ‎ B09MQB76JD\r\nItem model number ‏ : ‎ MV24\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ PAGE INDUSTRIES LIMITED, PAGE INDUSTRIES LIMITED, PAGE INDUSTRIES LIMITED, Cessna Business Park, 7th Floor, Umiya Business Bay, Tower-1, Varthur Hobli, Outer Ring Road, Bengaluru, Karnataka - 560103\r\nPacker ‏ : ‎ PAGE INDUSTRIES LIMITED, PAGE INDUSTRIES LIMITED, Cessna Business Park, 7th Floor, Umiya Business Bay, Tower-1, Varthur Hobli, Outer Ring Road, Bengaluru, Karnataka - 560103\r\nItem Weight ‏ : ‎ 355 g\r\nItem Dimensions LxWxH ‏ : ‎ 31.5 x 24.5 x 2.5 Centimeters\r\nGeneric Name ‏ : ‎ Track Pants', 'Jockey Men\'s Regular Track Pants', 'Jockey Men\'s Regular Track Pants', 'Jockey Men\'s Regular Track Pants', 1),
(84, 8, 23, 'JONNEY', 400, 250, 120, '902310872_4139GseLXeL.jpg', 'Package Dimensions ‏ : ‎ 31.5 x 24.2 x 3.2 cm; 240 Grams\r\nDate First Available ‏ : ‎ 27 March 2023\r\nManufacturer ‏ : ‎ MACK HOSIERY,B-32/741,BAHADUR KE ROAD,GT ROAD Ludhiana Punjab(WEST),141008\r\nASIN ‏ : ‎ B0BZQ5V177\r\nItem part number ‏ : ‎ D10_MELANGEE_01-L\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ MACK HOSIERY,B-32/741,BAHADUR KE ROAD,GT ROAD Ludhiana Punjab(WEST),141008\r\nItem Weight ‏ : ‎ 240 g', 'Product Dimensions ‏ : ‎ 20.32 x 7.62 x 25.4 cm; 200 Grams\r\nDate First Available ‏ : ‎ 9 March 2020\r\nManufacturer ‏ : ‎ Mack Hosiery, Ludhiana, 141008\r\nASIN ‏ : ‎ B085NNC9N1\r\nItem part number ‏ : ‎ D1-PRT-NO.1-MLG_0001-M\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Mack Hosiery, Ludhiana, 141008, Mack Hosiery, Ludhiana, 141008\r\nItem Weight ‏ : ‎ 200 g\r\nItem Dimensions LxWxH ‏ : ‎ 20.3 x 7.6 x 25.4 Centimeters', 'Package Dimensions ‏ : ‎ 31.5 x 24.2 x 3.2 cm; 240 Grams\r\nDate First Available ‏ : ‎ 27 March 2023\r\nManufacturer ‏ : ‎ MACK HOSIERY,B-32/741,BAHADUR KE ROAD,GT ROAD Ludhiana Punjab(WEST),141008\r\nASIN ‏ : ‎ B0BZQ5V177\r\nItem part number ‏ : ‎ D10_MELANGEE_0', 'Package Dimensions ‏ : ‎ 31.5 x 24.2 x 3.2 cm; 240 Grams\r\nDate First Available ‏ : ‎ 27 March 2023\r\nManufacturer ‏ : ‎ MACK HOSIERY,B-32/741,BAHADUR KE ROAD,GT ROAD Ludhiana Punjab(WEST),141008\r\nASIN ‏ : ‎ B0BZQ5V177\r\nItem part number ‏ : ‎ D10_MELANGEE_0', 'Package Dimensions ‏ : ‎ 31.5 x 24.2 x 3.2 cm; 240 Grams\r\nDate First Available ‏ : ‎ 27 March 2023\r\nManufacturer ‏ : ‎ MACK HOSIERY,B-32/741,BAHADUR KE ROAD,GT ROAD Ludhiana Punjab(WEST),141008\r\nASIN ‏ : ‎ B0BZQ5V177\r\nItem part number ‏ : ‎ D10_MELANGEE_0', 1),
(85, 8, 23, 'Van Heusen', 300, 150, 12, '321162910_41NY7meDxAL.jpg', 'Van Heusen Men\'s Track Pants', 'Product Dimensions ‏ : ‎ 28 x 24 x 3 cm; 400 Grams\r\nDate First Available ‏ : ‎ 31 December 2019\r\nManufacturer ‏ : ‎ Aditya Birla Fashion & Retail\r\nASIN ‏ : ‎ B083C2GFWL\r\nItem model number ‏ : ‎ 50056\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Aditya Birla Fashion & Retail\r\nItem Weight ‏ : ‎ 400 g\r\nItem Dimensions LxWxH ‏ : ‎ 28 x 24 x 3 Centimeters\r\nGeneric Name ‏ : ‎ Track Pants', 'Van Heusen Men\'s Track Pants', 'Van Heusen Men\'s Track Pants', 'Van Heusen Men\'s Track Pants', 1),
(86, 8, 23, 'RVCA TRACK', 300, 180, 12, '266211473_71PlFshFnFL._UL1500_.jpg', 'RVCA Men\'s Fleece Sweatpant with Pockets', 'Package Dimensions ‏ : ‎ 45.1 x 33.3 x 6.2 cm; 504 Grams\r\nDate First Available ‏ : ‎ 17 February 2022\r\nManufacturer ‏ : ‎ RVCA\r\nASIN ‏ : ‎ B09NQPPC1X\r\nItem model number ‏ : ‎ AVYFB00137-BLK\r\nCountry of Origin ‏ : ‎ USA\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ RVCA', 'RVCA Men\'s Fleece Sweatpant with Pockets', 'RVCA Men\'s Fleece Sweatpant with Pockets', 'RVCA Men\'s Fleece Sweatpant with Pockets', 1),
(87, 8, 23, 'PEPPYZONE', 250, 180, 12, '685948130_610BjJqZ67L._UL1500_.jpg', 'Peppyzone Men\'s Camouflage Regular Fit Track Pant', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 30 x 25 x 3 cm; 400 Grams\r\nDate First Available ‏ : ‎ 17 February 2018\r\nManufacturer ‏ : ‎ VASTRAZ\r\nASIN ‏ : ‎ B079WLZFHQ\r\nItem model number ‏ : ‎ LR-89\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ VASTRAZ, Peppyzone, No:4/B, Babu Jagan Street, Arumbakkam, Chennai -600106, Tamil Nadu, Mobile: 7200615300, support@peppyzone.in\r\nPacker ‏ : ‎ Peppyzone, No:4/B, Babu Jagan Street, Arumbakkam, Chennai -600106, Tamil Nadu, Mobile: 7200615300, support@peppyzone.in\r\nItem Weight ‏ : ‎ 400 g', 'Peppyzone Men\'s Camouflage Regular Fit Track Pant', 'Peppyzone Men\'s Camouflage Regular Fit Track Pant', 'Peppyzone Men\'s Camouflage Regular Fit Track Pant', 1),
(88, 8, 23, 'BLUE STAR SHARK', 250, 190, 12, '927780848_31pHe-b55LL.jpg', 'BLUE STAR SHARK Men\'s Lycra Stretchable Regular Fit Joggers Navy Track Pant Lower', 'Product Dimensions ‏ : ‎ 24 x 23 x 4 cm; 330 Grams\r\nDate First Available ‏ : ‎ 14 March 2022\r\nASIN ‏ : ‎ B09VM6CRKW\r\nItem part number ‏ : ‎ BSS_Grey_ARROW_CRG_XXL\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nItem Weight ‏ : ‎ 330 g', 'BLUE STAR SHARK Men\'s Lycra Stretchable Regular Fit Joggers Navy Track Pant Lower', 'BLUE STAR SHARK Men\'s Lycra Stretchable Regular Fit Joggers Navy Track Pant Lower', 'BLUE STAR SHARK Men\'s Lycra Stretchable Regular Fit Joggers Navy Track Pant Lower', 1),
(89, 8, 23, 'BIG BOTTON', 350, 250, 12, '160114511_81ghck3I3HS._UL1500_.jpg', 'Big Button Men\'s Regular Fit Cotton Blend Track Pant (BB 9505_Black)', 'Product Dimensions ‏ : ‎ 29 x 25 x 2 cm; 330 Grams\r\nDate First Available ‏ : ‎ 8 May 2021\r\nManufacturer ‏ : ‎ COCCY SG INDIA\r\nASIN ‏ : ‎ B094GFZNPG\r\nItem part number ‏ : ‎ BB 9501\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ COCCY SG INDIA\r\nItem Weight ‏ : ‎ 330 g\r\nItem Dimensions LxWxH ‏ : ‎ 29 x 25 x 2 Centimeters', 'Big Button Men\'s Regular Fit Cotton Blend Track Pant (BB 9505_Black)', 'Big Button Men\'s Regular Fit Cotton Blend Track Pant (BB 9505_Black)', 'Big Button Men\'s Regular Fit Cotton Blend Track Pant (BB 9505_Black)', 1),
(90, 8, 24, 'JOCKEY SHORTS', 300, 200, 12, '875650739_71ll4vuFZtL._UL1500_.jpg', 'Jockey Men\'s Cotton Shorts', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 28 x 24 x 3 cm; 375 Grams\r\nDate First Available ‏ : ‎ 12 April 2015\r\nManufacturer ‏ : ‎ PAGE INDUSTRIES LIMITED\r\nASIN ‏ : ‎ B00W05JKRC\r\nItem model number ‏ : ‎ SP26-01\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ PAGE INDUSTRIES LIMITED, PAGE INDUSTRIES LIMITED, Umiya Business Bay-Tower-1, 7th Floor, Cessna Business Park, Kadubeesanahalli, Varthur Hobli, Bengaluru- 560103; Contact no : 080-4945-4545\r\nPacker ‏ : ‎ PAGE INDUSTRIES LIMITED, Umiya Business Bay-Tower-1, 7th Floor, Cessna Business Park, Kadubeesanahalli, Varthur Hobli, Bengaluru- 560103; Contact no : 080-4945-4545\r\nItem Weight ‏ : ‎ 375 g\r\nItem Dimensions LxWxH ‏ : ‎ 28 x 24 x 3 Centimeters\r\nIncluded Components ‏ : ‎ Shorts\r\nGeneric Name ‏ : ‎ Performance Shorts', 'Jockey Men\'s Cotton Shorts', 'Jockey Men\'s Cotton Shorts', 'Jockey Men\'s Cotton Shorts', 1),
(91, 8, 24, 'Amazon Brand -', 300, 180, 12, '354680055_713p2lQXoML._UL1500_.jpg', 'Amazon Brand - Symbol Men\'s Shorts', 'Product Dimensions ‏ : ‎ 5 x 5 x 5 cm; 50 Grams\r\nDate First Available ‏ : ‎ 4 May 2022\r\nManufacturer ‏ : ‎ Amazon Brand - Symbol\r\nASIN ‏ : ‎ B09ZHMBL8Q\r\nItem model number ‏ : ‎ AW19-SHR-ESS-03\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Amazon Brand - Symbol, CLOUDTAIL INDIA PRIVATE LIMITED, Ground Floor, Rear Portion, H-9, Block B-1, Mohan Cooperative Industrial Area, Mathura Road, New Delhi-110044\r\nPacker ‏ : ‎ CLOUDTAIL INDIA PRIVATE LIMITED, Ground Floor, Rear Portion, H-9, Block B-1, Mohan Cooperative Industrial Area, Mathura Road, New Delhi-110044\r\nItem Weight ‏ : ‎ 50 g\r\nItem Dimensions LxWxH ‏ : ‎ 50 x 50 x 50 Millimeters\r\nGeneric Name ‏ : ‎ Shorts', 'Amazon Brand - Symbol Men\'s Shorts', 'Amazon Brand - Symbol Men\'s Shorts', 'Amazon Brand - Symbol Men\'s Shorts', 1),
(92, 8, 24, 'U.S. POLO  SHORTS', 260, 140, 12, '698963795_51tT+cYY08L._UL1100_.jpg', 'U.S. POLO ASSN. Men\'s Regular Shorts', 'Product Dimensions ‏ : ‎ 24 x 20 x 1.5 cm; 500 Grams\r\nDate First Available ‏ : ‎ 11 November 2019\r\nManufacturer ‏ : ‎ Us Polo Association\r\nASIN ‏ : ‎ B081B1VYLM\r\nItem model number ‏ : ‎ I668-PL\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Us Polo Association, BHUVANESWARI TEX\r\nPacker ‏ : ‎ BHUVANESWARI TEX\r\nImporter ‏ : ‎ Arvind Brands 8th Floor, Duparc Trinity, FM Cariappa Colony, Shivaji Nagar, 17, MG Rd, Ashok Nagar, Bengaluru, Karnataka 560001\r\nItem Weight ‏ : ‎ 500 g\r\nItem Dimensions LxWxH ‏ : ‎ 24 x 20 x 1.5 Centimeters', 'U.S. POLO ASSN. Men\'s Regular Shorts', 'U.S. POLO ASSN. Men\'s Regular Shorts', 'U.S. POLO ASSN. Men\'s Regular Shorts', 1),
(93, 8, 24, 'Chromozome', 350, 260, 12, '126943455_31ufq-70GnL.jpg', 'Chromozome Men\'s Regular Shorts', 'Product Dimensions ‏ : ‎ 33 x 22 x 2 cm; 240 Grams\r\nDate First Available ‏ : ‎ 1 February 2019\r\nManufacturer ‏ : ‎ Huechem Textiles Pvt Ltd\r\nASIN ‏ : ‎ B07NBYXQC1\r\nItem model number ‏ : ‎ N-169 Running Shorts\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Huechem Textiles Pvt Ltd, Huechem Textiles Pvt Ltd No 1 AVP Road Near Kalaivani theatre Angeripalayam post Tirupur 641603\r\nPacker ‏ : ‎ Huechem Textiles Pvt Ltd No 1 AVP Road Near Kalaivani theatre Angeripalayam post Tirupur 641603\r\nItem Weight ‏ : ‎ 240 g\r\nItem Dimensions LxWxH ‏ : ‎ 33 x 22 x 2 Centimeters', 'Chromozome Men\'s Regular Shorts', 'Chromozome Men\'s Regular Shorts', 'Chromozome Men\'s Regular Shorts', 1),
(94, 8, 24, 'CBLUE SHORT', 250, 160, 12, '354450768_41s8B8hOCcL.jpg', 'CBlue Men\'s Outdoor Quick Dry Lightweight Sports Shorts Zipper Pockets', 'Package Dimensions ‏ : ‎ 27.6 x 22.3 x 3 cm; 190 Grams\r\nDate First Available ‏ : ‎ 12 January 2021\r\nManufacturer ‏ : ‎ C Blue Fitness And Sports\r\nASIN ‏ : ‎ B08SWKCJ6Z\r\nItem model number ‏ : ‎ CNSHORTS-NS\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ C Blue Fitness And Sports, C BLUE FITNESS AND SPORTS , JALANDHAR 919999311261\r\nPacker ‏ : ‎ C BLUE FITNESS AND SPORTS , JALANDHAR 919999311261\r\nItem Weight ‏ : ‎ 190 g', 'CBlue Men\'s Outdoor Quick Dry Lightweight Sports Shorts Zipper Pockets', 'CBlue Men\'s Outdoor Quick Dry Lightweight Sports Shorts Zipper Pockets', 'CBlue Men\'s Outdoor Quick Dry Lightweight Sports Shorts Zipper Pockets', 1),
(95, 8, 24, 'UNBEATABLE Cycling', 240, 120, 12, '355799575_31IF71dAsLL.jpg', 'UNBEATABLE Men\'s Cycling Shorts', 'Package Dimensions ‏ : ‎ 24 x 21 x 5 cm; 240 Grams\r\nDate First Available ‏ : ‎ 14 April 2022\r\nASIN ‏ : ‎ B09Y1YX6PY\r\nItem part number ‏ : ‎ STAR\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nItem Weight ‏ : ‎ 240 g', 'UNBEATABLE Men\'s Cycling Shorts', 'UNBEATABLE Men\'s Cycling Shorts', 'UNBEATABLE Men\'s Cycling Shorts', 1),
(96, 8, 24, 'JUST RIDER', 400, 250, 12, '145235436_41QC8AdwL8L.jpg', 'JUST RIDER Men\'s Cycling Shorts with Side Pocket', 'Package Dimensions ‏ : ‎ 10 x 8 x 5 cm; 190 Grams\r\nDate First Available ‏ : ‎ 7 February 2023\r\nASIN ‏ : ‎ B0BV2TR55X\r\nItem part number ‏ : ‎ 70-Shorts\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nItem Weight ‏ : ‎ 190 g', 'JUST RIDER Men\'s Cycling Shorts with Side Pocket', 'JUST RIDER Men\'s Cycling Shorts with Side Pocket', 'JUST RIDER Men\'s Cycling Shorts with Side Pocket', 1),
(97, 8, 24, 'DBURKE SHORTS', 250, 110, 12, '227221386_31xnuRH-i7L.jpg', 'DBURKE Shorts for Mens and WomensNS Polyester Shorts with One Side Safety Zipper Pocket | Adjustable Drawstrings with Elastic | Quick-Dry Absorbent & Comfortable | Shorts for Men', 'Product Dimensions ‏ : ‎ 10 x 10 x 10 cm; 120 Grams\r\nDate First Available ‏ : ‎ 5 April 2022\r\nManufacturer ‏ : ‎ Dburke\r\nASIN ‏ : ‎ B09X8B3Q28\r\nItem model number ‏ : ‎ DB-legcut_110\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Unisex-adult\r\nManufacturer ‏ : ‎ Dburke, support@barkeyo.com\r\nImporter ‏ : ‎ Www.barkeyo.com\r\nItem Weight ‏ : ‎ 120 g\r\nItem Dimensions LxWxH ‏ : ‎ 10 x 10 x 10 Centimeters', 'DBURKE Shorts for Mens and WomensNS Polyester Shorts with One Side Safety Zipper Pocket | Adjustable Drawstrings with Elastic | Quick-Dry Absorbent & Comfortable | Shorts for Men', 'DBURKE Shorts for Mens and WomensNS Polyester Shorts with One Side Safety Zipper Pocket | Adjustable Drawstrings with Elastic | Quick-Dry Absorbent & Comfortable | Shorts for Men', 'DBURKE Shorts for Mens and WomensNS Polyester Shorts with One Side Safety Zipper Pocket | Adjustable Drawstrings with Elastic | Quick-Dry Absorbent & Comfortable | Shorts for Men', 1),
(98, 8, 25, 'URBANO', 300, 180, 12, '374278631_71KQOSp+5IL._UL1500_.jpg', 'Urbano Fashion Men\'s Light Blue Slim Fit Denim Jeans Stretchable', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 33 x 27 x 1 cm; 249 Grams\r\nDate First Available ‏ : ‎ 18 August 2017\r\nManufacturer ‏ : ‎ Imperial Online Services Pvt Ltd\r\nASIN ‏ : ‎ B074YTGCDZ\r\nItem model number ‏ : ‎ eps-grey-40-fba\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Imperial Online Services Pvt Ltd, Imperial Online Services Private Limited, #6-56/1/A, NH9, Opposite IDPL Factory, Balanagar, HYDERABAD, TELANGANA, 500037, India\r\nPacker ‏ : ‎ Imperial Online Services Private Limited, #6-56/1/A, NH9, Opposite IDPL Factory, Balanagar, HYDERABAD, TELANGANA, 500037, India\r\nImporter ‏ : ‎ Imperial Online Services Private Limited, #6-56/1/A, NH9, Opposite IDPL Factory, Balanagar, HYDERABAD, TELANGANA, 500037, India\r\nItem Weight ‏ : ‎ 249 g\r\nItem Dimensions LxWxH ‏ : ‎ 33 x 27 x 1 Centimeters\r\nGeneric Name ‏ : ‎ Jeans', 'Urbano Fashion Men\'s Light Blue Slim Fit Denim Jeans Stretchable', 'Urbano Fashion Men\'s Light Blue Slim Fit Denim Jeans Stretchable', 'Urbano Fashion Men\'s Light Blue Slim Fit Denim Jeans Stretchable', 1),
(99, 8, 25, 'ALLEN  SOLLY', 350, 250, 12, '998195859_61rkG-3PNjL._UL1500_.jpg', 'Allen Solly Men\'s Slim Jeans Color Collections', 'Product Dimensions ‏ : ‎ 3 x 15 x 3 cm; 400 Grams\r\nDate First Available ‏ : ‎ 1 September 2021\r\nManufacturer ‏ : ‎ Allen Solly\r\nASIN ‏ : ‎ B09F657SDT\r\nItem model number ‏ : ‎ ALDNVSKF859099\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Allen Solly, Aditya Birla Fashion and Retail Limited. Kh No. 118/110/1, Building 2, Divyasree Technopolis, Yemalur Post, Off HAL Airport Road, Bengaluru-560037\r\nPacker ‏ : ‎ Aditya Birla Fashion and Retail Limited. Kh No. 118/110/1, Building 2, Divyasree Technopolis, Yemalur Post, Off HAL Airport Road, Bengaluru-560037\r\nImporter ‏ : ‎ Aditya Birla Fashion and Retail Limited. Kh No. 118/110/1, Building 2, Divyasree Technopolis, Yemalur Post, Off HAL Airport Road, Bengaluru-560037\r\nItem Weight ‏ : ‎ 400 g', 'Allen Solly Men\'s Slim Jeans Color Collections', 'Allen Solly Men\'s Slim Jeans Color Collections', 'Allen Solly Men\'s Slim Jeans Color Collections', 1),
(100, 8, 25, 'Amazon Brand - Inkast Denim', 400, 330, 12, '726885621_41gGLwdrl0L.jpg', 'Amazon Brand - Inkast Denim Co. Men\'s Slim Stretchable Jeans', 'Package Dimensions ‏ : ‎ 24.6 x 15 x 8.8 cm; 10 Grams\r\nDate First Available ‏ : ‎ 3 October 2018\r\nManufacturer ‏ : ‎ Amazon Brand - Inkast Denim Co.\r\nASIN ‏ : ‎ B07HZFQHT9\r\nItem model number ‏ : ‎ IN-ST-106_DARK BLUE_28\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Amazon Brand - Inkast Denim Co.\r\nItem Weight ‏ : ‎ 10 g\r\nGeneric Name ‏ : ‎ Stretchable Jeans', 'Amazon Brand - Inkast Denim Co. Men\'s Slim Stretchable Jeans', 'Amazon Brand - Inkast Denim Co. Men\'s Slim Stretchable Jeans', 'Amazon Brand - Inkast Denim Co. Men\'s Slim Stretchable Jeans', 1),
(101, 8, 25, 'GREENFIBER JEANS', 500, 350, 12, '133139427_51monwBnXoL._UL1440_.jpg', 'Greenfibre Men\'s Washed Raw Blue Cotton Stretch Narrow Fit Jeans - KDTH', 'Package Dimensions ‏ : ‎ 28 x 25 x 4 cm; 350 Grams\r\nDate First Available ‏ : ‎ 23 September 2022\r\nASIN ‏ : ‎ B0BG8FW14B\r\nItem part number ‏ : ‎ KDTH_32\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nItem Weight ‏ : ‎ 350 g', 'Greenfibre Men\'s Washed Raw Blue Cotton Stretch Narrow Fit Jeans - KDTH', 'Greenfibre Men\'s Washed Raw Blue Cotton Stretch Narrow Fit Jeans - KDTH', 'Greenfibre Men\'s Washed Raw Blue Cotton Stretch Narrow Fit Jeans - KDTH', 1),
(102, 8, 25, 'Amazon Brand', 500, 350, 12, '568895333_31wEZhbKsfL.jpg', 'Amazon Brand - Symbol Men\'s Slim Stretchable Jeans', 'Product Dimensions ‏ : ‎ 0.1 x 0.1 x 0.1 cm; 10 Grams\r\nDate First Available ‏ : ‎ 2 April 2022\r\nManufacturer ‏ : ‎ Amazon Brand - Symbol\r\nASIN ‏ : ‎ B09CH3R1Y6\r\nItem model number ‏ : ‎ SY-SB-CL-SL-203\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Amazon Brand - Symbol, CLOUDTAIL INDIA PRIVATE LIMITED, Ground Floor, Rear Portion, H-9, Block B-1, Mohan Cooperative Industrial Area, Mathura Road, New Delhi-110044\r\nPacker ‏ : ‎ CLOUDTAIL INDIA PRIVATE LIMITED, Ground Floor, Rear Portion, H-9, Block B-1, Mohan Cooperative Industrial Area, Mathura Road, New Delhi-110044\r\nItem Weight ‏ : ‎ 10 g\r\nItem Dimensions LxWxH ‏ : ‎ 1 x 1 x 1 Millimeters\r\nGeneric Name ‏ : ‎ Stretchable Jeans', 'Amazon Brand - Symbol Men\'s Slim Stretchable Jeans', 'Amazon Brand - Symbol Men\'s Slim Stretchable Jeans', 'Amazon Brand - Symbol Men\'s Slim Stretchable Jeans', 1),
(103, 8, 25, 'BEN MAERTIN', 400, 250, 12, '166737597_515olk-XS-L._UL1440_.jpg', 'Ben Martin Men\'s Relaxed Fit Jeans', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 18 x 25 x 3 cm; 400 Grams\r\nDate First Available ‏ : ‎ 15 May 2016\r\nManufacturer ‏ : ‎ Maruti Enterprises\r\nASIN ‏ : ‎ B01FPI95OI\r\nItem model number ‏ : ‎ BMW-JJ3-DARK-p4-28\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Maruti Enterprises\r\nItem Weight ‏ : ‎ 400 g\r\nItem Dimensions LxWxH ‏ : ‎ 18 x 25 x 3 Centimeters\r\nGeneric Name ‏ : ‎ Jeans', 'Ben Martin Men\'s Relaxed Fit Jeans', 'Ben Martin Men\'s Relaxed Fit Jeans', 'Ben Martin Men\'s Relaxed Fit Jeans', 1),
(104, 8, 25, 'U.S. POLO ASSN', 400, 250, 12, '365236284_81jlygrquPL._UL1500_.jpg', 'U.S. POLO ASSN. Men Men\'s Jeans', 'roduct details\r\nProduct Dimensions ‏ : ‎ 24 x 20 x 1.5 cm; 500 Grams\r\nDate First Available ‏ : ‎ 16 August 2022\r\nManufacturer ‏ : ‎ OM CREATIONS NO 43 MALLASANDRA Vi HESARGHATTA ROAD BENGALURU 560073\r\nASIN ‏ : ‎ B0B9SMQ982\r\nItem model number ‏ : ‎ UDJENO0833\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ OM CREATIONS NO 43 MALLASANDRA Vi HESARGHATTA ROAD BENGALURU 560073, OM CREATIONS NO 43 SRI NIDHI VANIJYA SANKEERNA MALLASANDRA VILLAGE HESARGHATTA MAIN ROAD BENGALURU 560073\r\nPacker ‏ : ‎ OM CREATIONS NO 43 SRI NIDHI VANIJYA SANKEERNA MALLASANDRA VILLAGE HESARGHATTA MAIN ROAD BENGALURU 560073\r\nImporter ‏ : ‎ Arvind Lifestyle brands ltds, 8th Floor, Duparc Trinity, 17, MG Road, Bangalore , Karnataka 560001\r\nItem Weight ‏ : ‎ 500 g', 'U.S. POLO ASSN. Men Men\'s Jeans', 'U.S. POLO ASSN. Men Men\'s Jeans', 'U.S. POLO ASSN. Men Men\'s Jeans', 1),
(105, 8, 28, 'ADBUCKS JOGGER', 400, 300, 12, '901715041_51Uac2uhC5L._UL1298_.jpg', 'ADBUCKS Men\'s Soild Cargos Style Joggers', 'Product Dimensions ‏ : ‎ 30 x 20 x 3 cm; 300 Grams\r\nDate First Available ‏ : ‎ 27 March 2023\r\nASIN ‏ : ‎ B0BZPZ895Y\r\nItem part number ‏ : ‎ Mens Joggers\r\nDepartment ‏ : ‎ Men\r\nItem Weight ‏ : ‎ 300 g\r\nItem Dimensions LxWxH ‏ : ‎ 30 x 20 x 3 Centimeters', 'ADBUCKS Men\'s Soild Cargos Style Joggers', 'ADBUCKS Men\'s Soild Cargos Style Joggers', 'ADBUCKS Men\'s Soild Cargos Style Joggers', 1),
(106, 8, 28, 'BEWAKOOF', 400, 250, 12, '113236414_41NXf4Pc3dL._UL1100_.jpg', 'Bewakoof Men\'s Solid Black Oversized Cargo Joggers', 'Product Dimensions ‏ : ‎ 28 x 24 x 2.5 cm; 425 Grams\r\nDate First Available ‏ : ‎ 11 January 2023\r\nManufacturer ‏ : ‎ Bewakoof\r\nASIN ‏ : ‎ B0BS3JFRQH\r\nItem model number ‏ : ‎ 552888\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Bewakoof, Bewakoof Brands Pvt Ltd, Sairaj Logistic Hub #A5, Bmc Pipeline Road, Opposite All Saints High School, Amne, Bhiwandi, Thane, Maharashtra 421302\r\nPacker ‏ : ‎ Bewakoof Brands Pvt Ltd, Sairaj Logistic Hub #A5, Bmc Pipeline Road, Opposite All Saints High School, Amane, Bhiwandi, Thane, Maharashtra - 421302\r\nItem Weight ‏ : ‎ 425 g\r\nItem Dimensions LxWxH ‏ : ‎ 28 x 24 x 2.5 Centimeters', 'Bewakoof Men\'s Solid Black Oversized Cargo Joggers', 'Bewakoof Men\'s Solid Black Oversized Cargo Joggers', 'Bewakoof Men\'s Solid Black Oversized Cargo Joggers', 1),
(107, 8, 28, 'BLUE STAR JOGGER', 400, 250, 12, '451606749_51Ip2+uBQ8L._UL1500_.jpg', 'BLUE STAR SHARK Men\'s Lycra Stretchable Regular Fit Joggers Navy Track Pant Lower', 'Product Dimensions ‏ : ‎ 24 x 23 x 4 cm; 330 Grams\r\nDate First Available ‏ : ‎ 31 January 2022\r\nASIN ‏ : ‎ B09F3W2P7R\r\nItem part number ‏ : ‎ BSS_AIRFORCE_ARROW_CRG_S\r\nDepartment ‏ : ‎ Men\r\nItem Weight ‏ : ‎ 330 g\r\nItem Dimensions LxWxH ‏ : ‎ 24 x 23 x 4 Centimeters', 'BLUE STAR SHARK Men\'s Lycra Stretchable Regular Fit Joggers Navy Track Pant Lower', 'BLUE STAR SHARK Men\'s Lycra Stretchable Regular Fit Joggers Navy Track Pant Lower', 'BLUE STAR SHARK Men\'s Lycra Stretchable Regular Fit Joggers Navy Track Pant Lower', 1),
(108, 8, 28, 'UMBRO JOGGER', 250, 200, 12, '588987878_61+Ig0zs7qL._UL1500_.jpg', 'Umbro Men\'s Diamond Jogger Pants, Black/White', 'Package Dimensions ‏ : ‎ 26 x 21.3 x 4.3 cm; 240.4 Grams\r\nDate First Available ‏ : ‎ 3 January 2021\r\nASIN ‏ : ‎ B08964P198\r\nDepartment ‏ : ‎ Men\r\nItem Weight ‏ : ‎ 240 g', 'Umbro Men\'s Diamond Jogger Pants, Black/White', 'Umbro Men\'s Diamond Jogger Pants, Black/White', 'Umbro Men\'s Diamond Jogger Pants, Black/White', 1),
(109, 8, 28, 'POLYESTER JOGGER', 500, 350, 12, '351831799_319ARUkTTEL.jpg', 'Polyester Men\'s Joggers Regular Fit Stretchable Track Pant', 'Date First Available ‏ : ‎ 11 November 2022\r\nASIN ‏ : ‎ B0BM5S6FHK\r\nItem part number ‏ : ‎ NIMO-0012\r\nDepartment ‏ : ‎ Men', 'Polyester Men\'s Joggers Regular Fit Stretchable Track Pant', 'Polyester Men\'s Joggers Regular Fit Stretchable Track Pant', 'Polyester Men\'s Joggers Regular Fit Stretchable Track Pant', 1),
(110, 8, 28, 'Ak Joggers Grey', 600, 450, 12, '470808806_41DkBmV5pnL._UL1080_ (1).jpg', 'Ak Joggers Grey', 'Date First Available ‏ : ‎ 18 April 2023\r\nASIN ‏ : ‎ B0C2VWR229\r\nItem part number ‏ : ‎ ak223\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men', 'Ak Joggers Grey', 'Ak Joggers Grey', 'Ak Joggers Grey', 1),
(111, 8, 28, 'Aruljohti Knits', 360, 260, 12, '670345282_51xM6aCtcPL.jpg', 'Aruljohti Knits Men\'s Cotton Designer', 'Package Dimensions ‏ : ‎ 15 x 10 x 3 cm; 300 Grams\r\nDate First Available ‏ : ‎ 17 March 2023\r\nManufacturer ‏ : ‎ Aruljothi Knits\r\nASIN ‏ : ‎ B0BYV9Y2XT\r\nItem model number ‏ : ‎ Jogger_Army_Green_S\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Aruljothi Knits, Aruljohti Knits\r\nPacker ‏ : ‎ Aruljothi Knits\r\nItem Weight ‏ : ‎ 300 g\r\nGeneric Name ‏ : ‎ Casual Pants', 'Aruljohti Knits Men\'s Cotton Designer', 'Aruljohti Knits Men\'s Cotton Designer', 'Aruljohti Knits Men\'s Cotton Designer', 1),
(112, 24, 11, 'Casio Vintage WATCH', 600, 450, 12, '844125857_41PaUAGYA1L.jpg', 'Casio Vintage Series Digital Grey Dial Men\'s Watch-A-158WA-1Q', 'Batteries ‏ : ‎ 1 Lithium Metal batteries required. (included)\r\nIs Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 12.7 x 10.16 x 20.32 cm; 58 Grams\r\nDate First Available ‏ : ‎ 27 March 2012\r\nManufacturer ‏ : ‎ Casio\r\nASIN ‏ : ‎ B000GAYQJ0\r\nItem model number ‏ : ‎ A158WA-1DF\r\nCountry of Origin ‏ : ‎ China\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ Casio\r\nPacker ‏ : ‎ Casio\r\nItem Weight ‏ : ‎ 58 g\r\nItem Dimensions LxWxH ‏ : ‎ 12.7 x 10.2 x 20.3 Centimeters', 'Casio Vintage Series Digital Grey Dial Men\'s Watch-A-158WA-1Q', 'Casio Vintage Series Digital Grey Dial Men\'s Watch-A-158WA-1Q', 'Casio Vintage Series Digital Grey Dial Men\'s Watch-A-158WA-1Q', 1),
(113, 24, 11, 'NAVIFORCE WATCH', 500, 350, 12, '264433334_61WHV-3ej6L._UL1000_.jpg', 'NAVIFORCE Digital Watch Men Luxury Stainless Steel Analog Quartz Waterproof Watches Fashion Business Chronograph Military Multifunctional Wristwatch', 'Band Colour	Silver\r\nBand Material	Stainless Steel\r\nBand Width	23 Millimeters\r\nBrand	NAVIFORCE\r\nCalendar Type	Day-Date\r\nCase Diameter	45.5 Millimeters\r\nCase Material	Metal\r\nCase Thickness	17 Millimeters\r\nClasp	Buckle\r\nCollection	Fashion\r\nDial Colour	Blue\r\nCrystal Material	Mineral Glass\r\nDisplay Type	Analog-Digital\r\nCase Shape	Round\r\nModel Number	NF9182\r\nPart Number	9182\r\nSpecial Features	1/100 SEC accuracy stopwatch, alarm and SIG function, snooze function , LED backlight\r\nWarranty Type	Contact Seller of Record\r\nMovement	Quartz\r\nWater Resistance Depth	30 Meters\r\nBand size	Men\'s Standard\r\nWarranty Description	1 Year Seller Warranty', 'NAVIFORCE Digital Watch Men Luxury Stainless Steel Analog Quartz Waterproof Watches Fashion Business Chronograph Military Multifunctional Wristwatch', 'NAVIFORCE Digital Watch Men Luxury Stainless Steel Analog Quartz Waterproof Watches Fashion Business Chronograph Military Multifunctional Wristwatch', 'NAVIFORCE Digital Watch Men Luxury Stainless Steel Analog Quartz Waterproof Watches Fashion Business Chronograph Military Multifunctional Wristwatch', 1),
(114, 24, 11, 'ACNOS WATCH', 600, 500, 12, '831498009_51uUVUyfl1S.jpg', 'Acnos Digital Watch Shockproof Multi-Functional Automatic Black Color Strap Waterproof Digital Sports Watch for Men\'s Kids Watch for Boys Watch for Men Pack of 1 Watch Water Resistance Digital Watch', 'Band Colour	Black\r\nBand Material	Polyurethane\r\nBand Width	20 Millimeters\r\nBezel Function	No bezel available\r\nBezel Material	No bezel available\r\nBrand	Acnos\r\nCalendar Type	Day, Date, Month & Year\r\nCase Diameter	36 Millimeters\r\nCase Material	PU\r\nCase Thickness	10.00\r\nClasp	Buckle\r\nDial Colour	Black\r\nCrystal Material	PU\r\nDisplay Type	Digital\r\nCase Shape	Rectangular\r\nItem Weight	250 Grams\r\nModel Number	SSPO-BLK\r\nPart Number	SSPO-BLK\r\nSpecial Features	alarm, Back Light, Multi Time Zone, Stop Watch, Time Display\r\nWarranty Type	Manufacturer\r\nMovement	Quartz\r\nWater Resistance Depth	30 Millimeters\r\nBand size	Mens Standard\r\nWarranty Description	1 Years Warranty Against The Manufacture Defect Only', 'Acnos Digital Watch Shockproof Multi-Functional Automatic Black Color Strap Waterproof Digital Sports Watch for Men\'s Kids Watch for Boys Watch for Men Pack of 1 Watch Water Resistance Digital Watch', 'Acnos Digital Watch Shockproof Multi-Functional Automatic Black Color Strap Waterproof Digital Sports Watch for Men\'s Kids Watch for Boys Watch for Men Pack of 1 Watch Water Resistance Digital Watch', 'Acnos Digital Watch Shockproof Multi-Functional Automatic Black Color Strap Waterproof Digital Sports Watch for Men\'s Kids Watch for Boys Watch for Men Pack of 1 Watch Water Resistance Digital Watch', 1),
(115, 24, 11, 'FASTRACK', 600, 450, 12, '836146713_41WV8GOOO9L.jpg', 'Fastrack Analog Black Dial Unisex Watch-NG38003PP13W / NG38003PP13W', 'Band Colour	Black\r\nBand Material	Plastic\r\nBezel Function	no bezel available\r\nBrand	Fastrack\r\nCase Material	Plastic\r\nClasp	Tang Buckle\r\nDial Colour	Black\r\nDisplay Type	Analog\r\nCase Shape	Round\r\nModel Number	NG38003PP13W / NG38003PP13W\r\nPart Number	NG38003PP13C\r\nSpecial Features	Water Resistant\r\nWarranty Type	Manufacturer\r\nMovement	Quartz\r\nWater Resistance Depth	30 Meters', 'Fastrack Analog Black Dial Unisex Watch-NG38003PP13W / NG38003PP13W', 'Fastrack Analog Black Dial Unisex Watch-NG38003PP13W / NG38003PP13W', 'Fastrack Analog Black Dial Unisex Watch-NG38003PP13W / NG38003PP13W', 1),
(116, 24, 11, 'FASTRACK BLACK DIAL', 700, 550, 12, '298916837_812mdk3Y6TL._UL1500_ (1).jpg', 'Dial Color: Black, Case Shape: Round, Case Material: Stainless Steel\r\nCase Diameter: 39.5 millimeters\r\nBand Color: Black, Band Material: Silicone\r\nWatch Movement Type: Quartz, Watch Display Type: Tees Analog\r\nWater Resistance Depth: 30 meters, Buckle Clasp\r\n12 Months manufacturer warranty on manufacturing defects\r\nIdeal for birthday, anniversary and wedding gift', 'Band Colour	Black\r\nBand Material	Silicone\r\nBrand	Fastrack\r\nCase Diameter	39.5 Millimeters\r\nCase Material	Stainless Steel\r\nClasp	Tang Buckle\r\nDial Colour	Black\r\nDisplay Type	Analog\r\nCase Shape	Round\r\nItem Weight	100 Grams\r\nModel Number	NG38022PP03W / NG38022PP03C\r\nPart Number	NG38022PP03C\r\nSpecial Features	Water Resistant\r\nWarranty Type	Manufacturer\r\nMovement	Quartz\r\nWater Resistance Depth	30 Meters', 'Fastrack Analog Black Dial Men\'s Watch-NG38022PP03W / NG38022PP03C', 'Fastrack Analog Black Dial Men\'s Watch-NG38022PP03W / NG38022PP03C', 'Fastrack Analog Black Dial Men\'s Watch-NG38022PP03W / NG38022PP03C', 1),
(117, 24, 11, 'NOISE', 800, 650, 12, '125289339_61akt30bJsL._SY355_.jpg', 'Noise Pulse Go Buzz Smart Watch with Advanced Bluetooth Calling, 1.69\" TFT Display, SpO2, 100 Sports Mode with Auto Detection, Upto 7 Days Battery (2 Days with Heavy Calling) - Jet Black', 'Brand	Noise\r\nModel Name	ColorFit Pulse Go Buzz\r\nStyle	Modern\r\nColour	Black\r\nScreen Size	1.69 Inches\r\nSpecial Feature	Heart Rate Tracking, Sleep Monitor, 150+ Cloud Watch Face, Notifications\r\nShape	Rectangular\r\nTarget Audience	Unisex Teen, Unisex Adult\r\nAge Range (Description)	Adult\r\nCompatible Devices	Laptop, Tablet, Smartphone', 'Noise Pulse Go Buzz Smart Watch with Advanced Bluetooth Calling, 1.69\" TFT Display, SpO2, 100 Sports Mode with Auto Detection, Upto 7 Days Battery (2 Days with Heavy Calling) - Jet Black', 'Noise Pulse Go Buzz Smart Watch with Advanced Bluetooth Calling, 1.69\" TFT Display, SpO2, 100 Sports Mode with Auto Detection, Upto 7 Days Battery (2 Days with Heavy Calling) - Jet Black', 'Noise Pulse Go Buzz Smart Watch with Advanced Bluetooth Calling, 1.69\" TFT Display, SpO2, 100 Sports Mode with Auto Detection, Upto 7 Days Battery (2 Days with Heavy Calling) - Jet Black', 1),
(118, 24, 12, 'AVIATO', 200, 80, 12, '499258773_51Nyw4S9X8L._UL1500_.jpg', 'ELEGANTE UV Protected Driving Vintage Pilot Gradient Metal Body Aviator Sunglasses for Men and Women', 'Product Dimensions ‏ : ‎ 14 x 14.5 x 5.4 cm; 130 Grams\r\nDate First Available ‏ : ‎ 10 December 2021\r\nManufacturer ‏ : ‎ Elegante International\r\nASIN ‏ : ‎ B09NF4S9X9\r\nItem model number ‏ : ‎ ELG-113 RIVET AVIATOR SUNGLASS\r\nCountry of Origin ‏ : ‎ Italy\r\nDepartment ‏ : ‎ Unisex-adult\r\nManufacturer ‏ : ‎ Elegante International\r\nItem Weight ‏ : ‎ 130 g\r\nItem Dimensions LxWxH ‏ : ‎ 14 x 14.5 x 5.4 Centimeters', 'ELEGANTE UV Protected Driving Vintage Pilot Gradient Metal Body Aviator Sunglasses for Men and Women', 'ELEGANTE UV Protected Driving Vintage Pilot Gradient Metal Body Aviator Sunglasses for Men and Women', 'ELEGANTE UV Protected Driving Vintage Pilot Gradient Metal Body Aviator Sunglasses for Men and Women', 1),
(119, 24, 12, 'GOURDEVA', 250, 180, 12, '942965276_413Ap7C8SGL.jpg', 'Gourdeva Men\'s polarized sunglasses, large-frame spring sunglasses TAC polarized lenses UV blocking', 'Package Dimensions ‏ : ‎ 17.7 x 7.7 x 4.9 cm; 120 Grams\r\nDate First Available ‏ : ‎ 3 August 2022\r\nASIN ‏ : ‎ B0B8M6SJWS\r\nItem model number ‏ : ‎ Spring\r\nCountry of Origin ‏ : ‎ China\r\nDepartment ‏ : ‎ Unisex-adult\r\nItem Weight ‏ : ‎ 120 g', 'Gourdeva Men\'s polarized sunglasses, large-frame spring sunglasses TAC polarized lenses UV blocking', 'Gourdeva Men\'s polarized sunglasses, large-frame spring sunglasses TAC polarized lenses UV blocking', 'Gourdeva Men\'s polarized sunglasses, large-frame spring sunglasses TAC polarized lenses UV blocking', 1),
(120, 24, 12, 'VELOCITY', 250, 150, 12, '493568676_413Ap7C8SGL.jpg', 'Velocity Polarized UV 400 Protection Square Green Sunglasses For Spectacular Look, For Men', 'Item Weight ‏ : ‎ 200 Grams\r\nDate First Available ‏ : ‎ 24 January 2022\r\nManufacturer ‏ : ‎ velocity optics private limited\r\nASIN ‏ : ‎ B09R23MFSB\r\nItem model number ‏ : ‎ VC6265PL M10B\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ velocity optics private limited, velocity optics private limited, A-241 OKHLA INDUSTRIAL AREA PHASE-1, DELHI-110020\r\nItem Weight ‏ : ‎ 200 g', 'Velocity Polarized UV 400 Protection Square Green Sunglasses For Spectacular Look, For Men', 'Velocity Polarized UV 400 Protection Square Green Sunglasses For Spectacular Look, For Men', 'Velocity Polarized UV 400 Protection Square Green Sunglasses For Spectacular Look, For Men', 1),
(121, 24, 12, 'AVIATOR', 300, 250, 12, '782193850_21q09WqZWbL.jpg', 'VELOCITY UV 400 Protection Aviator Stylish Green Sunglasses With Metallic Frame For Men', 'Item Weight ‏ : ‎ 200 Grams\r\nDate First Available ‏ : ‎ 6 December 2021\r\nManufacturer ‏ : ‎ velocity optics private limited\r\nASIN ‏ : ‎ B09P3L58VJ\r\nItem model number ‏ : ‎ SG/VL87/877/C14-L\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Men\r\nManufacturer ‏ : ‎ velocity optics private limited, velocity optics private limited, A-241 OKHLA INDUSTRIAL AREA PHASE-1, DELHI-110020\r\nItem Weight ‏ : ‎ 200 g', 'VELOCITY UV 400 Protection Aviator Stylish Green Sunglasses With Metallic Frame For Men', 'VELOCITY UV 400 Protection Aviator Stylish Green Sunglasses With Metallic Frame For Men', 'VELOCITY UV 400 Protection Aviator Stylish Green Sunglasses With Metallic Frame For Men', 1),
(122, 24, 12, 'BIO AVIA', 150, 70, 12, '498706198_315rbIN1bML.jpg', 'Bio-th® Polarized Aviator Sunglasses for Women Men UV Protection Metal Mirror Frame Green - Pack of 1', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 14 x 14.7 x 5.5 cm; 45 Grams\r\nDate First Available ‏ : ‎ 20 February 2020\r\nManufacturer ‏ : ‎ Bio-th\r\nASIN ‏ : ‎ B08G1RBSQV\r\nItem model number ‏ : ‎ BT3026\r\nCountry of Origin ‏ : ‎ China\r\nDepartment ‏ : ‎ Unisex Adult\r\nManufacturer ‏ : ‎ Bio-th, BRANDSHOPS INC, H-2104, Oyster Grande, Dwarka Expressway, Sector-102, Gurgaon, Haryana-122505, Customer Care No.- +91-8130573686\r\nPacker ‏ : ‎ BRANDSHOPS INC, H-2104, Oyster Grande, Dwarka Expressway, Sector-102, Gurgaon, Haryana-122505, Customer Care No.- +91-8130573686\r\nImporter ‏ : ‎ GBS, Sector-16 Rohini, Delhi-110085\r\nItem Weight ‏ : ‎ 45 g\r\nItem Dimensions LxWxH ‏ : ‎ 14 x 14.7 x 5.5 Centimeters', 'Bio-th® Polarized Aviator Sunglasses for Women Men UV Protection Metal Mirror Frame Green - Pack of 1', 'Bio-th® Polarized Aviator Sunglasses for Women Men UV Protection Metal Mirror Frame Green - Pack of 1', 'Bio-th® Polarized Aviator Sunglasses for Women Men UV Protection Metal Mirror Frame Green - Pack of 1', 1),
(123, 24, 12, 'JIM HALO', 250, 200, 12, '793910927_51ZPhu4T2bS._UL1500_.jpg', 'JIM HALO Polarized Shield Sunglasses Oversized Flat Top Square Glasses for Men', 'Package Dimensions ‏ : ‎ 17.8 x 7.4 x 6.3 cm; 38.27 Grams\r\nDate First Available ‏ : ‎ 12 January 2020\r\nManufacturer ‏ : ‎ JIM HALO\r\nASIN ‏ : ‎ B0823KN33R\r\nItem model number ‏ : ‎ ZTPT0398 C3\r\nCountry of Origin ‏ : ‎ China\r\nDepartment ‏ : ‎ Unisex Adult\r\nManufacturer ‏ : ‎ JIM HALO\r\nItem Weight ‏ : ‎ 38.2 g', 'JIM HALO Polarized Shield Sunglasses Oversized Flat Top Square Glasses for Men', 'JIM HALO Polarized Shield Sunglasses Oversized Flat Top Square Glasses for Men', 'JIM HALO Polarized Shield Sunglasses Oversized Flat Top Square Glasses for Men', 1),
(124, 24, 12, 'HUB VINTAGE', 350, 180, 12, '627883385_41-cZo6t18L.jpg', 'Hub Creation Classic Vintage Aviator Square Metal Frame sunglasses for Men and Women | 100% UV Protected Men & Women Sunglass', 'Product Dimensions ‏ : ‎ 10 x 10 x 10 cm; 200 Grams\r\nDate First Available ‏ : ‎ 27 March 2023\r\nManufacturer ‏ : ‎ Hub Creation\r\nASIN ‏ : ‎ B0BZP4KCWN\r\nItem model number ‏ : ‎ PS-10\r\nCountry of Origin ‏ : ‎ India\r\nDepartment ‏ : ‎ Unisex-adult\r\nManufacturer ‏ : ‎ Hub Creation\r\nPacker ‏ : ‎ HUB CREATION\r\nItem Weight ‏ : ‎ 200 g', 'Hub Creation Classic Vintage Aviator Square Metal Frame sunglasses for Men and Women | 100% UV Protected Men & Women Sunglass', 'Hub Creation Classic Vintage Aviator Square Metal Frame sunglasses for Men and Women | 100% UV Protected Men & Women Sunglass', 'Hub Creation Classic Vintage Aviator Square Metal Frame sunglasses for Men and Women | 100% UV Protected Men & Women Sunglass', 1),
(125, 24, 26, 'URBAN FOREST', 400, 350, 12, '666400998_71HoK4w6uwL._SY450_.jpg', 'URBAN FOREST Oliver Blue RFID Blocking Leather Wallet for Men', 'Brand	URBAN FOREST\r\nColour	Blue\r\nMaterial	Leather\r\nStyle	Contemporary\r\nPattern	Solid', 'URBAN FOREST Oliver Blue RFID Blocking Leather Wallet for Men', 'URBAN FOREST Oliver Blue RFID Blocking Leather Wallet for Men', 'URBAN FOREST Oliver Blue RFID Blocking Leather Wallet for Men', 1),
(126, 24, 26, 'HON BULL', 200, 100, 12, '283512405_71-SHXZtOyL._SX450_.jpg', 'HORNBULL Vegas Green RFID Blocking Leather Wallet for Men | Wallets Men Leather | Mens Wallet', 'Brand	HORNBULL\r\nColour	Olive\r\nMaterial	Leather\r\nStyle	Casual\r\nPattern	Solid', 'HORNBULL Vegas Green RFID Blocking Leather Wallet for Men | Wallets Men Leather | Mens Wallet', 'HORNBULL Vegas Green RFID Blocking Leather Wallet for Men | Wallets Men Leather | Mens Wallet', 'HORNBULL Vegas Green RFID Blocking Leather Wallet for Men | Wallets Men Leather | Mens Wallet', 1),
(127, 24, 26, 'WILD HORN', 500, 350, 12, '737915805_81NGeN2+DgL._SX466_.jpg', 'WildHorn Brown RFID Blocking Leather Wallet for Men I Ultra Strong Stitching I 6 Credit Card Slots I 2 Currency Compartments I 1 Coin Pocket', 'See all 24 options \r\nBrand	WildHorn\r\nColour	Brown\r\nMaterial	Leather\r\nStyle	Classic\r\nPattern	Men\'s Wallet (Brown)', 'WildHorn Brown RFID Blocking Leather Wallet for Men I Ultra Strong Stitching I 6 Credit Card Slots I 2 Currency Compartments I 1 Coin Pocket', 'WildHorn Brown RFID Blocking Leather Wallet for Men I Ultra Strong Stitching I 6 Credit Card Slots I 2 Currency Compartments I 1 Coin Pocket', 'WildHorn Brown RFID Blocking Leather Wallet for Men I Ultra Strong Stitching I 6 Credit Card Slots I 2 Currency Compartments I 1 Coin Pocket', 1),
(128, 24, 26, 'SPIFFY', 600, 450, 12, '843642705_81RRK0EaeyL._SX450_.jpg', 'See all 24 options \r\nBrand	WildHorn\r\nColour	Brown\r\nMaterial	Leather\r\nStyle	Classic\r\nPattern	Men\'s Wallet (Brown)', 'Brand	Spiffy\r\nColour	Brown\r\nMaterial	Leather\r\nStyle	Two Fold Wallet\r\nPattern	Textured', 'See all 24 options \r\nBrand	WildHorn\r\nColour	Brown\r\nMaterial	Leather\r\nStyle	Classic\r\nPattern	Men\'s Wallet (Brown)\r\nSee all 24 options \r\nBrand	WildHorn\r\nColour	Brown\r\nMaterial	Leather\r\nStyle	Classic\r\nPattern	Men\'s Wallet (Brown)', 'See all 24 options \r\nBrand	WildHorn\r\nColour	Brown\r\nMaterial	Leather\r\nStyle	Classic\r\nPattern	Men\'s Wallet (Brown)', 'See all 24 options \r\nBrand	WildHorn\r\nColour	Brown\r\nMaterial	Leather\r\nStyle	Classic\r\nPattern	Men\'s Wallet (Brown)', 1),
(129, 24, 27, 'ZEBRONICS HEADPHONE', 400, 350, 12, '611950641_81lLGM7SKbL._SY355_.jpg', 'ZEBRONICS Zeb-Thunder Wireless Bluetooth Over The Ear Headphone, FM, mSD, 9 hrs Playback with Mic (Blue)', 'Features\r\nWireless BT\r\nDual Pairing\r\nSupports Micro SD\r\nAUX Function\r\nBuilt-in FM Radio\r\nSoft & Comfortable Earcups\r\nAdjustable Headband\r\nMedia/Volume control\r\nCall Function\r\nBuilt-in Rechargeable Battery\r\nSpecifications\r\nBT version: 4.2\r\nWireless range: 10 meters (without obstacles)\r\nDriver Size: 40mm\r\nSpeaker Impedance: 32Ω\r\nFrequency Response: 40Hz - 20kHz\r\nSensitivity:-113dB ±3dB\r\nCharging time: 1.5hrs\r\nPlayback time: 9hrs*\r\nStandby time: 600hrs\r\nNet. Weight : 142g', 'ZEBRONICS Zeb-Thunder Wireless Bluetooth Over The Ear Headphone, FM, mSD, 9 hrs Playback with Mic (Blue)', 'ZEBRONICS Zeb-Thunder Wireless Bluetooth Over The Ear Headphone, FM, mSD, 9 hrs Playback with Mic (Blue)', 'ZEBRONICS Zeb-Thunder Wireless Bluetooth Over The Ear Headphone, FM, mSD, 9 hrs Playback with Mic (Blue)', 1),
(130, 24, 27, 'BELL BLHP', 500, 350, 12, '443219136_61tQpCLNOFL._SY355_.jpg', 'Bell BLHP105 Wired on-Ear Headphone with Tangle Free Cable+3.5mm Jack, Headset with 18hz-24Khz Frequency Response & 32ohm Impedance, Flexible 2D axis Folding Mechanism Headphone (BLHP105ABLK-Black)', 'Technical Details\r\nBrand	‎Bell\r\nManufacturer	‎Looks International Pvt Ltd, Looks International Pvt Ltd , 1710,Prerna Complex Bldg No. D/4 Anjur Road bhiwandi Thane MH- 421302, 8591982922\r\nModel	‎BLHP105ABLK-Black\r\nModel Name	‎BLHP 105A Wired Headphone\r\nModel Year	‎2018\r\nProduct Dimensions	‎18.29 x 17.53 x 9.14 cm; 50 Grams\r\nItem model number	‎BLHP105ABLK-Black\r\nSpecial Features	‎Sweatproof, Foldable\r\nMounting Hardware	‎Cable, Ear Cushions\r\nNumber of items	‎1\r\nMicrophone format	‎In-Line\r\nHeadphones form factor	‎On Ear\r\nCable feature	‎Tangle Free\r\nConnector Type	‎Wired\r\nMaterial	‎Plastic\r\nMaximum Operating Distance	‎2 Metres\r\nIncludes Rechargeable Battery	‎No\r\nManufacturer	‎Looks International Pvt Ltd\r\nCountry of Origin	‎China\r\nItem Weight	‎50 g', 'Bell BLHP105 Wired on-Ear Headphone with Tangle Free Cable+3.5mm Jack, Headset with 18hz-24Khz Frequency Response & 32ohm Impedance, Flexible 2D axis Folding Mechanism Headphone (BLHP105ABLK-Black)', 'Bell BLHP105 Wired on-Ear Headphone with Tangle Free Cable+3.5mm Jack, Headset with 18hz-24Khz Frequency Response & 32ohm Impedance, Flexible 2D axis Folding Mechanism Headphone (BLHP105ABLK-Black)', 'Bell BLHP105 Wired on-Ear Headphone with Tangle Free Cable+3.5mm Jack, Headset with 18hz-24Khz Frequency Response & 32ohm Impedance, Flexible 2D axis Folding Mechanism Headphone (BLHP105ABLK-Black)', 1),
(131, 24, 27, 'UBON', 600, 450, 12, '330197478_71oToOZPTnL._SY355_.jpg', 'Technical Details\r\nBrand	‎Bell\r\nManufacturer	‎Looks International Pvt Ltd, Looks International Pvt Ltd , 1710,Prerna Complex Bldg No. D/4 Anjur Road bhiwandi Thane MH- 421302, 8591982922\r\nModel	‎BLHP105ABLK-Black\r\nModel Name	‎BLHP 105A Wired Headphone\r\nModel Year	‎2018\r\nProduct Dimensions	‎18.29 x 17.53 x 9.14 cm; 50 Grams\r\nItem model number	‎BLHP105ABLK-Black\r\nSpecial Features	‎Sweatproof, Foldable\r\nMounting Hardware	‎Cable, Ear Cushions\r\nNumber of items	‎1\r\nMicrophone format	‎In-Line\r\nHeadphones form factor	‎On Ear\r\nCable feature	‎Tangle Free\r\nConnector Type	‎Wired\r\nMaterial	‎Plastic\r\nMaximum Operating Distance	‎2 Metres\r\nIncludes Rechargeable Battery	‎No\r\nManufacturer	‎Looks International Pvt Ltd\r\nCountry of Origin	‎China\r\nItem Weight	‎50 g', 'UBON Wired Headphone Information\r\nTechnical Details\r\nBrand	‎UBON\r\nManufacturer	‎CAPITAL SERVICE CENTRE, Off. No.1, Office Unit No.1,2, Basement, Ashok Vihar, Ph-II, New Delhi-52, CAPITAL SERVICE CENTRE, Off. No.1, Office Unit No.1,2, Basement, Ashok Vihar, Ph-II, New Delhi-52\r\nModel	‎UB-615\r\nModel Name	‎Fusion\r\nModel Year	‎2021\r\nProduct Dimensions	‎17 x 15 x 5 cm; 70 Grams\r\nItem model number	‎UB-615\r\nHardware Platform	‎Laptop, MP3 Player, PC, Tablet, Smartphone\r\nSpecial Features	‎Adjustable Headband, Handsfree Calling, 1 Meter Tangle free Cable, High Bass, Noise Isolating\r\nMounting Hardware	‎Headphone\r\nNumber of items	‎1\r\nMicrophone format	‎In-Line\r\nHeadphones form factor	‎On Ear\r\nBatteries Included	‎No\r\nBatteries Required	‎No\r\nCable feature	‎Detachable\r\nConnector Type	‎Wired\r\nMaterial	‎Faux Leather, Plastic\r\nMaximum Operating Distance	‎1 Metres\r\nIncludes Rechargeable Battery	‎No\r\nManufacturer	‎CAPITAL SERVICE CENTRE, Off. No.1, Office Unit No.1,2, Basement, Ashok Vihar, Ph-II, New Delhi-52\r\nCountry of Origin	‎India\r\nItem Weight	‎70 g\r\nAdditional Information\r\nASIN	B09XXYLVQ2\r\nCustomer Reviews	3.2 3.2 out of 5 stars    23 ratings\r\n3.2 out of 5 stars\r\nBest Sellers Rank	#31,726 in Electronics (See Top 100 in Electronics)\r\n#95 in On-Ear Headphones\r\nDate First Available	14 April 2022\r\nPacker	CAPITAL SERVICE CENTRE, Off. No.1, Office Unit No.1,2, Basement, Ashok Vihar, Ph-II, New Delhi-52\r\nImporter	CAPITAL SERVICE CENTRE, Off. No.1, Office Unit No.1,2, Basement, Ashok Vihar, Ph-II, New Delhi-52\r\nItem Dimensions LxWxH	17 x 15 x 5 Centimeters\r\nNet Quantity	1.00 count\r\nFeedback\r\nWould you like to tell us about a lower price? \r\nBrands in this category on AmazoN', 'Technical Details\r\nBrand	‎Bell\r\nManufacturer	‎Looks International Pvt Ltd, Looks International Pvt Ltd , 1710,Prerna Complex Bldg No. D/4 Anjur Road bhiwandi Thane MH- 421302, 8591982922\r\nModel	‎BLHP105ABLK-Black\r\nModel Name	‎BLHP 105A Wired Headphone\r\nMo', 'Technical Details\r\nBrand	‎Bell\r\nManufacturer	‎Looks International Pvt Ltd, Looks International Pvt Ltd , 1710,Prerna Complex Bldg No. D/4 Anjur Road bhiwandi Thane MH- 421302, 8591982922\r\nModel	‎BLHP105ABLK-Black\r\nModel Name	‎BLHP 105A Wired Headphone\r\nMo', 'Technical Details\r\nBrand	‎Bell\r\nManufacturer	‎Looks International Pvt Ltd, Looks International Pvt Ltd , 1710,Prerna Complex Bldg No. D/4 Anjur Road bhiwandi Thane MH- 421302, 8591982922\r\nModel	‎BLHP105ABLK-Black\r\nModel Name	‎BLHP 105A Wired Headphone\r\nMo', 1);
INSERT INTO `product` (`id`, `categories_id`, `subcategories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(132, 24, 27, 'ZEBRONICS', 500, 400, 12, '276701342_71YDoi-vKYL._SY355_.jpg', 'Zebronics Zeb-Bang Bluetooth Wireless Over Ear Headphones with Mic (Orange)', 'Zeb-bang is a bluetooth headphone with voice assistant\r\nIt has call function and 16hrs playback. Inline Remote : No\r\nIt also has foldable design and adjustable headband\r\nIt has controls and ports\r\nSpeaker impedance: 32 ohms\r\nFrequency response: 20hz-20khz\r\nCharging time: 1hr 30mins\r\nPlayback time: 16hrs\r\n1 Year warranty-from the date of purchase\r\nCountry of Origin: China', 'Zebronics Zeb-Bang Bluetooth Wireless Over Ear Headphones with Mic (Orange)\r\nZebronics Zeb-Bang Bluetooth Wireless Over Ear Headphones with Mic (Orange)', 'Zebronics Zeb-Bang Bluetooth Wireless Over Ear Headphones with Mic (Orange)', 'Zebronics Zeb-Bang Bluetooth Wireless Over Ear Headphones with Mic (Orange)', 1),
(133, 24, 27, 'PTRON BUDS', 600, 450, 12, '685157723_5107hPsNM3L._SX569_.jpg', 'PTron Tangent Duo Bluetooth 5.2 Wireless in Ear Headphones, 13mm Driver, Deep Bass, HD Calls, Fast Charging Type-C Neckband, Dual Pairing, Voice Assistant & IPX4 Water Resistant (Black/Green)', 'Brand	PTron\r\nModel Name	Tangent\r\nColour	Black/Green\r\nForm Factor	In Ear\r\nConnectivity technologies	Wireless\r\nWireless communication technologies	Bluetooth\r\nSpecial Feature	Made in India wireless neckband; 24Hrs Playback Time; 13mm Dynamic Driver for Deep Bass; Bluetooth 5.2 for Quick Pairing & Stable Connectivity; In-line Mic for Handsfree Calls; Ergonomic & Lightweight Built; In-Ear buds & Snug-fit for Passive Noise Cancellation; Magnetic Earbuds; Voice Assistant Support; Integrated Music & Call Controls; Type-C Charging; IPX4 Water/Sweat Resistant; 6 Months Manufacturer WarrantyMade in India wireless neckband;… See more\r\nWhats in the box	‎1*Wireless Neckband; 1*Charging Cable; 1*User Guide Card; 2 Pair Extra Eartips\r\nAge Range (Description)	Adult\r\nMaterial	Plastic', 'PTron Tangent Duo Bluetooth 5.2 Wireless in Ear Headphones, 13mm Driver, Deep Bass, HD Calls, Fast Charging Type-C Neckband, Dual Pairing, Voice Assistant & IPX4 Water Resistant (Black/Green)', 'PTron Tangent Duo Bluetooth 5.2 Wireless in Ear Headphones, 13mm Driver, Deep Bass, HD Calls, Fast Charging Type-C Neckband, Dual Pairing, Voice Assistant & IPX4 Water Resistant (Black/Green)', 'PTron Tangent Duo Bluetooth 5.2 Wireless in Ear Headphones, 13mm Driver, Deep Bass, HD Calls, Fast Charging Type-C Neckband, Dual Pairing, Voice Assistant & IPX4 Water Resistant (Black/Green)', 1),
(134, 25, 15, 'Wild Stone Classic Musk', 200, 120, 12, '276171509_71NylGIiYSL._SX355_.jpg', 'Wild Stone Classic Musk Logng Lasting Deodorant Body Spray for Men, 225ml', 'Product Dimensions ‏ : ‎ 19 x 5.3 x 5.3 cm; 200 Grams\r\nDate First Available ‏ : ‎ 14 February 2022\r\nASIN ‏ : ‎ B09SGCH1RH\r\nItem part number ‏ : ‎ classic-deo250\r\nCountry of Origin ‏ : ‎ India\r\nItem Weight ‏ : ‎ 200 g\r\nItem Dimensions LxWxH ‏ : ‎ 19 x 5.3 x 5.3 Centimeters\r\nNet Quantity ‏ : ‎ 225.0 millilitre', 'Wild Stone Classic Musk Logng Lasting Deodorant Body Spray for Men, 225ml', 'Wild Stone Classic Musk Logng Lasting Deodorant Body Spray for Men, 225ml', 'Wild Stone Classic Musk Logng Lasting Deodorant Body Spray for Men, 225ml', 1),
(135, 25, 15, 'Wild Stone Forest Spice', 250, 180, 12, '795551246_51CZc0HYp3L._SY355_.jpg', 'Wild Stone Forest Spice Deo Body Spray for Men, 150Ml', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 19.05 x 11.43 x 10.16 cm; 150 Grams\r\nDate First Available ‏ : ‎ 27 November 2017\r\nManufacturer ‏ : ‎ Mcnroe Consumer Products Pvt Ltd\r\nASIN ‏ : ‎ B077R36TTL\r\nItem model number ‏ : ‎ forestspicedeo-1\r\nCountry of Origin ‏ : ‎ India\r\nManufacturer ‏ : ‎ Mcnroe Consumer Products Pvt Ltd\r\nItem Weight ‏ : ‎ 150 g\r\nItem Dimensions LxWxH ‏ : ‎ 19 x 11.4 x 10.2 Centimeters\r\nNet Quantity ‏ : ‎ 150 millilitre', 'Wild Stone Forest Spice Deo Body Spray for Men, 150Ml', 'Wild Stone Forest Spice Deo Body Spray for Men, 150Ml', 'Wild Stone Forest Spice Deo Body Spray for Men, 150Ml', 1),
(136, 25, 15, 'Wild Stone Forest Spice Perfume for Men, 100ml', 150, 100, 12, '139672002_61eN84foJ4L._SY355_.jpg', 'Wild Stone Forest Spice Perfume for Men, 100ml\r\nWild Stone Forest Spice Perfume for Men, 100ml', 'Product Dimensions ‏ : ‎ 13 x 10 x 4 cm; 398 Grams\r\nDate First Available ‏ : ‎ 20 January 2021\r\nManufacturer ‏ : ‎ Mcnroe Consumer Products Pvt Ltd\r\nASIN ‏ : ‎ B08TGWLK5W\r\nItem model number ‏ : ‎ n-8904006302378\r\nCountry of Origin ‏ : ‎ India\r\nManufacturer ‏ : ‎ Mcnroe Consumer Products Pvt Ltd\r\nItem Weight ‏ : ‎ 398 g\r\nItem Dimensions LxWxH ‏ : ‎ 13 x 10 x 4 Centimeters\r\nNet Quantity ‏ : ‎ 100 millilitre', 'Wild Stone Forest Spice Perfume for Men, 100ml', 'Wild Stone Forest Spice Perfume for Men, 100ml', 'Wild Stone Forest Spice Perfume for Men, 100ml', 1),
(137, 25, 29, 'Fogg Marco', 150, 90, 12, '932714192_611+OfxzQRL._SY355_ (1).jpg', 'Fogg Marco Perfume Body Spray, Long Lasting No Gas Deodorant for Men, 150ml', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 17.8 x 5.1 x 5.1 cm; 160 Grams\r\nDate First Available ‏ : ‎ 1 January 2017\r\nManufacturer ‏ : ‎ Vini Cosmetics\r\nASIN ‏ : ‎ B00YEJYSEM\r\nItem model number ‏ : ‎ 8908001158862\r\nCountry of Origin ‏ : ‎ India\r\nManufacturer ‏ : ‎ Vini Cosmetics\r\nItem Weight ‏ : ‎ 160 g\r\nItem Dimensions LxWxH ‏ : ‎ 17.8 x 5.1 x 5.1 Centimeters\r\nNet Quantity ‏ : ‎ 150.0 millilitre', 'Fogg Marco Perfume Body Spray, Long Lasting No Gas Deodorant for Men, 150ml', 'Fogg Marco Perfume Body Spray, Long Lasting No Gas Deodorant for Men, 150ml', 'Fogg Marco Perfume Body Spray, Long Lasting No Gas Deodorant for Men, 150ml', 1),
(138, 25, 29, 'FOGG PARADISE', 150, 90, 12, '927011239_61LSmk9q5kL._SY355_.jpg', 'Fogg Paradise Fragrant Body Spray For Women, Long-Lasting, No Gas, Everyday Deodorant & Spray, 150ml', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 4 x 4 x 18 cm; 160 Grams\r\nDate First Available ‏ : ‎ 1 January 2017\r\nManufacturer ‏ : ‎ Perfunova International Ltd.\r\nASIN ‏ : ‎ B00YEK0E5S\r\nItem model number ‏ : ‎ 8908001158923\r\nCountry of Origin ‏ : ‎ India\r\nManufacturer ‏ : ‎ Perfunova International Ltd., Perfunova International Ltd.Survey No. 205/1 & 208/2,Coastal Highway,Village,Bhimpore,Nain Daman-396210 Contact email: dinesh.patwal@vinisales.co.in\r\nPacker ‏ : ‎ Perfunova International Ltd.Survey No. 205/1 & 208/2,Coastal Highway,Village,Bhimpore,Nain Daman-396210 Contact email: dinesh.patwal@vinisales.co.in\r\nItem Weight ‏ : ‎ 160 g\r\nItem Dimensions LxWxH ‏ : ‎ 40 x 40 x 180 Millimeters\r\nNet Quantity ‏ : ‎ 150.0 millilitre', 'Fogg Paradise Fragrant Body Spray For Women, Long-Lasting, No Gas, Everyday Deodorant & Spray, 150ml', 'Fogg Paradise Fragrant Body Spray For Women, Long-Lasting, No Gas, Everyday Deodorant & Spray, 150ml', 'Fogg Paradise Fragrant Body Spray For Women, Long-Lasting, No Gas, Everyday Deodorant & Spray, 150ml', 1),
(139, 25, 29, 'FOGG EAU', 160, 120, 12, '221685109_71+1ZjO1bhL._SY355_.jpg', 'Fogg Make My Day Scent, Eau De Parfum, Women’s Perfume, Long-lasting Fresh & Floral Fragrance, 100ml', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nProduct Dimensions ‏ : ‎ 6 x 6 x 14 cm; 91 Grams\r\nDate First Available ‏ : ‎ 8 October 2015\r\nManufacturer ‏ : ‎ Fogg\r\nASIN ‏ : ‎ B016BVZR6S\r\nItem model number ‏ : ‎ Make My Day\r\nCountry of Origin ‏ : ‎ India\r\nManufacturer ‏ : ‎ Fogg, Helios Packaging pvt.Ltd.,A-140,EPIP Industrial Area Neemrana Dist-Alwar ,Rajasthan- 301705 Contact email: dinesh.patwal@vinisales.co.in\r\nPacker ‏ : ‎ Helios Packaging pvt.Ltd.,A-140,EPIP Industrial Area Neemrana Dist-Alwar ,Rajasthan- 301705 Contact email: dinesh.patwal@vinisales.co.in\r\nItem Weight ‏ : ‎ 91 g\r\nItem Dimensions LxWxH ‏ : ‎ 6 x 6 x 14 Centimeters\r\nNet Quantity ‏ : ‎ 100.0 millilitre\r\nIncluded Components ‏ : ‎ 1 Perfume\r\nGeneric Name ‏ : ‎ Perfume', 'Fogg Make My Day Scent, Eau De Parfum, Women’s Perfume, Long-lasting Fresh & Floral Fragrance, 100ml', 'Fogg Make My Day Scent, Eau De Parfum, Women’s Perfume, Long-lasting Fresh & Floral Fragrance, 100ml', 'Fogg Make My Day Scent, Eau De Parfum, Women’s Perfume, Long-lasting Fresh & Floral Fragrance, 100ml', 1),
(140, 25, 29, 'FOGG PURE BLOOM', 150, 110, 12, '645385379_71PSbLWzOZL._SY355_.jpg', 'Fogg Pure Lady Blooming Lilies, Eau De Parfum for Women, Floral Fragrance, 50ml', 'Product Dimensions ‏ : ‎ 7.9 x 4 x 8.7 cm; 50 Grams\r\nDate First Available ‏ : ‎ 20 December 2021\r\nManufacturer ‏ : ‎ HELIOS PACKAGIN PVT. LTD.\r\nASIN ‏ : ‎ B09NW26J92\r\nItem model number ‏ : ‎ 8904238301576\r\nCountry of Origin ‏ : ‎ India\r\nManufacturer ‏ : ‎ HELIOS PACKAGIN PVT. LTD., Helios Packaging pvt ltd A-140,E.P.I.P Industrial Area,Neemrana,District-Alwar,Rajasthan=301705\r\nPacker ‏ : ‎ Helios Packagin Pvt. Ltd. , -140,E.P.I.P. Industrial Area, Neemrana,District-Alwar,Rajasthan-301705\r\nImporter ‏ : ‎ Helios Packagin Pvt. Ltd. , -140,E.P.I.P. Industrial Area, Neemrana,District-Alwar,Rajasthan-301705\r\nItem Weight ‏ : ‎ 50 g\r\nItem Dimensions LxWxH ‏ : ‎ 7.9 x 4 x 8.7 Centimeters\r\nNet Quantity ‏ : ‎ 50.0 millilitre\r\nGeneric Name ‏ : ‎ Perfume', 'Fogg Pure Lady Blooming Lilies, Eau De Parfum for Women, Floral Fragrance, 50ml', 'Fogg Pure Lady Blooming Lilies, Eau De Parfum for Women, Floral Fragrance, 50ml', 'Fogg Pure Lady Blooming Lilies, Eau De Parfum for Women, Floral Fragrance, 50ml', 1),
(141, 25, 30, 'zxe dark', 250, 160, 12, '521927396_51KRlD4kPfL._SY355_.jpg', 'Axe Dark Temptation Long Lasting Deodorant Bodyspray For Men, 215ml', 'Brand	AXE\r\nItem Form	Spray\r\nScent	Fresh\r\nMaterial Type Free	Paraben Free\r\nNumber of Items	1\r\nNet Quantity	215.0 millilitre\r\nItem Volume	215 Millilitres\r\nAbout this item\r\nSensual, smooth chocolate fragrance.\r\nCools you down by 6 degrees instantly\r\n72H Dual Action Technology\r\nZinc formula for enhanced odour protection\r\nNo Dyes. No Parabens\r\nSafe On Skin', 'Axe Dark Temptation Long Lasting Deodorant Bodyspray For Men, 215ml', 'Axe Dark Temptation Long Lasting Deodorant Bodyspray For Men, 215ml', 'Axe Dark Temptation Long Lasting Deodorant Bodyspray For Men, 215ml', 1),
(142, 25, 30, 'axe dark', 100, 80, 12, '850253007_51piYpThxjL._SY355_.jpg', 'AXE Dark Temptation 3 In 1 Body, Face & Hair Wash for Men, Long-Lasting Refreshing Dark Chocolate Fragrance, Natural Origin Ingredients, Removes Odor & Bacteria, Dermatologically Tested 250ml', 'Use by: 24 SEP 2025\r\nItem Form	Gel\r\nSkin Type	All\r\nBrand	AXE\r\nScent	Unscented\r\nMaterial Type Free	No Parabens\r\nAge Range (Description)	Adult\r\nNumber of Items	1\r\nNet Quantity	250.0 millilitre\r\nSpecial Feature	Nourishing, Moisturizing\r\nColour	Black', 'AXE Dark Temptation 3 In 1 Body, Face & Hair Wash for Men, Long-Lasting Refreshing Dark Chocolate Fragrance, Natural Origin Ingredients, Removes Odor & Bacteria, Dermatologically Tested 250ml', 'AXE Dark Temptation 3 In 1 Body, Face & Hair Wash for Men, Long-Lasting Refreshing Dark Chocolate Fragrance, Natural Origin Ingredients, Removes Odor & Bacteria, Dermatologically Tested 250ml', 'AXE Dark Temptation 3 In 1 Body, Face & Hair Wash for Men, Long-Lasting Refreshing Dark Chocolate Fragrance, Natural Origin Ingredients, Removes Odor & Bacteria, Dermatologically Tested 250ml', 1),
(143, 25, 30, 'axe signature', 200, 150, 12, '722030475_41gpCvrQmLL.jpg', 'Axe Signature Collection Black Series For Men Deodorant MYSTERIOUS Body Spray Perfume Deo 122ml', 'Is Discontinued By Manufacturer ‏ : ‎ No\r\nDate First Available ‏ : ‎ 26 November 2016\r\nManufacturer ‏ : ‎ AXE\r\nASIN ‏ : ‎ B01N2MGFSV\r\nItem part number ‏ : ‎ BEC005795\r\nCountry of Origin ‏ : ‎ India\r\nManufacturer ‏ : ‎ AXE\r\nNet Quantity ‏ : ‎ 122 millilitre\r\nGeneric Name ‏ : ‎ Deodorant', 'Axe Signature Collection Black Series For Men Deodorant MYSTERIOUS Body Spray Perfume Deo 122ml', 'Axe Signature Collection Black Series For Men Deodorant MYSTERIOUS Body Spray Perfume Deo 122ml', 'Axe Signature Collection Black Series For Men Deodorant MYSTERIOUS Body Spray Perfume Deo 122ml', 1),
(144, 25, 30, 'axe signature dark', 60, 40, 12, '511974239_61s0e7rrz4L._SY550_.jpg', 'AXE Signature Ticket, Dark Temptation Deodorant Body Perfume for Men - 17ml', 'Product Dimensions ‏ : ‎ 9.4 x 5.1 x 5.1 cm; 15 Grams\r\nDate First Available ‏ : ‎ 5 October 2018\r\nManufacturer ‏ : ‎ HUL\r\nASIN ‏ : ‎ B07JV9F95C\r\nItem part number ‏ : ‎ 24357\r\nCountry of Origin ‏ : ‎ India\r\nManufacturer ‏ : ‎ HUL\r\nItem Weight ‏ : ‎ 15 g\r\nItem Dimensions LxWxH ‏ : ‎ 9.4 x 5.1 x 5.1 Centimeters\r\nNet Quantity ‏ : ‎ 17.0 millilitre', 'AXE Signature Ticket, Dark Temptation Deodorant Body Perfume for Men - 17ml', 'AXE Signature Ticket, Dark Temptation Deodorant Body Perfume for Men - 17ml', 'AXE Signature Ticket, Dark Temptation Deodorant Body Perfume for Men - 17ml', 1),
(145, 25, 30, 'axe intense', 50, 40, 12, '448476170_515IQxsmg2L._SY450_.jpg', 'AXE Ticket Perfume, Intense, 17 ml', 'roduct details\r\nProduct Dimensions ‏ : ‎ 3.5 x 18.3 x 23.9 cm; 15 Grams\r\nDate First Available ‏ : ‎ 30 December 2017\r\nManufacturer ‏ : ‎ HUL\r\nASIN ‏ : ‎ B07DC7ZDCM\r\nItem part number ‏ : ‎ Pantry to FBA_May_310\r\nCountry of Origin ‏ : ‎ India\r\nManufacturer ‏ : ‎ HUL\r\nItem Weight ‏ : ‎ 15 g\r\nItem Dimensions LxWxH ‏ : ‎ 35 x 183 x 239 Millimeters', 'AXE Ticket Perfume, Intense, 17 ml', 'AXE Ticket Perfume, Intense, 17 ml', 'AXE Ticket Perfume, Intense, 17 ml', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `subcategory` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `categories_id`, `subcategory`, `image`, `status`) VALUES
(8, 5, 'Pattern shirts', '4121416545_shirts.jpg', 1),
(9, 5, 'Collar t-shirts', '2074857166_polot-shirts.jpg', 1),
(10, 5, 'Hoodies', '8551333767_black.jpg', 1),
(11, 24, 'Watches', '8309950007_titan.jpg', 1),
(12, 24, 'Goggles', '9681709523_2589922741_goggles.jpg', 1),
(14, 25, 'Denver', '1803371934_denver.jpg', 1),
(15, 25, 'wildstones', '8682419866_ws.jpg', 1),
(17, 5, 'Plain T-shirt', '1997363991_p-t-shirt.png', 1),
(18, 5, 'Formal shirts', '8866150229_formal.jpg', 1),
(20, 5, 'jackets', '9631574856_jackets.jpg', 1),
(21, 8, 'Formal Pants', '6767307331_formal.jpg', 1),
(23, 8, 'Track Pants', '9793567745_track.jpg', 1),
(24, 8, 'shorts', '2314613025_shorts.jpg', 1),
(25, 8, 'Jeans', '3710285784_jeans.jpg', 1),
(26, 24, 'wallet', '9477749279_wallet.jpg', 1),
(27, 24, 'Headphones', '4776009465_headphones.jpg', 1),
(28, 8, 'Joggers', '5135637882_download (1).jpg', 1),
(29, 25, 'Fogg', '5429960877_fogg.png', 1),
(30, 25, 'AXE ', '1717133594_Axe.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `phone`, `added_on`) VALUES
(1, 'Dharmesh Dubey', '123', 'dd@gmail.com', '8141633911', '2023-03-08 06:09:55'),
(2, 'Dubey Dharmesh', '1712', 'dubeydharmesh171@gmail.com', '8141633911', '0000-00-00 00:00:00'),
(3, 'grg', '123456', 'buddyvishal290@gmail.com', '9979587289', '2023-04-24 18:48:04'),
(4, 'Dubey Dharmesh', '123', 'dubeydharmesh@gmail.com', '8142654431', '2024-10-15 10:23:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `product` ADD FULLTEXT KEY `name` (`name`,`short_desc`,`description`,`meta_title`,`meta_desc`,`meta_keyword`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'crud', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"crud\",\"ecommerce\",\"phpmyadmin\",\"project\",\"test\",\"tms\",\"walktrend\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"crud\",\"table\":\"user\"},{\"db\":\"ecommerce\",\"table\":\"order_items\"},{\"db\":\"ecommerce\",\"table\":\"orders\"},{\"db\":\"ecommerce\",\"table\":\"carts\"},{\"db\":\"ecommerce\",\"table\":\"admin_user\"},{\"db\":\"ecommerce\",\"table\":\"product\"},{\"db\":\"ecommerce\",\"table\":\"categories\"},{\"db\":\"project\",\"table\":\"user\"},{\"db\":\"tms\",\"table\":\"admin\"},{\"db\":\"walktrend\",\"table\":\"admin_user\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-12-18 08:39:44', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Table structure for table `app_version`
--

CREATE TABLE `app_version` (
  `id` bigint(20) NOT NULL,
  `version_code` int(11) NOT NULL,
  `version_name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_version`
--

INSERT INTO `app_version` (`id`, `version_code`, `version_name`, `active`, `created_at`, `last_update`) VALUES
(1, 1, '1', 1, 1484386275760, 1485795959275),
(2, 2, '2', 1, 1485795799112, 1485795799112);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `brief` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `icon`, `draft`, `brief`, `color`, `priority`, `created_at`, `last_update`) VALUES
(3, 'Health & Beauty', '1651894646633.png', 0, 'Bath & Body, Hair care, Fragrances and Makeup', '#ff6f52', 7, 1485609656784, 1651894646633),
(4, 'Consumer Electronics', '1651894688745.png', 0, 'Smart Phones, Tablets, Laptops and Cameras.', '#ff870e', 6, 1485609722495, 1651894688745),
(10, 'Food & Groceries', '1651894633368.png', 0, 'Beverages, Pet Food, Fresh Products', '#4db151', 1, 1650594032643, 1652115032226),
(11, 'Home & Lifestyle', '1651894621656.png', 0, 'Bath, Bedding, Decor. Furniture and Kitchen Dining', '#BF360C', 2, 1650594111068, 1651894720377),
(12, 'Men\'s<br>Clothing', '1651893522532.png', 0, 'T-Shirts, Pants, Polo Shirt, Joggers and shoes', '#4186ff', 3, 1650594230680, 1651894358275),
(13, 'Women\'s Fashion', '1651893370423.png', 0, 'Shirts, Trousers, Kurtas, Muslim Wear and Shoes', '#fb0504', 3, 1650594447057, 1651893370423),
(14, 'Sports & Outdoor', '1651894605161.png', 0, 'Exercise & Fitness tools, Shoes and Supplements', '#18ab4e', 4, 1650594531171, 1651894605161),
(15, 'Babies and Toys', '1651894486743.png', 0, 'Baby accessories, clothing and toys', '#fe438e', 5, 1650594630354, 1651894486743);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `code` varchar(50) NOT NULL,
  `grouping` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`code`, `grouping`, `value`) VALUES
('EMAIL_ORDER', 'EMAIL', '{\"bcc_receiver\":[\"your-admin1@mail.com\",\"your-admin2@mail.com\"],\"notif_order\":true,\"notif_order_process\":true,\"reply_to\":\"markeet@mail.com\"}'),
('EMAIL_SMTP', 'EMAIL', '{\"email\":\"markeet@mail.com\",\"password\":\"YourPassword\",\"host\":\"mail.your-domain.com\",\"port\":\"111\"}'),
('EMAIL_TEXT', 'EMAIL', '{\"subject_email_new_order\":\"Market New Order\",\"title_report_new_order\":\"Market New Order\",\"subject_email_order_processed\":\"Order PROCESSED\",\"title_report_order_processed\":\"Order Status Change to PROCESSED\",\"subject_email_order_updated\":\"Order Data Updated\",\"title_report_order_updated\":\"Order Data Updated\"}'),
('GENERAL', 'GENERAL', '{\"currency\":\"USD\",\"tax\":11,\"featured_news\":5}'),
('NOTIF_KEY', 'NOTIF', '{\"fcm_key\":\"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\",\"one_signal_appid\":\"XXXXXXXXXXXXXXXXXXXXXXX\",\"one_signal_rest_key\":\"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\"}'),
('NOTIF_TITLE', 'NOTIF', '{\"new_product\":\"New Product\",\"update_product\":\"Update Product\"}'),
('PAYMENT_BANK', 'PAYMENT', '{\"active\":true,\"instruction\":\"<div><b>INSTRUCTION :&nbsp;</b></div><ol><li>Pay an amount of <b>[@amount]</b> to one of our bank numbers, the difference in the amount will cause the order become fail or delay payment confirmation..</li><li>Write the order code <b>[@code]</b> on the pay reference.</li><li>Confirmation by send your&nbsp;<span style=\\\"\\\\&quot;color:\\\" rgb(77,=\\\"\\\" 81,=\\\"\\\" 86);=\\\"\\\" font-family:=\\\"\\\" arial,=\\\"\\\" sans-serif;\\\\\\\"=\\\"\\\">Payment Slip</span>&nbsp;to WhatsApp number&nbsp;<b>123456789</b>&nbsp;or email <b>sample@gmail.com</b></li><li>Your order will be processed and ship immediately.</li></ol><b>BANK ACCOUNT :</b><br><ul><li>BANK XXX : <b>1234567-23671-2367</b> name aExpress Admin</li><li>BANK YYY :&nbsp;<b><b>1234567</b>-23671-2367</b> name aExpress&nbsp;Admin</li></ul>\"}'),
('PAYMENT_PAYPAL', 'PAYMENT', '{\"active\":true,\"client_id\":\"YourPaypalClientId\",\"secret\":\"YourPaypalSecretId\",\"mode\":\"SANDBOX\"}'),
('PAYMENT_RAZORPAY', 'PAYMENT', '{\"active\":true,\"key_id\":\"rzp_test_wc24Nhpfn6vVML\",\"key_secret\":\"hBWwa5UrVIu2UeQgemaOg3Dv\"}');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` bigint(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `paypal` tinyint(1) NOT NULL,
  `razorpay` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `code`, `name`, `paypal`, `razorpay`) VALUES
(1, 'AFA', 'Afghanistan afghani', 0, 0),
(2, 'ALL', 'Albanian lek', 0, 1),
(3, 'DZD', 'Algerian dinar', 0, 1),
(4, 'AOR', 'Angolan kwanza reajustado', 0, 0),
(5, 'ARS', 'Argentine peso', 0, 1),
(6, 'AMD', 'Armenian dram', 0, 1),
(7, 'AWG', 'Aruban guilder', 0, 1),
(8, 'AUD', 'Australian dollar', 1, 1),
(9, 'AZN', 'Azerbaijanian new manat', 0, 0),
(10, 'BSD', 'Bahamian dollar', 0, 1),
(11, 'BHD', 'Bahraini dinar', 0, 0),
(12, 'BDT', 'Bangladeshi taka', 0, 1),
(13, 'BBD', 'Barbados dollar', 0, 1),
(14, 'BYN', 'Belarusian ruble', 0, 0),
(15, 'BZD', 'Belize dollar', 0, 1),
(16, 'BMD', 'Bermudian dollar', 0, 1),
(17, 'BTN', 'Bhutan ngultrum', 0, 0),
(18, 'BOB', 'Bolivian boliviano', 0, 1),
(19, 'BWP', 'Botswana pula', 0, 1),
(20, 'BRL', 'Brazilian real', 1, 0),
(21, 'GBP', 'British pound', 1, 1),
(22, 'BND', 'Brunei dollar', 0, 1),
(23, 'BGN', 'Bulgarian lev', 0, 0),
(24, 'BIF', 'Burundi franc', 0, 0),
(25, 'KHR', 'Cambodian riel', 0, 1),
(26, 'CAD', 'Canadian dollar', 1, 1),
(27, 'CVE', 'Cape Verde escudo', 0, 0),
(28, 'KYD', 'Cayman Islands dollar', 0, 1),
(29, 'XOF', 'CFA franc BCEAO', 0, 0),
(30, 'XAF', 'CFA franc BEAC', 0, 0),
(31, 'XPF', 'CFP franc', 0, 0),
(32, 'CLP', 'Chilean peso', 0, 0),
(33, 'CNY', 'Chinese yuan renminbi', 1, 1),
(34, 'COP', 'Colombian peso', 0, 1),
(35, 'KMF', 'Comoros franc', 0, 0),
(36, 'CDF', 'Congolese franc', 0, 0),
(37, 'CRC', 'Costa Rican colon', 0, 1),
(38, 'HRK', 'Croatian kuna', 0, 1),
(39, 'CUP', 'Cuban peso', 0, 1),
(40, 'CZK', 'Czech koruna', 1, 1),
(41, 'DKK', 'Danish krone', 1, 1),
(42, 'DJF', 'Djibouti franc', 0, 0),
(43, 'DOP', 'Dominican peso', 0, 1),
(44, 'XCD', 'East Caribbean dollar', 0, 0),
(45, 'EGP', 'Egyptian pound', 0, 1),
(46, 'SVC', 'El Salvador colon', 0, 1),
(47, 'ERN', 'Eritrean nakfa', 0, 0),
(48, 'EEK', 'Estonian kroon', 0, 0),
(49, 'ETB', 'Ethiopian birr', 0, 1),
(50, 'EUR', 'EU euro', 1, 1),
(51, 'FKP', 'Falkland Islands pound', 0, 0),
(52, 'FJD', 'Fiji dollar', 0, 1),
(53, 'GMD', 'Gambian dalasi', 0, 1),
(54, 'GEL', 'Georgian lari', 0, 0),
(55, 'GHS', 'Ghanaian new cedi', 0, 0),
(56, 'GIP', 'Gibraltar pound', 0, 1),
(57, 'XAU', 'Gold (ounce)', 0, 0),
(58, 'XFO', 'Gold franc', 0, 0),
(59, 'GTQ', 'Guatemalan quetzal', 0, 1),
(60, 'GNF', 'Guinean franc', 0, 0),
(61, 'GYD', 'Guyana dollar', 0, 1),
(62, 'HTG', 'Haitian gourde', 0, 1),
(63, 'HNL', 'Honduran lempira', 0, 1),
(64, 'HKD', 'Hong Kong SAR dollar', 1, 1),
(65, 'HUF', 'Hungarian forint', 1, 1),
(66, 'ISK', 'Icelandic krona', 0, 0),
(67, 'XDR', 'IMF special drawing right', 0, 0),
(68, 'INR', 'Indian rupee', 1, 1),
(69, 'IDR', 'Indonesian rupiah', 0, 1),
(70, 'IRR', 'Iranian rial', 0, 0),
(71, 'IQD', 'Iraqi dinar', 0, 0),
(72, 'ILS', 'Israeli new shekel', 1, 1),
(73, 'JMD', 'Jamaican dollar', 0, 1),
(74, 'JPY', 'Japanese yen', 1, 0),
(75, 'JOD', 'Jordanian dinar', 0, 0),
(76, 'KZT', 'Kazakh tenge', 0, 1),
(77, 'KES', 'Kenyan shilling', 0, 1),
(78, 'KWD', 'Kuwaiti dinar', 0, 0),
(79, 'KGS', 'Kyrgyz som', 0, 1),
(80, 'LAK', 'Lao kip', 0, 1),
(81, 'LVL', 'Latvian lats', 0, 0),
(82, 'LBP', 'Lebanese pound', 0, 1),
(83, 'LSL', 'Lesotho loti', 0, 1),
(84, 'LRD', 'Liberian dollar', 0, 1),
(85, 'LYD', 'Libyan dinar', 0, 0),
(86, 'LTL', 'Lithuanian litas', 0, 0),
(87, 'MOP', 'Macao SAR pataca', 0, 1),
(88, 'MKD', 'Macedonian denar', 0, 1),
(89, 'MGA', 'Malagasy ariary', 0, 0),
(90, 'MWK', 'Malawi kwacha', 0, 1),
(91, 'MYR', 'Malaysian ringgit', 1, 1),
(92, 'MVR', 'Maldivian rufiyaa', 0, 1),
(93, 'MRO', 'Mauritanian ouguiya', 0, 0),
(94, 'MUR', 'Mauritius rupee', 0, 1),
(95, 'MXN', 'Mexican peso', 1, 1),
(96, 'MDL', 'Moldovan leu', 0, 1),
(97, 'MNT', 'Mongolian tugrik', 0, 1),
(98, 'MAD', 'Moroccan dirham', 0, 1),
(99, 'MZN', 'Mozambique new metical', 0, 0),
(100, 'MMK', 'Myanmar kyat', 0, 1),
(101, 'NAD', 'Namibian dollar', 0, 0),
(102, 'NPR', 'Nepalese rupee', 0, 1),
(103, 'ANG', 'Netherlands Antillian guilder', 0, 0),
(104, 'NZD', 'New Zealand dollar', 1, 1),
(105, 'NIO', 'Nicaraguan cordoba oro', 0, 1),
(106, 'NGN', 'Nigerian naira', 0, 0),
(107, 'KPW', 'North Korean won', 0, 0),
(108, 'NOK', 'Norwegian krone', 1, 1),
(109, 'OMR', 'Omani rial', 0, 0),
(110, 'PKR', 'Pakistani rupee', 0, 1),
(111, 'XPD', 'Palladium (ounce)', 0, 0),
(112, 'PAB', 'Panamanian balboa', 0, 0),
(113, 'PGK', 'Papua New Guinea kina', 0, 1),
(114, 'PYG', 'Paraguayan guarani', 0, 0),
(115, 'PEN', 'Peruvian nuevo sol', 0, 1),
(116, 'PHP', 'Philippine peso', 1, 1),
(117, 'XPT', 'Platinum (ounce)', 0, 0),
(118, 'PLN', 'Polish zloty', 1, 0),
(119, 'QAR', 'Qatari rial', 0, 1),
(120, 'RON', 'Romanian new leu', 0, 0),
(121, 'RUB', 'Russian ruble', 1, 1),
(122, 'RWF', 'Rwandan franc', 0, 0),
(123, 'SHP', 'Saint Helena pound', 0, 0),
(124, 'WST', 'Samoan tala', 0, 0),
(125, 'STD', 'Sao Tome and Principe dobra', 0, 0),
(126, 'SAR', 'Saudi riyal', 0, 1),
(127, 'RSD', 'Serbian dinar', 0, 0),
(128, 'SCR', 'Seychelles rupee', 0, 1),
(129, 'SLL', 'Sierra Leone leone', 0, 1),
(130, 'XAG', 'Silver (ounce)', 0, 0),
(131, 'SGD', 'Singapore dollar', 1, 1),
(132, 'SBD', 'Solomon Islands dollar', 0, 0),
(133, 'SOS', 'Somali shilling', 0, 1),
(134, 'ZAR', 'South African rand', 0, 1),
(135, 'KRW', 'South Korean won', 0, 0),
(136, 'LKR', 'Sri Lanka rupee', 0, 1),
(137, 'SDG', 'Sudanese pound', 0, 0),
(138, 'SRD', 'Suriname dollar', 0, 0),
(139, 'SZL', 'Swaziland lilangeni', 0, 1),
(140, 'SEK', 'Swedish krona', 1, 1),
(141, 'CHF', 'Swiss franc', 1, 1),
(142, 'SYP', 'Syrian pound', 0, 0),
(143, 'TWD', 'Taiwan New dollar', 1, 0),
(144, 'TJS', 'Tajik somoni', 0, 0),
(145, 'TZS', 'Tanzanian shilling', 0, 1),
(146, 'THB', 'Thai baht', 1, 1),
(147, 'TOP', 'Tongan paanga', 0, 0),
(148, 'TTD', 'Trinidad and Tobago dollar', 0, 1),
(149, 'TND', 'Tunisian dinar', 0, 0),
(150, 'TRY', 'Turkish lira', 0, 0),
(151, 'TMT', 'Turkmen new manat', 0, 0),
(152, 'AED', 'UAE dirham', 0, 0),
(153, 'UGX', 'Uganda new shilling', 0, 0),
(154, 'XFU', 'UIC franc', 0, 0),
(155, 'UAH', 'Ukrainian hryvnia', 0, 0),
(156, 'UYU', 'Uruguayan peso uruguayo', 0, 1),
(157, 'USD', 'US dollar', 1, 1),
(158, 'UZS', 'Uzbekistani sum', 0, 1),
(159, 'VUV', 'Vanuatu vatu', 0, 0),
(160, 'VEF', 'Venezuelan bolivar fuerte', 0, 0),
(161, 'VND', 'Vietnamese dong', 0, 0),
(162, 'YER', 'Yemeni rial', 0, 1),
(163, 'ZMK', 'Zambian kwacha', 0, 0),
(164, 'ZWL', 'Zimbabwe dollar', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fcm`
--

CREATE TABLE `fcm` (
  `id` bigint(20) NOT NULL,
  `device` varchar(100) NOT NULL,
  `os_version` varchar(100) NOT NULL,
  `app_version` varchar(10) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `regid` text NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fcm`
--

INSERT INTO `fcm` (`id`, `device`, `os_version`, `app_version`, `serial`, `regid`, `created_at`, `last_update`) VALUES
(4, 'Device Name', '6.0.1', '1.0', 'GGC00C0888E426A', 'APA91bEj7qmlVePXUpG4UjKOtyqG5x9hpeZ4tMhPDsJgDRWL76psPGtckLK3uMtmpLFj3RSFfgaVoBMCKhg5iR8RnPZPjeuml8Llgkc', 0, 0),
(7, 'sadasd', '1', '1', 'sad', 'sadasd', 1645142830603, 1645142830603);

-- --------------------------------------------------------

--
-- Table structure for table `news_info`
--

CREATE TABLE `news_info` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `brief_content` varchar(200) NOT NULL,
  `full_content` text NOT NULL,
  `image` varchar(110) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_info`
--

INSERT INTO `news_info` (`id`, `title`, `brief_content`, `full_content`, `image`, `draft`, `status`, `created_at`, `last_update`) VALUES
(1, 'Available Best Interior Stuff, Browse and Discover Now for Your Room.', 'Quisque efficitur diam sit amet quam porttitor, at dictum arcu viverra. Vivamus dapibus ante nunc, non malesuada enim gravida in.', '<div>Aliquam sed lorem quis urna eleifend aliquam ac ut urna. Sed tempus nisl tellus, vel tempor velit rutrum ac. Ut facilisis eget augue quis pulvinar. Nam a felis eu tortor convallis dapibus efficitur vel turpis. Etiam hendrerit pulvinar leo ac venenatis. Donec non felis et massa semper convallis nec id augue. Proin sit amet mollis nisl. Sed vestibulum auctor imperdiet. Nam ut enim non lacus blandit rhoncus non at turpis. Donec vel arcu malesuada, vulputate dui a, varius leo. Proin volutpat libero ultricies est auctor, eget facilisis ligula accumsan. Sed quis sapien hendrerit, luctus augue nec, aliquam urna. Mauris vestibulum convallis malesuada. Sed et ex cursus, fringilla tellus ac, maximus ipsum.</div><div><br></div><div>Sed viverra arcu in neque pulvinar dignissim. Nunc euismod aliquam magna, non efficitur lectus vehicula quis. Suspendisse vitae consequat arcu, eget malesuada dui. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec quis imperdiet libero. Donec imperdiet quis lectus vitae dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam pulvinar pretium ipsum, et faucibus libero aliquet et. Quisque efficitur diam sit amet quam porttitor, at dictum arcu viverra. Vivamus dapibus ante nunc, non malesuada enim gravida in. Cras bibendum eros vitae lacus efficitur, vel pretium est rutrum.</div><div><br></div><div>Praesent id efficitur risus. Nullam dui ligula, eleifend in convallis at, porta vitae massa. Curabitur sapien lorem, congue non enim non, rutrum gravida ipsum. Duis dignissim sapien in sem finibus ultrices id nec justo. Nulla hendrerit sed eros ac rhoncus. Nullam varius tellus id venenatis cursus. Cras commodo metus mauris, eget posuere sapien blandit non. Aenean fermentum ligula a libero suscipit dictum. Nulla dictum odio ut vulputate aliquam. Suspendisse potenti. Cras pellentesque vel felis sed dignissim. Proin aliquet orci tincidunt dui convallis, facilisis accumsan urna semper.</div>', 'Available Best Interior Stuff Browse and Discover Now for Your Room.jpg', 0, 'FEATURED', 1482250793274, 1651891784293),
(2, 'We Join Smartphone Fair  in Washington, D.C. April 7-8, 2017. Visit and Purchase our Product.', 'Aenean eu libero eget lorem tincidunt eleifend. Integer in diam felis. Proin sit amet mollis nisl.', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec scelerisque urna ut metus sagittis, vel congue lorem iaculis. Sed hendrerit mauris id tempor faucibus. In facilisis nibh vulputate ante porttitor, et venenatis arcu placerat. Vestibulum tempor nisi enim, eget consectetur ex accumsan fermentum. Mauris ipsum lacus, imperdiet eget purus vel, convallis euismod augue. In sed fringilla sem. Aenean ultricies ullamcorper euismod.</div><div><br></div><div>Cras non nunc est. Nunc quis dapibus lorem. Proin dignissim interdum interdum. In vitae aliquet odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam non venenatis nunc, id molestie velit. Vestibulum sagittis dui at nibh lacinia faucibus. Curabitur auctor sem diam. Aenean eu libero eget lorem tincidunt eleifend. Integer in diam felis.</div><div><br></div><div>Aliquam sed lorem quis urna eleifend aliquam ac ut urna. Sed tempus nisl tellus, vel tempor velit rutrum ac. Ut facilisis eget augue quis pulvinar. Nam a felis eu tortor convallis dapibus efficitur vel turpis. Etiam hendrerit pulvinar leo ac venenatis. Donec non felis et massa semper convallis nec id augue. Proin sit amet mollis nisl. Sed vestibulum auctor imperdiet. Nam ut enim non lacus blandit rhoncus non at turpis. Donec vel arcu malesuada, vulputate dui a, varius leo. Proin volutpat libero ultricies est auctor, eget facilisis ligula accumsan. Sed quis sapien hendrerit, luctus augue nec, aliquam urna. Mauris vestibulum convallis malesuada. Sed et ex cursus, fringilla tellus ac, maximus ipsum.</div>', 'We Join Smartphone Fair  in Washington DC April 78 2017 Visit and Purchase our Product.jpg', 0, 'FEATURED', 1485793148268, 1651891897694),
(10, 'Unique Women\'s Accessories Trend that Will Popular Current Season', 'Cras in dapibus ligula. Vestibulum elementum ante at sapien consectetur porta.', '<div>Cras in dapibus ligula. Vestibulum elementum ante at sapien consectetur porta. Nulla laoreet mauris a orci posuere eleifend. Duis dictum nisl scelerisque lectus tincidunt, id tristique lorem eleifend. Curabitur nibh risus, commodo in consequat eget, consectetur vel tellus. Suspendisse dignissim, lorem ut luctus congue, mi justo lobortis ex, non suscipit est est id urna. Ut eget tortor accumsan, consectetur justo sit amet, tincidunt enim.</div><div><br></div><div>Proin efficitur justo eget tempus vulputate. Nunc viverra felis tortor, a porttitor tortor vehicula dictum. Nam quis sapien nec tellus ultricies dictum. Praesent vulputate dolor sed nisl consectetur, vel varius dui suscipit. Maecenas vulputate ligula a sem sollicitudin viverra. In a libero viverra, eleifend nisi vitae, vehicula arcu. Donec sagittis sem sit amet nulla aliquam, a convallis risus ultricies. Praesent tristique magna odio, a dictum felis hendrerit quis.</div>', 'Unique Womens Accessories Trend that Will Popular Current Season.jpg', 0, 'FEATURED', 1485992959638, 1651891961524);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(110) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `price_discount` double NOT NULL DEFAULT 0,
  `stock` int(10) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `price_discount`, `stock`, `draft`, `description`, `status`, `created_at`, `last_update`) VALUES
(122, 'Samsung Galaxy A12', '1650594805353.jpg', 25000.00, 0, 20, 0, '<b>Samsung Galaxy A12 - A New Series Of The Company&nbsp;</b><div>Samsung after A11 brings now A12, which will be the new series of the company. The specs of the smartphone according to the new information is that it will be a mid-range smartphone and will be the first smartphone of the series. The Samsung Galaxy A12 will be packing a MediaTek Helio P35 chipset. The internal storage capacity of the coming smartphone is 64 gigabytes which means that Samsung\'s Galaxy A12 has got two variants. One will be a budget phone and the other one will be a bit expensive. The internal storage capacity of the coming handset Samsung Galaxy A12\'s can be increased by using the dedicated slot. So, there will be no issue with storage whether you go for the budget smartphone or buy the expensive variant of the Galaxy A12 by Samsung. The RAM that is embedded in the smartphone is 4 gigabytes of RAM. The RAM capacity is also different for both the variants of the smartphone. The new Samsung A12 is equipped with a PLS IPS Capacitive touchscreen that measures 6.5 inches and provides full HD plus the resolution of 720 x 1600 Pixels. On the rear of the smartphone that is called Samsung Galaxy\'s A12, there will be a triple rear camera setup. The main sensor of the back camera setup will be 48 megapixels, The macro lens will be 5 megapixels and the macro and depth sensors will be pairs of 2 megapixels as usual. Samsung Galaxy A12 has got 8 megapixels of the front-facing camera. The new handset will be pacing a ton of features that will the image quality of both camera setups. The smartphone Galaxy A12\'s to have a Li-Po Non-removable 5000 mAh battery and fingerprint facility at the rear to protect the smartphone.</div><div><br></div><div><ul class=\"\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.6b05UGiKUGiKPl\" style=\"margin: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, &quot;system-ui&quot;, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;\"><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Awesome screen built for cinema</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">6.5\" Display</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Stylish look, comfortable hold</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Awesome Quad camera to capture more</li><li class=\"\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.6b05UGiKUGiKPl\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">48 MP Main Camera</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">8 MP Selfie Camera</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">4 GB RAM</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">64 GB Internal Memory</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">5000 mAh Battery</li></ul></div>', 'READY STOCK', 1650594805353, 1650595231617),
(123, 'Apple iPhone 13 Pro Max', '1650595275667.jpg', 320450.00, 0, 20, 0, '<div><b>Apple iPhone 13 Pro Max - A Flagship Smartphone From The Company<br></b></div>Apple will launch its upcoming iPhone 13 that is the high-end Pro Max version of the series. Lost a few days ago, we learned that the Pro and Pro Max will reportedly have Samsungâ€™s OLED screens with a refresh rate of 120 Hz. Information on the design of the iPhone 13 series is now appearing. Let\'s talk about the upcoming new Apple iPhone 13 Pro Max. The smartphone got a Chipset of Apple A15 Bionic which is the most powerful chipset and to give more power to this device it has a 3.22 Hexa Core processor inside the Apple\'s iPhone 13 Pro Max to make the device ultra fast. And also there is a GPU of Apple GPU 5-core graphics under the hood of this smartphone. The display screen size of the smartphone is 6.7 Inches and It will provide the user with full HD plus the resolution of 1284 x 2778 Pixels. The Apple iPhone 13\'s having a Super Retina XDR OLED Capacitive Touchscreen display that is the latest one and well known for its outstanding results. In the protection of this smartphone, it has a Scratch-resistant glass, oleophobic coating. This iPhone 13 Pro Max by Apple got 6 gigabytes of RAM which gives this handset more power. The handset has got 128 gigabytes of internal memory which is more than enough to store your data. There is a Quad Camera setup in the back of this new Apple 13 Pro Max. The main camera is 12 megapixels wide, and another one is also 12 megapixels telephoto, 12 megapixels ultrawide, and the depth sensor is TOF 3D LiDAR megapixels. On the front, there is a Dual 12 megapixels selfie camera in Apple iPhone\'s 13 Pro Max. There is a Face ID reader in this smartphone to protect your data. And you will find an IP68 dust/water resistant up to 6m for 30 mins. The battery of the upcoming iPhone 13 Pro Max is also a massive one. The handset is fueled with a 4352 mAh battery to get enough backup time and the smartphone also got a Fast battery charging. Now Samsung and other smartphone companies will have a competitor in the market when 13 Pro Max lunched.', 'READY STOCK', 1650595275667, 1650595275667),
(124, 'Apple iPad Air 5', '1650595664491.jpg', 125999.00, 0, 20, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650595664491, 1650595664491),
(125, 'Samsung Galaxy S21 FE', '1650595860277.png', 136499.00, 0, 20, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650595860277, 1650595860277),
(126, 'Zeppelin Black Sweatshirt', '1650595981781.jpg', 20.00, 0, 20, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650595981781, 1650595981781),
(127, 'Pure Cotton Polo Shirt Men\'s T-shirt', '1650596278295.png', 19.50, 0, 39, 0, '<h1 class=\"product-title-text\" data-spm-anchor-id=\"a2g0o.detail.1000016.i2.3fa446f3fjvaDU\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; color: rgb(34, 34, 34); font-weight: 500; font-size: 14px; line-height: 19px; width: fit-content; font-family: &quot;Open Sans&quot;, Roboto, Arial, Helvetica, sans-serif, SimSun;\"><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></h1>', 'READY STOCK', 1650596278295, 1650596278295),
(128, 'DYXUE Brand Tops 2022 Polos Short Sleeve Logo Male Polo Shirt', '1650596360426.jpg', 22.30, 0, 67, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650596360426, 1650596360426),
(129, 'Men Casual T-shirt + Shorts 2-piece Suit', '1650596484907.jpg', 14.75, 0, 22, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650596484907, 1650596484907),
(130, 'Handmade Retro Leisure Loafers Shoes', '1650596741171.jpg', 22.00, 0, 22, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650596741171, 1650596741171),
(131, 'Summer Beach Flip Flops', '1650596899814.jpg', 12.00, 0, 12, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650596899814, 1650596899814),
(132, 'Basketball Shoes', '1650596971145.jpg', 44.00, 0, 22, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650596971145, 1650596971145),
(133, 'Retro Kimono Blouse Chic Blusas Tops', '1650597296069.jpg', 10.63, 0, 33, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650597296069, 1650597296069),
(134, 'Floral Print Chiffon Smock Blouse', '1650597358780.jpg', 19.13, 0, 33, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650597358780, 1650597358780),
(135, 'Geometric Print Smock Blouse Office Lady', '1650597394607.jpg', 10.69, 0, 33, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650597394607, 1650597394607),
(136, 'Colorful Graffiti Print Perspective Smock Blouse', '1650597472662.jpg', 13.55, 0, 22, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650597472662, 1650597472662),
(137, 'Sequin Denim Jacket Womens Jacket', '1650597531113.jpg', 43.33, 0, 44, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650597531113, 1650597531113),
(138, 'Hollow Hole Belt Harajuku Autumn Denim Coat', '1650597635161.jpg', 65.34, 0, 45, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650597635161, 1650597635161),
(139, 'Zevity Women Vintage Contrast Color Graffiti Print Chiffon Blouse', '1650597697142.jpg', 34.00, 0, 44, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650597697142, 1650597697142),
(140, 'Korean Loose Short Cowboy Outerwear', '1650597798314.jpg', 46.00, 0, 33, 0, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span>', 'READY STOCK', 1650597798314, 1650597798314);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
(122, 4),
(123, 4),
(124, 4),
(125, 4),
(126, 12),
(127, 12),
(128, 12),
(129, 12),
(130, 12),
(131, 12),
(132, 12),
(133, 13),
(134, 13),
(135, 13),
(136, 13),
(137, 13),
(138, 13),
(139, 13),
(140, 13);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `product_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `id` bigint(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  `shipping` varchar(20) NOT NULL,
  `shipping_location` varchar(50) NOT NULL,
  `shipping_rate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `date_ship` bigint(20) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `payment` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `payment_data` text NOT NULL,
  `total_fees` decimal(12,2) NOT NULL,
  `tax` decimal(12,2) NOT NULL,
  `serial` varchar(100) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_order`
--

INSERT INTO `product_order` (`id`, `code`, `buyer`, `address`, `email`, `shipping`, `shipping_location`, `shipping_rate`, `date_ship`, `phone`, `comment`, `status`, `payment`, `payment_status`, `payment_data`, `total_fees`, `tax`, `serial`, `created_at`, `last_update`) VALUES
(2, 'JZ16066ON', 'asad', 'sadsdasd', 'asad@asad.c', 'Economy', 'New York, US', 20.00, 1653625766556, '3234234', '456465456', 'WAITING', '', '', '', 73.26, 11.00, 'cab8c1a4e4421a3b', 1651897721259, 1651897721259),
(3, 'DN83125YJ', 'asad', 'sadsdasd', 'asad@asad.c', 'Economy', 'New York, US', 0.00, 1652809196840, '3234234', '', 'WAITING', '', '', '', 48.84, 11.00, 'cab8c1a4e4421a3b', 1652117984028, 1652117984028),
(4, 'DT01761EK', 'asad', 'sadsdasd', 'asad@asad.c', '', '', 0.00, 1652809196840, '3234234', '', 'WAITING', '', '', '', 48.84, 11.00, 'cab8c1a4e4421a3b', 1652117984028, 1652117984028),
(5, 'DY61322KT', 'asad', 'sadsdasd', 'asad@asad.c', '', '', 0.00, 1652809196840, '3234234', '', 'WAITING', '', '', '', 48.84, 11.00, 'cab8c1a4e4421a3b', 1652117984028, 1652117984028),
(6, 'GI80721WN', 'asad', 'sadsdasd', 'asad@asad.c', '', '', 0.00, 1652809196840, '3234234', '', 'WAITING', '', '', '', 48.84, 11.00, 'cab8c1a4e4421a3b', 1652117984028, 1652117984028),
(7, 'JH52666FC', 'asad', 'sadsdasd', 'asad@asad.c', '', '', 0.00, 1652809196840, '3234234', '', 'WAITING', '', '', '', 48.84, 11.00, 'cab8c1a4e4421a3b', 1652117984028, 1652117984028),
(8, 'NF76053YC', 'asad', 'sadsdasd', 'asad@asad.c', '', '', 0.00, 1652809196840, '3234234', '', 'WAITING', '', '', '', 48.84, 11.00, 'cab8c1a4e4421a3b', 1652117984028, 1652117984028),
(9, 'AN36957ZJ', 'some name', 'some address', 'some@gmail.com', '', '', 0.00, 1652188334810, '+9212345678', 'asdasdasdasd', 'WAITING', '', '', '', 51.06, 11.00, 'cab8c1a4e4421a3b', 1652188334810, 1652188334810),
(10, 'MW33936WE', 'asad', 'some address', 'asad@gmail.com', '', '', 0.00, 1652188585327, '123456789', 'some additional comments', 'WAITING', '', '', '', 51.06, 11.00, 'cab8c1a4e4421a3b', 1652188585327, 1652188585327),
(11, 'TJ74571FX', 'some name here', 'sadsadasd', 'some@gmail.com', '', '', 0.00, 1652188632869, '123456789', 'asdasdasdasdasd', 'WAITING', 'RAZORPAY', '', 'order_JTXfdqL1TfmDRT', 51.06, 11.00, 'cab8c1a4e4421a3b', 1652188632869, 1652188632869),
(12, 'XD95036TY', 'Mian Asad Ali', 'some address', 'some@gmail.com', '', '', 0.00, 1652189452793, '123456789', 'some additional comments', 'WAITING', 'RAZORPAY', '', 'order_JTXfQNtkfblhlu', 51.06, 11.00, 'cab8c1a4e4421a3b', 1652189452793, 1652189452793);

-- --------------------------------------------------------

--
-- Table structure for table `product_order_detail`
--

CREATE TABLE `product_order_detail` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `price_item` decimal(12,2) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_order_detail`
--

INSERT INTO `product_order_detail` (`id`, `order_id`, `product_id`, `product_name`, `amount`, `price_item`, `created_at`, `last_update`) VALUES
(2, 2, 139, 'Korean Loose Short Cowboy Outerwear', 1, 46.00, 1651897902353, 1651897902353),
(3, 3, 125, 'sdasd', 1, 22.00, 1652118120425, 1652118120425),
(4, 4, 125, 'sdasd', 1, 22.00, 1652118183106, 1652118183106),
(5, 5, 125, 'sdasd', 1, 22.00, 1652118191683, 1652118191683),
(6, 6, 125, 'sdasd', 1, 22.00, 1652182988154, 1652182988154),
(7, 7, 125, 'sdasd', 1, 22.00, 1652188220908, 1652188220908),
(8, 8, 125, 'sdasd', 1, 22.00, 1652188248247, 1652188248247),
(9, 9, 140, 'Korean Loose Short Cowboy Outerwear', 1, 46.00, 1652188337479, 1652188337479),
(10, 10, 140, 'Korean Loose Short Cowboy Outerwear', 1, 46.00, 1652188587981, 1652188587981),
(11, 11, 140, 'Korean Loose Short Cowboy Outerwear', 1, 46.00, 1652188635569, 1652188635569),
(12, 12, 140, 'Korean Loose Short Cowboy Outerwear', 1, 46.00, 1652189455449, 1652189455449);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` bigint(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `location_id` varchar(50) NOT NULL,
  `rate_economy` decimal(12,2) NOT NULL,
  `rate_regular` decimal(12,2) NOT NULL,
  `rate_express` decimal(12,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `active_eco` tinyint(1) NOT NULL,
  `active_reg` tinyint(1) NOT NULL,
  `active_exp` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `location`, `location_id`, `rate_economy`, `rate_regular`, `rate_express`, `active`, `active_eco`, `active_reg`, `active_exp`) VALUES
(100, 'Alabama, US', '', 5.00, 10.00, 20.00, 0, 1, 1, 1),
(101, 'California, US', '', 5.00, 10.00, 20.00, 1, 1, 1, 1),
(102, 'Kansas, US', '', 5.00, 10.00, 20.00, 1, 1, 1, 1),
(103, 'Louisiana, US', '', 5.00, 10.00, 20.00, 1, 1, 1, 1),
(104, 'Michigan, US', '', 5.00, 10.00, 20.00, 1, 1, 1, 1),
(105, 'New York, US', '', 5.00, 10.00, 20.00, 1, 1, 1, 1),
(106, 'Oklahoma, US', '', 5.00, 10.00, 20.00, 1, 1, 1, 1),
(107, 'Texas, US', '', 5.00, 10.00, 20.00, 1, 1, 1, 1),
(108, 'Virginia, US', '', 5.00, 10.00, 20.00, 0, 1, 1, 1),
(109, 'Washington, US', '', 5.00, 10.00, 20.00, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`) VALUES
(1, 'Mian Speaks', 'admin', 'contact@mianasad.com', 'e6e061838856bf47e1de730719fb2609');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_version`
--
ALTER TABLE `app_version`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`name`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fcm`
--
ALTER TABLE `fcm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_info`
--
ALTER TABLE `news_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_unique_name` (`name`);
ALTER TABLE `product` ADD FULLTEXT KEY `product_fulltext` (`name`,`description`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD KEY `fk_product_category_1` (`product_id`),
  ADD KEY `fk_product_category_2` (`category_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD KEY `fk_table_images` (`product_id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table_orders_item` (`order_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location` (`location`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_version`
--
ALTER TABLE `app_version`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `fcm`
--
ALTER TABLE `fcm`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `news_info`
--
ALTER TABLE `news_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fk_product_category_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_category_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `fk_table_images` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  ADD CONSTRAINT `fk_table_orders_item` FOREIGN KEY (`order_id`) REFERENCES `product_order` (`id`) ON DELETE CASCADE;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `tms`
--
CREATE DATABASE IF NOT EXISTS `tms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tms`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2017-11-10 01:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `BookingId` int(11) NOT NULL,
  `PackageId` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `FromDate` varchar(100) NOT NULL,
  `ToDate` varchar(100) NOT NULL,
  `Comment` mediumtext NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `CancelledBy` varchar(5) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`BookingId`, `PackageId`, `UserEmail`, `FromDate`, `ToDate`, `Comment`, `RegDate`, `status`, `CancelledBy`, `UpdationDate`) VALUES
(2, 1, 'anuj@gmail.com', '05/18/2017', '05/31/2017', '\"Lorem ipsum dolor sit amet, cpariatur. Excepteur sint ', '2017-05-13 19:01:10', 2, 'u', '2017-05-13 21:30:23'),
(9, 1, 'demo@test.com', '05/19/2017', '05/21/2017', 'demo test demo test', '2017-05-14 07:45:11', 1, NULL, '2017-05-14 07:47:45'),
(10, 5, 'abc@g.com', '05/22/2017', '05/24/2017', 'test test t test test ttest test ttest test ttest test ttest test ttest test ttest test ttest test ttest test ttest test ttest test ttest test ttest test t', '2017-05-14 07:56:26', 1, NULL, '2017-05-14 07:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `tblenquiry`
--

CREATE TABLE `tblenquiry` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `EmailId` varchar(100) NOT NULL,
  `MobileNumber` char(10) NOT NULL,
  `Subject` varchar(100) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
--
-- Database: `walktrend`
--
CREATE DATABASE IF NOT EXISTS `walktrend` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `walktrend`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
