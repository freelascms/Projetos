SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_typeUser`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_typeUser` (
  `tb_typeUser_id` INT NOT NULL AUTO_INCREMENT ,
  `tb_typeUser_type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  PRIMARY KEY (`tb_typeUser_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_user` (
  `tb_user_id` INT NOT NULL AUTO_INCREMENT ,
  `tb_typeUser_id_typeUser` INT NOT NULL ,
  `tb_user_name` VARCHAR(200) CHARACTER SET 'armscii8' NOT NULL ,
  `tb_user_email` VARCHAR(200) NOT NULL ,
  `tb_user_dtBrithday` DATE NULL ,
  `tb_user_address` VARCHAR(300) NULL ,
  `tb_user_addressComp` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL ,
  `tb_user_cep` VARCHAR(45) NULL ,
  `tb_user_tel` VARCHAR(45) NOT NULL ,
  `tb_user_cel` VARCHAR(45) NULL ,
  `tb_user_login` VARCHAR(100) NOT NULL ,
  `tb_user_pass` VARCHAR(45) NOT NULL ,
  `tb_user_cod` INT NOT NULL ,
  `tb_user_dtRegister` DATETIME NOT NULL ,
  `tb_user_ip` VARCHAR(45) NOT NULL ,
  `tb_user_twitter` VARCHAR(200) NULL ,
  `tb_user_facebook` VARCHAR(200) NULL ,
  PRIMARY KEY (`tb_user_id`) ,
  INDEX `fk_tb_user_tb_typeUser1_idx` (`tb_typeUser_id_typeUser` ASC) ,
  CONSTRAINT `fk_tb_user_tb_typeUser1`
    FOREIGN KEY (`tb_typeUser_id_typeUser` )
    REFERENCES `mydb`.`tb_typeUser` (`tb_typeUser_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_typeInstance`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_typeInstance` (
  `tb_typeInstance_id` INT NOT NULL AUTO_INCREMENT ,
  `tb_typeInstance_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  `tb_typeInstance_linkImg` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  PRIMARY KEY (`tb_typeInstance_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_instance`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_instance` (
  `tb_instance_id` INT NOT NULL AUTO_INCREMENT ,
  `tb_typeInstance_tb_typeInstance_id` INT NOT NULL ,
  `tb_instance_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  PRIMARY KEY (`tb_instance_id`) ,
  INDEX `fk_tb_instance_tb_typeInstance1_idx` (`tb_typeInstance_tb_typeInstance_id` ASC) ,
  CONSTRAINT `fk_tb_instance_tb_typeInstance1`
    FOREIGN KEY (`tb_typeInstance_tb_typeInstance_id` )
    REFERENCES `mydb`.`tb_typeInstance` (`tb_typeInstance_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_content`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_content` (
  `tb_content_id` INT NOT NULL AUTO_INCREMENT ,
  `tb_instance_id_instance` INT NOT NULL ,
  `tb_user_id` INT NOT NULL ,
  `tb_content_title` VARCHAR(300) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL ,
  `tb_content_header` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL ,
  `tb_content_short` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL ,
  `tb_content_text` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL ,
  `tb_content_dtRegister` DATETIME NOT NULL ,
  `tb_content_dtPublication` DATETIME NULL ,
  `tb_content_published` INT NULL ,
  `tb_content_highlight` INT NULL ,
  `tb_content_link` VARCHAR(300) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL ,
  PRIMARY KEY (`tb_content_id`) ,
  INDEX `fk_tb_content_tb_instance1_idx` (`tb_instance_id_instance` ASC) ,
  INDEX `fk_tb_content_tb_user1_idx` (`tb_user_id` ASC) ,
  CONSTRAINT `fk_tb_content_tb_instance1`
    FOREIGN KEY (`tb_instance_id_instance` )
    REFERENCES `mydb`.`tb_instance` (`tb_instance_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_content_tb_user1`
    FOREIGN KEY (`tb_user_id` )
    REFERENCES `mydb`.`tb_user` (`tb_user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_tags` (
  `tb_tags_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Tabela que contém o cadastro de tags para os conteúdos.' ,
  `tb_tags_text` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  PRIMARY KEY (`tb_tags_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_filesContent`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_filesContent` (
  `tb_filesContent_id` INT NOT NULL AUTO_INCREMENT ,
  `tb_filesContent_originalName` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  `tb_filesContent_name` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  `tb_filesContent_link` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  `tb_filesContent_type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  PRIMARY KEY (`tb_filesContent_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_loginRegister`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_loginRegister` (
  `tb_loginRegister_id` INT NOT NULL ,
  `tb_user_id` INT NOT NULL ,
  `tb_loginRegister_ipUserLogin` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  `tb_loginRegister_timeUserLogin` DATETIME NOT NULL ,
  PRIMARY KEY (`tb_loginRegister_id`) ,
  INDEX `fk_tb_loginRegister_tb_user1_idx` (`tb_user_id` ASC) ,
  CONSTRAINT `fk_tb_loginRegister_tb_user1`
    FOREIGN KEY (`tb_user_id` )
    REFERENCES `mydb`.`tb_user` (`tb_user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_twitter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_twitter` (
  `id_twitter` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id_twitter`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_user_has_tb_instance`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_user_has_tb_instance` (
  `tb_user_tb_user_id` INT NOT NULL ,
  `tb_instance_tb_instance_id` INT NOT NULL ,
  PRIMARY KEY (`tb_user_tb_user_id`, `tb_instance_tb_instance_id`) ,
  INDEX `fk_tb_user_has_tb_instance_tb_instance1_idx` (`tb_instance_tb_instance_id` ASC) ,
  INDEX `fk_tb_user_has_tb_instance_tb_user1_idx` (`tb_user_tb_user_id` ASC) ,
  CONSTRAINT `fk_tb_user_has_tb_instance_tb_user1`
    FOREIGN KEY (`tb_user_tb_user_id` )
    REFERENCES `mydb`.`tb_user` (`tb_user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_user_has_tb_instance_tb_instance1`
    FOREIGN KEY (`tb_instance_tb_instance_id` )
    REFERENCES `mydb`.`tb_instance` (`tb_instance_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_content_has_tb_filesContent`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_content_has_tb_filesContent` (
  `tb_content_tb_content_id` INT NOT NULL ,
  `tb_filesContent_tb_filesContent_id` INT NOT NULL ,
  PRIMARY KEY (`tb_content_tb_content_id`, `tb_filesContent_tb_filesContent_id`) ,
  INDEX `fk_tb_content_has_tb_filesContent_tb_filesContent1_idx` (`tb_filesContent_tb_filesContent_id` ASC) ,
  INDEX `fk_tb_content_has_tb_filesContent_tb_content1_idx` (`tb_content_tb_content_id` ASC) ,
  CONSTRAINT `fk_tb_content_has_tb_filesContent_tb_content1`
    FOREIGN KEY (`tb_content_tb_content_id` )
    REFERENCES `mydb`.`tb_content` (`tb_content_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_content_has_tb_filesContent_tb_filesContent1`
    FOREIGN KEY (`tb_filesContent_tb_filesContent_id` )
    REFERENCES `mydb`.`tb_filesContent` (`tb_filesContent_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_content_has_tb_tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_content_has_tb_tags` (
  `tb_content_tb_content_id` INT NOT NULL ,
  `tb_tags_tb_tags_id` INT NOT NULL ,
  PRIMARY KEY (`tb_content_tb_content_id`, `tb_tags_tb_tags_id`) ,
  INDEX `fk_tb_content_has_tb_tags_tb_tags1_idx` (`tb_tags_tb_tags_id` ASC) ,
  INDEX `fk_tb_content_has_tb_tags_tb_content1_idx` (`tb_content_tb_content_id` ASC) ,
  CONSTRAINT `fk_tb_content_has_tb_tags_tb_content1`
    FOREIGN KEY (`tb_content_tb_content_id` )
    REFERENCES `mydb`.`tb_content` (`tb_content_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_content_has_tb_tags_tb_tags1`
    FOREIGN KEY (`tb_tags_tb_tags_id` )
    REFERENCES `mydb`.`tb_tags` (`tb_tags_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_extraFieldContent`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_extraFieldContent` (
  `tb_extraFieldContent_id` INT NOT NULL ,
  `tb_instance_tb_instance_id` INT NOT NULL ,
  `tb_extraFieldContent_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  `tb_extraFieldContent_type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  `tb_extraFieldContent_length` INT NOT NULL ,
  `tb_extraFieldContent_order` INT NOT NULL ,
  PRIMARY KEY (`tb_extraFieldContent_id`) ,
  INDEX `fk_tb_extraContent_tb_instance1_idx` (`tb_instance_tb_instance_id` ASC) ,
  CONSTRAINT `fk_tb_extraContent_tb_instance1`
    FOREIGN KEY (`tb_instance_tb_instance_id` )
    REFERENCES `mydb`.`tb_instance` (`tb_instance_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_content_has_tb_extraFieldContent`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_content_has_tb_extraFieldContent` (
  `tb_content_tb_content_id` INT NOT NULL ,
  `tb_extraFieldContent_tb_extraFieldContent_id` INT NOT NULL ,
  `tb_content_has_tb_extraFieldContent_value` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL ,
  `tb_content_has_tb_extraFieldContent_fieldFilter` INT NULL ,
  PRIMARY KEY (`tb_content_tb_content_id`, `tb_extraFieldContent_tb_extraFieldContent_id`) ,
  INDEX `fk_tb_content_has_tb_extraFieldContent_tb_extraFieldContent_idx` (`tb_extraFieldContent_tb_extraFieldContent_id` ASC) ,
  INDEX `fk_tb_content_has_tb_extraFieldContent_tb_content1_idx` (`tb_content_tb_content_id` ASC) ,
  CONSTRAINT `fk_tb_content_has_tb_extraFieldContent_tb_content1`
    FOREIGN KEY (`tb_content_tb_content_id` )
    REFERENCES `mydb`.`tb_content` (`tb_content_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_content_has_tb_extraFieldContent_tb_extraFieldContent1`
    FOREIGN KEY (`tb_extraFieldContent_tb_extraFieldContent_id` )
    REFERENCES `mydb`.`tb_extraFieldContent` (`tb_extraFieldContent_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `mydb`.`tb_extraFieldFilter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tb_extraFieldFilter` (
  `tb_extraFieldFilter_id` INT NOT NULL ,
  `tb_extraFieldContent_tb_extraFieldContent_id` INT NOT NULL ,
  `tb_extraFieldFilter_name` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL ,
  PRIMARY KEY (`tb_extraFieldFilter_id`) ,
  INDEX `fk_tb_extraFieldFilter_tb_extraFieldContent1_idx` (`tb_extraFieldContent_tb_extraFieldContent_id` ASC) ,
  CONSTRAINT `fk_tb_extraFieldFilter_tb_extraFieldContent1`
    FOREIGN KEY (`tb_extraFieldContent_tb_extraFieldContent_id` )
    REFERENCES `mydb`.`tb_extraFieldContent` (`tb_extraFieldContent_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
