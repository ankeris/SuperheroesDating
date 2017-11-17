-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2017 at 09:06 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superheroesdating`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(10) NOT NULL,
  `message` varchar(255) NOT NULL,
  `sender` varchar(70) NOT NULL,
  `receiver` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `message`, `sender`, `receiver`) VALUES
(4, 'IM TALKING TO MYSELF', 'batman@gmail.com', 'batman@gmail.com'),
(7, 'ads', 'batman@gmail.com', 'doctorstrange@gmail.com'),
(8, 'asdas das das', 'batman@gmail.com', 'doctorstrange@gmail.com'),
(9, 'asdas das das6', 'batman@gmail.com', 'doctorstrange@gmail.com'),
(10, 'dasdsa jksa dasj iqw jlas js', 'batman@gmail.com', 'doctorstrange@gmail.com'),
(11, 'youre cool m8', 'batman@gmail.com', 'doctorstrange@gmail.com'),
(14, 'dedddddddddddddddd\'', 'batman@gmail.com', 'batman@gmail.com'),
(15, 'msg', 'batman@gmail.com', 'venom@gmail.com'),
(16, 'dsa', 'batman@gmail.com', 'batman@gmail.com'),
(17, 'dat', 'batman@gmail.com', 'doctorstrange@gmail.com'),
(18, 'hey', 'spiderman@gmail.com', 'doctorstrange@gmail.com'),
(19, 'hey', 'spiderman@gmail.com', 'doctorstrange@gmail.com'),
(20, 'hey', 'spiderman@gmail.com', 'doctorstrange@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `name` varchar(30) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `id` int(10) NOT NULL,
  `profile_email` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`name`, `comment`, `id`, `profile_email`) VALUES
('Venom', 'SpiderMAN!!!!! YOULL BE DEAD YOU TURD', 4, 'spiderman@gmail.com'),
('Spidermans friend', 'I will defend him, you snake Venom', 6, 'spiderman@gmail.com'),
('Your Name', 'Cool', 10, 'spiderman@gmail.com'),
('Spiderman', 'No one likes you tentacle ', 11, 'venom@gmail.com'),
('Venom', 'Dude you\'re weird ', 17, 'doctorstrange@gmail.com'),
('Fan', 'My favorite hero!', 18, 'doctorstrange@gmail.com'),
('HAH', 'YOu won\'t succeeed', 19, 'doctorstrange@gmail.com'),
('Sp0derm8', 'you\'re a meme', 20, 'spiderman@gmail.com'),
('anonymous', 'i liked your profile, please like mine ok?', 21, 'spiderman@gmail.com'),
('commenter', 'ill just write a comment so it\'s not so empty here', 22, 'batman@gmail.com'),
('stranger', 'Can you sell me your cool car? pl0x', 23, 'batman@gmail.com'),
('Spidermans friend', 'we will kill you, no spoilers', 24, 'venom@gmail.com');

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
('batman@gmail.com', 'Batmanas', '', 9, '', 'https://upload.wikimedia.org/wikipedia/en/1/17/Batman-BenAffleck.jpg'),
('doctorstrange@gmail.com', 'Doctor Strange', 'very strong stuff', 4, '', 'https://nerdist.com/wp-content/uploads/2016/09/20160930_n_nerdistnews_drstrangeinfinity_1x1.jpg'),
('spiderman@gmail.com', 'Spiderman', 'throws a spider web', 58, '', 'https://images-na.ssl-images-amazon.com/images/I/51KjWthOnCL.jpg'),
('venom@gmail.com', 'Venom', '', 0, '', 'http://www.dailyhogar.com/media/1462/venom.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `receiver` (`receiver`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_email` (`profile_email`);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `profile` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `profile` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`profile_email`) REFERENCES `profile` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
