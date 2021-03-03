CREATE DATABASE IF NOT EXISTS `HOLIDAYS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `HOLIDAYS`;

CREATE TABLE `HOTELS` (
  `hotel_id` VARCHAR(42),
  `hotel_name` VARCHAR(42),
  `stars` VARCHAR(42),
  `address` VARCHAR(42),
  `zip` VARCHAR(42),
  `city` VARCHAR(42),
  `photo` VARCHAR(42),
  `group_id` VARCHAR(42),
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `OPTIONS` (
  `option_id` VARCHAR(42),
  `option_name` VARCHAR(42),
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ROOMS` (
  `room_no` VARCHAR(42),
  `area` VARCHAR(42),
  `room_tel` VARCHAR(42),
  `price` VARCHAR(42),
  `hotel_id` VARCHAR(42),
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `HAS` (
  `room_no` VARCHAR(42),
  `option_id` VARCHAR(42),
  PRIMARY KEY (`room_no`, `option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `GROUPS` (
  `group_id` VARCHAR(42),
  `group_name` VARCHAR(42),
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `BOOKS` (
  `room_no` VARCHAR(42),
  `cust_id` VARCHAR(42),
  `start` VARCHAR(42),
  `end` VARCHAR(42),
  `price` VARCHAR(42),
  PRIMARY KEY (`room_no`, `cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CUSTOMERS` (
  `cust_id` VARCHAR(42),
  `fname` VARCHAR(42),
  `lname` VARCHAR(42),
  `address` VARCHAR(42),
  `zip` VARCHAR(42),
  `city` VARCHAR(42),
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `HOTELS` ADD FOREIGN KEY (`group_id`) REFERENCES `GROUPS` (`group_id`);
ALTER TABLE `ROOMS` ADD FOREIGN KEY (`hotel_id`) REFERENCES `HOTELS` (`hotel_id`);
ALTER TABLE `HAS` ADD FOREIGN KEY (`option_id`) REFERENCES `OPTIONS` (`option_id`);
ALTER TABLE `HAS` ADD FOREIGN KEY (`room_no`) REFERENCES `ROOMS` (`room_no`);
ALTER TABLE `BOOKS` ADD FOREIGN KEY (`cust_id`) REFERENCES `CUSTOMERS` (`cust_id`);
ALTER TABLE `BOOKS` ADD FOREIGN KEY (`room_no`) REFERENCES `ROOMS` (`room_no`);