DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE doctor
(doc_id INT(11)  NOT NULL AUTO_INCREMENT,
 name_doc VARCHAR(25) NOT NULL DEFAULT'unknown',
 lastname_doc VARCHAR(25) NOT NULL DEFAULT'unknown',
 gender_doc VARCHAR(8) NOT NULL,
 arithmosTaut_doc VARCHAR(20) NOT NULL DEFAULT'unknown',
 address_doc VARCHAR(20) NOT NULL DEFAULT 'unknown',
 numberAdr_doc INT(3) NOT NULL,
 city_doc VARCHAR(20) NOT NULL DEFAULT 'unknown',
 postalCode_doc INT(11) NOT NULL,
 officeNumber_doc BIGINT(20) NOT NULL,
PRIMARY KEY(doc_id)
)engine=InnoDB;

CREATE TABLE certificate
(date_cert DATE NOT NULL ,
 title_cert VARCHAR(20) NOT NULL DEFAULT'unknown',
 cert_id INT(11) NOT NULL,
 eidikotita SET('xeirourgos','psixiatros','kardiologos'),
PRIMARY KEY(title_cert,cert_id),
CONSTRAINT crtdoc
FOREIGN KEY(cert_id) REFERENCES doctor(doc_id)
ON DELETE CASCADE
ON UPDATE CASCADE)engine=InnoDB;

CREATE TABLE nosileytis
(id_nos INT(11) NOT NULL AUTO_INCREMENT,
 name_nos VARCHAR(25) NOT NULL DEFAULT'unknown',
 lastName_nos VARCHAR(25) NOT NULL DEFAULT'unknown',
 gender_nos VARCHAR(8) NOT NULL,
 arithmosTaut_nos VARCHAR(20) NOT NULL DEFAULT'unknown',
 address_nos VARCHAR(20) NOT NULL DEFAULT 'unknown',
 numberAdr_nos INT(3) NOT NULL,
 city_nos VARCHAR(20) NOT NULL DEFAULT 'unknown',
 postalCode_nos INT(11) NOT NULL,
 telephone_nos INT(10) NOT NULL,
PRIMARY KEY(id_nos)
)engine=InnoDB;

