SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE DATABASE IF NOT EXISTS `bikes`;
USE `bikes` ;

DROP TABLE IF EXISTS `Category`;
CREATE TABLE IF NOT EXISTS `bikes`.`Category` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Image` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Brand`;
CREATE TABLE IF NOT EXISTS `bikes`.`Brand` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Image` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Product`;
CREATE TABLE IF NOT EXISTS `bikes`.`Product` (
  `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(115) NOT NULL,
  `Desciption` LONGTEXT NOT NULL,
  `Price` DECIMAL NOT NULL,
  `Stock` INT NOT NULL,
  `Sold` INT NOT NULL DEFAULT 0,
  `Image` VARCHAR(300) NOT NULL,
  `Brand_Id` INT NOT NULL,
  `Category_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Product_Brand_idx` (`Brand_Id` ASC) VISIBLE,
  INDEX `fk_Product_Category1_idx` (`Category_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Brand`
    FOREIGN KEY (`Brand_Id`)
    REFERENCES `mydb`.`Brand` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Category1`
    FOREIGN KEY (`Category_Id`)
    REFERENCES `mydb`.`Category` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `bikes`.`Orders` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Subtotal` DECIMAL NOT NULL,
  `QST` DECIMAL NOT NULL,
  `GST` DECIMAL NOT NULL,
  `Total` DECIMAL NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Product_has_Orders`;
CREATE TABLE IF NOT EXISTS `bikes`.`Product_has_Orders` (
  `Product_Id` INT UNSIGNED NOT NULL,
  `Orders_Id` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Price_Unit` DECIMAL NOT NULL,
  PRIMARY KEY (`Product_Id`, `Orders_Id`),
  INDEX `fk_Product_has_Orders_Orders1_idx` (`Orders_Id` ASC) VISIBLE,
  INDEX `fk_Product_has_Orders_Product1_idx` (`Product_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_has_Orders_Product1`
    FOREIGN KEY (`Product_Id`)
    REFERENCES `mydb`.`Product` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Orders_Orders1`
    FOREIGN KEY (`Orders_Id`)
    REFERENCES `mydb`.`Orders` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Admins`;
CREATE TABLE IF NOT EXISTS `bikes`.`Admins` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;