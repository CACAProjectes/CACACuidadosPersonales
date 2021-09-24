/* PROFESSIONS */
DELETE FROM grupfuncional;
/*Grupos funcionales*/
INSERT INTO grupfuncional VALUES (1,'Cuidador de mascotas','Descripción de Cuidador de mascotas',1);
INSERT INTO grupfuncional VALUES (2,'Cuidador de personas','Descripción de Cuidador personal no sanitario',1);
INSERT INTO grupfuncional VALUES (3,'Monitor escolar','Descripción de Monitor de enseñanza',1);
INSERT INTO grupfuncional VALUES (4,'Monitor de entretenimiento','Descripción de Monitor de enseñanza',1);
INSERT INTO grupfuncional VALUES (5,'Monitor deportivo','Descripción de Monitor de enseñanza',1);
INSERT INTO grupfuncional VALUES (6,'Personal de recados','Descripción de Personal de tareas',1);
INSERT INTO grupfuncional VALUES (7,'Personal sanitario','Descripción de Personal de tareas',1);
/* */
DELETE FROM professio;
/*Personal sanitario*/
INSERT INTO professio VALUES (1,'Enfermero/a','Descripción de Enfermero/a',1);
INSERT INTO professio VALUES (2,'TCAI','Descripción de TCAI',1);
INSERT INTO professio VALUES (3,'Auxiliar de enfermería','Descripción de Auxiliar de enfermería',1);
INSERT INTO professio VALUES (4,'Fisioterapeuta','Descripción de Fisioterapeuta',1);
INSERT INTO professio VALUES (5,'Quiropráctico/Masajista','Descripción de Quiropráctico/Masajista',1);
INSERT INTO professio VALUES (6,'Nutricionista','Descripción de Nutricionista',1);
INSERT INTO professio VALUES (7,'Cuidador sanitario','Descripción de Cuidador sanitario',1);
/*Monitor de entretenimiento*/
INSERT INTO professio VALUES (8,'Monitor de tiempo libre','Descripción de Monitor de tiempo libre',1);
INSERT INTO professio VALUES (9,'Monitor de excursiones','Descripción de Monitor de excursiones',1);
INSERT INTO professio VALUES (10,'Monitor de fiestas/DJ/payaso)','Descripción de Monitor de fiestas (DJ, payaso)',1);
/*Monitor deportivo*/
INSERT INTO professio VALUES (11,'Monitor de zumba/fitness','Descripción de Monitor de zumba/spinner/fitness/...',1);
INSERT INTO professio VALUES (12,'Monitor de gym/culturismo','Descripción de Monitor de gym y culturismo',1);
INSERT INTO professio VALUES (13,'Entrenador personal','Descripción de Entrenador personal',1);
/*Monitor de enseñanza*/
INSERT INTO professio VALUES (14,'Profesor refuerzo escolar','Descripción de Profesor para refuerzo escolar',1);
INSERT INTO professio VALUES (15,'Profesor especializado','Descripción de Profesor de asignaturas específicas',1);
INSERT INTO professio VALUES (16,'Profesor tareas escolares','Descripción de Profesor para tareas escolares (deberes)',1);
/*Cuidador de personas*/
INSERT INTO professio VALUES (17,'Cuidador de personas mayores','Descripción de Canguro de personas mayores',1);
INSERT INTO professio VALUES (18,'Cuidador de niños','Descripción de Canguro de niños',1);
INSERT INTO professio VALUES (19,'Acompañante a colegios/CAP','Descripción de Acompañante a colegios, CAP,…',1);
/*Cuidador de mascotas*/
INSERT INTO professio VALUES (20,'Cuidador de mascotas','Descripción de Cuidador de mascotas',1);
INSERT INTO professio VALUES (21,'Acompañante de mascotas','Descripción de Acompañante de mascotas',1);
/*Personal de tareas*/
INSERT INTO professio VALUES (22,'Recadero de compras','Descripción de Recadero de compras',1);
INSERT INTO professio VALUES (23,'Recadero de gestiones','Descripción de Recadero de gestiones',1);
/* */
DELETE FROM REL_GF_PROF;
/*Personal sanitario*/
INSERT INTO REL_GF_PROF VALUES (7,1);
INSERT INTO REL_GF_PROF VALUES (7,2);
INSERT INTO REL_GF_PROF VALUES (7,3);
INSERT INTO REL_GF_PROF VALUES (7,4);
INSERT INTO REL_GF_PROF VALUES (7,5);
INSERT INTO REL_GF_PROF VALUES (7,6);
INSERT INTO REL_GF_PROF VALUES (7,7);
/*Monitor escolar*/
INSERT INTO REL_GF_PROF VALUES (3,14);
INSERT INTO REL_GF_PROF VALUES (3,15);
INSERT INTO REL_GF_PROF VALUES (3,16);
/*Cuidador de personas*/
INSERT INTO REL_GF_PROF VALUES (2,17);
INSERT INTO REL_GF_PROF VALUES (2,18);
INSERT INTO REL_GF_PROF VALUES (2,19);
/*Monitor deportivo*/
INSERT INTO REL_GF_PROF VALUES (5,11);
INSERT INTO REL_GF_PROF VALUES (5,12);
INSERT INTO REL_GF_PROF VALUES (5,13);
/*Monitor de entretenimiento*/
INSERT INTO REL_GF_PROF VALUES (4,8);
INSERT INTO REL_GF_PROF VALUES (4,9);
INSERT INTO REL_GF_PROF VALUES (4,10);
/*Cuidador de mascotas*/
INSERT INTO REL_GF_PROF VALUES (1,20);
INSERT INTO REL_GF_PROF VALUES (1,21);
/*Personal de tareas*/
INSERT INTO REL_GF_PROF VALUES (6,22);
INSERT INTO REL_GF_PROF VALUES (6,23);

