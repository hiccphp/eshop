-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2018-08-06 00:37:01
-- 服务器版本： 5.7.23-0ubuntu0.18.04.1
-- PHP Version: 7.2.7-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop`
--

-- --------------------------------------------------------

--
-- 表的结构 `shop_address`
--

CREATE TABLE `shop_address` (
  `addressid` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `address` text,
  `postcode` char(6) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_admin`
--

CREATE TABLE `shop_admin` (
  `adminid` int(10) UNSIGNED NOT NULL COMMENT '主键ID',
  `adminuser` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `adminpass` char(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `adminemail` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` bigint(20) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_admin`
--

INSERT INTO `shop_admin` (`adminid`, `adminuser`, `adminpass`, `adminemail`, `logintime`, `loginip`, `createtime`) VALUES
(1, 'admin', '523af537946b79c4f8369ed39ba78605', 'hiccphp@qq.com', 1533480499, 2130706433, 1533454017),
(3, 'joe', '21232f297a57a5a743894a0e4a801fc3', 'hiccphpb@qq.com', 1533466834, 2130706433, 1533454017),
(5, '44', '3691308f2a4c2f6983f2880d32e29c84', '44@qq.com', 0, 0, 0),
(6, '11', '6512bd43d9caa6e02c990b0a82652dca', '22211@qq.com', 1533480487, 2130706433, 0),
(7, '22', 'b6d767d2f8ed5d21a44b0e5886680cb9', '22@qq.com', 0, 0, 0),
(8, '33', '182be0c5cdcd5072bb1864cdee4d3d6e', '33@qq.com', 0, 0, 0),
(9, '55', 'b53b3a3d6ab90ce0268229151c9bde11', '55@qq.com', 0, 0, 0),
(10, '66', '3295c76acbf4caaed33c36b1b5fc2cb1', '66@qq.com', 0, 0, 0),
(11, '77', '28dd2c7955ce926456240b2ff0100bde', '77@qq.com', 0, 0, 0),
(12, '7788', '2a38a4a9316c49e5a833517c45d31070', '88@qq.com', 0, 0, 0),
(13, '111', '6512bd43d9caa6e02c990b0a82652dca', '111@qq.com', 0, 0, 0),
(14, '3333333', '182be0c5cdcd5072bb1864cdee4d3d6e', '33111@qq.com', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `shop_cart`
--

CREATE TABLE `shop_cart` (
  `cartid` bigint(20) UNSIGNED NOT NULL,
  `productid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `productnum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `userid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_category`
--

CREATE TABLE `shop_category` (
  `cateid` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '',
  `parentid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_order`
--

CREATE TABLE `shop_order` (
  `orderid` bigint(20) UNSIGNED NOT NULL,
  `userid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `addressid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expressid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expressno` varchar(50) NOT NULL DEFAULT '',
  `tradeno` varchar(100) NOT NULL DEFAULT '',
  `tradeext` text,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_order_detail`
--

CREATE TABLE `shop_order_detail` (
  `detailid` bigint(20) UNSIGNED NOT NULL,
  `productid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productnum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `orderid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_product`
--

CREATE TABLE `shop_product` (
  `productid` bigint(20) UNSIGNED NOT NULL,
  `cateid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `descr` text,
  `num` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cover` varchar(200) NOT NULL DEFAULT '',
  `pics` text,
  `issale` enum('0','1') NOT NULL DEFAULT '0',
  `ishot` enum('0','1') NOT NULL DEFAULT '0',
  `istui` enum('0','1') NOT NULL DEFAULT '0',
  `saleprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ison` enum('0','1') NOT NULL DEFAULT '1',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_profile`
--

CREATE TABLE `shop_profile` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '主键ID',
  `truename` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `age` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '年龄',
  `sex` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '2016-01-01' COMMENT '生日',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `company` varchar(100) NOT NULL DEFAULT '' COMMENT '公司',
  `userid` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户的ID',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_user`
--

CREATE TABLE `shop_user` (
  `userid` bigint(20) UNSIGNED NOT NULL COMMENT '主键ID',
  `username` varchar(32) NOT NULL DEFAULT '',
  `userpass` char(32) NOT NULL DEFAULT '',
  `useremail` varchar(100) NOT NULL DEFAULT '',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_user`
--

INSERT INTO `shop_user` (`userid`, `username`, `userpass`, `useremail`, `createtime`) VALUES
(1, 'han', '83832391027a1f2f4d46ef882ff3a47d', 'han@qq.com', 1533484906),
(2, '11', '6512bd43d9caa6e02c990b0a82652dca', '11@11.com', 1533484942),
(3, '22', 'b6d767d2f8ed5d21a44b0e5886680cb9', '22@11.com', 1533484953),
(4, '33', '182be0c5cdcd5072bb1864cdee4d3d6e', '33@11.com', 1533484959),
(5, '3344', 'f7177163c833dff4b38fc8d2872f1ec6', '44@11.com', 1533484964),
(6, '55', 'b53b3a3d6ab90ce0268229151c9bde11', '55@11.com', 1533484969);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shop_address`
--
ALTER TABLE `shop_address`
  ADD PRIMARY KEY (`addressid`),
  ADD KEY `shop_address_userid` (`userid`);

--
-- Indexes for table `shop_admin`
--
ALTER TABLE `shop_admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `shop_admin_adminuser_adminpass` (`adminuser`,`adminpass`),
  ADD UNIQUE KEY `shop_admin_adminuser_adminemail` (`adminuser`,`adminemail`);

--
-- Indexes for table `shop_cart`
--
ALTER TABLE `shop_cart`
  ADD PRIMARY KEY (`cartid`),
  ADD KEY `shop_cart_productid` (`productid`),
  ADD KEY `shop_cart_userid` (`userid`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`cateid`),
  ADD KEY `shop_category_parentid` (`parentid`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `shop_order_userid` (`userid`),
  ADD KEY `shop_order_addressid` (`addressid`),
  ADD KEY `shop_order_expressid` (`expressid`);

--
-- Indexes for table `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `shop_order_detail_productid` (`productid`),
  ADD KEY `shop_order_detail_orderid` (`orderid`);

--
-- Indexes for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `shop_product_cateid` (`cateid`),
  ADD KEY `shop_product_ison` (`ison`);

--
-- Indexes for table `shop_profile`
--
ALTER TABLE `shop_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_profile_userid` (`userid`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `shop_user_username_userpass` (`username`,`userpass`),
  ADD UNIQUE KEY `shop_user_useremail_userpass` (`useremail`,`userpass`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `shop_address`
--
ALTER TABLE `shop_address`
  MODIFY `addressid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_admin`
--
ALTER TABLE `shop_admin`
  MODIFY `adminid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID', AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `shop_cart`
--
ALTER TABLE `shop_cart`
  MODIFY `cartid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `cateid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `orderid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_order_detail`
--
ALTER TABLE `shop_order_detail`
  MODIFY `detailid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `productid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_profile`
--
ALTER TABLE `shop_profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID';
--
-- 使用表AUTO_INCREMENT `shop_user`
--
ALTER TABLE `shop_user`
  MODIFY `userid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID', AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
