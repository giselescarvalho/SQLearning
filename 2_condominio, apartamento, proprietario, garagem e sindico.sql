-- condominio, apartamento, proprietario, garagem e sindico

-- 1ª parte criando tabelas e colunas

create schema agendatres;

CREATE TABLE `agendatres`.`tbsindico` (
  `idMatriculaSindico` INT NOT NULL AUTO_INCREMENT,
  `nomeSindico` VARCHAR(45) NOT NULL,
  `logradouroSindico` VARCHAR(45) NOT NULL,
  `telefoneSindico` VARCHAR(45) NOT NULL,
  `codCondominio` INT NOT NULL,
  PRIMARY KEY (`idMatriculaSindico`));

CREATE TABLE `agendatres`.`tbgaragem` (
  `idVagaGaragem` INT NOT NULL AUTO_INCREMENT,
  `numeroGaragem` INT NOT NULL,
  `tipoGaragem` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idVagaGaragem`));

CREATE TABLE `agendatres`.`tbproprietario` (
  `idProprietario` INT NOT NULL AUTO_INCREMENT,
  `nomeProprietario` VARCHAR(45) NOT NULL,
  `rgProprietario` BIGINT(9) NOT NULL,
  `telefoneProprietario` VARCHAR(45) NOT NULL,
  `emailProprietario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProprietario`));

CREATE TABLE `agendatres`.`tbapartamento` (
  `idApartamento` INT NOT NULL AUTO_INCREMENT,
  `numeroApartamento` INT NOT NULL,
  `tipoApartamento` VARCHAR(1) NOT NULL,
  `codCondominio` INT NOT NULL,
  `codProprietario` INT NOT NULL,
  `codGaragem` INT NOT NULL,
  PRIMARY KEY (`idApartamento`));

CREATE TABLE `agendatres`.`tbcondominio` (
  `idCondominio` INT NOT NULL AUTO_INCREMENT,
  `nomeCondominio` VARCHAR(45) NOT NULL,
  `logradouroCondominio` VARCHAR(45) NOT NULL,
  `codSindico` INT NOT NULL,
  PRIMARY KEY (`idCondominio`));

-- 2ª parte fazendo relação FK

-- FKs na Apartamento
ALTER TABLE `agendatres`.`tbapartamento` 
ADD INDEX `idVagaGaragem_idx` (`codGaragem` ASC) VISIBLE;
;
ALTER TABLE `agendatres`.`tbapartamento` 
ADD CONSTRAINT `idVagaGaragem`
  FOREIGN KEY (`codGaragem`)
  REFERENCES `agendatres`.`tbgaragem` (`idVagaGaragem`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
;
ALTER TABLE `agendatres`.`tbapartamento` 
ADD INDEX `idProprietario_idx` (`codProprietario` ASC) VISIBLE,
ADD INDEX `idCondominio_idx` (`codCondominio` ASC) VISIBLE;
;
ALTER TABLE `agendatres`.`tbapartamento` 
ADD CONSTRAINT `idProprietario`
  FOREIGN KEY (`codProprietario`)
  REFERENCES `agendatres`.`tbproprietario` (`idProprietario`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `idCondominio`
  FOREIGN KEY (`codCondominio`)
  REFERENCES `agendatres`.`tbcondominio` (`idCondominio`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- FK na Condominio
ALTER TABLE `agendatres`.`tbcondominio` 
ADD INDEX `idMatriculaSindico_idx` (`codSindico` ASC) VISIBLE;
;
ALTER TABLE `agendatres`.`tbcondominio` 
ADD CONSTRAINT `idMatriculaSindico`
  FOREIGN KEY (`codSindico`)
  REFERENCES `agendatres`.`tbsindico` (`idMatriculaSindico`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- FK na Sindico, pois 1:1 condomínio:síndico
ALTER TABLE `agendatres`.`tbsindico` 
ADD INDEX `idCondominio_idx` (`codCondominio` ASC) VISIBLE;
;
ALTER TABLE `agendatres`.`tbsindico` 
ADD CONSTRAINT `idCondominio`
  FOREIGN KEY (`codCondominio`)
  REFERENCES `agendatres`.`tbcondominio` (`idCondominio`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

