-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 29, 2018 at 10:56 AM
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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `media_url`, `created_at`, `updated_at`) VALUES
(1, 'course', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'http://112.196.33.91:3333/', NULL, NULL),
(2, 'course', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'http://112.196.33.91:3333/', NULL, NULL),
(3, 'course 3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'http://112.196.33.91:3333/', NULL, NULL);

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
  `comment_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `title`, `body`, `user_id`) VALUES
(3, '2018-08-22 11:05:30', '2018-08-22 11:05:30', 'test', 'test', NULL),
(4, '2018-08-25 07:44:48', '2018-08-25 07:44:48', 'test', 'testt', NULL);

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
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `course_id`, `name`, `description`, `order`) VALUES
(1, 1, 'section 1', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', NULL),
(2, 1, 'section 2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', NULL),
(3, 1, 'section 3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', NULL),
(4, 1, 'section 4', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', NULL);

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
  `created_at` datetime DEFAULT NULL,
  `updated_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `section_id`, `name`, `description`, `created_at`, `updated_At`) VALUES
(1, 1, 'topic 1', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', '2018-08-08 00:00:00', '2018-08-24 00:00:00'),
(2, 1, 'topic 2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', '2018-08-08 00:00:00', '2018-08-24 00:00:00'),
(3, 1, 'topic 3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', '2018-08-08 00:00:00', '2018-08-24 00:00:00'),
(4, 1, 'topic 4', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', '2018-08-08 00:00:00', '2018-08-24 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role_type` int(55) NOT NULL DEFAULT '2' COMMENT '1) admin 2) frontend user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `username`, `email`, `password`, `role_type`) VALUES
(1, '2018-08-22 10:23:13', '2018-08-22 10:23:13', 'shivaay', 'omnamahshivaay@outlook.in', '$2a$10$.t7EFerVYF6ZpwKO82jg9Ow7COhueDOS1OMwHaMfrVIv4ks7zjWC.', 2),
(2, '2018-08-22 11:05:07', '2018-08-22 11:05:07', 'ashok', 'kumarashok30592@gmail.com', '$2a$10$V4qp5Ybbc.eoszrnHqjYu.bqd5V39dViVV2eAO9uIp0nvKXVt.Eti', 1),
(3, '2018-08-22 14:47:11', '2018-08-22 14:47:11', 'ashokG', 'ashok.slinfy@gmail.com', '$2a$10$fcbmvKle4rOQCk6sUQ0ehO4zw7MHSYlVTiZS6HpFydeXc3Bf7b6CW', 2),
(7, '2018-08-22 00:00:00', '2018-08-22 00:00:00', 'ASHOKGSASDASDDD', 'ashok.slinDDfy@gmASDSAail.com', 'ASHOKG', 2),
(8, '2018-08-22 16:45:12', '2018-08-22 16:45:12', 'noora@gmail.com', 'noora@gmail.com', '$2a$10$Y9p/sgyv4E99BGgknqCQpuOymsoEp5uWEswa4gCHoqXjZfGfKvEu.', 1),
(9, '2018-08-22 18:22:57', '2018-08-22 18:22:57', 'noora1', 'noora1@gmail.com', '$2a$10$SmWjLt7ZPzhsoKKCCdpNq.gat4tEJnqz.MpgEsMsxZeJ1C1KsL5Sq', 2),
(10, '2018-08-22 19:10:28', '2018-08-22 19:10:28', 'admin', 'admin@vision.com', '$2a$10$2aOu8lX/XlArG3vDLQB5Nu86vIBfscIGY5yCa1Su8WMt5k4Nan9dS', 1),
(11, '2018-08-22 19:23:38', '2018-08-22 19:23:38', 'testg', 'testg@gmail.com', '$2a$10$Qks0pKzxCGL0tdJKanFpXONh.E8AtE.BW6dvR5RP6QRBCRlDdEz3K', 2),
(12, '2018-08-22 19:23:38', '2018-08-22 19:23:38', 'testgsdfsd', 'testsdfsg@gmail.com', '$2a$10$Qks0pKzxCGL0tdJKanFpXONh.E8AtE.BW6dvR5RP6QRBCRlDdEz3K', 2),
(13, '2018-08-22 19:23:38', '2018-08-22 19:23:38', 'testsdfsdfsdgsdfsd', 'tessdfdsftsdfsg@gmail.com', '$2a$10$Qks0pKzxCGL0tdJKanFpXONh.E8AtE.BW6dvR5RP6QRBCRlDdEz3K', 2),
(17, '2018-08-23 17:00:12', '2018-08-23 17:00:12', 'john', 'sunil@slinfy.com', '$2a$10$bbgHmHhSGOskJ5/wyP6BjeTKr3VRiXaWBn3bnWJsuvtFhlpzsOkoy', 2),
(18, '2018-08-24 19:11:50', '2018-08-24 19:11:50', 'manishme', 'manish.kumar@slinfy.com', '$2a$10$EuzPbRYtdlPxOBJFoTKkDOuJ35IK2yectP82uA71kSc85YSsFws.C', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