CREATE TABLE telephones
(tel_docId INT(11) NOT NULL,
 telNumber INT(11) NOT NULL,
PRIMARY KEY(tel_docId,telNumber),
CONSTRAINT telDoc
FOREIGN KEY(tel_docId) REFERENCES doctor(doc_id) 
ON DELETE CASCADE
ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE kliniki
(name_klin VARCHAR(20) NOT NULL DEFAULT'unknown',
 numberRooms_klin BIGINT(20) NOT NULL ,
 building ENUM('A','B','C','D'),
 floor_klin INT(7) NOT NULL,
 director_klin INT(11) NOT NULL,
 since_date DATE NOT NULL,
 to_date DATE  NOT NULL,
PRIMARY KEY(name_klin),
CONSTRAINT dirklin
FOREIGN KEY (director_klin) REFERENCES doctor(doc_id)
ON DELETE CASCADE
ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE docworks
(id_workingDoc INT(11) NOT NULL ,
 name_workKlin VARCHAR(20) NOT NULL DEFAULT'unknown',
PRIMARY KEY(id_workingDoc, name_workKlin),
CONSTRAINT workdoc
FOREIGN KEY(id_workingDoc) REFERENCES doctor(doc_id) 
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT workingklin
FOREIGN KEY(name_workKlin) REFERENCES kliniki(name_klin)
ON DELETE CASCADE 
ON UPDATE CASCADE)engine=InnoDB;

CREATE TABLE nosworks
(id_workingNos INT(11) NOT NULL ,
 name_workingklin VARCHAR(20) NOT NULL DEFAULT'unknown',
PRIMARY KEY(id_workingNos,name_workingklin),
CONSTRAINT worknos
FOREIGN KEY(id_workingNos) REFERENCES nosileytis (id_nos) 
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT workingklin2
FOREIGN KEY(name_workingklin) REFERENCES kliniki(name_klin)
ON DELETE CASCADE 
ON UPDATE CASCADE)engine=InnoDB;

CREATE TABLE patient
(id_pat INT(11) NOT NULL  AUTO_INCREMENT,
 name_pat VARCHAR(20) NOT NULL DEFAULT'unknown',
 lastname_pat VARCHAR(20) NOT NULL DEFAULT'unknown',
 gender_nos VARCHAR(8) NOT NULL,
 arithmosTaut_nos VARCHAR(20) NOT NULL DEFAULT'unknown',
 address_nos VARCHAR(20) NOT NULL DEFAULT 'unknown',
 numberAddress_nos INT(3) NOT NULL,
 city_nos VARCHAR(20) NOT NULL DEFAULT 'unknown',
 postalCode_nos INT(11) NOT NULL,
 klin_pat VARCHAR(20) NOT NULL DEFAULT'unknown',
PRIMARY KEY(id_pat),
CONSTRAINT patklin
FOREIGN KEY( klin_pat) REFERENCES kliniki(name_klin)
ON DELETE CASCADE
ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE medicines
(med_id INT(11) NOT NULL ,
 med_name VARCHAR(20) NOT NULL DEFAULT'unknown',
PRIMARY KEY(med_id,med_name),
CONSTRAINT medpatient
FOREIGN KEY(med_id) REFERENCES patient(id_pat)
ON DELETE CASCADE
ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE supervisorDoc
(supervisorDoc_id INT(11) NOT NULL,
 patient_id INT(11) NOT NULL,
PRIMARY KEY(supervisorDoc_id,patient_id)
CONSTRAINT supDoc
FOREIGN KEY(supervisorDoc_id) REFERENCES doctor(doc_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT patWdoc
FOREIGN KEY(patient_id) REFERENCES patient(id_pat)
ON DELETE CASCADE
ON UPDATE CASCADE)engine=InnoDB;

/*comment*/

INSERT INTO `doctor` 
VALUES(NULL,"Giannis","marakos","male","AH-1234","rodou",59,"patra",26002,32),
      (NULL,"Andreas","euaggelou","male","AH-1234567","Aratou",12,"patra",26400,57);

INSERT INTO `certificate` 
VALUES(19960718,"Ogkoxeirourgiki",1,'xeirourgos'),
      (20030904,"xeirismos",2,'kardiologos,xeirourgos');    

INSERT INTO `nosileytis`
VALUES (NULL,"eirini","gasteratou","female","AH-56789","Agias sofias",12,"athina",34567,6978),
       (NULL,"giwrgos","nikolopoulos","male","AH-2367","KapoustoDiminio",46,"Diminio",20600,6978);

INSERT INTO `telephones`
VALUES (1,6949234333),
       (2,6949874569);

INSERT INTO `kliniki`
VALUES ("aglaias kiriakou",5000,'A',5,1,20160511,20170929),
       ("Agios Andreas",76000,'D',8,2,20090922,20140524);

INSERT INTO `docworks`
VALUES (1,"aglaias kiriakou"),
       (2,"Agios Andreas");

INSERT INTO `nosworks`
VALUES (1,"aglaias kiriakou"),
       (2, "Agios Andreas");

INSERT INTO `patient`
VALUES (NULL,"alkis","marinos","male","AH-56987","gerokostopoulou",90,"Kozani",56790,"aglaias kiriakou"),
       (NULL,"konstantinos","stamikos","male","AH-4529","sofokleous",189,"messologi",26789,"Agios Andreas");

INSERT INTO `medicines`
VALUES (1,"Depon"),
       (2,"aerolin");

INSERT INTO `supervisorDoc`
VALUES (1,2),
       (2,1);                    


 
  
 
