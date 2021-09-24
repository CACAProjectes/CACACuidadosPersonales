INSERT INTO SERVEI VALUES (1,'Acompañar a adultos','Descripción de Acompañar a adultos','es',1);
INSERT INTO SERVEI VALUES (2,'Acompañar a colegios/academias','Descripción de Acompañar a colegios/academias','es',1);
INSERT INTO SERVEI VALUES (3,'Adiestrar mascotas','Descripción de Adiestrar mascotas','es',1);
INSERT INTO SERVEI VALUES (4,'Atender a adultos','Descripción de Atender a adultos','es',1);
INSERT INTO SERVEI VALUES (5,'Atender a niños/jóvenes','Descripción de Atender a niños/jóvenes','es',1);
INSERT INTO SERVEI VALUES (6,'Atender a personas enfermas','Descripción de Atender a personas enfermas','es',1);
INSERT INTO SERVEI VALUES (7,'Atender a personas minusvàlides/discapacitadas','Descripción de Atender a personas minusvàlides/discapacitadas','es',1);
INSERT INTO SERVEI VALUES (8,'Cuidar/atender a adultos','Descripción de Cuidar/atender a adultos','es',1);
INSERT INTO SERVEI VALUES (9,'Cuidar/atender a niños/jóvenes','Descripción de Cuidar/atender a niños/jóvenes','es',1);
INSERT INTO SERVEI VALUES (10,'Cuidar/mantener mascotas','Descripción de Cuidar/mantener mascotas','es',1);
INSERT INTO SERVEI VALUES (11,'Entrenador personal','Descripción de Entrenador personal','es',1);
INSERT INTO SERVEI VALUES (12,'Monitor de actividades fisico-deportivas','Descripción de Monitor de actividades fisico-deportivas','es',1);
INSERT INTO SERVEI VALUES (13,'Monitor de animación socio-deportivas','Descripción de Monitor de animación socio-deportivas','es',1);
INSERT INTO SERVEI VALUES (14,'Monitor de gym/culturismo','Descripción de Monitor de gym/culturismo','es',1);
INSERT INTO SERVEI VALUES (15,'Monitor de juegos','Descripción de Monitor de juegos','es',1);
INSERT INTO SERVEI VALUES (16,'Monitor de tiempo libre','Descripción de Monitor de tiempo libre','es',1);
INSERT INTO SERVEI VALUES (17,'Organizar conciertos','Descripción de Organizar conciertos','es',1);
INSERT INTO SERVEI VALUES (18,'Organizar fiestas','Descripción de Organizar fiestas','es',1);
INSERT INTO SERVEI VALUES (19,'Pasear mascotas','Descripción de Pasear mascotas','es',1);
INSERT INTO SERVEI VALUES (20,'Realizar deberes','Descripción de Realizar deberes','es',1);
INSERT INTO SERVEI VALUES (21,'Realizar gestiones a terceros (CAP, Banco, Supermercado,...)','Descripción de Realizar gestiones a terceros (CAP, Banco, Supermercado,...)','es',1);
INSERT INTO SERVEI VALUES (22,'Realizar recados/encargos','Descripción de Realizar recados/encargos','es',1);
INSERT INTO SERVEI VALUES (23,'Reforzar estudios','Descripción de Reforzar estudios','es',1);
--
INSERT INTO SERVEI VALUES (6,'Atendre persones malaltes','Descripció d''Atendre persones malaltes','ca',1);
INSERT INTO SERVEI VALUES (6,'Caring for sick people','Description of Caring for sick people','en',1);

