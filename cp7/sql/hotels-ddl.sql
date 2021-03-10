-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema holidays
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema holidays
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `holidays` DEFAULT CHARACTER SET utf8 ;
USE `holidays` ;

-- -----------------------------------------------------
-- Table `holidays`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holidays`.`cities` (
  `zip` CHAR(10) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `land` CHAR(2) NOT NULL,
  PRIMARY KEY (`zip`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `holidays`.`hotels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holidays`.`hotels` (
  `hno` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(255) NULL,
  `zip` CHAR(10) NULL,
  `photo` MEDIUMBLOB NULL,
  PRIMARY KEY (`hno`),
  INDEX `hotels_zip_fk_idx` (`zip` ASC),
  CONSTRAINT `hotels_zip_fk`
    FOREIGN KEY (`zip`)
    REFERENCES `holidays`.`cities` (`zip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `holidays`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holidays`.`rooms` (
  `rno` VARCHAR(20) NOT NULL,
  `type` VARCHAR(6) NULL DEFAULT NULL,
  `price` DECIMAL(6,2) NULL DEFAULT NULL,
  `hno` TINYINT NOT NULL,
  PRIMARY KEY (`rno`),
  INDEX `fk_rooms_hotels_idx` (`hno` ASC),
  CONSTRAINT `fk_rooms_hotels`
    FOREIGN KEY (`hno`)
    REFERENCES `holidays`.`hotels` (`hno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `holidays`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holidays`.`customers` (
  `cno` TINYINT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(30) NOT NULL,
  `lname` VARCHAR(30) NOT NULL,
  `mail` VARCHAR(255) NOT NULL,
  `pass` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`cno`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `holidays`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holidays`.`booking` (
  `rno` VARCHAR(20) NOT NULL,
  `cno` TINYINT NOT NULL,
  `arrival` DATE NOT NULL,
  `departure` DATE NOT NULL,
  `price` DECIMAL(6,2) NULL DEFAULT NULL,
  PRIMARY KEY (`rno`, `cno`, `arrival`, `departure`),
  INDEX `booking_cno_idx` (`cno` ASC),
  CONSTRAINT `booking_rno_fk`
    FOREIGN KEY (`rno`)
    REFERENCES `holidays`.`rooms` (`rno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `booking_cno`
    FOREIGN KEY (`cno`)
    REFERENCES `holidays`.`customers` (`cno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
