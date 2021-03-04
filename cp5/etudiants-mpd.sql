-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema greta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema greta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `greta` DEFAULT CHARACTER SET utf8 ;
USE `greta` ;

-- -----------------------------------------------------
-- Table `greta`.`apprenant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greta`.`apprenant` (
  `code_e` INT NOT NULL AUTO_INCREMENT,
  `nom_e` VARCHAR(45) NOT NULL,
  `ddn_e` DATETIME NULL,
  `sexe_e` VARCHAR(1) NULL,
  `interne` TINYINT NULL,
  PRIMARY KEY (`code_e`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greta`.`intervenant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greta`.`intervenant` (
  `code_i` INT NOT NULL AUTO_INCREMENT,
  `nom_i` VARCHAR(45) NOT NULL,
  `grade` VARCHAR(45) NULL,
  `ddc` DATETIME NULL,
  PRIMARY KEY (`code_i`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greta`.`module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greta`.`module` (
  `code_m` INT NOT NULL AUTO_INCREMENT,
  `nom_m` VARCHAR(45) NOT NULL,
  `coeff` TINYINT NULL,
  `code_i` INT NOT NULL,
  PRIMARY KEY (`code_m`),
  INDEX `fk_module_intervenant_idx` (`code_i` ASC),
  CONSTRAINT `fk_module_intervenant`
    FOREIGN KEY (`code_i`)
    REFERENCES `greta`.`intervenant` (`code_i`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `greta`.`etudie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `greta`.`etudie` (
  `code_e` INT NOT NULL,
  `code_m` INT NOT NULL,
  `note` TINYINT NULL,
  PRIMARY KEY (`code_e`, `code_m`),
  INDEX `fk_apprenant_has_module_module1_idx` (`code_m` ASC),
  INDEX `fk_apprenant_has_module_apprenant1_idx` (`code_e` ASC),
  CONSTRAINT `fk_apprenant_has_module_apprenant1`
    FOREIGN KEY (`code_e`)
    REFERENCES `greta`.`apprenant` (`code_e`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apprenant_has_module_module1`
    FOREIGN KEY (`code_m`)
    REFERENCES `greta`.`module` (`code_m`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
