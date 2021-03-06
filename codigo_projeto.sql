# Auto detect text files and perform LF normalization
* text=auto
-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, 
SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERRO
R_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema MiniMercado
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema MiniMercado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MiniMercado` DEFAULT CHARACTER SET utf8 ;
USE `MiniMercado` ;
-- -----------------------------------------------------
-- Table `MiniMercado`.`ListaContactos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`ListaContactos` (
`id` INT NOT NULL AUTO_INCREMENT,
 PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`rua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`rua` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `designacao` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`Pais` (
 `id` INT NOT NULL AUTO_INCREMENT,
`designacao` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`CodPostal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`CodPostal` (
`id` INT NOT NULL AUTO_INCREMENT,
 `Codigo` VARCHAR(100) NOT NULL,
 `Designacao` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`cidade` (
 `id` INT NOT NULL AUTO_INCREMENT,
`designacao` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`Localizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`Localizacao` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `rua_id` INT NOT NULL,
 `Pais_is` INT NOT NULL,
 `CodPostal_id` INT NOT NULL,
 `cidade_id1` INT NOT NULL,
 PRIMARY KEY (`id`),
 INDEX `fk_Localizacao_rua1_idx` (`rua_id` ASC) VISIBLE,
 INDEX `fk_Localizacao_Pais1_idx` (`Pais_is` ASC) VISIBLE,
 INDEX `fk_Localizacao_CodPostal1_idx` (`CodPostal_id` ASC) VISIBLE,
 INDEX `fk_Localizacao_cidade2_idx` (`cidade_id1` ASC) VISIBLE,
 CONSTRAINT `fk_Localizacao_rua1`
 FOREIGN KEY (`rua_id`)
 REFERENCES `MiniMercado`.`rua` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_Localizacao_Pais1`
 FOREIGN KEY (`Pais_is`)
 REFERENCES `MiniMercado`.`Pais` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_Localizacao_CodPostal1`
 FOREIGN KEY (`CodPostal_id`)
 REFERENCES `MiniMercado`.`CodPostal` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_Localizacao_cidade2`
 FOREIGN KEY (`cidade_id1`)
 REFERENCES `MiniMercado`.`cidade` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`MiniMercado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`MiniMercado` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `nome` VARCHAR(45) NOT NULL,
 `ListaContactos_id` INT NOT NULL,
 `Localizacao_id` INT NOT NULL,
 PRIMARY KEY (`id`),
 INDEX `fk_MiniMercado_ListaContactos1_idx` (`ListaContactos_id` ASC) VISIBLE,
 INDEX `fk_MiniMercado_Localizacao1_idx` (`Localizacao_id` ASC) VISIBLE,
 CONSTRAINT `fk_MiniMercado_ListaContactos1`
 FOREIGN KEY (`ListaContactos_id`)
 REFERENCES `MiniMercado`.`ListaContactos` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_MiniMercado_Localizacao1`
 FOREIGN KEY (`Localizacao_id`)
 REFERENCES `MiniMercado`.`Localizacao` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`Cliente` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `NIF` INT NOT NULL,
 `Nome` VARCHAR(45) NOT NULL,
 `ListaContactos_id` INT NOT NULL,
 `Localizacao_id` INT NOT NULL,
 PRIMARY KEY (`id`),
 INDEX `fk_Cliente_ListaContactos1_idx` (`ListaContactos_id` ASC) VISIBLE,
 INDEX `fk_Cliente_Localizacao1_idx` (`Localizacao_id` ASC) VISIBLE,
 CONSTRAINT `fk_Cliente_ListaContactos1`
 FOREIGN KEY (`ListaContactos_id`)
 REFERENCES `MiniMercado`.`ListaContactos` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_Cliente_Localizacao1`
 FOREIGN KEY (`Localizacao_id`)
 REFERENCES `MiniMercado`.`Localizacao` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`MiniMercado_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`MiniMercado_Cliente` (
 `MiniMercado_id` INT NOT NULL,
`Cliente_id` INT NOT NULL,
 PRIMARY KEY (`MiniMercado_id`, `Cliente_id`),
 INDEX `fk_MiniMercado_has_Cliente_Cliente1_idx` (`Cliente_id` ASC) VISIBLE,
 INDEX `fk_MiniMercado_has_Cliente_MiniMercado1_idx` (`MiniMercado_id` ASC) VISIBLE,
 CONSTRAINT `fk_MiniMercado_has_Cliente_MiniMercado1`
 FOREIGN KEY (`MiniMercado_id`)
 REFERENCES `MiniMercado`.`MiniMercado` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_MiniMercado_has_Cliente_Cliente1`
 FOREIGN KEY (`Cliente_id`)
 REFERENCES `MiniMercado`.`Cliente` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`Funcionario` 
`id` INT NOT NULL AUTO_INCREMENT,
 `nome` VARCHAR(45) NOT NULL,
 `funcao` VARCHAR(45) NOT NULL,
 `data_nasc` DATE NOT NULL,
 `MiniMercado_id` INT NOT NULL,
 `ListaContactos_id` INT NOT NULL,
 `Localizacao_id` INT NOT NULL,
 PRIMARY KEY (`id`),
 INDEX `fk_Funcionario_MiniMercado1_idx` (`MiniMercado_id` ASC) VISIBLE,
 INDEX `fk_Funcionario_ListaContactos1_idx` (`ListaContactos_id` ASC) VISIBLE,
 INDEX `fk_Funcionario_Localizacao1_idx` (`Localizacao_id` ASC) VISIBLE,
 CONSTRAINT `fk_Funcionario_MiniMercado1`
 FOREIGN KEY (`MiniMercado_id`)
 REFERENCES `MiniMercado`.`MiniMercado` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_Funcionario_ListaContactos1`
 FOREIGN KEY (`ListaContactos_id`)
 REFERENCES `MiniMercado`.`ListaContactos` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_Funcionario_Localizacao1`
 FOREIGN KEY (`Localizacao_id`)
 REFERENCES `MiniMercado`.`Localizacao` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`Emails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`Emails` (
 `Email` VARCHAR(45) NOT NULL,
 `ListaContactos_id` INT NOT NULL,
 PRIMARY KEY (`Email`),
 INDEX `fk_Emails_ListaContactos1_idx` (`ListaContactos_id` ASC) VISIBLE,
 CONSTRAINT `fk_Emails_ListaContactos1`
 FOREIGN KEY (`ListaContactos_id`)
 REFERENCES `MiniMercado`.`ListaContactos` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`Nr_Telemovel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`Nr_Telemovel` (
 `Numero` VARCHAR(20) NOT NULL,
 `ListaContactos_id` INT NOT NULL,
 PRIMARY KEY (`Numero`),
 INDEX `fk_Nr_Telemovel_ListaContactos1_idx` (`ListaContactos_id` ASC) VISIBLE,
 CONSTRAINT `fk_Nr_Telemovel_ListaContactos1`
 FOREIGN KEY (`ListaContactos_id`)
 REFERENCES `MiniMercado`.`ListaContactos` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`produto` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `preco` DECIMAL(5,2) NOT NULL,
 `descricao` VARCHAR(100) NOT NULL,
 PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`fatura` 
`nr` INT NOT NULL AUTO_INCREMENT,
 `data` DATE NOT NULL,
 `valor` DECIMAL(5,2) NOT NULL,
 `Funcionario_id` INT NOT NULL,
 `Cliente_id` INT NOT NULL,
 PRIMARY KEY (`nr`),
INDEX `fk_fatura_Funcionario1_idx` (`Funcionario_id` ASC) VISIBLE,
 INDEX `fk_fatura_Cliente1_idx` (`Cliente_id` ASC) VISIBLE,
 CONSTRAINT `fk_fatura_Funcionario1`
 FOREIGN KEY (`Funcionario_id`)
 REFERENCES `MiniMercado`.`Funcionario` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_fatura_Cliente1`
 FOREIGN KEY (`Cliente_id`)
 REFERENCES `MiniMercado`.`Cliente` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `MiniMercado`.`fatura_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiniMercado`.`fatura_produto` (
 `fatura_nr` INT NOT NULL,
 `produto_id` INT NOT NULL,
`quantidade` INT NOT NULL,
 PRIMARY KEY (`fatura_nr`, `produto_id`),
 INDEX `fk_fatura_has_produto_produto1_idx` (`produto_id` ASC) VISIBLE,
 INDEX `fk_fatura_has_produto_fatura1_idx` (`fatura_nr` ASC) VISIBLE,
 CONSTRAINT `fk_fatura_has_produto_fatura1`
 FOREIGN KEY (`fatura_nr`)
 REFERENCES `MiniMercado`.`fatura` (`nr`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
CONSTRAINT `fk_fatura_has_produto_produto1`
 FOREIGN KEY (`produto_id`)
  REFERENCES `MiniMercado`.`produto` (`id`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
