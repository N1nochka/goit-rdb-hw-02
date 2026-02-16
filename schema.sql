-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Клієнти`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Клієнти` (
  `ID_клієнта` INT NOT NULL AUTO_INCREMENT,
  `Клієнт` VARCHAR(50) NOT NULL,
  `Адреса_клієнта` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_клієнта`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Замовлення`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Замовлення` (
  `Номер_замовлення` INT NOT NULL AUTO_INCREMENT,
  `ID_клієнта` INT NOT NULL,
  `Дата_замовлення` DATE NOT NULL,
  PRIMARY KEY (`Номер_замовлення`),
  INDEX `fk_orders_customers_idx` (`ID_клієнта` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`ID_клієнта`)
    REFERENCES `mydb`.`Клієнти` (`ID_клієнта`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Товари`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Товари` (
  `ID_товару` INT NOT NULL AUTO_INCREMENT,
  `Назва_товару` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_товару`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Деталі_замовлення`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Деталі_замовлення` (
  `Номер_замовлення` INT NOT NULL,
  `ID_товару` INT NOT NULL,
  `Кількість` INT NOT NULL,
  PRIMARY KEY (`Номер_замовлення`, `ID_товару`),
  INDEX `fk_order_details_products_idx` (`ID_товару` ASC) VISIBLE,
  CONSTRAINT `fk_order_details_orders`
    FOREIGN KEY (`Номер_замовлення`)
    REFERENCES `mydb`.`Замовлення` (`Номер_замовлення`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_products`
    FOREIGN KEY (`ID_товару`)
    REFERENCES `mydb`.`Товари` (`ID_товару`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
