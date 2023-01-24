DROP DATABASE IF EXISTS eshop;
CREATE DATABASE eshop;
USE eshop;

CREATE TABLE `CPU` (
  cpu_model  VARCHAR (20) NOT NULL,
  cpu-socket INT (6) NOT NULL, 
  cpu_company ENUM('INTEL' ,'AMD'),
  cpu_frequency VARCHAR (4) NOT NULL,
  cpu_cores INT(2) NOT NULL,
  `cpu_threads INT(2)  NOT NULL,
  `cpu_power`INT(3) NOT NULL,
  `cpu_l1Size`FLOAT (3.2)  NOT NULL,
 `cpu_price` FLOAT (3.2) NOT NULL,
PRIMARY KEY(`cpu_model`)
);

CREATE TABLE `MOBO` (
  `mobo_model  VARCHAR (20) NOT NULL,
  `mobo_socket`  INT (6) NOT NULL,
  `mobo_company` VARCHAR (20) NOT NULL,
  `mobo_maxRamFreq` VARCHAR (4) NOT NULL,
  `mobo_RamSlots` INT (3) NOT NULL,
 `mobo_RamType` SET ('DDR3','DDR4',DDR3 SO-DIMM','DDR4 SO-DIMM')NOT NULL,
`mobo_Size` SET ('uATX/MicroATX','ATX','ExtendedATX','MiniITX','SSI','Other') NOT NULL,
`mobo_price` FLOAT (3.2) NOT NULL,
 PRIMARY KEY((`mobo_model`)
);

CREATE TABLE connectsMobo_Cpu(
'mobo_model' VARCHAR(20) NOT NULL,
'cpu-model' VARCHAR(20) NOT NULL,
PRIMARY KEY('mobo_model','cpu_model'),
CONSTRAINT keyForCpuFrom_Connects
FOREIGN KEY ('cpu_model') REFERENCES CPU('cpu_model')
ON DELETE CASCADE ON UPDATE CASCADE ,
CONSTRAINT keyforMobo_Connects 
FOREIGN KEY('mobo_model') REFERENCES MOBO('mobo_model')
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `RAM` (
  `ram_model` VARCHAR (20) NOT NULL,
  `ram_company` VARCHAR (20) NOT NULL,
  `ram_type SET ('DDR3','DDR4','DDR3 SO-DIMM','DDR4 SO-DIMM'), 
  `ram_capacity`VARCHAR (4) NOT NULL,
  `ram_frequency`VARCHAR (4) NOT NULL,
  `ram_price` FLOAT (3.2) NOT NULL,
  PRIMARY KEY(`ram_model`)
);


CREATE TABLE connectsMobo_Ram(
'mobo_model' VARCHAR(20) NOT NULL,
'ram_model' VARCHAR(20) NOT NULL ,
PRIMARY KEY('mobo_model','cpu_model'),
CONSTRAINT keyForMoboR_Connects
FOREIGN KEY ('mobo_model') REFERENCES MOBO('mobo_model')
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT KeyForRam_Connects
FOREIGN KEY('ram model') REFERENCES RAM('ram_model')
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `GPU` (
  `gpu_model` VARCHAR (20) NOT NULL,
  `gpu_company` ENUM('NVIDIA' ,'AMD'),
  `gpu_supplyCompany` VARCHAR (20) NOT NULL,
  `gpu_memorySize` VARCHAR (10) NOT NULL,
  `gpu_memoryType` VARCHAR (10) NOT NULL,
 `gpu_baseClock` VARCHAR (10) NOT NULL,
 `gpu_memoryClock` VARCHAR (10) NOT NULL,
  `gpu_minPower` VARCHAR (10) NOT NULL,
  `gpu_price` FLOAT (3.2) NOT NULL,
PRIMARY KEY(`gpu_model`),
);

CREATE TABLE gpu_connectivity(
'gpu_model' VARCHAR(20) NOT NULL,
'gpu_connectivity' SET('DVI-D','DVI-I','Mini HDMI','HDMI','Display_Port','mini_DisplayPort'),
PRIMARY KEY('gpu_model','gpu_connectivity'),
CONSTRAINT KeyForGpuConnections
FOREIGN KEY ('gpu_connectivity') REFERENCES GPU('gpu_connectivity')
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `PSU` (
  `psu_code model` INT(9) NOT NULL,
  `psu_company` VARCHAR (20) NOT NULL,
  `psu_power` VARCHAR (10) NOT NULL,
   `psu_price` FLOAT (3.2) NOT NULL,
  PRIMARY KEY (`psu_code model`)
);

CREATE TABLE `CASE` (
  `case_codeModel`  VARCHAR (20) NOT NULL,
 `case_company` VARCHAR (20) NOT NULL,
  `case_price` FLOAT (3.2) NOT NULL,
  `case_size` SET ('Midi','Mini','Full Tower','Ultra Tower','Micro')
   PRIMARY KEY (`case_codeModel`)
  );

CREATE fits_CaseMobo(
'mobo_model' VARCHAR(20) NOT NULL,
'case_codeModel' VARCHAR(20) NOT NULL,
PRIMARY KEY('mobo_model','case_codeModel')
CONSTRAINT keyForCase_Fits
FOREIGN KEY ('case_codeModel') REFERENCES CASE('case_codeModel')
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT keyForMobo_fits
FOREIGN KEY ('mobo_model') REFERENCES MOBO('mobo_model')
ON DELETE CASCADE ON UPDATE CASCADE 
);


CREATE TABLE case_typeMoboConnectivity(
'case_codeModel' VARCHAR(20) NOT NULL,
'caseTypeMoboConnections' VARCHAR(10) SET('ATX','uATX','mini ITX') NOT NULL DEFAULT'ATX',
PRIMARY KEY('case_codeModel','caseTypeMoboConnections')
CONSTRAINT KeyForCaseConnections
FOREIGN KEY ('case_codeModel') REFERENCES CASE('case_codeModel')
ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE `HD` (
  `hd_codeModel` VARCHAR (20) NOT NULL,
  `hd_company` VARCHAR (20) NOT NULL,
  `hd_capacity` VARCHAR (20) NOT NULL,
  `hd_size` VARCHAR (20) NOT NULL,
  `hd_price` FLOAT (3.2) NOT NULL,
   PRIMARY KEY (`hd_codeModel`)
);

CREATE TABLE `SSD` (
 
 `hd_codeModel` VARCHAR (20) NOT NULL,
 `ssd_conectionType` VARCHAR (20) NOT NULL,
  `ssd_readSpeed` INT(3) NOT NULL,
  `ssd_writeSpeed` INT(3) NOT NULL,
PRIMARY KEY(
 `hd_codeModel` ),
  CONSTRAINT keyForSsd FOREIGN KEY (
 `hd_codeModel` ) REFERENCES HD(
 `hd_codeModel` ) 
  ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE `extHD` (
  `hd_codeModel` VARCHAR (20) NOT NULL,
  `exthd_connectionType` VARCHAR (20) NOT NULL,
  `exthd_exPower' ENUM ('YES','NO'),
PRIMARY KEY(`hd_codeModel`),
CONSTRAINT KeyForExtHD FOREIGN KEY((`hd_codeModel`) REFERENCES HD((`hd_codeModel`)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `HDD` (
  `hd_codeModel` VARCHAR (20) NOT NULL,
`hdd_connectionType` VARCHAR (20) NOT NULL,
  `hdd_cacheSize` VARCHAR (20) NOT NULL,
  `hdd_rpm` FLOAT (3,1) NOT NULL,
 PRIMARY KEY(`hd_codeModel`),
CONSTRAINT KeyForHdd FOREIGN KEY((`hd_codeModel`) REFERENCES HD((`hd_codeModel`)
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `CUSTOMER` (
  `customer_ID` INT(9) NOT NULL AUTO_INCREMENT,
  `customer_Name` VARCHAR(20) DEFAULT 'unknown',
  `customer_email` VARCHAR(20) NULL,
  `customer_lastName` VARCHAR(20) DEFAULT 'unknown',
  `customer_registrationDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`customer_ID`),
  );

CREATE TABLE customer_telephones(
'customer' INT(9) NOT NULL,
'telephones' INT(10) NULL,
PRIMARY KEY('customer','telephones'),
CONSTRAINT keyForCustomerTelephones
FOREIGN KEY ('customer') REFERENCES CUSTOMER('customer_ID')
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `CUSTOMER_CARD` (
  `customer_CardID` INT(9) NOT NULL AUTO_INCREMENT,
  `redeemed_points` INT(10) NULL ,
  `available_points` INT(10) NULL,
  `cardManager` INT(9) MOT NULL,
  PRIMARY KEY ('customer_CardID'),
  CONSTRAINT KeyForCustomerCard
  FOREIGN KEY(`cardManager` ) REFERENCES CUSTOMER(`customer_ID')
  ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `ORDER` (
  `order_ID` INT(10) NOT NULL AUTO_INCREMENT,
  `order_cost` FLOAT(5,2) NOT NULL,
  `order_productsTogether` BOOLEAN NOT NULL,
  `customer` INT(9) NOT NULL,
  `cpu` VARCHAR(20)  NULL,
  `mobo' VARCHAR(20)  NULL,
  `ram` VARCHAR(20)  NULL,
  `gpu` VARCHAR(20)  NULL,
  `psu` VARCHAR(20)  NULL,
  `case` VARCHAR(20)  NULL,
  `hd` VARCHAR(20)  NULL,
  PRIMARY KEY(`order_ID`,`customer`),
  CONSTRAINT orderCpu FOREIGN KEY(`cpu`) REFERENCES CPU('cpu_model')
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT orderMobo FOREIGN KEY(`mobo`) REFERENCES MOBO('mobo_model')
  ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT orderRam FOREIGN KEY(`ram`) REFERENCES RAM('ram_model')
  ON DELETE CASCADE ON UPDATE CASCADE, 
   CONSTRAINT orderGpu FOREIGN KEY(`gpu`) REFERENCES GPU('gpu_model')
  ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT orderPsu FOREIGN KEY(`psu`) REFERENCES PSU('psu_code_model')
  ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT orderCase FOREIGN KEY(`case`) REFERENCES CASE('case_codeModel')
  ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT orderHD FOREIGN KEY(`hd`) REFERENCES HD('hd_codeModel')
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `ADMINISTRATORS` (
  `admin_ID` INT(9) NOT NULL AUTO_INCREMENT,
  `admin_grade` ENUM('Senior','Junior'),
  `admin_name` VARCHAR(20) NULL DEFAULT 'UNKNOWN',
  `admin_lastname` VARCHAR(20) NULL DEFAULT'UNKNOWN',
  `admin_bio` TEXT NULL,
  `admin_email` VARCHAR(20) NULL ,
   `senior` INT(9) NULL,
   `salary` INT(9) NOT NULL,
   PRIMARY KEY(`admin_ID`),
   CONSTRAINT SelfRefernceAdmin FOREIGN KEY(`senior`) REFERENCES `ADMINISTRATORS`(`admin_ID`)
   ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT KeyForAdminSalary FOREIGN KEY(`salary`) REFERENCES ADMIN_SALARY(adminSalary_ID)
   ON DELETE CASCADE ON UPDATE CASCADE)
);

CREATE TABLE `ADMIN_SALARY` (
  `adminSalary_ID` INT (9) NOT NULL AUTO_INCREMENT,
   `adminSalary_month` DATE ,
  `adminSalary_price` FLOAT (3.2) NOT NULL,
  `adminSalary_year` YEAR (2),
   PRIMARY KEY (`adminSalary_ID`)
);
