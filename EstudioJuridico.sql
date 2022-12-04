-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema estudiojuridico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema estudiojuridico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `estudiojuridico` DEFAULT CHARACTER SET utf8mb3 ;

-- -----------------------------------------------------
-- scripts creacion tablas
-- -----------------------------------------------------

USE `estudiojuridico` ;

-- -----------------------------------------------------
-- Table `bitacoraclientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`bitacoraclientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NULL DEFAULT NULL,
  `usuario` VARCHAR(45) NULL DEFAULT NULL,
  `cliente_viejo` INT NULL DEFAULT NULL,
  `cliente_nuevo` INT NULL DEFAULT NULL,
  `tipo_operacion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bitacorasociedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`bitacorasociedades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NULL DEFAULT NULL,
  `usuario` VARCHAR(45) NULL DEFAULT NULL,
  `sociedad_viejo` INT NULL DEFAULT NULL,
  `sociedad_nuevo` INT NULL DEFAULT NULL,
  `tipo_operacion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `celular` VARCHAR(200) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(200) NOT NULL,
  `DNI` VARCHAR(200) NOT NULL,
  `CUIT` VARCHAR(200) NOT NULL,
  `profesion` VARCHAR(45) NOT NULL,
  `estadoCivil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `sociedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`sociedades` (
  `idSociedades` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `numeroCorrelativo` VARCHAR(55) NOT NULL,
  `CUIT` VARCHAR(55) NOT NULL,
  `domicilio` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idSociedades`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `departamentojudicial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`departamentojudicial` (
  `idDepartamentoJudicial` INT NOT NULL AUTO_INCREMENT,
  `jurisdicciones` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamentoJudicial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `juicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`juicios` (
  `idJuicios` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `materia` VARCHAR(150) NOT NULL,
  `juzgado` VARCHAR(100) NOT NULL,
  `fecha` DATE NOT NULL,
  `idDepartamentoJudicial` INT NOT NULL,
  `idCliente` INT NULL DEFAULT NULL,
  `idSociedades` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idJuicios`),
  INDEX `idSociedades_idx` (`idSociedades` ASC) VISIBLE,
  INDEX `idClientes_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idDepartamentoJudicial_idx` (`idDepartamentoJudicial` ASC) VISIBLE,
  CONSTRAINT `idClientes`
    FOREIGN KEY (`idCliente`)
    REFERENCES `estudiojuridico`.`clientes` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idSociedades`
    FOREIGN KEY (`idSociedades`)
    REFERENCES `estudiojuridico`.`sociedades` (`idSociedades`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idDepartamentoJudicial`
    FOREIGN KEY (`idDepartamentoJudicial`)
    REFERENCES `estudiojuridico`.`departamentojudicial` (`idDepartamentoJudicial`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `presupuestossa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`presupuestossa` (
  `idPresupuestosSA` INT NOT NULL AUTO_INCREMENT,
  `reserva de nombre` DECIMAL(24,2) NOT NULL,
  `formulario IGJ` DECIMAL(24,2) NOT NULL,
  `tasa` DECIMAL(24,2) NOT NULL,
  `escritura` DECIMAL(24,2) NOT NULL,
  `copias` DECIMAL(24,2) NOT NULL,
  `edicto` DECIMAL(24,2) NOT NULL,
  `seguro` DECIMAL(24,2) NOT NULL,
  `gastos` DECIMAL(24,2) NOT NULL,
  `honorarios` DECIMAL(24,2) NOT NULL,
  `total` DECIMAL(24,2) NOT NULL,
  PRIMARY KEY (`idPresupuestosSA`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `entespublicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`entespublicos` (
  `idEntesPublicos` INT NOT NULL AUTO_INCREMENT,
  `organismos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEntesPublicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`pago` (
  `idPago` INT NOT NULL AUTO_INCREMENT,
  `formas de pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tramitesadministrativos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`tramitesadministrativos` (
  `idTramitesAdministrativos` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(150) NOT NULL,
  `fecha` DATE NOT NULL,
  `idEntesPublicos` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `idPresupuestosSA` INT NOT NULL,
  `idPago` INT NOT NULL,
  PRIMARY KEY (`idTramitesAdministrativos`),
  INDEX `idPresupuestosSA_idx` (`idPresupuestosSA` ASC) VISIBLE,
  INDEX `FK_Clientes_idx` (`idCliente` ASC) VISIBLE,
  INDEX `FK_EntesPublicos_idx` (`idEntesPublicos` ASC) VISIBLE,
  INDEX `FK_Pago_idx` (`idPago` ASC) VISIBLE,
  CONSTRAINT `FK_Clientes`
    FOREIGN KEY (`idCliente`)
    REFERENCES `estudiojuridico`.`clientes` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PresupuestosSA`
    FOREIGN KEY (`idPresupuestosSA`)
    REFERENCES `estudiojuridico`.`presupuestossa` (`idPresupuestosSA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_EntesPublicos`
    FOREIGN KEY (`idEntesPublicos`)
    REFERENCES `estudiojuridico`.`entespublicos` (`idEntesPublicos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Pago`
    FOREIGN KEY (`idPago`)
    REFERENCES `estudiojuridico`.`pago` (`idPago`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `presupuestossrl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`presupuestossrl` (
  `idPresupuestosSRL` INT NOT NULL AUTO_INCREMENT,
  `reserva de nombre` DECIMAL(24,2) NOT NULL,
  `formulario constitucion` DECIMAL(24,2) NOT NULL,
  `tasa` DECIMAL(24,2) NOT NULL,
  `certificacion firmas` DECIMAL(24,2) NOT NULL,
  `dictamen` DECIMAL(24,2) NOT NULL,
  `copias` DECIMAL(24,2) NOT NULL,
  `honorarios` DECIMAL(24,2) NOT NULL,
  `total` DECIMAL(24,2) NOT NULL,
  PRIMARY KEY (`idPresupuestosSRL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tramitessocietarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`tramitessocietarios` (
  `idTramitesSocietarios` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(150) NOT NULL,
  `fecha` DATE NOT NULL,
  `idSociedades` INT NOT NULL,
  `idPresupuestosSA` INT NULL,
  `idPresupuestosSRL` INT NULL,
  PRIMARY KEY (`idTramitesSocietarios`),
  INDEX `FK_Sociedades_idx` (`idSociedades` ASC) VISIBLE,
  INDEX `FK_PresupuestosSA_idx` (`idPresupuestosSA` ASC) VISIBLE,
  INDEX `FK_PresupuestosSRL_idx` (`idPresupuestosSRL` ASC) VISIBLE,
  CONSTRAINT `Sociedades`
    FOREIGN KEY (`idSociedades`)
    REFERENCES `estudiojuridico`.`sociedades` (`idSociedades`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `PresupuestosSA`
    FOREIGN KEY (`idPresupuestosSA`)
    REFERENCES `estudiojuridico`.`presupuestossa` (`idPresupuestosSA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `PresupuestosSRL`
    FOREIGN KEY (`idPresupuestosSRL`)
    REFERENCES `estudiojuridico`.`presupuestossrl` (`idPresupuestosSRL`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `estudiojuridico` ;

-- -----------------------------------------------------
-- Placeholder table for view `estudiojuridico`.`vista_costos_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`vista_costos_clientes` (`nombre` INT, `apellido` INT, `tipo` INT, `total` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudiojuridico`.`vista_costos_sociedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`vista_costos_sociedades` (`nombre` INT, `numeroCorrelativo` INT, `tipo` INT, `total` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudiojuridico`.`vista_juicios_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`vista_juicios_clientes` (`idCliente` INT, `nombre` INT, `apellido` INT, `titulo` INT, `materia` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudiojuridico`.`vista_juicios_sociedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`vista_juicios_sociedades` (`idSociedades` INT, `nombre` INT, `titulo` INT, `materia` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudiojuridico`.`vista_tramites_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudiojuridico`.`vista_tramites_clientes` (`idCliente` INT, `nombre` INT, `apellido` INT, `tipo` INT);

-- -----------------------------------------------------
-- function gastos_honorarios
-- funcion en la que se ingresa el id de un presupuestos() y retorna el total a pagar de los gastos y honorarios
-- se utiliza de esta manera ---> select gastos_honorarios('idPresupuestosSA') total_gastos;
-- -----------------------------------------------------

DELIMITER $$
USE `estudiojuridico`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `gastos_honorarios`(idGastos int) RETURNS char(60) CHARSET utf8mb3
    DETERMINISTIC
begin
	declare total decimal;
    set total = (select concat(gastos + honorarios) from presupuestossa
    where idPresupuestosSA = idGastos);
    return total;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- function clientes_tramites
-- funcion en la cual se ingresa el ID del cliente y retorna el tipo de tramite que este tiene asignado con la fecha
-- se utiliza de esta manera ---> select clientes_tramites(idCliente) as cliente, tipo, fecha from tramitesadministrativos;
-- -----------------------------------------------------

DELIMITER //
create function clientes_tramites (idClienteTramite int)
returns varchar(100)
reads sql data
begin
	declare datos varchar(100);
     if  idClienteTramite = 0 then 
		set datos = "numero id debe ser mayor a 0";
     else
		set datos = (select concat(idTramitesAdministrativos, ' ',tipo, ' ', fecha, '  cliente:  ',idCliente)
		from tramitesadministrativos where tramitesadministrativos.idCliente=idClienteTramite);
     end if;
	return datos;
end//
DELIMITER ;


-- -----------------------------------------------------
-- procedure insertar_clientes
-- Store Procedure que inserta datos en la tabla clientes, si detecta que el email esta repetido no inserta el dato
-- -----------------------------------------------------

DELIMITER $$
USE `estudiojuridico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_clientes`(nom varchar(45),
ape varchar(45),
cel varchar(200),
correo varchar(45),
dom varchar(200),
DNI varchar(200),
CUIT varchar(200),
prof varchar(45),
estad varchar(45))
begin
declare existe_persona int;
declare id int;
set existe_persona = (select count(*) from clientes where email=correo);
if existe_persona = 0 then
	insert into clientes (nombre,apellido,celular,email,domicilio,DNI,CUIT,profesion,estadoCivil)
	values(nom, ape, cel, correo, dom, DNI, CUIT, prof, estad);
    set id = last_insert_id();
else
	set id = 0;
end if;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ordenamiento
-- Stored Procedure que ordena los datos de una tabla que se ingrese
-- -----------------------------------------------------

DELIMITER $$
USE `estudiojuridico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenamiento`( in campo varchar(200) , in tipo_ordenamiento enum('asc' ,'desc',''), in tabla varchar(200) )
begin
    if campo != '' then
		set @ordenar = concat(' order by ' , campo);
	else
		set @ordenar = '';
	end if;
    if tipo_ordenamiento != '' then
		set @tipo = concat(' ' , tipo_ordenamiento);
	else
		set @tipo = '';
	end if;
    set @clausula = concat('select * from ', tabla ,@ordenar,@tipo);
    prepare runSQL from @clausula;
    execute runSQL;
    deallocate prepare runSQL;
    
end$$

DELIMITER ;

-- -----------------------------------------------------
-- scripts creacion tablas vista
-- -----------------------------------------------------

-- -----------------------------------------------------
-- View `vista_costos_clientes`
-- vista para ver el costo total de los tramites de los clientes
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudiojuridico`.`vista_costos_clientes`;
USE `estudiojuridico`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estudiojuridico`.`vista_costos_clientes` 
AS select `c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`t`.`tipo` AS `tipo`,`p`.`total` AS `total` 
from ((`estudiojuridico`.`tramitesadministrativos` `t` join `estudiojuridico`.`clientes` `c`) join `estudiojuridico`.`presupuestossa` `p`) 
where ((`t`.`idCliente` = `c`.`idCliente`) and (`t`.`idPresupuestosSA` = `p`.`idPresupuestosSA`));

-- -----------------------------------------------------
-- View `vista_costos_sociedades`
-- vista para ver el costo total de los tramites de las sociedades
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudiojuridico`.`vista_costos_sociedades`;
USE `estudiojuridico`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estudiojuridico`.`vista_costos_sociedades` 
AS select `s`.`nombre` AS `nombre`,`s`.`numeroCorrelativo` AS `numeroCorrelativo`,`t`.`tipo` AS `tipo`,`p`.`total` AS `total` 
from ((`estudiojuridico`.`tramitessocietarios` `t` join `estudiojuridico`.`sociedades` `s`) join `estudiojuridico`.`presupuestossa` `p`) 
where ((`t`.`idSociedades` = `s`.`idSociedades`) and (`t`.`idPresupuestosSA` = `p`.`idPresupuestosSA`));

-- -----------------------------------------------------
-- View `vista_juicios_clientes`
-- vista para ver el titulo y la materia de los juicios de clientes
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudiojuridico`.`vista_juicios_clientes`;
USE `estudiojuridico`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estudiojuridico`.`vista_juicios_clientes` 
AS select `estudiojuridico`.`clientes`.`idCliente` AS `idCliente`,`estudiojuridico`.`clientes`.`nombre` AS `nombre`,`estudiojuridico`.`clientes`.`apellido` AS `apellido`,`estudiojuridico`.`juicios`.`titulo` AS `titulo`,`estudiojuridico`.`juicios`.`materia` AS `materia` 
from (`estudiojuridico`.`clientes` join `estudiojuridico`.`juicios`) 
where (`estudiojuridico`.`clientes`.`idCliente` = `estudiojuridico`.`juicios`.`idCliente`);

-- -----------------------------------------------------
-- View `vista_juicios_sociedades`
-- vista para ver el titulo y la materia de los juicios de sociedades
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudiojuridico`.`vista_juicios_sociedades`;
USE `estudiojuridico`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estudiojuridico`.`vista_juicios_sociedades` 
AS select `estudiojuridico`.`sociedades`.`idSociedades` AS `idSociedades`,`estudiojuridico`.`sociedades`.`nombre` AS `nombre`,`estudiojuridico`.`juicios`.`titulo` AS `titulo`,`estudiojuridico`.`juicios`.`materia` AS `materia` 
from (`estudiojuridico`.`sociedades` join `estudiojuridico`.`juicios`) 
where (`estudiojuridico`.`sociedades`.`idSociedades` = `estudiojuridico`.`juicios`.`idSociedades`);

-- -----------------------------------------------------
-- View `vista_tramites_clientes`
-- vista para ver tramites de cada cliente
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudiojuridico`.`vista_tramites_clientes`;
USE `estudiojuridico`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estudiojuridico`.`vista_tramites_clientes` 
AS select `estudiojuridico`.`clientes`.`idCliente` AS `idCliente`,`estudiojuridico`.`clientes`.`nombre` AS `nombre`,`estudiojuridico`.`clientes`.`apellido` AS `apellido`,`estudiojuridico`.`tramitesadministrativos`.`tipo` AS `tipo` 
from (`estudiojuridico`.`clientes` join `estudiojuridico`.`tramitesadministrativos`) 
where (`estudiojuridico`.`clientes`.`idCliente` = `estudiojuridico`.`tramitesadministrativos`.`idCliente`);

-- -----------------------------------------------------
-- scripts creacion triggers
-- -----------------------------------------------------

USE `estudiojuridico`;

DELIMITER $$
-- trigger para controlar eliminacion de datos en la tabla clientes
USE `estudiojuridico`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `estudiojuridico`.`borrar_cliente`
BEFORE DELETE ON `estudiojuridico`.`clientes`
FOR EACH ROW
begin 
insert into bitacoraClientes
(fecha,hora,usuario,cliente_viejo,tipo_operacion)
values
(current_date(),current_time(),session_user(),old.idCliente,'cliente borrado');
end$$

-- trigger para controlar insercion de datos nuevos en la tabla clientes
USE `estudiojuridico`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `estudiojuridico`.`insercion_cliente`
AFTER INSERT ON `estudiojuridico`.`clientes`
FOR EACH ROW
insert into bitacoraClientes 
(fecha,hora,usuario,cliente_nuevo,tipo_operacion)
values(current_date(),current_time(),session_user(),new.idCliente,'cliente insertado')$$

-- trigger para controlar eliminacion de datos en la tabla sociedades
USE `estudiojuridico`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `estudiojuridico`.`borrar_sociedad`
BEFORE DELETE ON `estudiojuridico`.`sociedades`
FOR EACH ROW
begin 
insert into bitacoraSociedades
(fecha,hora,usuario,sociedad_viejo,tipo_operacion)
values
(current_date(),current_time(),session_user(),old.idSociedades,'sociedad borrada');
end$$

-- trigger para controlar insercion de datos nuevos en la tabla sociedades
USE `estudiojuridico`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `estudiojuridico`.`insercion_sociedad`
AFTER INSERT ON `estudiojuridico`.`sociedades`
FOR EACH ROW
insert into bitacoraSociedades
(fecha,hora,usuario,sociedad_nuevo,tipo_operacion)
values(current_date(),current_time(),session_user(),new.idSociedades,'sociedad insertada')$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- scripts insercion datos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- tabla 'clientes'
-- -----------------------------------------------------

INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (1,'Lucas','Rodriguez','15 4874 2014','lucasr@gmail.com','Boqueron 865-Lomas de Zamora','20 455 723','20-20455723-5','Abogado','Soltero');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (2,'Pablo','Garcia ','15 2047 9467','garciapablo@gmail.com','Cerrito 461-Lomas de Zamora','34 617 592','20-34617592-5','Medico','Casado');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (3,'Alejandro','Cardozo','11 7419 2483','acardozo@hotmail.com','Cnel. Pringles 231-Lanus','22 846 310','20-22846310-5','Empresario','Casado');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (4,'Jose','Saavedra','15 6184 2715','josesaav@gmail.com','Garibaldi 145 -Moron','38 216 084','20-38216084-5','Abogado','Casado');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (5,'Mercedes','Liva','15 1694 6925','livamercedes@hotmail.com','Lavalle 784 5°D-Pilar','21 584 628','27-21584628-5','Arquitecta','Soltero');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (6,'Pilar','Hernandez','11 9237 8648','p.hernandez@gmail.com','Oliden 169 - Olivos','34 726 736','27-34726736-5','Veterinaria ','Casado');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (7,'Valentina','Lopez','15 3850 4608','valen.l@gmail.com','Gral. Pacheco 425-Vicente Lopez','22 380 758','27-22380758-5','Medica','Soltero');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (8,'Matias','Cano','15 4517 0574','maticano@gmail.com','Caseros 42 10°A-Martinez','34 561 443','20-34561443-5','Contador','Soltero');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (9,'Manuel','Benitez','11 8257 9042','benitez.m@hotmail.com','Corrientes 156-CABA','24 034 640','20-24034640-5','Empresario','Soltero');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (10,'Cristian','Molino','15 6835 8810','molinocristian@gmail.com','Ayacucho 847-CABA','31 730 826','20-31730826-5','Medico','Casado');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (11,'German','Soto','11 7431 5520','germansoto@gmail.com','España 264-Lomas de Zamora','35 255 376','20-35255376-5','Docente','Casado');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (12,'Fernando','Villa','15 2403 8246','fer.villa@gmail.com','Brasil 754-Martelli','39 522 134','20-39522134-5','Mecanico','Soltero');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (13,'Micaela','Acuña','11 5411 8844','acuñamicaela@hotmail.com','Uriarte 1642-CABA','26 366 815','27-26366815-5','Empresaria','Casado');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (14,'Agustina','Velasquez','15 9062 3520','velasquezagus@gmail.com','Av. Sarmiento 465-CABA','22 342 409','27-22342409-5','Diseñadora','Casado');
INSERT INTO clientes (`idCliente`,`nombre`,`apellido`,`celular`,`email`,`domicilio`,`DNI`,`CUIT`,`profesion`,`estadoCivil`) VALUES (15,'Fabian','Celli','15 6612 4580','fabian.celli@gmail.com','Av. Del Libertador 1785-CABA ','36 193 637','20-36193637-5','Empresario','Soltero');

-- -----------------------------------------------------
-- tabla 'sociedades'
-- -----------------------------------------------------

INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (1,'Alpan Srl.','1752189','30710223455','BILLINGHURST 2225 PISO 3 OFICINA C ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (2,'Lomas S.A.','1245753','30561947431','PARAGUAY 880 PISO3 DEPTO 24');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (3,'Tandil Srl.','1672384','30100114265','AV.LEANDRO N ALEM 690 PISO 17');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (4,'Floreria la rosa S.A.','1497321','30935209685','INTENDENTE FELICIONI 601 ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (5,'Oldbridge Trading','1196441','30190906141','AV. LAS HERAS 1844 PISO 6 DPTO B ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (6,'Green Mountain S.A.','1039272','30744084166','ALMA FUERTE 230 ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (7,'Mavrick Srl.','1524821','30810805544','RIVADAVIA 1751 ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (8,'Peak Invest Srl.','1684078','30866456773','AZCUENAGA 21 ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (9,'LMDShow S.A.','1392749','30006597365','PARANA 264 PISO 7 OFICINA 67 ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (10,'Fregdex Srl.','1913962','30183966872','RONDEAU 1194 PISO 2 ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (11,'EdgeRise S.A.','1631082','30592817697','IRENE MARTINEZ 21  ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (12,'Fasttrack Srl.','1489869','30950600961','JUAN B. JUSTO 4646');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (13,'Bristol Mayer S.A.','1821105','30985464897','AV. MORENO 1171');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (14,'Hopestone S.A.','1280261','30708892554','SAAVEDRA 756  ');
INSERT INTO sociedades (`idSociedades`,`nombre`,`numeroCorrelativo`,`CUIT`,`domicilio`) VALUES (15,'IdeaProvin S.A.','1072070','30460284140','BELGRANO 1915 PISO 3 DPTO B ');

-- -----------------------------------------------------
-- tabla 'departamentojudicial'
-- -----------------------------------------------------

INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (1,'Azul');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (2,'Avellaneda - Lanús');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (3,'Bahía Blanca');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (4,'CABA');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (5,'Dolores');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (6,'General San Martín');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (7,'Junín');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (8,'La Matanza');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (9,'La Plata');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (10,'Lomas de Zamora');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (11,'Mar del Plata');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (12,'Mercedes');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (13,'Moreno - General Rodriguez');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (14,'Morón');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (15,'Necochea');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (16,'Pergamino');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (17,'Quilmes');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (18,'San Isidro');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (19,'San Nicolás');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (20,'Trenque Lauquen');
INSERT INTO departamentojudicial (`idDepartamentoJudicial`,`jurisdicciones`) VALUES (21,'Zarate Campana');

-- -----------------------------------------------------
-- tabla 'entespublicos'
-- -----------------------------------------------------

INSERT INTO entespublicos (`idEntesPublicos`,`organismos`) VALUES (1,'SECLO');
INSERT INTO entespublicos (`idEntesPublicos`,`organismos`) VALUES (2,'domestico');
INSERT INTO entespublicos (`idEntesPublicos`,`organismos`) VALUES (3,'SECOSE');
INSERT INTO entespublicos (`idEntesPublicos`,`organismos`) VALUES (4,'defensa al consumidor');
INSERT INTO entespublicos (`idEntesPublicos`,`organismos`) VALUES (5,'IGJ');
INSERT INTO entespublicos (`idEntesPublicos`,`organismos`) VALUES (6,'RPI');
INSERT INTO entespublicos (`idEntesPublicos`,`organismos`) VALUES (7,'RNPA');
INSERT INTO entespublicos (`idEntesPublicos`,`organismos`) VALUES (8,'TAD');

-- -----------------------------------------------------
-- tabla 'pago'
-- -----------------------------------------------------

INSERT INTO pago (`idPago`,`formas de pago`) VALUES (1,'tarjeta credito');
INSERT INTO pago (`idPago`,`formas de pago`) VALUES (2,'tarjeta debito');
INSERT INTO pago (`idPago`,`formas de pago`) VALUES (3,'transferencia');
INSERT INTO pago (`idPago`,`formas de pago`) VALUES (4,'deposito');
INSERT INTO pago (`idPago`,`formas de pago`) VALUES (5,'mercado pago');
INSERT INTO pago (`idPago`,`formas de pago`) VALUES (6,'efectivo');
INSERT INTO pago (`idPago`,`formas de pago`) VALUES (7,'cheque');

-- -----------------------------------------------------
-- tabla 'presupuestossa'
-- -----------------------------------------------------

INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (1,200.00,800.00,100.00,3000.00,100.00,1700.00,350.00,4200.00,3000.00,13450.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (2,700.00,3200.00,100.00,1800.00,500.00,2300.00,1050.00,5000.00,4500.00,19150.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (3,800.00,2000.00,200.00,5000.00,500.00,2500.00,500.00,6000.00,5500.00,23000.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (4,500.00,1500.00,100.00,4500.00,500.00,1500.00,1000.00,20500.00,18500.00,48600.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (5,200.00,2500.00,150.00,6000.00,150.00,3000.00,300.00,30500.00,25000.00,67800.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (6,700.00,1000.00,200.00,4000.00,200.00,2000.00,350.00,10000.00,5000.00,23450.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (7,600.00,3000.00,100.00,5500.00,500.00,1700.00,400.00,4500.00,2200.00,18500.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (8,350.00,800.00,250.00,3500.00,100.00,1000.00,200.00,16000.00,8000.00,30200.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (9,400.00,2200.00,150.00,2000.00,100.00,2500.00,1000.00,5000.00,2500.00,15850.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (10,800.00,3100.00,100.00,1700.00,200.00,2300.00,650.00,28500.00,16500.00,53850.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (11,650.00,4000.00,200.00,1350.00,350.00,1800.00,350.00,34900.00,24500.00,68100.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (12,400.00,1500.00,100.00,3000.00,500.00,3000.00,600.00,7500.00,3500.00,20100.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (13,200.00,800.00,200.00,2000.00,500.00,1300.00,400.00,15200.00,7500.00,28100.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (14,500.00,2000.00,250.00,2500.00,100.00,2500.00,1000.00,6000.00,3000.00,17850.00);
INSERT INTO presupuestossa (`idPresupuestosSA`,`reserva de nombre`,`formulario IGJ`,`tasa`,`escritura`,`copias`,`edicto`,`seguro`,`gastos`,`honorarios`,`total`) VALUES (15,700.00,3200.00,150.00,1500.00,100.00,1700.00,500.00,4500.00,2350.00,14700.00);

-- -----------------------------------------------------
-- tabla 'presupuestossrl'
-- -----------------------------------------------------

INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (1,300.00,900.00,200.00,5000.00,1400.00,500.00,25000.00,33300.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (2,750.00,1500.00,100.00,1500.00,1400.00,250.00,3000.00,8500.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (3,400.00,3400.00,150.00,3400.00,1400.00,400.00,18500.00,27650.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (4,850.00,2600.00,250.00,2900.00,1400.00,350.00,16000.00,24350.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (5,200.00,4000.00,250.00,5500.00,1400.00,100.00,4500.00,15950.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (6,500.00,1400.00,100.00,4500.00,1400.00,150.00,7000.00,15050.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (7,950.00,2800.00,200.00,1000.00,1400.00,450.00,11500.00,18300.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (8,650.00,3900.00,150.00,3000.00,1400.00,200.00,20000.00,29300.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (9,300.00,1950.00,150.00,2000.00,1400.00,500.00,16500.00,22800.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (10,550.00,800.00,200.00,4000.00,1400.00,300.00,24500.00,31750.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (11,800.00,1000.00,100.00,5400.00,1400.00,150.00,12500.00,21350.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (12,700.00,3000.00,250.00,4300.00,1400.00,400.00,15000.00,25050.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (13,450.00,2000.00,150.00,2500.00,1400.00,500.00,22500.00,29500.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (14,150.00,950.00,100.00,1900.00,1400.00,250.00,9500.00,14250.00);
INSERT INTO presupuestossrl (`idPresupuestosSRL`,`reserva de nombre`,`formulario constitucion`,`tasa`,`certificacion firmas`,`dictamen`,`copias`,`honorarios`,`total`) VALUES (15,800.00,850.00,200.00,3600.00,1400.00,350.00,14900.00,22100.00);

-- -----------------------------------------------------
-- tabla 'juicios'
-- -----------------------------------------------------

INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (16,'cardozoalejandro','sucesion','civil 8','2022-07-22',2,3,NULL);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (17,'larosafloreria','convocatoria asamblea','comercial 4','2022-09-18',5,NULL,4);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (18,'concurso mavrick','concurso preventivo','comercial 7','2022-10-05',10,NULL,7);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (19,'canomatias','escrituracion','civil 5','2022-05-14',4,8,NULL);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (20,'sotogerman','inscripcion testamento','civil 2','2022-08-20',9,11,NULL);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (21,'livamercedes','particion herencia','civil 8','2022-06-06',8,5,NULL);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (22,'fregdex oficio','oficio','comercial 2','2022-03-16',12,NULL,10);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (23,'fasttrack nulidad','nulidad contrato','comercial 5','2022-04-03',2,NULL,12);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (24,'hernandezpilar','sucesion','civil 4','2022-07-10',4,6,NULL);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (25,'oldbridge concurso','concurso preventivo','comercial 3','2022-09-07',5,NULL,5);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (26,'tandil convocatoria','convocatoria asamblea','comercial 1','2022-10-03',9,NULL,3);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (27,'molinocristian','inscripcion testamento','civil 2','2022-05-17',8,10,NULL);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (28,'lopezvalentina','escrituracion','civil 7','2022-05-24',2,7,NULL);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (29,'lomas oficio','oficio','comercial 4','2022-08-28',13,NULL,2);
INSERT INTO juicios (`idJuicios`,`titulo`,`materia`,`juzgado`,`fecha`,`idDepartamentoJudicial`,`idCliente`,`idSociedades`) VALUES (30,'saavedrajose','particion herencia','civil 6','2022-10-09',10,4,NULL);

-- -----------------------------------------------------
-- tabla 'tramitesadministrativos'
-- -----------------------------------------------------

INSERT INTO tramitesadministrativos (`idTramitesAdministrativos`,`tipo`,`fecha`,`idEntesPublicos`,`idCliente`,`idPresupuestosSA`,`idPago`) VALUES (16,'inscripcion autoridades','2022-05-21',5,1,1,3);
INSERT INTO tramitesadministrativos (`idTramitesAdministrativos`,`tipo`,`fecha`,`idEntesPublicos`,`idCliente`,`idPresupuestosSA`,`idPago`) VALUES (17,'reforma estatuto','2022-11-02',8,2,4,5);
INSERT INTO tramitesadministrativos (`idTramitesAdministrativos`,`tipo`,`fecha`,`idEntesPublicos`,`idCliente`,`idPresupuestosSA`,`idPago`) VALUES (18,'transformacion','2022-12-27',7,9,5,4);
INSERT INTO tramitesadministrativos (`idTramitesAdministrativos`,`tipo`,`fecha`,`idEntesPublicos`,`idCliente`,`idPresupuestosSA`,`idPago`) VALUES (19,'escision','2022-04-16',3,5,7,3);
INSERT INTO tramitesadministrativos (`idTramitesAdministrativos`,`tipo`,`fecha`,`idEntesPublicos`,`idCliente`,`idPresupuestosSA`,`idPago`) VALUES (20,'inscripcion autoridades','2022-08-04',5,12,9,6);
INSERT INTO tramitesadministrativos (`idTramitesAdministrativos`,`tipo`,`fecha`,`idEntesPublicos`,`idCliente`,`idPresupuestosSA`,`idPago`) VALUES (21,'reforma estatuto','2022-09-28',8,13,10,5);
INSERT INTO tramitesadministrativos (`idTramitesAdministrativos`,`tipo`,`fecha`,`idEntesPublicos`,`idCliente`,`idPresupuestosSA`,`idPago`) VALUES (22,'cesion cuotas','2022-05-05',2,14,14,4);
INSERT INTO tramitesadministrativos (`idTramitesAdministrativos`,`tipo`,`fecha`,`idEntesPublicos`,`idCliente`,`idPresupuestosSA`,`idPago`) VALUES (23,'escision','2022-06-29',1,15,15,6);

-- -----------------------------------------------------
-- tabla 'tramitessocietarios'
-- -----------------------------------------------------

INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (1,'cesion cuotas','2022-07-15',1,2,NULL);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (2,'cambio sede ','2022-09-08',6,3,NULL);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (3,'fusion','2022-02-20',7,6,NULL);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (4,'cambio sede ','2022-06-10',9,8,NULL);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (5,'cesion cuotas','2022-11-22',11,11,NULL);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (6,'fusion','2022-01-16',13,12,NULL);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (7,'transformacion','2022-03-11',15,13,NULL);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (8,'cesion cuotas','2022-04-16',3,NULL,4);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (9,'cambio sede ','2022-10-05',5,NULL,7);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (10,'fusion','2022-08-13',10,NULL,2);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (11,'cambio sede ','2022-11-06',12,NULL,6);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (12,'cesion cuotas','2022-06-10',14,NULL,10);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (13,'fusion','2022-07-17',2,NULL,5);
INSERT INTO tramitessocietarios (`idTramitesSocietarios`,`tipo`,`fecha`,`idSociedades`,`idPresupuestosSA`,`idPresupuestosSRL`) VALUES (14,'transformacion','2022-09-08',8,NULL,8);
