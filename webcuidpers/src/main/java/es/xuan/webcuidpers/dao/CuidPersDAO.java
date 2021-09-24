package es.xuan.webcuidpers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import es.xuan.webcuidpers.model.Agenda;
import es.xuan.webcuidpers.model.Client;
import es.xuan.webcuidpers.model.GrupFuncional;
import es.xuan.webcuidpers.model.Informacio;
import es.xuan.webcuidpers.model.Persona;
import es.xuan.webcuidpers.model.Professio;
import es.xuan.webcuidpers.model.Professional;
import es.xuan.webcuidpers.model.Resultat;
import es.xuan.webcuidpers.model.Servei;
import es.xuan.webcuidpers.model.TipusServei;
/**
 * @author Juan J. Campos
 */
public class CuidPersDAO {	

	public Resultat guardarServei(int pIdProfessional, int pIdClient, int pIdTipusServei, String pHoraris, String pAdreca, String pServei, String pDescServei) {
		Connection conn = null;
		Resultat res = new Resultat();
		System.out.println("idProfessional: " + pIdProfessional +
				" - IdClient: " + pIdClient +
				" - IdTipusServei: " + pIdTipusServei +
				" - Horaris: " + pHoraris +
				" - Adreca: " + pAdreca +
				" - Servei: " + pServei +
				" - Descripció servei: " + pDescServei
				);
        // insert into adreca_client (id_client, telefon,telefon_bis, email, adreca, codi_postal, localitat, provincia, pais) values(3,'','','','C/Música 6, 2º-4ª','08191','Rubí','Barcelona','España');
		String sql1 = "insert into adreca_client (id_client, telefon, telefon_bis, email, adreca, codi_postal, localitat, provincia, pais) values(?,'','','',?,?,?,?,?)";
		// insert into REL_RESERVA values(1,3,4,'2021-3-18_8:00:00_9:00:00',LAST_INSERT_ID(), 'Cuidar avi de 65 anys','Venir pel matí fins que arribi la seva filla');
		String sql2 = "insert into REL_RESERVA values(?,?,?,?,?,LAST_INSERT_ID(),?,?)";
		// insert into REL_AGE_SER_IND values(1,3,'2021-3-18_8:00:00_9:00:00');
		String sql3 = "insert into REL_AGE_SER_IND values(?,?,?,?)";		
	    try {
	    	conn = ConnectionHelper.getConnection();
	        conn.setAutoCommit(false);	        
	        ///////////////////////////////
	        // adreca_client
	        ///////////////////////////////
	        PreparedStatement ps = conn.prepareStatement(sql1);	 
	        ps.setInt(1, pIdClient);			// ID CLIENT
	        // Adreça
	        String adreca[] = pAdreca.split("!");
	        if (adreca.length > 4) {
		        ps.setString(2, adreca[0]);			// Adreça
		        ps.setString(3, adreca[1]);			// Codi postal
		        ps.setString(4, adreca[2]);			// Localitat
		        ps.setString(5, adreca[3]);			// Provincia
		        ps.setString(6, adreca[4]);			// País
	        }
	        int iRes = ps.executeUpdate();
	        if (iRes == 0) {	        	
	        	res.setCodi(9999);
	        	res.setDescripcio("CuidPersDAO.guardarServei.SQL1");
	        	conn.rollback();
	        	return res;
	        }
	        String horaris[] = pHoraris.split(",");
	        for (int i=0;i<horaris.length;i++) {
		        ///////////////////////////////
		        //	REL_RESERVA
		        ///////////////////////////////
	        	// SQL2
		        ps = conn.prepareStatement(sql2);	
		        ps.setInt(1, pIdProfessional);						// ID PROFESSIONAL
		        ps.setInt(2, pIdClient);							// ID CLIENT
		        ps.setInt(3, pIdTipusServei);						// ID SERVEI
		        String horarisIniFi[] = horaris[i].split("_");
		        //ps.setString(4, horaris[i].replaceAll("_", " "));			// HORARI INI: 2021-02-24_09:00:00 -> 2021-02-24 09:00:00
		        ps.setString(4, horarisIniFi[0] + " " + horarisIniFi[1]);	// HORARI INI: 2021-02-24_09:00:00 -> 2021-02-24 09:00:00
		        ps.setString(5, horarisIniFi[0] + " " + horarisIniFi[2]);	// HORARI FI: 2021-02-24_09:00:00 -> 2021-02-24 09:00:00
		        ps.setString(6, pServei);							// SERVEI
		        ps.setString(7, pDescServei);						// DESC SERVEI
		        iRes = ps.executeUpdate();
		        if (iRes == 0) {	        	
		        	res.setCodi(9999);
		        	res.setDescripcio("CuidPersDAO.guardarServei.SQL2");
		        	conn.rollback();
		        	return res;
		        }
		        ///////////////////////////////
		        //	REL_AGE_SER_IND
		        ///////////////////////////////
	        	// SQL3
		        ps = conn.prepareStatement(sql3);	
		        ps.setInt(1, pIdProfessional);						// ID PROFESSIONAL
		        ps.setInt(2, pIdClient);							// ID CLIENT
		        String horarisIniFiAg[] = horaris[i].split("_");
		        ps.setString(3, horarisIniFiAg[0] + " " + horarisIniFiAg[1]);	// HORARI INI: 2021-02-24_09:00:00 -> 2021-02-24 09:00:00
		        ps.setString(4, horarisIniFiAg[0] + " " + horarisIniFiAg[2]);	// HORARI FI: 2021-02-24_09:00:00 -> 2021-02-24 09:00:00
		        iRes = ps.executeUpdate();
		        if (iRes == 0) {	        	
		        	res.setCodi(9999);
		        	res.setDescripcio("CuidPersDAO.guardarServei.SQL3");
		        	conn.rollback();
		        	return res;
		        }
	        }
        	res.setCodi(0);
        	res.setDescripcio("RESERVA0000001");
        	conn.commit();
	    } catch (SQLException e) {
	        e.printStackTrace();
        	res.setCodi(9998);
        	res.setDescripcio("CuidPersDAO.guardarServei.SQLException: " + e);
	        if(conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
		        	res.setCodi(9997);
		        	res.setDescripcio("CuidPersDAO.guardarServei.SQLException: " + e1);
				}
		} finally {
			ConnectionHelper.close(conn);
		}		
	    return res;
	}
	
