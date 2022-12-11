-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2022 at 06:20 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tweetapplication`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(100) NOT NULL,
  `UserId` int(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `TweetId` int(100) NOT NULL,
  `Date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `UserId`, `Description`, `TweetId`, `Date`) VALUES
(142, 696, 'hhhhh', 1040, '2022-09-12'),
(143, 696, 'ok ok', 1040, '2022-09-12'),
(144, 693, 'no why', 1040, '2022-09-12'),
(145, 693, 'good', 1036, '2022-09-12');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `ID` int(100) NOT NULL,
  `FollowerId` int(100) NOT NULL,
  `FollowedId` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hiddentweets`
--

CREATE TABLE `hiddentweets` (
  `id` int(100) NOT NULL,
  `tweetid` int(100) NOT NULL,
  `userid` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `ID` int(100) NOT NULL,
  `UserId` int(100) NOT NULL,
  `TweetId` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `saved_tweets`
--

CREATE TABLE `saved_tweets` (
  `id` int(11) NOT NULL,
  `TweetId` int(100) NOT NULL,
  `UserId` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `id` int(100) NOT NULL,
  `UserId` int(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Hashtag` varchar(100) NOT NULL,
  `Date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`id`, `UserId`, `Description`, `Hashtag`, `Date`) VALUES
(1033, 693, 'where .. ', '#tweet', '2022-12-11'),
(1034, 693, 'rrrrrr', '#rr', '2022-12-11'),
(1035, 693, 'ok. fine ..', '#ok', '2022-12-12'),
(1036, 695, 'no. ggg', '#gg', '2022-11-11'),
(1037, 695, 'uuu', '#d1', '2023-11-16'),
(1039, 696, 'nooo', '#no', '2024-04-17'),
(1040, 696, 'thanks', '#kk1', '2023-11-16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Fullname` varchar(100) NOT NULL,
  `Birthday` varchar(20) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Username`, `Fullname`, `Birthday`, `Password`, `Address`) VALUES
(692, 'salam', 'salam sami', '2001-05-11', '123', 'main street'),
(693, 'amany', 'amany abd', '2000-02-8', '123', 'main street ramallah'),
(694, 'ansam', 'ansam abd', '2003-02-24', '123', 'main street ramallah'),
(695, 'noor', 'noor shanteer', '2000-09-14', '123', 'main street '),
(696, 'omama', 'omama kittaneh', '2000-06-12', '123', 'main street '),
(697, 'mona', 'mona sameeh', '2008-10-12', '123', 'main street ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Test` (`UserId`),
  ADD KEY `tweeid` (`TweetId`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ddh` (`FollowedId`);

--
-- Indexes for table `hiddentweets`
--
ALTER TABLE `hiddentweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `tweetid` (`tweetid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `TweetId` (`TweetId`);

--
-- Indexes for table `saved_tweets`
--
ALTER TABLE `saved_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xx` (`TweetId`),
  ADD KEY `cc` (`UserId`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hiddentweets`
--
ALTER TABLE `hiddentweets`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `saved_tweets`
--
ALTER TABLE `saved_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1042;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=698;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `Test` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tweeid` FOREIGN KEY (`TweetId`) REFERENCES `tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `ddh` FOREIGN KEY (`FollowedId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hiddentweets`
--
ALTER TABLE `hiddentweets`
  ADD CONSTRAINT `gggfd` FOREIGN KEY (`tweetid`) REFERENCES `tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nnn` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `aa` FOREIGN KEY (`TweetId`) REFERENCES `tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qq` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saved_tweets`
--
ALTER TABLE `saved_tweets`
  ADD CONSTRAINT `cc` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `xx` FOREIGN KEY (`TweetId`) REFERENCES `tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