INSERT INTO TIPUS_SERVEI VALUES (1,'Servicios a adultos','Descripción de Servicios a adultos','es',1);
INSERT INTO TIPUS_SERVEI VALUES (2,'Servicios a deportistas','Descripción de Servicios a deportistas','es',1);
INSERT INTO TIPUS_SERVEI VALUES (3,'Servicios a estudiantes','Descripción de Servicios a estudiantes','es',1);
INSERT INTO TIPUS_SERVEI VALUES (4,'Servicios a mascotas','Descripción de Servicios a mascotas','es',1);
INSERT INTO TIPUS_SERVEI VALUES (5,'Servicios a niños/jóvenes','Descripción de Servicios a niños/jóvenes','es',1);
INSERT INTO TIPUS_SERVEI VALUES (6,'Servicios de recados/encargos','Descripción de Servicios de recados/encargos','es',1);
INSERT INTO TIPUS_SERVEI VALUES (7,'Servicios para actividades lúdicas','Descripción de Servicios para actividades lúdicas','es',1);
INSERT INTO TIPUS_SERVEI VALUES (8,'Servicios sanitarios a personas','Descripción de Servicios sanitarios a personas','es',1);

INSERT INTO REL_TS_SERV VALUES (4,19);
INSERT INTO REL_TS_SERV VALUES (4,3);
INSERT INTO REL_TS_SERV VALUES (4,10);
INSERT INTO REL_TS_SERV VALUES (5,2);
INSERT INTO REL_TS_SERV VALUES (5,9);
INSERT INTO REL_TS_SERV VALUES (1,1);
INSERT INTO REL_TS_SERV VALUES (1,8);
INSERT INTO REL_TS_SERV VALUES (3,20);
INSERT INTO REL_TS_SERV VALUES (3,23);
INSERT INTO REL_TS_SERV VALUES (7,17);
INSERT INTO REL_TS_SERV VALUES (7,18);
INSERT INTO REL_TS_SERV VALUES (7,15);
INSERT INTO REL_TS_SERV VALUES (7,16);
INSERT INTO REL_TS_SERV VALUES (2,11);
INSERT INTO REL_TS_SERV VALUES (2,12);
INSERT INTO REL_TS_SERV VALUES (2,13);
INSERT INTO REL_TS_SERV VALUES (2,14);
INSERT INTO REL_TS_SERV VALUES (6,21);
INSERT INTO REL_TS_SERV VALUES (6,22);
INSERT INTO REL_TS_SERV VALUES (8,6);
INSERT INTO REL_TS_SERV VALUES (8,9);
INSERT INTO REL_TS_SERV VALUES (8,4);
INSERT INTO REL_TS_SERV VALUES (8,7);

INSERT INTO grup_funcional VALUES (1,'Animador socio-cultural','Descripción de Animador socio-cultural','es',1);
INSERT INTO grup_funcional VALUES (2,'Cuidador de adultos','Descripción de Cuidador de adultos','es',1);
INSERT INTO grup_funcional VALUES (3,'Cuidador de mascotas','Descripción de Cuidador de mascotas','es',1);
INSERT INTO grup_funcional VALUES (4,'Cuidador infantil/juvenil','Descripción de Cuidador infantil/juvenil','es',1);
INSERT INTO grup_funcional VALUES (5,'Monitor deportivo','Descripción de Monitor deportivo','es',1);
INSERT INTO grup_funcional VALUES (6,'Monitor escolar','Descripción de Monitor escolar','es',1);
INSERT INTO grup_funcional VALUES (7,'Personal para recados/encargos','Descripción de Personal para recados/encargos','es',1);
INSERT INTO grup_funcional VALUES (8,'Personal sanitario','Descripción de Personal sanitario','es',1);

