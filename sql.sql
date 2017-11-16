-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2017 at 04:30 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `SuperheroesDating`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(10) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_between_two_profiles`
--

CREATE TABLE `chat_between_two_profiles` (
  `first_profile_email` varchar(50) NOT NULL,
  `second_profile_email` varchar(50) NOT NULL,
  `chat_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `title` varchar(30) NOT NULL,
  `text` varchar(255) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gift`
--

CREATE TABLE `gift` (
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `email` varchar(70) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `superpower` varchar(50) NOT NULL,
  `like_count` int(10) NOT NULL,
  `gift` varchar(50) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`email`, `nickname`, `superpower`, `like_count`, `gift`, `picture`) VALUES
('batman@gmail.com', 'Batman', '', 0, '', 'https://upload.wikimedia.org/wikipedia/en/1/17/Batman-BenAffleck.jpg'),
('doctorstrange', 'DoctorStrange', '', 0, '', 'https://nerdist.com/wp-content/uploads/2016/09/20160930_n_nerdistnews_drstrangeinfinity_1x1.jpg'),
('spiderman@gmail.com', 'Spiderman', '', 0, '', ''),
('venom@gmail.com', 'Venom', '', 0, '', 'http://www.dailyhogar.com/media/1462/venom.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `profile_has_comment`
--

CREATE TABLE `profile_has_comment` (
  `profile_email` varchar(50) NOT NULL,
  `comment_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift`
--
ALTER TABLE `gift`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;