package es.xuan.webcuidpers;
import java.io.Serializable;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import es.xuan.webcuidpers.dao.CuidPersDAO;
import es.xuan.webcuidpers.model.Agenda;
import es.xuan.webcuidpers.model.Client;
import es.xuan.webcuidpers.model.GrupFuncional;
import es.xuan.webcuidpers.model.Persona;
import es.xuan.webcuidpers.model.Professional;
import es.xuan.webcuidpers.model.Resultat;
import es.xuan.webcuidpers.model.TipusServei;

/*
 * http://localhost:8080/webcuidpers/services/agenda/prova	
 */
/**
 * @author Juan J. Campos
 */
@Path("/agenda")
public class AgendaService implements Serializable {
	private static final long serialVersionUID = 1L;

	CuidPersDAO dao = new CuidPersDAO();
	
	/*
	 * Prova de funcionament
	 * http://localhost:8080/webcuidpers/services/agenda/prova
	 */
	@GET
	@Produces(MediaType.TEXT_HTML)
	@Path("/prova")
	public String prova() {
		return "Prova AGENDA/PROVA!";
	}
	/*
	 * http://192.168.1.130:8080/webcuidpers/services/agenda/autUsuari/ADM/626924434/pwd
	 */
	@GET 
	@Path("autUsuari/{perfil}/{usuari}/{pwd}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Persona autUsuari(@PathParam("perfil") String pPerfil, @PathParam("usuari") String pUsuari, @PathParam("pwd") String pPwd) {
		//System.out.println("AgendaService.autUsuari: " + pPerfil + ", " + pUsuari + ", " + pPwd);
		return dao.autUsuari(pPerfil, pUsuari, pPwd);
	}
	/*
	 * http://192.168.1.130:8080/webcuidpers/services/agenda/guardarServei/2/3/8/2021-02-22_00:00:00,2021-02-29_00:00:00/C_Música 6, 2º-4ª!08191!Rubí!Barcelona/nom del servei/descripció del servei
	 * /guardarServei/' + vIdProfessional + '/' + vIdClient + '/' + vIdTipusServei + '/' + vHoraris + '/' + vAdreca + '/' + vTitolServei + '/' + vDescServei
	 */
	@GET 
	@Path("guardarServei/{idProfessional}/{idClient}/{idTipusServei}/{horaris}/{adreca}/{servei}/{descservei}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Resultat guardarServei(@PathParam("idProfessional") int pIdProfessional, @PathParam("idClient") int pIdClient, @PathParam("idTipusServei") int pIdTipusServei, @PathParam("horaris") String pHoraris, @PathParam("adreca") String pAdreca, @PathParam("servei") String pServei, @PathParam("descservei") String pDescServei) {
		//System.out.println("AgendaService.guardarServei: " + pIdProfessional + ", " + pIdClient + ", " + pIdTipusServei + ", " + pHoraris + ", " + pAdreca + ", " + pServei + ", " + pDescServei);
		return dao.guardarServei(pIdProfessional, pIdClient, pIdTipusServei, pHoraris, pAdreca, pServei, pDescServei);
	}
	/*
	 * http://localhost:8080/webcuidpers/services/agenda/cercaByNom/ca
	 */
	@GET 
	@Path("cercaByNom/{vNom}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Client> cercaByNom(@PathParam("vNom") String pNom) {
		//System.out.println("cercaClient: " + pIdClient);
		return dao.cercaByNom(pNom);
	}
	/*
	 * http://localhost:8080/webcuidpers/services/cercaClient/1
	 */
	@GET 
	@Path("cercaClient/{idClient}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Client cercaClient(@PathParam("idClient") int pIdClient) {
		//System.out.println("cercaClient: " + pIdClient);
		return dao.cercaClient(pIdClient);
	}
	/*
	 * http://localhost:8080/webcuidpers/services/agenda/allServeis/es
	 */
	@GET 
	@Path("allServeis/{idioma}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<TipusServei> allServeis(@PathParam("idioma") String pIdioma) {
		//System.out.println("allServeis: " + pIdioma);
		return dao.allServeis(pIdioma);
	}
	/*
	 * http://localhost:8080/webcuidpers/services/agenda/allGrupsFuncionals/es
	 */
	@GET 
	@Path("allGrupsFuncionals/{idioma}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<GrupFuncional> allGrupsFuncionals(@PathParam("idioma") String pIdioma) {
		//System.out.println("allServeis: " + pIdioma);
		return dao.allGrupsFuncionals(pIdioma);
	}
	/*
	 * http://localhost:8080/webcuidpers/services/agenda/oneProfessional/es/2/8
	 */
	@GET 
	@Path("oneProfessional/{idioma}/{idPersona}/{idTipusServei}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Professional oneProfessional(@PathParam("idioma") String pIdioma, @PathParam("idPersona") int pidPersona, @PathParam("idTipusServei") int pIdTipusServei) {
		//System.out.println("oneProfessional: " + pIdioma + "," + pidPersona + "," + pIdTipusServei);
		return dao.oneProfessionalAgenda(pIdioma, pidPersona, pIdTipusServei);
	}
	/*
	 * http://localhost:8080/webcuidpers/services/agenda/allProfessionals/es/6
	 */
	@GET 
	@Path("allProfessionals/{idioma}/{idsServeis}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Professional> allProfessionals(@PathParam("idioma") String pIdioma, @PathParam("idsServeis") String pIdsServeis) {
		//System.out.println("allProfessionals: " + pIdioma + pIdsServeis);
		return dao.allProfessionals(pIdioma, pIdsServeis);
	}
	/*
	 * http://localhost:8080/webcuidpers/services/agenda/allAgenda/1,2/2021-02-22_00:00:00/2021-02-29_00:00:00
	 */
	@GET 
	@Path("allAgenda/{idsProfessionals}/{dataIni}/{dataFi}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Agenda> allAgenda(@PathParam("idsProfessionals") String pIdsProfs, @PathParam("dataIni") String pDataIni, @PathParam("dataFi") String pDataFi) {
		//System.out.println("allAgenda: " + pIdsProfs);
		return dao.allAgenda(pIdsProfs, pDataIni, pDataFi);
	}
}