INSERT INTO professio VALUES (1,'Acondicionamiento físico','Descripción de Acondicionamiento físico','es',1);
INSERT INTO professio VALUES (2,'Animador sòcio-cultural','Descripción de Animador sòcio-cultural','es',1);
INSERT INTO professio VALUES (3,'Auxiliar de enfermería','Descripción de Auxiliar de enfermería','es',1);
INSERT INTO professio VALUES (4,'CAFEMN','Descripción de CAFEMN','es',1);
INSERT INTO professio VALUES (5,'Cuidador de minusválidos/discapacitados','Descripción de Cuidador de minusválidos/discapacitados','es',1);
INSERT INTO professio VALUES (6,'Cuidador sanitario','Descripción de Cuidador sanitario','es',1);
INSERT INTO professio VALUES (7,'DJ','Descripción de DJ','es',1);
INSERT INTO professio VALUES (8,'Enfermero/a','Descripción de Enfermero/a','es',1);
INSERT INTO professio VALUES (9,'Fisioterapeuta','Descripción de Fisioterapeuta','es',1);
INSERT INTO professio VALUES (10,'Monitor de ludotecas','Descripción de Monitor de ludotecas','es',1);
INSERT INTO professio VALUES (11,'Nutricionista','Descripción de Nutricionista','es',1);
INSERT INTO professio VALUES (12,'Personal no especializado','Descripción de Personal no especializado','es',1);
INSERT INTO professio VALUES (13,'Profesional de medio ambiente','Descripción de Profesional de medio ambiente','es',1);
INSERT INTO professio VALUES (14,'Profesional de veterianaria','Descripción de Profesional de veterianaria','es',1);
INSERT INTO professio VALUES (15,'Profesional de zoologia','Descripción de Profesional de zoologia','es',1);
INSERT INTO professio VALUES (16,'Profesor para BATCHILLERATO','Descripción de Profesor para BATCHILLERATO','es',1);
INSERT INTO professio VALUES (17,'Profesor para CICLOS','Descripción de Profesor para CICLOS','es',1);
INSERT INTO professio VALUES (18,'Profesor para ESO','Descripción de Profesor para ESO','es',1);
INSERT INTO professio VALUES (19,'Profesor para infantil','Descripción de Profesor para infantil','es',1);
INSERT INTO professio VALUES (20,'Profesor para primaria','Descripción de Profesor para primaria','es',1);
INSERT INTO professio VALUES (21,'Profesor para secundaria','Descripción de Profesor para secundaria','es',1);
INSERT INTO professio VALUES (22,'Profesor para UNIVERSITARIOS','Descripción de Profesor para UNIVERSITARIOS','es',1);
INSERT INTO professio VALUES (23,'Quiropráctico/Masajista','Descripción de Quiropráctico/Masajista','es',1);
INSERT INTO professio VALUES (24,'TCAI','Descripción de TCAI','es',1);
--
INSERT INTO professio VALUES (24,'TCAI','Descripció de TCAI','ca',1);
INSERT INTO professio VALUES (24,'TCAI','Description of TCAI','en',1);

INSERT INTO REL_GF_PROF VALUES (3,12);
INSERT INTO REL_GF_PROF VALUES (3,13);
INSERT INTO REL_GF_PROF VALUES (3,14);
INSERT INTO REL_GF_PROF VALUES (3,15);
INSERT INTO REL_GF_PROF VALUES (4,12);
INSERT INTO REL_GF_PROF VALUES (2,12);
INSERT INTO REL_GF_PROF VALUES (6,16);
INSERT INTO REL_GF_PROF VALUES (6,17);
INSERT INTO REL_GF_PROF VALUES (6,18);
INSERT INTO REL_GF_PROF VALUES (6,19);
INSERT INTO REL_GF_PROF VALUES (6,20);
INSERT INTO REL_GF_PROF VALUES (6,21);
INSERT INTO REL_GF_PROF VALUES (6,22);
INSERT INTO REL_GF_PROF VALUES (1,2);
INSERT INTO REL_GF_PROF VALUES (1,7);
INSERT INTO REL_GF_PROF VALUES (1,10);
INSERT INTO REL_GF_PROF VALUES (1,12);
INSERT INTO REL_GF_PROF VALUES (5,1);
INSERT INTO REL_GF_PROF VALUES (5,4);
INSERT INTO REL_GF_PROF VALUES (7,12);
INSERT INTO REL_GF_PROF VALUES (8,5);
INSERT INTO REL_GF_PROF VALUES (8,6);
INSERT INTO REL_GF_PROF VALUES (8,3);
INSERT INTO REL_GF_PROF VALUES (8,8);
INSERT INTO REL_GF_PROF VALUES (8,9);
INSERT INTO REL_GF_PROF VALUES (8,11);
INSERT INTO REL_GF_PROF VALUES (8,23);
INSERT INTO REL_GF_PROF VALUES (8,24);

