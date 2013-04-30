SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `cms_cmsv1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `cms_cmsv1` ;

-- -----------------------------------------------------
-- Table `cms_cmsv1`.`perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`perfil` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`perfil` (
  `per_id` INT NOT NULL AUTO_INCREMENT ,
  `per_nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`per_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`arquivos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`arquivos` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`arquivos` (
  `arq_id` INT NOT NULL AUTO_INCREMENT ,
  `arq_nome` VARCHAR(300) NULL ,
  `arq_tipo` VARCHAR(45) NULL ,
  `arq_link` VARCHAR(300) NULL ,
  `arq_dtcriacao` DATETIME NULL ,
  PRIMARY KEY (`arq_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`pessoas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`pessoas` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`pessoas` (
  `pes_id` INT NOT NULL AUTO_INCREMENT ,
  `pes_nome` VARCHAR(200) NULL ,
  `pes_rg` VARCHAR(45) NULL ,
  `pes_cpf` VARCHAR(45) NULL ,
  `pes_email` VARCHAR(200) NULL ,
  `pes_endereco` VARCHAR(300) NULL ,
  `pes_comp` VARCHAR(300) NULL ,
  `pes_bairro` VARCHAR(100) NULL ,
  `pes_cidade` VARCHAR(100) NULL ,
  `pes_pais` VARCHAR(100) NULL ,
  `pes_cep` VARCHAR(45) NULL ,
  `pes_telefone` VARCHAR(45) NULL ,
  `pes_celular` VARCHAR(45) NULL ,
  `pes_dtcriacao` DATETIME NULL ,
  `arquivos_arq_id` INT NOT NULL ,
  PRIMARY KEY (`pes_id`) ,
  CONSTRAINT `fk_pessoas_arquivos1`
    FOREIGN KEY (`arquivos_arq_id` )
    REFERENCES `cms_cmsv1`.`arquivos` (`arq_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`usuarios` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`usuarios` (
  `usu_id` INT NOT NULL AUTO_INCREMENT ,
  `usu_login` VARCHAR(45) NULL ,
  `usu_senha` VARCHAR(45) NULL ,
  `usu_email` VARCHAR(45) NULL ,
  `usu_dtcriacao` DATETIME NULL ,
  `perfil_per_id` INT NOT NULL ,
  `pessoas_pes_id` INT NOT NULL ,
  PRIMARY KEY (`usu_id`) ,
  CONSTRAINT `fk_usuarios_perfil1`
    FOREIGN KEY (`perfil_per_id` )
    REFERENCES `cms_cmsv1`.`perfil` (`per_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_pessoas1`
    FOREIGN KEY (`pessoas_pes_id` )
    REFERENCES `cms_cmsv1`.`pessoas` (`pes_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`funcionalidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`funcionalidades` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`funcionalidades` (
  `fun_id` INT NOT NULL AUTO_INCREMENT ,
  `fun_nome` VARCHAR(100) NULL ,
  `fun_url` VARCHAR(300) NULL ,
  `fun_link` VARCHAR(300) NULL ,
  `fun_ordem` INT NULL ,
  PRIMARY KEY (`fun_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`instancias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`instancias` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`instancias` (
  `ins_id` INT NOT NULL AUTO_INCREMENT ,
  `ins_nome` VARCHAR(45) NOT NULL ,
  `ins_url` VARCHAR(100) NULL ,
  `ins_ordem` INT NULL ,
  PRIMARY KEY (`ins_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`registro_de_atividades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`registro_de_atividades` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`registro_de_atividades` (
  `reg_id` INT NOT NULL AUTO_INCREMENT ,
  `reg_ip` VARCHAR(45) NULL ,
  `reg_dtreg` DATETIME NULL ,
  `reg_atividade` VARCHAR(300) NULL ,
  PRIMARY KEY (`reg_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`cursos` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`cursos` (
  `cur_id` INT NOT NULL AUTO_INCREMENT ,
  `cur_nome` VARCHAR(200) NULL ,
  `cur_descricao` MEDIUMTEXT NULL ,
  `cur_link` VARCHAR(300) NULL ,
  `cur_dtinicio` DATETIME NULL ,
  `cur_dtfim` DATETIME NULL ,
  `cur_dtcriacao` DATETIME NULL ,
  `cur_publicado` INT NULL ,
  `cur_destaque` INT NULL ,
  PRIMARY KEY (`cur_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`conteudo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`conteudo` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`conteudo` (
  `con_id` INT NOT NULL AUTO_INCREMENT ,
  `con_titulo` VARCHAR(300) NULL ,
  `con_subtitulo` VARCHAR(300) NULL ,
  `con_texto` MEDIUMTEXT NULL ,
  `con_dtcriacao` DATETIME NULL ,
  `con_dtpublicacao` DATETIME NULL ,
  `con_publicado` INT NULL ,
  `con_destaque` INT NULL ,
  PRIMARY KEY (`con_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`aluno` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`aluno` (
  `alu_id` INT NOT NULL AUTO_INCREMENT ,
  `pessoas_pes_id` INT NOT NULL ,
  `alu_matricula` VARCHAR(45) NULL ,
  PRIMARY KEY (`alu_id`) ,
  CONSTRAINT `fk_aluno_pessoas1`
    FOREIGN KEY (`pessoas_pes_id` )
    REFERENCES `cms_cmsv1`.`pessoas` (`pes_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`parceiros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`parceiros` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`parceiros` (
  `par_id` INT NOT NULL AUTO_INCREMENT ,
  `par_nome` VARCHAR(200) NULL ,
  `par_link` VARCHAR(300) NULL ,
  `par_publicado` INT NULL ,
  `par_destaque` INT NULL ,
  `par_dtcriacao` DATETIME NULL ,
  `arquivos_arq_id` INT NOT NULL ,
  PRIMARY KEY (`par_id`) ,
  CONSTRAINT `fk_parceiros_arquivos1`
    FOREIGN KEY (`arquivos_arq_id` )
    REFERENCES `cms_cmsv1`.`arquivos` (`arq_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`destaque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`destaque` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`destaque` (
  `des_id` INT NOT NULL ,
  `des_titulo` VARCHAR(300) NULL ,
  `des_descricao` VARCHAR(300) NULL ,
  `des_dtcriacao` DATETIME NULL ,
  `des_publicado` INT NULL ,
  `des_destaque` INT NULL ,
  `arquivos_arq_id` INT NOT NULL ,
  PRIMARY KEY (`des_id`) ,
  CONSTRAINT `fk_destaque_arquivos1`
    FOREIGN KEY (`arquivos_arq_id` )
    REFERENCES `cms_cmsv1`.`arquivos` (`arq_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`empresas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`empresas` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`empresas` (
  `emp_id` INT NOT NULL AUTO_INCREMENT ,
  `emp_nome` VARCHAR(300) NULL ,
  `emp_razaosocial` VARCHAR(300) NULL ,
  `emp_cnpj` VARCHAR(45) NULL ,
  `emp_email` VARCHAR(200) NULL ,
  `emp_telefone` VARCHAR(45) NULL ,
  `emp_celular` VARCHAR(45) NULL ,
  `emp_endereco` VARCHAR(300) NULL ,
  `emp_comp` VARCHAR(300) NULL ,
  `emp_bairro` VARCHAR(100) NULL ,
  `emp_cidade` VARCHAR(100) NULL ,
  `emp_pais` VARCHAR(100) NULL ,
  `emp_cep` VARCHAR(45) NULL ,
  `emp_dtcriacao` DATETIME NULL ,
  `arquivos_arq_id` INT NOT NULL ,
  PRIMARY KEY (`emp_id`) ,
  CONSTRAINT `fk_empresas_arquivos1`
    FOREIGN KEY (`arquivos_arq_id` )
    REFERENCES `cms_cmsv1`.`arquivos` (`arq_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`assinantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`assinantes` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`assinantes` (
  `ass_id` INT NOT NULL AUTO_INCREMENT ,
  `ass_login` VARCHAR(45) NULL ,
  `ass_senha` VARCHAR(45) NULL ,
  `ass_email` VARCHAR(45) NULL ,
  `ass_dtcriacao` DATETIME NULL ,
  `pessoas_pes_id` INT NULL ,
  `empresas_emp_id` INT NULL ,
  PRIMARY KEY (`ass_id`) ,
  CONSTRAINT `fk_assinantes_pessoas1`
    FOREIGN KEY (`pessoas_pes_id` )
    REFERENCES `cms_cmsv1`.`pessoas` (`pes_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assinantes_empresas1`
    FOREIGN KEY (`empresas_emp_id` )
    REFERENCES `cms_cmsv1`.`empresas` (`emp_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`newsletter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`newsletter` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`newsletter` (
  `news_id` INT NOT NULL AUTO_INCREMENT ,
  `news_nome` VARCHAR(300) NULL ,
  `news_email` VARCHAR(200) NULL ,
  `news_dtcriacao` DATETIME NULL ,
  PRIMARY KEY (`news_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`cursos_has_aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`cursos_has_aluno` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`cursos_has_aluno` (
  `cursos_cur_id` INT NOT NULL ,
  `aluno_alu_id` INT NOT NULL ,
  PRIMARY KEY (`cursos_cur_id`, `aluno_alu_id`) ,
  CONSTRAINT `fk_cursos_has_aluno_cursos`
    FOREIGN KEY (`cursos_cur_id` )
    REFERENCES `cms_cmsv1`.`cursos` (`cur_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_has_aluno_aluno1`
    FOREIGN KEY (`aluno_alu_id` )
    REFERENCES `cms_cmsv1`.`aluno` (`alu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`cursos_has_arquivos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`cursos_has_arquivos` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`cursos_has_arquivos` (
  `cursos_cur_id` INT NOT NULL ,
  `arquivos_arq_id` INT NOT NULL ,
  PRIMARY KEY (`cursos_cur_id`, `arquivos_arq_id`) ,
  CONSTRAINT `fk_cursos_has_arquivos_cursos1`
    FOREIGN KEY (`cursos_cur_id` )
    REFERENCES `cms_cmsv1`.`cursos` (`cur_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_has_arquivos_arquivos1`
    FOREIGN KEY (`arquivos_arq_id` )
    REFERENCES `cms_cmsv1`.`arquivos` (`arq_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`arquivos_has_conteudo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`arquivos_has_conteudo` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`arquivos_has_conteudo` (
  `arquivos_arq_id` INT NOT NULL ,
  `conteudo_con_id` INT NOT NULL ,
  PRIMARY KEY (`arquivos_arq_id`, `conteudo_con_id`) ,
  CONSTRAINT `fk_arquivos_has_conteudo_arquivos1`
    FOREIGN KEY (`arquivos_arq_id` )
    REFERENCES `cms_cmsv1`.`arquivos` (`arq_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arquivos_has_conteudo_conteudo1`
    FOREIGN KEY (`conteudo_con_id` )
    REFERENCES `cms_cmsv1`.`conteudo` (`con_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`arquivos_has_aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`arquivos_has_aluno` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`arquivos_has_aluno` (
  `arquivos_arq_id` INT NOT NULL ,
  `aluno_alu_id` INT NOT NULL ,
  PRIMARY KEY (`arquivos_arq_id`, `aluno_alu_id`) ,
  CONSTRAINT `fk_arquivos_has_aluno_arquivos1`
    FOREIGN KEY (`arquivos_arq_id` )
    REFERENCES `cms_cmsv1`.`arquivos` (`arq_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arquivos_has_aluno_aluno1`
    FOREIGN KEY (`aluno_alu_id` )
    REFERENCES `cms_cmsv1`.`aluno` (`alu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`funcionalidades_has_instancias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`funcionalidades_has_instancias` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`funcionalidades_has_instancias` (
  `funcionalidades_fun_id` INT NOT NULL ,
  `instancias_ins_id` INT NOT NULL ,
  PRIMARY KEY (`funcionalidades_fun_id`, `instancias_ins_id`) ,
  CONSTRAINT `fk_funcionalidades_has_instancias_funcionalidades1`
    FOREIGN KEY (`funcionalidades_fun_id` )
    REFERENCES `cms_cmsv1`.`funcionalidades` (`fun_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionalidades_has_instancias_instancias1`
    FOREIGN KEY (`instancias_ins_id` )
    REFERENCES `cms_cmsv1`.`instancias` (`ins_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`usuarios_has_instancias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`usuarios_has_instancias` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`usuarios_has_instancias` (
  `usuarios_usu_id` INT NOT NULL ,
  `instancias_ins_id` INT NOT NULL ,
  PRIMARY KEY (`usuarios_usu_id`, `instancias_ins_id`) ,
  CONSTRAINT `fk_usuarios_has_instancias1_usuarios1`
    FOREIGN KEY (`usuarios_usu_id` )
    REFERENCES `cms_cmsv1`.`usuarios` (`usu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_instancias1_instancias1`
    FOREIGN KEY (`instancias_ins_id` )
    REFERENCES `cms_cmsv1`.`instancias` (`ins_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cms_cmsv1`.`usuarios_has_funcionalidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cms_cmsv1`.`usuarios_has_funcionalidades` ;

CREATE  TABLE IF NOT EXISTS `cms_cmsv1`.`usuarios_has_funcionalidades` (
  `usuarios_usu_id` INT NOT NULL ,
  `funcionalidades_fun_id` INT NOT NULL ,
  PRIMARY KEY (`usuarios_usu_id`, `funcionalidades_fun_id`) ,
  CONSTRAINT `fk_usuarios_has_funcionalidades_usuarios1`
    FOREIGN KEY (`usuarios_usu_id` )
    REFERENCES `cms_cmsv1`.`usuarios` (`usu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_funcionalidades_funcionalidades1`
    FOREIGN KEY (`funcionalidades_fun_id` )
    REFERENCES `cms_cmsv1`.`funcionalidades` (`fun_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `cms_cmsv1` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
