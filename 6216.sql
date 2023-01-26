DROP DATABASE IF EXISTS askisi;
CREATE DATABASE askisi;
USE askisi;

CREATE TABLE ipourgio
(`name_ipourgio` VARCHAR(25) NOT NULL DEFAULT'unknown',
 `odos_ipourgio` VARCHAR(30) NOT NULL DEFAULT'unknown',
 `city_ipourgio` VARCHAR(20) NOT NULL DEFAULT'unknown',
 `telephone_ipourgio` INT(10) NOT NULL DEFAULT'0',
PRIMARY KEY(`name_ipourgio`)
)ENGINE=InnoDB;

CREATE TABLE ipallilos
(`id_ipal` INT(8) NOT NULL AUTO_INCREMENT,
 `name_ipal` VARCHAR(25) NOT NULL DEFAULT'unknown',
 `lastName_ipal` VARCHAR(25) NOT NULL DEFAULT'unknown',
 `age_ipal` INT(3) NOT NULL DEFAULT'0',
 `gender_ipal` ENUM('FEMALE','MALE'),
PRIMARY KEY(`id_ipal`)
)ENGINE=InnoDB; 

CREATE TABLE works
(`name_workIp` VARCHAR(25) NOT NULL DEFAULT'unknown',
 `id_workIpal` INT(8) NOT NULL,
PRIMARY KEY(`name_workIp`,`id_workIpal`),
CONSTRAINT Work_Ipourgio
FOREIGN KEY(`name_workIp`) REFERENCES ipourgio(`name_ipourgio`)
ON DELETE CASCADE 
ON UPDATE CASCADE,
CONSTRAINT Work_Ipal
FOREIGN KEY(`id_workIpal`) REFERENCES ipallilos(`id_ipal`)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE simvasiouxos 
(`id_simvasiouxos` INT(8) NOT NULL DEFAULT'0',
 `diastima_simvaseis` INT(7) NOT NULL DEFAULT'0',
 `startDate_simvasiouxos` DATE NOT NULL ,
PRIMARY KEY(`id_simvasiouxos`),
CONSTRAINT Simvasioux_Ipal
FOREIGN KEY(`id_simvasiouxos`) REFERENCES ipallilos(`id_ipal`)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE=InnoDB;

INSERT INTO ipourgio
VALUES("oikonomikwn","KapoustinAthina","Athina",6949454790);

INSERT INTO ipallilos
VALUES(NULL,"Antreas","euagellou",30,'MALE');

INSERT INTO works
VALUES("oikonomikwn",1);

INSERT INTO simvasiouxos
VALUES(1,365,20171024);