/* SERVEIS */
/*Tipus de serveis*/
DELETE FROM tipusservei;
INSERT INTO tipusservei VALUES (1,'Servicios a mascotas','Descripción de Servicios sanitarios',1);
INSERT INTO tipusservei VALUES (2,'Servicios a personas','Descripción de de monitorización',1);
INSERT INTO tipusservei VALUES (3,'Servicios a escolares','Descripción de cuidados',1);
INSERT INTO tipusservei VALUES (4,'Servicios de entretenimiento','Descripción de recados',1);
INSERT INTO tipusservei VALUES (5,'Organización de fiestas/DJ','Descripción de recados',1);
INSERT INTO tipusservei VALUES (6,'Servicios a deportistas','Descripción de recados',1);
INSERT INTO tipusservei VALUES (7,'Servicios de recados','Descripción de recados',1);
INSERT INTO tipusservei VALUES (8,'Servicios sanitarios','Descripción de recados',1);
/*Serveis*/
DELETE FROM servei;
INSERT INTO servei VALUES (1,'Atender a personas','Descripción de Atender a clientes sanitarios',1);
INSERT INTO servei VALUES (2,'Atender a personas enfermas','Descripción de Atender a clientes sanitarios',1);
INSERT INTO servei VALUES (3,'Atender a escolares','Descripción de Atender a clientes no sanitarios',1);
INSERT INTO servei VALUES (4,'Organizar excursiones','Descripción de Atender a cliente deportivo/enseñanza',1);
INSERT INTO servei VALUES (5,'Atender a deportistas','Descripción de Servicio de entretenimiento',1);
INSERT INTO servei VALUES (6,'Realizar recados','Descripción de Servicio de fiestas/DJ/payaso/...',1);
INSERT INTO servei VALUES (7,'Atender a mascotas','Descripción de Atender a mascotas',1);
INSERT INTO servei VALUES (8,'Organizar fiestas/DJ','Descripción de Atender a mascotas',1);
/*Relación de servicios*/
/*Servicios a mascotas*/
DELETE FROM REL_TS_SERV;
INSERT INTO REL_TS_SERV VALUES (1,7);
/*Servicios a personas*/
INSERT INTO REL_TS_SERV VALUES (2,1);
/*Servicios a escolares*/
INSERT INTO REL_TS_SERV VALUES (3,3);
/*Servicios de entretenimiento*/
INSERT INTO REL_TS_SERV VALUES (4,4);
/*Organización de fiestas/DJ*/
INSERT INTO REL_TS_SERV VALUES (5,8);
/*Servicios a deportistas*/
INSERT INTO REL_TS_SERV VALUES (6,5);
/*Servicios de recados*/
INSERT INTO REL_TS_SERV VALUES (7,6);
/*Servicios sanitaros*/
INSERT INTO REL_TS_SERV VALUES (8,1);
INSERT INTO REL_TS_SERV VALUES (8,2);
/*Relación de servicios-Funcions*/
/*Servicios sanitarios*/
DELETE FROM REL_GF_TIPSERV;
INSERT INTO REL_GF_TIPSERV VALUES (1,1);    /*Cuidador de mascotas*/
INSERT INTO REL_GF_TIPSERV VALUES (2,2);    /*Cuidador personas*/
INSERT INTO REL_GF_TIPSERV VALUES (3,3);    /*Monitor escolar*/
INSERT INTO REL_GF_TIPSERV VALUES (4,4);    /*Monitor de entretenimiento*/
INSERT INTO REL_GF_TIPSERV VALUES (4,5);    /*Monitor de entretenimiento*/
INSERT INTO REL_GF_TIPSERV VALUES (5,6);    /*Monitor deportivo*/
INSERT INTO REL_GF_TIPSERV VALUES (6,7);    /*Personal de recados*/
INSERT INTO REL_GF_TIPSERV VALUES (7,8);	/*Personal sanitario*/
INSERT INTO REL_GF_TIPSERV VALUES (7,2);	/*Personal sanitario*/

COMMIT;