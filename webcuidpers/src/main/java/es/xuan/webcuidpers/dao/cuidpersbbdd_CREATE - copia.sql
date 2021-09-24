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

DROP TABLE IF EXISTS REL_GF_PROF;
DROP TABLE IF EXISTS grup_funcional;
CREATE TABLE grup_funcional (
  id int(7) NOT NULL AUTO_INCREMENT,
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id, idioma),
  UNIQUE KEY(nom, idioma)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS professio;
CREATE TABLE professio (
  id int(7) NOT NULL AUTO_INCREMENT,
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id, idioma),
  UNIQUE KEY(nom, idioma)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE REL_GF_PROF (
  id_grupfuncional int(7) NOT NULL,
  id_professio int(7) NOT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  PRIMARY KEY (id_professio, id_grupfuncional, idioma),
  FOREIGN KEY (id_grupfuncional, idioma)
	REFERENCES grup_funcional(id, idioma)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_professio, idioma)
	REFERENCES professio(id, idioma)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS REL_TS_SERV;
DROP TABLE IF EXISTS servei;
CREATE TABLE servei (
  id int(7) NOT NULL AUTO_INCREMENT,
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id, idioma),
  UNIQUE KEY(nom, idioma)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS tipus_servei;
CREATE TABLE tipus_servei (
  id int(7) NOT NULL AUTO_INCREMENT,
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  estat char(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id, idioma),
  UNIQUE KEY(nom, idioma)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE REL_TS_SERV (
  id_tipusservei int(7) NOT NULL,
  id_servei int(7) NOT NULL,
  idioma char(2) DEFAULT 'es' NOT NULL,
  PRIMARY KEY (id_servei, id_tipusservei, idioma),
  FOREIGN KEY (id_tipusservei, idioma)
	REFERENCES tipus_servei(id, idioma)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_servei, idioma)
	REFERENCES servei(id, idioma)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS professional;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS persona;
CREATE TABLE persona (
  id int(7) NOT NULL,  
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
  id int(7) NOT NULL,
  id_persona int(7) NOT NULL,
  id_professio int(7) NOT NULL,
  color char(7) DEFAULT '000000',
  PRIMARY KEY (id),
  UNIQUE KEY (id_persona, id_professio),
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
  id int(7) NOT NULL,
  id_persona int(7) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_persona)
	REFERENCES persona(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS grup;
CREATE TABLE grup (
  id int(7) NOT NULL,  
  nom varchar(63) NOT NULL,
  descripcio varchar(255) DEFAULT NULL,
  id_client_responsable int(7) NOT NULL,  
  id_client_responsable_bis int(7) DEFAULT NULL,  
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS REL_SERV_PROF;
CREATE TABLE REL_SERV_PROF (
  id_professional int(7) NOT NULL,
  id_servei int(7) NOT NULL,
  PRIMARY KEY (id_professional, id_servei),
  FOREIGN KEY (id_professional)
	REFERENCES professional(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_servei)
	REFERENCES servei(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS REL_AGE_SER_IND;
CREATE TABLE REL_AGE_SER_IND (
  id_professional int(7) NOT NULL,
  id_client int(7) NOT NULL,
  data_cita DATETIME NOT NULL,
  PRIMARY KEY (id_professional, id_client, data_cita),
  FOREIGN KEY (id_professional) 
	REFERENCES professional(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY (id_client)
	REFERENCES client(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT;

