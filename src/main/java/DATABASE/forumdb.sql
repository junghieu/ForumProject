-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2025 at 06:29 AM
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
-- Database: `forumdb`
--

DROP DATABASE IF EXISTS forumdb;
CREATE DATABASE forumdb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE forumdb;

-- --------------------------------------------------------

-- Table structure for table `users`
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `roles`
CREATE TABLE `roles` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `user_roles`
CREATE TABLE `user_roles` (
  `username` VARCHAR(50),
  `role_id` INT,
  PRIMARY KEY (`username`, `role_id`),
  FOREIGN KEY (`username`) REFERENCES `users`(`username`) ON DELETE CASCADE,
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `posts`
CREATE TABLE `posts` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(200) NOT NULL,
  `content` TEXT NOT NULL,
  `username` VARCHAR(50),
  FOREIGN KEY (`username`) REFERENCES `users`(`username`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `comments`
CREATE TABLE `comments` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `postId` INT,
  `username` VARCHAR(50),
  `content` TEXT NOT NULL,
  FOREIGN KEY (`postId`) REFERENCES `posts`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`username`) REFERENCES `users`(`username`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert sample users (admin123, user123 hashed with BCrypt)
INSERT INTO `users` (`username`, `password`) VALUES
('admin', '$2a$10$Wqxb.TMZ2pEtvR0Bdnq9nuAf61OjBbNq9NdZRtVG2KzENOMU.W6ne'), -- password: admin123
('user1', '$2a$10$u5gM9lAmICowov89Z5EDCeEj0KH0V1bLK8xmpo6nrrCH3gM9QO9lK'), -- password: user123
('user2', '$2a$10$u5gM9lAmICowov89Z5EDCeEj0KH0V1bLK8xmpo6nrrCH3gM9QO9lK');

-- Insert roles
INSERT INTO `roles` (`name`) VALUES ('ADMIN'), ('USER');

-- Assign roles
INSERT INTO `user_roles` (`username`, `role_id`) VALUES
('admin', 1), -- ADMIN
('user1', 2), -- USER
('user2', 2);

-- Sample posts
INSERT INTO `posts` (`title`, `content`, `username`) VALUES
('Chào mừng đến với diễn đàn', 'Hãy thảo luận mọi thứ về lập trình tại đây.', 'admin'),
('Giới thiệu bản thân', 'Mình là user1, rất vui được gặp các bạn!', 'user1');

-- Sample comments
INSERT INTO `comments` (`postId`, `username`, `content`) VALUES
(1, 'user2', 'Cảm ơn admin đã tạo diễn đàn!'),
(2, 'admin', 'Rất hoan nghênh bạn!');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
 /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
 /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
