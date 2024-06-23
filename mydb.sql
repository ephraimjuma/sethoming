SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE sethoming;

CREATE TABLE `user` (
    `user_id`int(10) NOT NULL PRIMARY KEY,
    `username` varchar(255) NOT NULL PRIMARY KEY,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `phone` varchar (20) NOT NULL,
    `email` varchar(255) NOT NULL PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rides` (
    `ride_id` int (10) NOT NULL PRIMARY KEY,
    `vehicle_id` int (10) NOT NULL,
    `pickup_location` varchar (255) NOT NULL,
    `dropoff_location` varchar (255) NOT NULL,
    `fare` varchar (255) NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (fare) REFERENCES payments(fare)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `drivers`(
    `driver_id` int(10) NOT NULL PRIMARY KEY,
    `driver_name` varchar (254) NOT NULL,
    `phone` varchar (255) NOT NULL,
    `license_number` varchar(255) NOT NULL,
    `vehicle_id` int(10) NOT NULL,
    FOREIGN KEY (license_number) REFERENCES vehicles(license_number),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `vehicles`(
    `vehicle_id` int(10) NOT NULL PRIMARY KEY,
    `model` varchar(255) NOT NULL,
    `license_number` varchar(255) NOT NULL PRIMARY KEY,
    `capacity` varchar(20) NOT NULL,
    `driver_id` int(10) NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `payments`(
    `payment_id` varchar(20) NOT NULL,
    `payment_method` varchar (255) NOT NULL,
    `fare` varchar (255) NOT NULL  PRIMARY KEY
    `ride_id` int (10) NOT NULL,
    `payment_status` varchar(255) NOT NULL,
    FOREIGN KEY (ride_id) REFERENCES rides(ride_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `verification` (
  `user_id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (username) REFERENCES user(username),
  FOREIGN KEY (email) REFERENCES user(email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;