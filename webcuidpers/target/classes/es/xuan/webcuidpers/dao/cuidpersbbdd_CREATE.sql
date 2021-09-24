-- MySQL dump 10.13  Distrib 5.5.15, for osx10.6 (i386)
--
-- Host: localhost    Database: cellar
-- ------------------------------------------------------
-- Server version	5.7

-- DROP DATABASE IF EXISTS cuidpersbbdd;
-- CREATE DATABASE cuidpersbbdd
--   CHARACTER SET utf8
--   COLLATE utf8_general_ci;
  
-- USE cuidpersbbdd;

DROP TABLE IF EXISTS REL_RESERVA;
DROP TABLE IF EXISTS REL_AGE_SER_IND;
DROP TABLE IF EXISTS REL_SERV_PROF;
DROP TABLE IF EXISTS REL_TS_SERV;
DROP TABLE IF EXISTS REL_GF_PROF;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS professional;
DROP TABLE IF EXISTS grup;
DROP TABLE IF EXISTS tipus_servei;
DROP TABLE IF EXISTS servei;
DROP TABLE IF EXISTS persona;
DROP TABLE IF EXISTS grup_funcional;
DROP TABLE IF EXISTS professio;
DROP TABLE IF EXISTS adreca_client;



CREATE TABLE grup (
  id int(7) NOT NULL AUTO_INCREMENT,
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  id_client_responsable int(7) NOT NULL,  
  id_client_responsable_bis int(7) DEFAULT NULL,  
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE professio (
  id int(7) NOT NULL AUTO_INCREMENT,
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id, idioma),
  UNIQUE KEY(nom, idioma)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE grup_funcional (
  id int(7) NOT NULL AUTO_INCREMENT,
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id, idioma),
  UNIQUE KEY(nom, idioma)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE servei (
  id int(7) NOT NULL AUTO_INCREMENT,
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id, idioma),
  UNIQUE KEY(nom, idioma)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE tipus_servei (
  id int(7) NOT NULL AUTO_INCREMENT,
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id, idioma),
  UNIQUE KEY(nom, idioma)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE persona (
  id int(7) NOT NULL AUTO_INCREMENT,
  nif_nie varchar(15) NOT NULL,
  nom varchar(63) NOT NULL,
  cognoms varchar(255) DEFAULT NULL,
  data_naixement DATETIME DEFAULT NULL,
  telefon char(15) NOT NULL,
  telefon_bis char(15) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  adreca varchar(255) DEFAULT NULL,
  codi_postal char(5) DEFAULT NULL,
  localitat varchar(255) DEFAULT NULL,
  provincia varchar(255) DEFAULT NULL,
  pais varchar(255) DEFAULT NULL,  
  idioma char(2) DEFAULT 'es' NOT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY(telefon)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE professional (
  id_persona int(7) NOT NULL,
  id_professio int(7) NOT NULL,
  color char(7) DEFAULT '000000',
  PRIMARY KEY (id_persona, id_professio),
  FOREIGN KEY (id_persona)
	REFERENCES persona(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_professio)
	REFERENCES professio(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE client (
  id_persona int(7) NOT NULL,
  id_pers_contact_1 int(7),
  id_pers_contact_2 int(7),
  color char(7) DEFAULT '000000',
  PRIMARY KEY (id_persona),
  FOREIGN KEY (id_persona)
	REFERENCES persona(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE administratiu (
  id_persona int(7) NOT NULL,
  nivell int(1) NOT NULL,
  PRIMARY KEY (id_persona),
  FOREIGN KEY (id_persona)
	REFERENCES persona(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE REL_INFO_CLIENT (
	id_persona int(7) NOT NULL,
	data_info DATETIME NOT NULL,
	informacio varchar(255) NOT NULL,
  PRIMARY KEY (id_persona, data_info),
  FOREIGN KEY (id_persona)
	REFERENCES client(id_persona)
	ON UPDATE CASCADE
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE REL_TS_SERV (
  id_tipusservei int(7) NOT NULL,
  id_servei int(7) NOT NULL,
  PRIMARY KEY (id_servei, id_tipusservei),
  FOREIGN KEY (id_tipusservei)
	REFERENCES tipus_servei(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_servei)
	REFERENCES servei(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE REL_SERV_PROF (
  id_persona int(7) NOT NULL,
  id_servei int(7) NOT NULL,
  PRIMARY KEY (id_persona, id_servei),
  FOREIGN KEY (id_persona)
	REFERENCES professional(id_persona)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_servei)
	REFERENCES servei(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE REL_AGE_SER_IND (
  id_professional int(7) NOT NULL,
  id_client int(7) NOT NULL,
  data_cita_ini DATETIME NOT NULL,
  data_cita_fi DATETIME NOT NULL,
  PRIMARY KEY (id_professional, id_client, data_cita_ini),
  FOREIGN KEY (id_professional) 
	REFERENCES professional(id_persona)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_client)
	REFERENCES client(id_persona)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE REL_GF_PROF (
  id_grupfuncional int(7) NOT NULL,
  id_professio int(7) NOT NULL,
  PRIMARY KEY (id_professio, id_grupfuncional),
  FOREIGN KEY (id_grupfuncional)
	REFERENCES grup_funcional(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_professio)
	REFERENCES professio(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE REL_RESERVA (
  id_professional int(7) NOT NULL,
  id_client int(7) NOT NULL,
  id_servei int(7) NOT NULL,
  data_cita_ini DATETIME NOT NULL,
  data_cita_fi DATETIME NOT NULL,
  id_adreca int(7) DEFAULT NULL,
  servei varchar(255) NOT NULL,
  desc_servei varchar(255) DEFAULT NULL,
  PRIMARY KEY (id_professional, id_client, data_cita_ini),
  FOREIGN KEY (id_professional) 
	REFERENCES professional(id_persona)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_client)
	REFERENCES client(id_persona)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_servei)
	REFERENCES servei(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE		
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE adreca_client (
  id int(7) NOT NULL AUTO_INCREMENT,
  id_client int(7) NOT NULL,
  telefon char(15) NOT NULL,
  telefon_bis char(15) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  adreca varchar(255) DEFAULT NULL,
  codi_postal char(5) DEFAULT NULL,
  localitat varchar(255) DEFAULT NULL,
  provincia varchar(255) DEFAULT NULL,
  pais varchar(255) DEFAULT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_client)
	REFERENCES client(id_persona)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT;