INSERT INTO persona VALUES(1,'52198862V','JUAN JESÚS','CAMPOS PULIDO','1971-02-12','626924434','935884178','campospulido@gmail.com','C/MÚSICA 6, 2º-4ª','08191','RUBÍ','BARCELONA','ESPAÑA','es',1);
INSERT INTO persona VALUES(2,'43508781A','ELISENDA','CANALS GUIMERÀ','1971-04-17','636819832','935884178','elisendacanals@hotmail.com','C/MÚSICA 6, 2º-4ª','08191','RUBÍ','BARCELONA','ESPAÑA','es',1);
INSERT INTO persona VALUES(3,'47743138Z','MIQUEL','CAMPOS CANALS','2001-09-10','123456789','','miquel.campos.canals@gmail.com','C/MÚSICA 6, 2º-4ª','08191','RUBÍ','BARCELONA','ESPAÑA','es',1);
INSERT INTO persona VALUES(4,'47743139S','MARTA ','CAMPOS CANALS','2003-04-17','123456790','','marta.campos.canals@gmail.com','C/MÚSICA 6, 2º-4ª','08191','RUBÍ','BARCELONA','ESPAÑA','es',1);
INSERT INTO persona VALUES(5,'47743141Z','HELENA','CAMPOS CANALS','2008-07-23','123456791','','helena.campos.canals@gmail.com','C/MÚSICA 6, 2º-4ª','08191','RUBÍ','BARCELONA','ESPAÑA','es',1);

INSERT INTO professional VALUES(2,24,'ff8080');	# Elisenda - TCAI
INSERT INTO professional VALUES(1,24,'0080ff');	# Juan J. - TCAI
INSERT INTO professional VALUES(1,22,'0080ff');	# Juan J. - Profesor para UNIVERSITARIOS

INSERT INTO professional VALUES(3,12,'0080aa');	# Miquel - Personal no especializado
INSERT INTO professional VALUES(4,12,'0080bb');	# Miquel - Personal no especializado
INSERT INTO professional VALUES(5,12,'0080cc');	# Miquel - Personal no especializado


INSERT INTO administratiu VALUES(1,5);	# Juan J.

-- ALTER TABLE client ADD column id_pers_contact_1 int(7) AFTER id_persona;
-- ALTER TABLE client ADD column id_pers_contact_2 int(7) AFTER id_pers_contact_1;

INSERT INTO client VALUES(1,2,null,'ff8000');
INSERT INTO client VALUES(2,1,null,'ff8010');
INSERT INTO client VALUES(3,1,2,'ff8020');
INSERT INTO client VALUES(4,1,2,'ff8030');
INSERT INTO client VALUES(5,1,2,'ff8040');

INSERT INTO REL_INFO_CLIENT VALUES(3,'2021-02-23 09:00:00','El Miquel no tiene información relevant.');		# Miquel
INSERT INTO REL_INFO_CLIENT VALUES(4,'2021-02-23 09:00:00','La Marta no tiene información relevant.');		# Marta
INSERT INTO REL_INFO_CLIENT VALUES(5,'2021-02-23 09:00:00','La Helena no tiene información relevant.');		# Helena


INSERT INTO grup VALUES(1,'GRUP EXCURSIONISTA RUBÍ','Descripció del grup excursionista de Rubí',1,2);

