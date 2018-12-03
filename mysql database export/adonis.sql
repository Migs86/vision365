-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2018 at 02:22 PM
-- Server version: 5.7.23-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adonis`
--

-- --------------------------------------------------------

--
-- Table structure for table `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1503248427885_user', 1, '2018-08-22 04:48:11'),
(2, '1507839709797_post_schema', 1, '2018-08-22 04:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `assign_campaign_photos`
--

CREATE TABLE `assign_campaign_photos` (
  `id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1 assign 0 unassign'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_event`
--

CREATE TABLE `calendar_event` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_gallery`
--

CREATE TABLE `calendar_gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `calender_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `calender`
--

CREATE TABLE `calender` (
  `id` int(11) NOT NULL,
  `calender_title` varchar(255) NOT NULL,
  `select_start_date` varchar(255) NOT NULL,
  `select_start_month` varchar(255) NOT NULL,
  `holidays` varchar(255) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `calender_type` int(11) NOT NULL,
  `photo_layout` int(11) DEFAULT NULL,
  `created_by` int(1) DEFAULT NULL COMMENT '1) admin 2) app user',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calender`
--

INSERT INTO `calender` (`id`, `calender_title`, `select_start_date`, `select_start_month`, `holidays`, `campaign_id`, `user_id`, `calender_type`, `photo_layout`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Girl campaign', '2018', 'July', 'All', 1, NULL, 1, 1, NULL, 1, '2018-07-19 00:00:00', '2018-07-19 00:00:00'),
(2, 'Football saver', '2018', 'July', 'All', 2, NULL, 3, 3, NULL, 1, '2018-07-19 00:00:00', '2018-07-19 00:00:00'),
(3, 'Mini Poster Portrait', '2016', '3', 'All', 2, 1202, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(4, 'Mini Poster Portrait', '2014', '2', 'All', 1, 1202, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(5, 'Mini Poster Portrait', '2018', '5', 'All', 1, 1202, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(6, 'Mini Poster Portrait', '2015', '2', 'All', 1, 1202, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(7, 'Mini Poster Portrait', '2013', '1', 'All', 2, 1226, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(8, 'Mini Poster Portrait', '2015', '2', 'All', 2, 1226, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(9, 'Wall Calendar', '2017', '4', 'All', 2, 1226, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(10, 'Mini Poster Portrait', '2014', '2', 'All', 2, 1226, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(11, 'Mini Poster Portrait', '2013', '1', 'All', 2, 1205, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(12, 'Mini Poster Portrait', '2015', '3', 'All', 2, 1205, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(13, 'Mini Poster Portrait', '2014', '2', 'All', 2, 1205, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(14, 'Mini Poster Portrait', '2014', '2', 'All', 2, 1205, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(15, 'Mini Poster Portrait', '2015', '2', 'All', 2, 1205, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(16, 'Mini Poster Portrait', '2015', '2', 'All', 2, 1205, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(17, 'Mini Poster Portrait', '2016', '3', 'All', 1, 1205, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(18, 'Mini Poster Portrait', '2015', '3', 'All', 2, 1205, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(19, 'Mini Poster Portrait', '2015', '2', 'All', 2, 1205, 1, 1, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(20, 'Mini Poster Portrait', '2015', '3', 'All', 2, 1205, 2, 2, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(21, 'Mini Poster Portrait', '2015', '2', 'All', 1, 1205, 2, 2, 2, 0, '2018-07-23 00:00:00', '2018-07-23 00:00:00'),
(22, 'ashok', '2018', 'July', 'All', 4, NULL, 1, 1, NULL, 1, '2018-07-24 00:00:00', '2018-07-24 00:00:00'),
(23, 'title', '2018', 'July', 'All', 5, NULL, 1, 1, NULL, 1, '2018-07-24 00:00:00', '2018-07-24 00:00:00'),
(24, 'Peace', '2018', 'July', 'All', 6, NULL, 1, 1, NULL, 1, '2018-07-24 00:00:00', '2018-07-24 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `content` longtext,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '1 Active 0 Inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 5, 'good post', 1, '2018-09-03 00:00:00', '2018-09-03 00:00:00'),
(2, 2, 5, 'good post 2', 1, '2018-09-03 00:00:00', '2018-09-03 00:00:00'),
(3, 24, 9, 'lalit Post good', 0, NULL, NULL),
(4, 24, 9, 'lalit sir post is very good', 0, NULL, NULL),
(5, 24, 9, 'lalit sir bhut vadea', 0, NULL, NULL),
(6, 10, 8, 'i am commenting on you', 0, NULL, NULL),
(7, 10, 8, 'next comment', 0, NULL, NULL),
(8, 24, 9, 'great', 0, NULL, NULL),
(9, 10, 8, 'what', 0, NULL, NULL),
(10, 24, 9, 'xzczc', 0, NULL, NULL),
(11, 10, 9, 'xcvx', 0, NULL, NULL),
(12, 10, 3, 'commenting', 0, NULL, NULL),
(13, 10, 3, 'dj here', 0, NULL, NULL),
(14, 10, 3, 'yahoo', 0, NULL, NULL),
(15, 10, 3, 'zxzsz', 0, NULL, NULL),
(16, 10, 8, 'hellow', 0, NULL, NULL),
(17, 10, 4, 'hetyt', 0, NULL, NULL),
(18, 10, 4, 'xczcxz', 0, NULL, NULL),
(19, 10, 4, 'xdvcxvcx', 0, NULL, NULL),
(20, 10, 4, 'vcb', 0, NULL, NULL),
(21, 20, 5, 'test', 0, NULL, NULL),
(22, 20, 8, 'tes', 0, NULL, NULL),
(23, 26, 9, 'Nice Post', 0, NULL, NULL),
(26, 10, 6, 'hey', 0, NULL, NULL),
(27, 8, 9, ' xvc', 0, NULL, NULL),
(28, 8, 9, ' xvc', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `media_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1 => active ,0 =>deactive',
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `media_url`, `created_at`, `status`, `updated_at`) VALUES
(1, 'Accounting', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'http://112.196.33.91:3333/', NULL, 1, NULL),
(2, 'Aerospace Engineering', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'http://112.196.33.91:3333/', NULL, 1, NULL),
(3, 'course 3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'http://112.196.33.91:3333/', NULL, 1, NULL),
(8, 'course 4', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'http://112.196.33.91:3333/', NULL, 1, NULL),
(9, 'course 5', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'http://112.196.33.91:3333/', NULL, 1, NULL),
(10, 'course 6', 'test', 'http://112.196.33.91:3333/admin/courses/create', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 5, 1, '2018-09-07 00:00:00', '2018-09-07 00:00:00'),
(3, 10, 4, 1, NULL, NULL),
(4, 21, 9, 1, NULL, NULL),
(5, 25, 9, 0, NULL, NULL),
(6, 26, 9, 0, NULL, NULL),
(7, 26, 8, 0, NULL, NULL),
(8, 26, 6, 1, NULL, NULL),
(9, 21, 8, 1, NULL, NULL),
(10, 10, 9, 1, NULL, NULL),
(11, 45, 9, 1, NULL, NULL),
(12, 45, 8, 1, NULL, NULL),
(13, 45, 11, 1, NULL, NULL),
(14, 45, 10, 1, NULL, NULL),
(15, 45, 7, 1, NULL, NULL),
(16, 45, 3, 0, NULL, NULL),
(17, 10, 10, 1, NULL, NULL),
(18, 45, 6, 0, NULL, NULL),
(19, 47, 9, 1, NULL, NULL),
(20, 1, 14, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(55) NOT NULL,
  `section_id` int(55) NOT NULL,
  `topic_id` int(55) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `post_image` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '1 Active 0 Inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `course_id`, `section_id`, `topic_id`, `title`, `body`, `post_image`, `status`, `created_at`, `updated_at`) VALUES
(3, 10, 0, 0, 0, 'test', 'test', '1536058202059.jpeg', 1, '2018-08-22 11:05:30', '2018-08-22 11:05:30'),
(4, 10, 0, 0, 0, 'test', 'testt', '1536058202059.jpeg', 0, '2018-08-25 07:44:48', '2018-08-25 07:44:48'),
(5, 10, 0, 0, 0, 'test post 1', 'body 1', '1536058202059.jpeg', 0, '2018-09-01 03:32:00', '2018-09-01 03:32:00'),
(6, 10, 1, 1, 1, 'Highcharts Demo', 'dsff', '1536058202059.jpeg', 0, '2018-09-04 10:36:53', '2018-09-04 10:36:53'),
(7, 10, 1, 1, 1, 'Highcharts Demo', 'dfgdf', '1536058202059.jpeg', 0, '2018-09-04 16:13:51', '2018-09-04 16:13:51'),
(8, 10, 1, 1, 2, 'Highcharts Demo', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', '1536058202059.jpeg', 0, '2018-09-04 16:20:02', '2018-09-07 12:44:25'),
(9, 24, 1, 1, 1, 'Lalit kangre val', 'Lalit kangre val', '1536229423957.jpeg', 0, '2018-09-06 15:53:43', '2018-09-06 15:53:43'),
(10, 45, 1, 1, 4, 'Arjun Kapoor and Malaika Arora Are No Longer Keen to Hide Their Relationship, Here\'s Proof – See Pic', 'On the other hand, Arbaaz Khan is rumoured to be in a relationship with Georgia Andriani. Arbaaz and Georgia are often snapped spending time with each other\'s families or bonding with each other over family dinners on several occasions. Recently, Arbaaz Khan and Giorgia Andriani walked for Archana Kochhar as showstoppers at Phoenix Fashion Night in Bangalore. Watch this space for further updates.', '1539064007340.jpeg', 0, '2018-10-09 11:16:47', '2018-10-09 11:16:47'),
(12, 10, 2, 4, 5, 'Flights Coming Soon...', 'The Supreme Court has asked the government to give details by October 29 - in a sealed cover - of the decision-making process on the Rafale fighter jet deal, which is at the centre of a massive political row.', '1539166300102.jpeg', 0, '2018-10-10 15:41:40', '2018-10-10 15:41:40'),
(13, 45, 2, 4, 5, 'What is Accounting? Importance, Purpose & Need', 'If you’re like most people out there, just hearing the word “accounting” probably sends your brain off to sleep. You probably think accounting is hard. And boring. And for old people.\r\n\r\nWell, the good news is, that’s not entirely true. Accounting can be extremely interesting. In fact, a large part of accounting is learning about how to make more money. And most people find making money a lot of fun.', '1539236264726.jpeg', 0, '2018-10-11 11:07:44', '2018-10-11 13:25:10'),
(14, 2, 1, 2, 2, 'New Post', 'Testing', '1543578281572.png', 0, '2018-11-30 17:14:41', '2018-11-30 17:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_type` varchar(25) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` longtext,
  `order` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1 Active 0 Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `course_id`, `name`, `description`, `order`, `status`) VALUES
(1, 1, 'Financial accounting', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', NULL, 1),
(2, 1, 'Advanced accounting', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', NULL, 1),
(3, 1, 'Fraud detection', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', NULL, 1),
(4, 2, 'Performance and Design', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `allow_emails` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` longtext,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '1 Active 0 Inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `section_id`, `name`, `description`, `status`, `created_at`, `updated_At`) VALUES
(1, 1, 'Introduction', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', 1, '2018-08-08 00:00:00', '2018-08-24 00:00:00'),
(2, 2, 'Basic Structure', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', 1, '2018-08-08 00:00:00', '2018-08-24 00:00:00'),
(3, 3, 'Accounting Cycle', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', 1, '2018-08-08 00:00:00', '2018-08-24 00:00:00'),
(4, 3, 'Bussiness Law', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', 1, '2018-08-08 00:00:00', '2018-08-24 00:00:00'),
(5, 4, 'Introduction', 'herereerd dsg', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role_type` int(55) NOT NULL DEFAULT '2' COMMENT '1) admin 2) frontend user',
  `status` int(1) NOT NULL DEFAULT '2' COMMENT '1 Active 0 Inactive',
  `token` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `profile_image`, `email`, `username`, `password`, `role_type`, `status`, `token`, `created_at`, `updated_at`) VALUES
(1, 'shiv g', '1536225066764.jpeg', 'omnamahshivaay@outlook.in', 'shivaay', '$2a$10$.t7EFerVYF6ZpwKO82jg9Ow7COhueDOS1OMwHaMfrVIv4ks7zjWC.', 1, 0, NULL, '2018-08-22 10:23:13', '2018-08-22 10:23:13'),
(2, 'ak', NULL, 'lalit.slinfy@gmail.com', 'lalit143', '$2a$10$LWtlbpgJ4p5NmuOP.18prOs/mT/UVfFOXOpTRwcJpY/PMa8dYgSay', 1, 0, NULL, '2018-08-22 11:05:07', '2018-11-30 16:24:26'),
(3, 'ashok', NULL, 'ashok.slinfy@gmail.com', 'ashokG', '$2a$10$fcbmvKle4rOQCk6sUQ0ehO4zw7MHSYlVTiZS6HpFydeXc3Bf7b6CW', 2, 1, NULL, '2018-08-22 14:47:11', '2018-08-22 14:47:11'),
(7, 'userssssssss', NULL, 'ashok.slinDDfy@gmASDSAail.com', 'userr', 'ASHOKG', 2, 1, NULL, '2018-08-22 00:00:00', '2018-08-22 00:00:00'),
(8, 'noora', '1536225066764.jpeg', 'noora@gmail.com', 'noora@gmail.com', '$2a$10$Y9p/sgyv4E99BGgknqCQpuOymsoEp5uWEswa4gCHoqXjZfGfKvEu.', 1, 0, NULL, '2018-08-22 16:45:12', '2018-08-22 16:45:12'),
(9, 'noora1', NULL, 'noora1@gmail.com', 'noora1', '$2a$10$SmWjLt7ZPzhsoKKCCdpNq.gat4tEJnqz.MpgEsMsxZeJ1C1KsL5Sq', 2, 1, NULL, '2018-08-22 18:22:57', '2018-08-22 18:22:57'),
(10, 'admin', '1539347699173.jpeg', 'admin@vision.com', 'admin', '$2a$10$ttgEbJBgkT3CMV5Qay/qweppcj9T1X1IpJyIoy0eeq779Q5bCUq3e', 1, 0, NULL, '2018-08-22 19:10:28', '2018-10-12 18:04:59'),
(11, 'te', '1536225066764.jpeg', 'testg@gmail.com', 'testg', '$2a$10$Qks0pKzxCGL0tdJKanFpXONh.E8AtE.BW6dvR5RP6QRBCRlDdEz3K', 2, 1, NULL, '2018-08-22 19:23:38', '2018-08-22 19:23:38'),
(12, 'djash', NULL, 'testsdfsg@gmail.com', 'testgsdfsd', '$2a$10$Qks0pKzxCGL0tdJKanFpXONh.E8AtE.BW6dvR5RP6QRBCRlDdEz3K', 2, 0, NULL, '2018-08-22 19:23:38', '2018-08-22 19:23:38'),
(13, 'awujik', NULL, 'tessdfdsftsdfsg@gmail.com', 'testsdfsdfsdgsdfsd', '$2a$10$Qks0pKzxCGL0tdJKanFpXONh.E8AtE.BW6dvR5RP6QRBCRlDdEz3K', 2, 1, NULL, '2018-08-22 19:23:38', '2018-08-22 19:23:38'),
(17, 'slinfy', NULL, 'sunil@slinfy.com', 'john', '$2a$10$bbgHmHhSGOskJ5/wyP6BjeTKr3VRiXaWBn3bnWJsuvtFhlpzsOkoy', 2, 0, NULL, '2018-08-23 17:00:12', '2018-08-23 17:00:12'),
(18, 'ds', NULL, 'manish.kumar@slinfy.com', 'manishme', '$2a$10$EuzPbRYtdlPxOBJFoTKkDOuJ35IK2yectP82uA71kSc85YSsFws.C', 2, 0, NULL, '2018-08-24 19:11:50', '2018-08-24 19:11:50'),
(19, 'aw', NULL, 'sunil@gmail.com', 'john1', '$2a$10$nKf8oZZZXYOuZzX2tf/lX.0G92hbZSb3vuJPm1oaSjycWkLsgFo4G', 2, 0, NULL, '2018-08-31 11:33:50', '2018-08-31 11:33:50'),
(20, 'asd', NULL, 'miguelenriquefernando@gmail.com', 'Miguel', '$2a$10$rISYPjy0ew0WLn41vrblKe9q1OgkrlZQ2aFjOxDRFu2VbHs45FXKW', 2, 0, NULL, '2018-09-01 03:31:13', '2018-09-01 03:31:13'),
(21, 'lalit', NULL, 'kumarashok305922@gmail.com', 'lalit', '$2a$10$PQMipu8xyTLfBMe4njXv7u2TDu0L1Mav1X0fgHJ/dWq7lCZByihhO', 2, 0, NULL, '2018-09-03 13:03:46', '2018-09-03 13:03:46'),
(22, 'aa', '1536221474813.jpeg', 'profilePics@gmail.com', 'profilePics', '$2a$10$nTQkws21iMihEBRM1ONRbuPcTLw/8ix3GIwlrH/UILLd8U841Wh..', 2, 0, NULL, '2018-09-06 13:41:15', '2018-09-06 13:41:15'),
(23, 'aaaa', '1536225151032.jpeg', 'profilePics1@gmail.com', 'profilePics1', '$2a$10$Xqq2qDrW2DTuuQ6WYGaVcuWW4o.VZIEj4TdjunAR4lHLLSOTlco9S', 2, 2, NULL, '2018-09-06 14:42:31', '2018-09-06 14:42:31'),
(24, 'aaaa', '1536229378692.png', 'lalitg@gmail.com', 'lalitg', '$2a$10$7gAoYS35G8XWsoScRzQ0f.uqA3QMB5EziKjaYOF7BqdpW7V43XVi.', 2, 2, NULL, '2018-09-06 15:52:58', '2018-09-06 15:52:58'),
(25, 'eriu', '1536560908883.jpeg', 'test@gmail.com', 'test', '$2a$10$iexcPTJ5JvoR5v4/v4jYleF8PvhJoXVeDo4tlbAF2lQYa1JEWQrr2', 2, 0, NULL, '2018-09-10 11:58:29', '2018-09-10 11:58:29'),
(26, 'da', '1536562849825.jpeg', 'user@gmail.com', 'user', '$2a$10$QY4ZPREzAvOIaxcDdix3geTGbkyJ2Tsyy7YXYk3IvoW46ohFEJP6S', 2, 0, NULL, '2018-09-10 12:30:49', '2018-09-10 12:30:49'),
(35, 'aser', '1536645650445.jpeg', 'gsaf@gmail.com', 'nb', '$2a$10$cIdJb9y7kqJmubLQJWZD7e2OlU1wg9D5KWDvVi1Qp6PKeMz9F1uw6', 2, 2, NULL, '2018-09-11 11:30:50', '2018-09-11 11:30:50'),
(36, 'sfart', '1536645782329.jpeg', 'abss@gmail.com', 'abc', '$2a$10$Tr85M0YrZ4Sq.GCOcsDZrOoy6kSFPS4dfUzDGIjt.TDxLxy/fW55.', 2, 2, NULL, '2018-09-11 11:33:02', '2018-09-11 11:33:02'),
(38, 'abcde', NULL, 'abcde@gmail.com', 'abcde', '$2a$10$RF7VUMSZS8tqJ9GHLf1PrOvR7CI3wvanysHP.ndjpA9/spAgZtxY6', 2, 0, NULL, '2018-09-11 13:39:53', '2018-09-11 13:39:53'),
(39, 'ab', NULL, 'ab@gmail.com', 'ab', '$2a$10$vfnf9nVxEU5hEbG68UOKIOgZYpGdHTzYxWANOVXQGQ06/7HVW/iTK', 2, 2, NULL, '2018-09-11 13:41:02', '2018-09-11 13:41:02'),
(40, 'neww', NULL, 'neww@gmail.com', 'neww', '$2a$10$UHoU4RVBAzJ4GIIbqjH2s.lYG5rgVo46lpCKyYS7h5DQD1bEtKPQm', 2, 2, NULL, '2018-09-11 13:45:58', '2018-09-11 13:45:58'),
(41, 'xyz', NULL, 'jxbh@gmail.com', 'xyz', '$2a$10$1AXQ5azaiFhWDCfaQVczh.B/1Y73iQXjPcGQcDN0/AIjgauleE.ra', 2, 2, NULL, '2018-09-11 16:01:23', '2018-09-11 16:01:23'),
(43, 'sdf', NULL, 'sd@gmail.com', 'sd', '$2a$10$ZHlLlxbJNPEGJe8G9iq/1e6jBSsHmemUBblX/54M0PKVEmvVUH.Ty', 2, 2, NULL, '2018-09-11 16:14:11', '2018-09-11 16:14:11'),
(44, 'a', NULL, 'impreet96@gmail.com', 'a', '$2a$10$xBbEg4.ulKmpv5jVd4yFtuCwIJdH.uiRWq1D5rvekwK6Hk/P2LhQK', 2, 2, NULL, '2018-09-11 16:14:58', '2018-09-11 16:14:58'),
(45, 'harjinder', '1539062845056.png', 'harjinder.sl@gmail.com', 'harjinder', '$2a$10$3X36LNJcbEd3Tfv8YqeaueJ6qRdQLifgYTWWG1nhEcR98TToPGhSa', 2, 2, NULL, '2018-10-09 10:57:25', '2018-10-11 16:18:47'),
(46, 'noora saroa', '1539256789531.jpeg', 'harjinder.slinfy1@gmail.com', 'harjinder1', '$2a$10$Vrk.oZutgCSKK/KNATujOeEnTRcWJsHGEJzZEIrw6xd53AmTLh/aa', 2, 2, NULL, '2018-10-11 16:49:49', '2018-10-11 16:49:49'),
(47, 'noora saroa', '1539256961235.jpeg', 'harjinder.slinfy@gmail.com', 'harjinder2', '$2a$10$8eTQjK0cCaypvILTtr9yyuuZrOKO0w9B3I4NErRsoWMmLEK3VS5Na', 2, 2, NULL, '2018-10-11 16:52:41', '2018-10-12 12:55:50'),
(48, 'Shivam', NULL, 'shivam1432@yopmail.com', 'shivam', '$2a$10$33IdTzTGgV/xdgI3WcYC/OezBm9hMFTzNvrkB5Dk0wTo7rMGthOR.', 2, 0, NULL, '2018-11-30 17:17:23', '2018-11-30 17:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_campaign_photos`
--
ALTER TABLE `assign_campaign_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar_event`
--
ALTER TABLE `calendar_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar_gallery`
--
ALTER TABLE `calendar_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calender`
--
ALTER TABLE `calender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `assign_campaign_photos`
--
ALTER TABLE `assign_campaign_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `calendar_event`
--
ALTER TABLE `calendar_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `calendar_gallery`
--
ALTER TABLE `calendar_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `calender`
--
ALTER TABLE `calender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
