SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `empresaz` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `empresaz` ;

-- -----------------------------------------------------
-- Table `empresaz`.`departamentos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `empresaz`.`departamentos` (
  `dept_no` TINYINT(2) NOT NULL ,
  `dnombre` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL ,
  `loc` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL ,
  PRIMARY KEY (`dept_no`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `empresaz`.`empleados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `empresaz`.`empleados` (
  `emp_no` SMALLINT(4) UNSIGNED NOT NULL ,
  `apellido` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL ,
  `oficio` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL ,
  `dir` SMALLINT(6) NULL DEFAULT NULL ,
  `fecha_alt` DATE NULL DEFAULT NULL ,
  `salario` FLOAT(6,2) NULL DEFAULT NULL ,
  `comision` FLOAT(6,2) NULL DEFAULT NULL ,
  `dept_no` TINYINT(2) NOT NULL ,
  PRIMARY KEY (`emp_no`) ,
  INDEX `dept_no` (`dept_no` ASC) ,
  CONSTRAINT `dept_no`
    FOREIGN KEY (`dept_no` )
    REFERENCES `empresaz`.`departamentos` (`dept_no` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

use empresaz;
/*Primero se insertan los departamentos */
 INSERT INTO departamentos VALUES
(10,'CONTABILIDAD','SEVILLA'),
(20,'INVESTIGACIÓN','MADRID'),
(30,'VENTAS','BARCELONA'),
(40,'PRODUCCIÓN','BILBAO');

/* Inserta los empleados*/
INSERT INTO empleados VALUES
(1000,'AMARO','AUXILIAR',1,20100102,940.00,0.00,10),
(2000,'CASTRO','AUXILIAR',2,20110102,890.00,0.00,10),
(3000,'HERNANDEZ','CONTABLE',3,20010102,1890.00,0.00,10),
(4000,'FERNANDEZ','TEC.LAB.',4,20080102,1500.00,0.00,20),
(5000,'HERMOSILLA','DIR.LAB.',5,20060102,2420.00,0.00,20),
(6000,'DE ANDRES','GERENTE',6,20010102,3450.00,20.00,40),
(7000,'GOMEZ','VENDEDOR',7,20020102,1200.00,10.00,30),
(8000,'BORREGO','VENDEDOR',8,20020102,1200.00,10.00,30);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