INSERT INTO REL_SERV_PROF VALUES(1,4);		# Elisenda
INSERT INTO REL_SERV_PROF VALUES(1,5);
INSERT INTO REL_SERV_PROF VALUES(1,6);
INSERT INTO REL_SERV_PROF VALUES(1,7);
INSERT INTO REL_SERV_PROF VALUES(1,8);
INSERT INTO REL_SERV_PROF VALUES(1,9);
INSERT INTO REL_SERV_PROF VALUES(2,4);		# Juan J.
INSERT INTO REL_SERV_PROF VALUES(2,5);
INSERT INTO REL_SERV_PROF VALUES(2,6);
INSERT INTO REL_SERV_PROF VALUES(2,7);
INSERT INTO REL_SERV_PROF VALUES(2,8);
INSERT INTO REL_SERV_PROF VALUES(2,9);

INSERT INTO REL_SERV_PROF VALUES(5,19);		# Helena
INSERT INTO REL_SERV_PROF VALUES(5,10);
INSERT INTO REL_SERV_PROF VALUES(3,19);		# Miquel
INSERT INTO REL_SERV_PROF VALUES(4,19);		# Marta


DELETE FROM REL_AGE_SER_IND;
INSERT INTO REL_AGE_SER_IND VALUES(2,3,'2021-02-23 09:00:00','2021-02-23 09:00:00');		# Elisenda
INSERT INTO REL_AGE_SER_IND VALUES(2,3,'2021-02-24 09:00:00','2021-02-23 09:00:00');		# Elisenda
INSERT INTO REL_AGE_SER_IND VALUES(2,4,'2021-02-25 09:00:00','2021-02-23 09:00:00');		# Elisenda

INSERT INTO REL_AGE_SER_IND VALUES(1,3,'2021-02-23 09:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,4,'2021-02-24 10:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,5,'2021-02-25 11:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,4,'2021-02-26 10:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,4,'2021-02-27 11:00:00','2021-02-23 09:00:00');		# Juan J.

INSERT INTO REL_AGE_SER_IND VALUES(2,3,'2021-03-01 09:00:00','2021-02-23 09:00:00');		# Elisenda
INSERT INTO REL_AGE_SER_IND VALUES(2,3,'2021-03-02 11:00:00','2021-02-23 09:00:00');		# Elisenda
INSERT INTO REL_AGE_SER_IND VALUES(2,4,'2021-03-03 10:00:00','2021-02-23 09:00:00');		# Elisenda

INSERT INTO REL_AGE_SER_IND VALUES(1,3,'2021-03-01 07:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,4,'2021-03-03 12:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,5,'2021-03-04 11:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,4,'2021-03-06 10:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,4,'2021-03-07 07:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,4,'2021-03-07 08:00:00','2021-02-23 09:00:00');		# Juan J.
INSERT INTO REL_AGE_SER_IND VALUES(1,4,'2021-03-07 23:00:00','2021-02-23 09:00:00');		# Juan J.

/*
  REL_RESERVA
  id_professional int(7) NOT NULL,
  id_client int(7) NOT NULL,
  id_servei int(7) NOT NULL,
  data_cita DATETIME NOT NULL,
  id_adreca int(7) DEFAULT NULL,
  servei varchar(255) NOT NULL,
  desc_servei

  adreca_client
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
  estat

  REL_AGE_SER_IND
  id_professional int(7) NOT NULL,
  id_client int(7) NOT NULL,
  data_cita

  idProfessional: 1 - IdClient: 3 - IdTipusServei: 4 - Horaris: 2021-3-18_7:00:00,2021-3-18_8:00:00, - Adreca: Música!08191!Rubí!Barcelona - Servei: ser - Descripció servei: desc

*/
-- DELETE FROM adreca_client;
insert into adreca_client (id_client, telefon,telefon_bis, email, adreca, codi_postal, localitat, provincia, pais) values(3,'','','','C/Música 6, 2º-4ª','08191','Rubí','Barcelona','España');
insert into REL_RESERVA values(1,3,4,'2021-3-18_8:00:00','2021-03-18 09:00:00',LAST_INSERT_ID(), 'Cuidar avi de 65 anys','Venir pel matí fins que arribi la seva filla');
insert into REL_AGE_SER_IND values(1,3,'2021-3-18_8:00:00','2021-03-18 09:00:00');

commit;


