-- ----------------------------------------------
-- PROFESSIONS
-- ----------------------------------------------
select * from grup_funcional;
select * from professio;
select * from REL_GF_PROF;

select gf.*, prof.* 
from grup_funcional gf
	left join REL_GF_PROF relgf on gf.id = relgf.id_grupfuncional and gf.estat = 1 and gf.idioma='es'
	left join professio prof on relgf.id_professio = prof.id and prof.estat = 1 and prof.idioma='es'
order by gf.nom;

update professio
set descripcio='Descripción de Animador socio-cultural'
where id = 2;
commit;
-- ----------------------------------------------
-- SERVEIS
-- ----------------------------------------------
select * from servei;
select * from tipus_servei;
select * from REL_TS_SERV;

/* Búsqueda de serveis a partir de tipus_servei - TOTS */
select ts.*, ser.*
from tipus_servei ts 
	left join REL_TS_SERV relts on ts.id = relts.id_tipusservei and ts.estat = 1 and ts.idioma='es'
	left join servei ser on relts.id_servei = ser.id and ser.estat = 1 and ser.idioma='es'
order by ts.nom, ser.nom;

-- ----------------------------------------------
-- PERSONES AMB UN DETERMINAT SERVEI
-- ----------------------------------------------
select prof.id, pers.*
from servei ser 
	join REL_SERV_PROF relts on ser.id = relts.id_servei and ser.estat = 1 and ser.idioma = 'es'
	join PROFESSIONAL prof on relts.id_professional = prof.id 
	join PERSONA pers on prof.id_persona = pers.id and pers.estat = 1
where
	ser.id = 6
order by pers.cognoms, pers.nom;


-- ----------------------------------------------
-- PERSONES AMB UN DETERMINAT SERVEI
-- ----------------------------------------------
select profs.id, pers.*, prof.*
from PERSONA pers 
	join PROFESSIONAL profs on pers.id = profs.id_persona and pers.estat = '1'
	join PROFESSIO prof on profs.id_professio = prof.id and prof.estat = '1' and prof.idioma = 'en'
	join REL_SERV_PROF relts on profs.id = relts.id_professional 
	join SERVEI ser on relts.id_servei = ser.id and ser.estat = '1' and ser.idioma = 'en'
where
	ser.id in (6,1,2,3)
order by pers.cognoms, pers.nom, prof.nom;

-- ----------------------------------------------
-- AGENDA DELS PROFESSIONALS
-- ----------------------------------------------
select rel.*, profs.color 
from PROFESSIONAL profs
	join REL_AGE_SER_IND rel on profs.id = rel.id_professional
where 
	profs.id in (1,2)	-- JUAN J. y ELISENDA
	and rel.data_cita between '2021-02-24 09:00:00' and '2021-02-26 09:00:00'
order by rel.data_cita;

-- ----------------------------------------------
-- DADES DEL PROFESSIONAL - GLOBAL
-- ----------------------------------------------
select pers.*, prof.*, rela.*, ser.*
from PROFESSIONAL profs
	join PROFESSIO prof on prof.id = profs.id_professio and prof.estat = '1' and prof.idioma = 'es'
	join PERSONA pers on pers.id = profs.id_persona and pers.estat = '1'
	join REL_AGE_SER_IND rela on profs.id = rela.id_professional 
	join REL_SERV_PROF rels on profs.id = rels.id_professional 
	join SERVEI ser on rels.id_servei = ser.id and ser.estat = '1' and ser.idioma = 'es'
	join REL_TS_SERV relts on relts.id_servei = ser.id

where
	profs.id = 2					-- JUAN J.
	and relts.id_tipusservei = 8	-- Servicios sanitarios a personas
order by rela.data_cita, ser.nom;

-- ----------------------------------------------
-- DADES DEL PROFESSIONAL - PROFESSIÓ - AGENDA
-- ----------------------------------------------
select pers.*, rel.*, profs.*
from PROFESSIONAL profs
	join PERSONA pers on pers.id = profs.id_persona and pers.estat = '1'
	join REL_AGE_SER_IND rel on profs.id = rel.id_professional 
where
	profs.id = 1					-- JUAN J.
	and rel.data_cita between '2021-02-22 00:00:00' and '2021-02-29 00:00:00'
order by rel.data_cita;

-- ----------------------------------------------
-- DADES DEL PROFESSIONAL - PROFESSIÓ - PROFESSIÓNS
-- ----------------------------------------------
select prof.*, profs.*, pers.*
from PROFESSIONAL profs
	join PROFESSIO prof on prof.id = profs.id_professio and prof.estat = '1' and prof.idioma = 'es'
	join PERSONA pers on pers.id = profs.id_persona and pers.estat = '1'
where
	profs.id_persona = 2	-- JUAN J.
order by prof.nom;

-- ----------------------------------------------
-- DADES DEL PROFESSIONAL - SERVEIS
-- ----------------------------------------------
select ser.* 
from REL_SERV_PROF rels 
	join SERVEI ser on rels.id_servei = ser.id and ser.estat = '1' and ser.idioma = 'es' 
	join REL_TS_SERV relts on relts.id_servei = ser.id 
where 
	rels.id_professional = 1
	and relts.id_tipusservei = 8
	order by ser.nom;