	public List<Client> cercaByNom(String pNom) {
    	List<Client> list = new ArrayList<Client>();
        Connection c = null;
        /* Clients per nom */ 
    	String sql = "select cl.*, pers.*, " + 
    			"	contact1.nom, contact1.cognoms, contact1.telefon, contact1.email,  " + 
    			"	contact2.nom, contact2.cognoms, contact2.telefon, contact2.email, " + 
    			"	info.data_info, info.informacio " + 
    			"from CLIENT cl " + 
    			"	join PERSONA pers on pers.id = cl.id_persona and pers.estat = '1' " + 
    			"	left join PERSONA contact1 on cl.id_pers_contact_1 = contact1.id " + 
    			"	left join PERSONA contact2 on cl.id_pers_contact_2 = contact2.id " + 
    			"	left join REL_INFO_CLIENT info on cl.id_persona = info.id_persona " + 
    			"where " + 
    			"	pers.nom like ('%"+pNom+"%') OR pers.cognoms like ('%"+pNom+"%') " + 
    			"order by pers.cognoms, pers.nom;";
	    try {
	        c = ConnectionHelper.getConnection();
	        PreparedStatement ps = c.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        Client client= null;
	        while (rs.next()) {
	        	client = processRowClient(rs);	
	        	list.add(client);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
	    return list;
	}
	

	public Persona autUsuari(String pPerfil, String pUsuari, String pPwd) {
		Connection c = null;
		Persona vPersona = null;
        String sql = "";
        if (pPerfil.equals("ADM"))
        	sql = "select pers.*, adm.* " + 
    			"from PERSONA pers " + 
    			"	join administratiu adm on pers.id = adm.id_persona " + 
    			"where " + 
    			"	pers.email = ? or pers.telefon = ? ";
        else if (pPerfil.equals("CLI"))
        	sql = "select pers.*, cli.* " + 
    			"from PERSONA pers " + 
    			"	join client cli on pers.id = cli.id_persona " + 
    			"where " + 
    			"	pers.email = ? or pers.telefon = ? ";
        else if (pPerfil.equals("PRO"))
        	sql = "select pers.*, pro.* " + 
    			"from PERSONA pers " + 
    			"	join professional adm on pers.id = pro.id_persona " + 
    			"where " + 
    			"	pers.email = ? or pers.telefon = ? ";
	    try {
	    	/*
	    	 * PERSONA 
	    	 */
	        c = ConnectionHelper.getConnection();
	        PreparedStatement ps = c.prepareStatement(sql);
	        ps.setString(1, pUsuari);			// USUARI
	        ps.setString(2, pUsuari);			// USUARI
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	        	vPersona = processRowuUsuari(pPerfil, rs);	
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
	    return vPersona;
	}

	public Client cercaClient(int pIdPersona) {
    	Connection c = null;
        Client vClient = null;
    	String sql = "select cl.*, pers.*,  " + 
    			"	contact1.nom, contact1.cognoms, contact1.telefon, contact1.email,  " + 
    			"	contact2.nom, contact2.cognoms, contact2.telefon, contact2.email, " + 
    			"	info.data_info, info.informacio " + 
    			"from CLIENT cl " + 
    			"	join PERSONA pers on pers.id = cl.id_persona and pers.estat = '1' " + 
    			"	left join PERSONA contact1 on cl.id_pers_contact_1 = contact1.id " + 
    			"	left join PERSONA contact2 on cl.id_pers_contact_2 = contact2.id " + 
    			"	left join REL_INFO_CLIENT info on cl.id_persona = info.id_persona " + 
    			"where " + 
    			"	cl.id_persona = ? " + 
    			"order by pers.nom;";
	    try {
	    	/*
	    	 * PERSONA 
	    	 */
	        c = ConnectionHelper.getConnection();
	        PreparedStatement ps = c.prepareStatement(sql);
	        ps.setInt(1, pIdPersona);			// ID PERSONA
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	        	vClient = processRowClient(rs);	
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
	    return vClient;
    }	
	
	public Professional oneProfessionalAgenda(String pIdioma, int pIdPersona, int pIdTipusServei) {
    	Connection c = null;
        Professional professional = null;
    	String sqlProfessions = "select prof.*, profs.*, pers.* " + 
    			"from PROFESSIONAL profs " + 
    			"	join PROFESSIO prof on prof.id = profs.id_professio and prof.estat = '1' and prof.idioma = ? " + 
    			"	join PERSONA pers on pers.id = profs.id_persona and pers.estat = '1' " + 
    			"where " + 
    			"	profs.id_persona = ? " + 
    			"order by prof.nom;";
    	
    	String sqlServei = "select ser.* " + 
    			"from REL_SERV_PROF rels " + 
    			"	join SERVEI ser on rels.id_servei = ser.id and ser.estat = '1' and ser.idioma = ? " + 
    			"	join REL_TS_SERV relts on relts.id_servei = ser.id " + 
    			"where " + 
    			"	rels.id_persona = ? " + 
    			"	and relts.id_tipusservei = ? " + 
    			"order by ser.nom;";
	    try {
	    	/*
	    	 * PERSONA i PROFESSIONS
	    	 */
	        c = ConnectionHelper.getConnection();
	        PreparedStatement ps = c.prepareStatement(sqlProfessions);
	        ps.setString(1, pIdioma);
	        ps.setInt(2, pIdPersona);	// ID PERSONA
	        ResultSet rs = ps.executeQuery();
	        Professional professionalAux = null;
	        Professio professio = null;
	        int idProfessional = -1;
	        while (rs.next()) {
	        	professionalAux = processRowProfessionals(rs);	        	
	        	if (professionalAux.getIdProf() != idProfessional) {
	        		professional = processRowProfessionals(rs);;
	        	}
	        	professio = processRowProfessio(rs);
        		professional.addProfessio(professio);
	        	idProfessional = professionalAux.getIdProf();
	        }
	        ConnectionHelper.close(c);
	    	/*
	    	 * SERVEIS
	    	 */
	        c = ConnectionHelper.getConnection();
	        ps = c.prepareStatement(sqlServei);
	        ps.setString(1, pIdioma);
	        ps.setInt(2, pIdPersona);
	        ps.setInt(3, pIdTipusServei);
	        rs = ps.executeQuery();
	        Servei servei = null;
	        while (rs.next()) {
	        	servei = processRowServei(rs);
	        	professional.addServei(servei);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
	    return professional;
    }
	
	public List<Agenda> allAgenda(String pIdsProfessionals, String pDataIni, String pDataFi) {
		// pDataIni i pDataFi -> '2021-02-24 09:00:00' and '2021-02-26 09:00:00'
    	List<Agenda> list = new ArrayList<Agenda>();
        Connection c = null;
        /* Cites de professionals - TOTS */ 
    	String sql = "select distinct rel.*, profs.color " + 
    			"from PROFESSIONAL profs " + 
    			"	join REL_AGE_SER_IND rel on profs.id_persona = rel.id_professional " + 
    			"where " + 
    			"	profs.id_persona in (" +pIdsProfessionals + ") " + 
    			"	and rel.data_cita_ini between ? and ? " +
    			"order by rel.data_cita_ini;";
	    try {
	        c = ConnectionHelper.getConnection();
	        PreparedStatement ps = c.prepareStatement(sql);
	        ps.setString(1, pDataIni.replaceAll("_", " "));	// 2021-02-24_09:00:00 -> 2021-02-24 09:00:00
	        ps.setString(2, pDataFi.replaceAll("_", " "));	// 2021-02-24_09:00:00 -> 2021-02-24 09:00:00
	        ResultSet rs = ps.executeQuery();
	        Agenda agenda = null;
	        while (rs.next()) {
	        	agenda = processRowAgenda(rs);	
	        	list.add(agenda);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
	    return list;
    }
	
	private Agenda processRowAgenda(ResultSet rs) throws SQLException {
		Agenda agenda = new Agenda();
	    agenda.setIdClient(rs.getInt("rel.id_client"));
	    agenda.setIdProfessional(rs.getInt("rel.id_professional"));
	    agenda.setColor(rs.getString("profs.color"));	    
	    //
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(rs.getTimestamp("rel.data_cita_ini"));
	    agenda.setDataCita(cal);
	    //
		return agenda;
	}

	public List<Professional> allProfessionals(String pIdioma, String pIdsServeis) {
    	List<Professional> list = new ArrayList<Professional>();
        Connection c = null;
        /* Búsqueda de grups funcionals - TOTS */ 
    	String sql = "select distinct pers.*, prof.*, profs.* " + 
    			"from PERSONA pers " + 
    			"	join PROFESSIONAL profs on pers.id = profs.id_persona and pers.estat = '1' " + 
    			"	join PROFESSIO prof on profs.id_professio = prof.id and prof.estat = '1' and prof.idioma = ? " + 
    			"	join REL_SERV_PROF relts on profs.id_persona = relts.id_persona " + 
    			"	join SERVEI ser on relts.id_servei = ser.id and ser.estat = '1' and ser.idioma = ? " + 
    			"where " + 
    			"	ser.id in (" +pIdsServeis + ") " + 
    			"order by pers.cognoms, pers.nom, prof.nom;";
	    try {
	        c = ConnectionHelper.getConnection();
	        PreparedStatement ps = c.prepareStatement(sql);
	        ps.setString(1, pIdioma);
	        ps.setString(2, pIdioma);
	        ResultSet rs = ps.executeQuery();
	        Professional professionalAux = null;
	        Professional professional = null;
	        Professio professio = null;
	        int idProfessional = -1;
	        while (rs.next()) {
	        	professionalAux = processRowProfessionals(rs);
	        	professio = processRowProfessio(rs);
	        	if (professionalAux.getIdProf() != idProfessional) {
	        		professional = processRowProfessionals(rs);
	        		list.add(professional);
	        	}
	        	professional.addProfessio(professio);
	        	idProfessional = professionalAux.getIdProf();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
	    return list;
    }

	private Professio processRowProfessio(ResultSet rs) throws SQLException {
		Professio professio = new Professio();
	    professio.setId(rs.getInt("prof.id"));
	    professio.setNom(rs.getString("prof.nom"));
	    professio.setDescripcio(rs.getString("prof.descripcio"));
	    professio.setIdioma(rs.getString("prof.idioma"));
	    professio.setEstat(rs.getString("prof.estat"));
	    return professio;
	}

	public List<GrupFuncional> allGrupsFuncionals(String pIdioma) {
    	List<GrupFuncional> list = new ArrayList<GrupFuncional>();
        Connection c = null;
        /* Búsqueda de grups funcionals - TOTS */ 
    	String sql = "SELECT * FROM grup_funcional WHERE estat = '1' and idioma = ? ORDER BY nom;";
	    try {
	        c = ConnectionHelper.getConnection();
	        PreparedStatement ps = c.prepareStatement(sql);
	        ps.setString(1, pIdioma);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            list.add(processRowGF(rs));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
	    return list;
    }
	
    public List<TipusServei> allServeis(String pIdioma) {
    	List<TipusServei> list = new ArrayList<TipusServei>();
        Connection c = null;
        /* Búsqueda de TipusServei a partir del grup funcional - ID grup funcional*/ 
    	String sql = 
    			"select ts.*, ser.* " + 
    			"from tipus_servei ts  " + 
    			"	left join REL_TS_SERV relts on ts.id = relts.id_tipusservei and ts.estat = '1' and ts.idioma= ? " + 
    			"	left join servei ser on relts.id_servei = ser.id and ser.estat = '1' and ser.idioma= ? " + 
    			"order by ts.nom, ser.nom; ";
	    try {
	        c = ConnectionHelper.getConnection();
	        PreparedStatement ps = c.prepareStatement(sql);
	        ps.setString(1, pIdioma);
	        ps.setString(2, pIdioma);
	        ResultSet rs = ps.executeQuery();
	        //
	        TipusServei tipusServeiAux = null;
	        TipusServei tipusServei = null;
	        Servei servei = null;
	        int idTipusServei = -1;
	        while (rs.next()) {
	        	tipusServeiAux = processRowTipusServei(rs);
	        	servei = processRowServei(rs);
	        	if (tipusServeiAux.getId() != idTipusServei) {
	        		tipusServei = processRowTipusServei(rs);
	        		list.add(tipusServei);
	        	}
	        	tipusServei.addServei(servei);
	        	idTipusServei = tipusServeiAux.getId();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
	    return list;
    }

    private Client processRowClient(ResultSet rs) throws SQLException {
    	Client vClient = new Client();
	    vClient.setIdClient(rs.getInt("cl.id_persona"));
	    vClient.setIdPers(rs.getInt("pers.id"));
	    vClient.setNifNie(rs.getString("pers.nif_nie"));
	    vClient.setNom(rs.getString("pers.nom"));
	    vClient.setCognoms(rs.getString("pers.cognoms"));
	    vClient.setDataNaixement(rs.getDate("pers.data_naixement"));
		vClient.setTelefon(rs.getString("pers.telefon"));
		vClient.setTelefonBis(rs.getString("pers.telefon_bis"));
		vClient.setEmail(rs.getString("pers.email"));
		vClient.setAdreca(rs.getString("pers.adreca"));
		vClient.setCodiPostal(rs.getString("pers.codi_postal"));
		vClient.setLocalitat(rs.getString("pers.localitat"));
		vClient.setProvincia(rs.getString("pers.provincia"));
		vClient.setPais(rs.getString("pers.pais"));;
	    vClient.setIdioma(rs.getString("pers.idioma"));
	    vClient.setEstat(rs.getString("pers.estat"));
	    vClient.setColor(rs.getString("cl.color"));
	    // Contacte 1
	    Persona contact1 = new Persona();
	    contact1.setNom(rs.getString("contact1.nom"));
	    contact1.setCognoms(rs.getString("contact1.cognoms"));
	    contact1.setTelefon(rs.getString("contact1.telefon"));
	    contact1.setEmail(rs.getString("contact1.email"));
	    vClient.setContacte1(contact1);
	    // Contacte 2
	    Persona contact2 = new Persona();
	    contact2.setNom(rs.getString("contact2.nom"));
	    contact2.setCognoms(rs.getString("contact2.cognoms"));
	    contact2.setTelefon(rs.getString("contact2.telefon"));
	    contact2.setEmail(rs.getString("contact2.email"));
	    vClient.setContacte2(contact2);
	    // Informació relevant
	    Informacio info = new Informacio();
	    info.setDataInfo(rs.getDate("info.data_info"));
	    info.setInformacio(rs.getString("info.informacio"));
	    vClient.setInfoRelevant(info);
	    	    
	    return vClient;
	}
    private Professional processRowProfessionals(ResultSet rs) throws SQLException {
    	Professional professional = new Professional();
	    professional.setIdProf(rs.getInt("profs.id_persona"));
	    professional.setIdPers(rs.getInt("pers.id"));
	    professional.setNifNie(rs.getString("pers.nif_nie"));
	    professional.setNom(rs.getString("pers.nom"));
	    professional.setCognoms(rs.getString("pers.cognoms"));
	    professional.setDataNaixement(rs.getDate("pers.data_naixement"));
		professional.setTelefon(rs.getString("pers.telefon"));
		professional.setTelefonBis(rs.getString("pers.telefon_bis"));
		professional.setEmail(rs.getString("pers.email"));
		professional.setAdreca(rs.getString("pers.adreca"));
		professional.setCodiPostal(rs.getString("pers.codi_postal"));
		professional.setLocalitat(rs.getString("pers.localitat"));
		professional.setProvincia(rs.getString("pers.provincia"));
		professional.setPais(rs.getString("pers.pais"));;
	    professional.setIdioma(rs.getString("pers.idioma"));
	    professional.setEstat(rs.getString("pers.estat"));
	    professional.setColor(rs.getString("profs.color"));
	    
	    return professional;
	}
    private Servei processRowServei(ResultSet rs) throws SQLException {
    	Servei servei = new Servei();
	    servei.setId(rs.getInt("ser.id"));
	    servei.setNom(rs.getString("ser.nom"));
	    servei.setDescripcio(rs.getString("ser.descripcio"));
	    servei.setIdioma(rs.getString("ser.idioma"));
	    servei.setEstat(rs.getString("ser.estat"));
	    return servei;
	}
    private TipusServei processRowTipusServei(ResultSet rs) throws SQLException {
    	TipusServei tipusServei = new TipusServei();
	    tipusServei.setId(rs.getInt("ts.id"));
	    tipusServei.setNom(rs.getString("ts.nom"));
	    tipusServei.setDescripcio(rs.getString("ts.descripcio"));
	    tipusServei.setIdioma(rs.getString("ts.idioma"));
	    tipusServei.setEstat(rs.getString("ts.estat"));
	    return tipusServei;
	}	
    private GrupFuncional processRowGF(ResultSet rs) throws SQLException {
	    GrupFuncional grupFuncional = new GrupFuncional();
	    grupFuncional.setId(rs.getInt("id"));
	    grupFuncional.setNom(rs.getString("nom"));
	    grupFuncional.setDescripcio(rs.getString("descripcio"));
	    grupFuncional.setIdioma(rs.getString("idioma"));
	    grupFuncional.setEstat(rs.getString("estat"));
	    return grupFuncional;
	}	
	private Persona processRowuUsuari(String pPerfil, ResultSet rs) throws SQLException {
	    // Contacte 1
	    Persona persona = new Persona();
	    persona.setIdPers(rs.getInt("pers.id"));
	    persona.setNom(rs.getString("pers.nom"));
	    persona.setCognoms(rs.getString("pers.cognoms"));
	    persona.setTelefon(rs.getString("pers.telefon"));
	    persona.setEmail(rs.getString("pers.email"));
		return persona;
	}

}