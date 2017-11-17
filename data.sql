-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 17, 2017 at 10:58 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cats_and_dogs`
--
CREATE DATABASE IF NOT EXISTS `cats_and_dogs` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cats_and_dogs`;

-- --------------------------------------------------------

--
-- Table structure for table `dogs`
--

CREATE TABLE `dogs` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `race` varchar(128) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `image` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `dogs`
--

INSERT INTO `dogs` (`id`, `name`, `race`, `description`, `image`) VALUES
(1, 'Rosa', 'Bernese Mountain Dog', 'The Bernese Mountain Dog, called in German the Berner Sennenhund, is a large-sized breed of dog, one of the four breeds of Sennenhund-type dogs from the Swiss Alps. The name Sennenhund is derived from the German Senne (“alpine pasture”) and Hund (“dog”), as they accompanied the alpine herders and dairymen called Senn. Berner (or Bernese in English) refers to the area of the breed’s origin, in the canton of Bern. This mountain dog was originally kept as a general farm dog. Large Sennenhunde in the past were also used as draft animals, pulling carts. The breed was officially established in 1907. In 1937, the American Kennel Club recognized it; today, the club classifies it as a member of the Working Group.', 'rosa.jpg'),
(2, 'Doggy', 'German Smth', 'Bites your leg', '\'image.jpg\''),
(5, 'Rudolph', 'Red Assier', 'Bites your arms', '\'dog.jpg\''),
(7, 'Candy', 'Indian dog', 'Good smell sencor', '\'dog.jpg\'');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dogs`
--
ALTER TABLE `dogs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dogs`
--
ALTER TABLE `dogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;--
-- Database: `skyfi`
--
CREATE DATABASE IF NOT EXISTS `skyfi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `skyfi`;

-- --------------------------------------------------------

--
-- Table structure for table `Album`
--

CREATE TABLE `Album` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Album`
--

INSERT INTO `Album` (`id`, `title`) VALUES
(1, 'Album of destiny'),
(2, 'Other side of the sun');

-- --------------------------------------------------------

--
-- Table structure for table `album_contains_song`
--

CREATE TABLE `album_contains_song` (
  `album_id` int(10) NOT NULL,
  `song_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Artist`
--

CREATE TABLE `Artist` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Artist`
--

INSERT INTO `Artist` (`id`, `name`, `lastname`, `image`) VALUES
(1, 'Laurynas', 'Naujokas', ''),
(2, 'John', 'Papa', ''),
(3, 'Jenifer', 'Naujokiene', ''),
(4, 'Bob', 'Desaunois', ''),
(23, 'juozas', 'rastenis', 'Mousedas'),
(24, 'laurinas', 'laurijokas', 'grazi.jpg'),
(25, 'something', 'smth', '');

-- --------------------------------------------------------

--
-- Table structure for table `artist_has_album`
--

CREATE TABLE `artist_has_album` (
  `artist_id` int(10) NOT NULL,
  `album_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `artist_has_song`
--

CREATE TABLE `artist_has_song` (
  `artist_id` int(10) NOT NULL,
  `song_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist_has_song`
--

INSERT INTO `artist_has_song` (`artist_id`, `song_id`) VALUES
(4, 14);

-- --------------------------------------------------------

--
-- Table structure for table `Band`
--

CREATE TABLE `Band` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Band`
--

INSERT INTO `Band` (`id`, `title`) VALUES
(1, 'Child of Nature'),
(2, 'Foreigners');

-- --------------------------------------------------------

--
-- Table structure for table `band_has_album`
--

CREATE TABLE `band_has_album` (
  `band_id` int(10) NOT NULL,
  `album_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `band_has_artist`
--

CREATE TABLE `band_has_artist` (
  `artist_id` int(10) NOT NULL,
  `band_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`name`) VALUES
('Electro'),
('Pop'),
('Rap'),
('Rock');

-- --------------------------------------------------------

--
-- Table structure for table `Song`
--

CREATE TABLE `Song` (
  `id` int(10) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Song`
--

INSERT INTO `Song` (`id`, `genre`, `title`) VALUES
(7, 'Rap', 'This is ma\' destiny'),
(9, 'Electro', 'My rithm is like dat'),
(11, 'Pop', 'Hello Hello Party People'),
(12, 'Rock', 'No country without a man'),
(13, 'Rock', 'Stone rockin\''),
(14, 'Pop', 'My Favorite Dream');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Album`
--
ALTER TABLE `Album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `album_contains_song`
--
ALTER TABLE `album_contains_song`
  ADD KEY `album_id` (`album_id`),
  ADD KEY `song_id` (`song_id`);

--
-- Indexes for table `Artist`
--
ALTER TABLE `Artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artist_has_album`
--
ALTER TABLE `artist_has_album`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `artist_has_song`
--
ALTER TABLE `artist_has_song`
  ADD KEY `artist_has_song_ibfk_1` (`artist_id`),
  ADD KEY `song_id` (`song_id`);

--
-- Indexes for table `Band`
--
ALTER TABLE `Band`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `band_has_album`
--
ALTER TABLE `band_has_album`
  ADD KEY `album_id` (`album_id`),
  ADD KEY `band_id` (`band_id`);

--
-- Indexes for table `band_has_artist`
--
ALTER TABLE `band_has_artist`
  ADD KEY `band_has_artist_ibfk_3` (`artist_id`),
  ADD KEY `band_id` (`band_id`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `Song`
--
ALTER TABLE `Song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre` (`genre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Album`
--
ALTER TABLE `Album`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Artist`
--
ALTER TABLE `Artist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `Band`
--
ALTER TABLE `Band`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Song`
--
ALTER TABLE `Song`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `album_contains_song`
--
ALTER TABLE `album_contains_song`
  ADD CONSTRAINT `album_contains_song_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `album_contains_song_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `Song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `artist_has_album`
--
ALTER TABLE `artist_has_album`
  ADD CONSTRAINT `artist_has_album_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `Artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `artist_has_album_ibfk_3` FOREIGN KEY (`album_id`) REFERENCES `Album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `artist_has_song`
--
ALTER TABLE `artist_has_song`
  ADD CONSTRAINT `artist_has_song_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `Artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `artist_has_song_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `Song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `band_has_album`
--
ALTER TABLE `band_has_album`
  ADD CONSTRAINT `band_has_album_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `band_has_album_ibfk_2` FOREIGN KEY (`band_id`) REFERENCES `Band` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `band_has_artist`
--
ALTER TABLE `band_has_artist`
  ADD CONSTRAINT `band_has_artist_ibfk_3` FOREIGN KEY (`artist_id`) REFERENCES `Artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `band_has_artist_ibfk_4` FOREIGN KEY (`band_id`) REFERENCES `Band` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Song`
--
ALTER TABLE `Song`
  ADD CONSTRAINT `song_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `Genre` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `SuperheroesDating`
--
CREATE DATABASE IF NOT EXISTS `SuperheroesDating` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `SuperheroesDating`;

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
('batman@gmail.com', 'Batman', '', 6, '', 'https://upload.wikimedia.org/wikipedia/en/1/17/Batman-BenAffleck.jpg'),
('doctorstrange@gmail.com', 'Doctor Strange', 'very strong stuff', 0, '', 'https://nerdist.com/wp-content/uploads/2016/09/20160930_n_nerdistnews_drstrangeinfinity_1x1.jpg'),
('spiderman@gmail.com', 'Spiderman', '', 28, '', 'https://images-na.ssl-images-amazon.com/images/I/51KjWthOnCL.jpg'),
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