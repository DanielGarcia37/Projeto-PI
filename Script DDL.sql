SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS,
FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE,
SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZE
RO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
`id` INT NOT NULL,
`tipo` VARCHAR(45) NULL,
`logradouro` VARCHAR(45) NULL,
`numero` INT NULL,
`cep` CHAR(8) NULL,
`complemento` VARCHAR(50) NULL,
`bairro` VARCHAR(45) NULL,
`cidade` VARCHAR(45) NULL,
`estado` CHAR(2) NULL,
`enderecocol` VARCHAR(45) NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
`idUser` INT NOT NULL,
`nome` VARCHAR(45) NULL,
`sobrenome` VARCHAR(45) NULL,
`protetor_cadastrado` VARCHAR(45) NULL,
`endereco_id` INT NOT NULL,
PRIMARY KEY (`idUser`, `endereco_id`),
INDEX `fk_User_endereco1_idx` (`endereco_id` ASC) VISIBLE,
CONSTRAINT `fk_User_endereco1`
FOREIGN KEY (`endereco_id`)
REFERENCES `mydb`.`endereco` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`animal` (
`animalcol` VARCHAR(45) NULL,
`id` INT NOT NULL,
`nome` VARCHAR(45) NULL,
`especie` VARCHAR(45) NULL,
`status_castracao` TINYINT(1) NULL,
`bairro_localizacao` VARCHAR(45) NULL,
`id_usuario` VARCHAR(45) NULL,
`disp_adocao` TINYINT(1) NULL,
`id_saude` INT NULL,
`id_vacina` INT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`user_has_animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_has_animal` (
`animal_id` INT NOT NULL,
`User_id` INT NOT NULL,
PRIMARY KEY (`animal_id`, `User_id`),
INDEX `fk_user_has_animal_animal1_idx` (`animal_id` ASC) VISIBLE,
INDEX `fk_user_has_animal_User1_idx` (`User_id` ASC) VISIBLE,
CONSTRAINT `fk_user_has_animal_animal1`
FOREIGN KEY (`animal_id`)
REFERENCES `mydb`.`animal` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_user_has_animal_User1`
FOREIGN KEY (`User_id`)
REFERENCES `mydb`.`User` (`idUser`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`clinica_parceira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clinica_parceira` (
`id` INT NOT NULL,
`nome` VARCHAR(45) NULL,
`CMRV` VARCHAR(45) NULL,
`telefone` VARCHAR(45) NULL,
`User_id` INT NOT NULL,
`endereco_id` INT NOT NULL,
PRIMARY KEY (`id`, `User_id`, `endereco_id`),
INDEX `fk_clinica_parceira_User1_idx` (`User_id` ASC) VISIBLE,
INDEX `fk_clinica_parceira_endereco1_idx` (`endereco_id` ASC) VISIBLE,
CONSTRAINT `fk_clinica_parceira_User1`
FOREIGN KEY (`User_id`)
REFERENCES `mydb`.`User` (`idUser`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_clinica_parceira_endereco1`
FOREIGN KEY (`endereco_id`)
REFERENCES `mydb`.`endereco` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`clinica_parceira_has_animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clinica_parceira_has_animal` (
`animal_id` INT NOT NULL,
`clinica_parceira_id` INT NOT NULL,
PRIMARY KEY (`animal_id`, `clinica_parceira_id`),
INDEX `fk_clinica_parceira_has_animal_animal1_idx` (`animal_id` ASC) VISIBLE,
INDEX `fk_clinica_parceira_has_animal_clinica_parceira1_idx` (`clinica_parceira_id`
ASC) VISIBLE,
CONSTRAINT `fk_clinica_parceira_has_animal_animal1`
FOREIGN KEY (`animal_id`)
REFERENCES `mydb`.`animal` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_clinica_parceira_has_animal_clinica_parceira1`
FOREIGN KEY (`clinica_parceira_id`)
REFERENCES `mydb`.`clinica_parceira` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`status_saude`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`status_saude` (
`id` INT NOT NULL,
`data_atualizacao` TIMESTAMP NULL,
`observacoes` VARCHAR(45) NULL,
`vermifugo` TINYINT(1) NULL,
`antiparasitario` TINYINT(0) NULL,
`User_id` INT NOT NULL,
`animal_id` INT NOT NULL,
PRIMARY KEY (`id`, `User_id`, `animal_id`),
INDEX `fk_status_saude_User1_idx` (`User_id` ASC) VISIBLE,
INDEX `fk_status_saude_animal1_idx` (`animal_id` ASC) VISIBLE,
CONSTRAINT `fk_status_saude_User1`
FOREIGN KEY (`User_id`)
REFERENCES `mydb`.`User` (`idUser`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_status_saude_animal1`
FOREIGN KEY (`animal_id`)
REFERENCES `mydb`.`animal` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`status_vacinal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`status_vacinal` (
`id` INT NOT NULL,
`data_atualizacao` TIMESTAMP NULL,
`tipo_vacina` VARCHAR(45) NULL,
`satatus_vacinalcol` VARCHAR(45) NULL,
`User_idUser` INT NOT NULL,
`animal_id1` INT NOT NULL,
PRIMARY KEY (`id`, `User_idUser`, `animal_id1`),
INDEX `fk_status_vacinal_User_idx` (`User_idUser` ASC) VISIBLE,
INDEX `fk_status_vacinal_animal1_idx` (`animal_id1` ASC) VISIBLE,
CONSTRAINT `fk_status_vacinal_User`
FOREIGN KEY (`User_idUser`)
REFERENCES `mydb`.`User` (`idUser`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_status_vacinal_animal1`
FOREIGN KEY (`animal_id1`)
REFERENCES `mydb`.`animal` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;