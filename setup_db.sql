CREATE DATABASE IF NOT EXISTS `testing`;
USE `testing`;

CREATE TABLE IF NOT EXISTS `registered_users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `username` VARCHAR(100) NOT NULL UNIQUE,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `resettoken` VARCHAR(255) DEFAULT NULL,
  `resettokenexpire` DATE DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE DATABASE IF NOT EXISTS `restaurentms`;
USE `restaurentms`;

CREATE TABLE IF NOT EXISTS `room booking` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `state` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `cin` VARCHAR(50) NOT NULL,
  `cout` VARCHAR(50) NOT NULL,
  `members` VARCHAR(50) NOT NULL,
  `roomtype` VARCHAR(100) NOT NULL,
  `no of rooms` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nonac` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `roomno` VARCHAR(50) NOT NULL UNIQUE,
  `roomtype` VARCHAR(100) NOT NULL,
  `price` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `deluxacroom` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `roomno` VARCHAR(50) NOT NULL UNIQUE,
  `roomtype` VARCHAR(100) NOT NULL,
  `price` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `acroom` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `roomno` VARCHAR(50) NOT NULL UNIQUE,
  `roomtype` VARCHAR(100) NOT NULL,
  `price` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `hall` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `status` VARCHAR(50) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `hall_details` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `state` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `date` VARCHAR(50) NOT NULL,
  `members` VARCHAR(50) NOT NULL,
  `function` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `card details` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `cardno` VARCHAR(50) NOT NULL,
  `cvv` VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `food` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `full_name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `address` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `feedback` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `message` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed Data

-- Admin account
INSERT INTO `admin` (`username`, `password`) VALUES ('admin', 'admin')
ON DUPLICATE KEY UPDATE username=username;

-- Hall
INSERT INTO `hall` (`status`) VALUES ('un book');

-- Payment card
INSERT INTO `card details` (`cardno`, `cvv`) VALUES ('1234567812345678', '123');

-- Rooms
INSERT INTO `deluxacroom` (`roomno`, `roomtype`, `price`, `status`) VALUES 
('101', 'Delux AC', 1100, 'un book'),
('102', 'Delux AC', 1100, 'un book'),
('103', 'Delux AC', 1100, 'un book'),
('104', 'Delux AC', 1100, 'un book'),
('105', 'Delux AC', 1100, 'un book')
ON DUPLICATE KEY UPDATE roomno=roomno;

INSERT INTO `acroom` (`roomno`, `roomtype`, `price`, `status`) VALUES 
('201', 'A.C. Room', 900, 'un book'),
('202', 'A.C. Room', 900, 'un book'),
('203', 'A.C. Room', 900, 'un book'),
('204', 'A.C. Room', 900, 'un book'),
('205', 'A.C. Room', 900, 'un book')
ON DUPLICATE KEY UPDATE roomno=roomno;

INSERT INTO `nonac` (`roomno`, `roomtype`, `price`, `status`) VALUES 
('301', 'Non AC', 700, 'un book'),
('302', 'Non AC', 700, 'un book'),
('303', 'Non AC', 700, 'un book'),
('304', 'Non AC', 700, 'un book'),
('305', 'Non AC', 700, 'un book')
ON DUPLICATE KEY UPDATE roomno=roomno;
