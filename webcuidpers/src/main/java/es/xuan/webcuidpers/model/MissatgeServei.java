package es.xuan.webcuidpers.model;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import net.fortuna.ical4j.model.DateTime;

public class MissatgeServei implements Serializable {
	private static final long serialVersionUID = 1L;

	String toEmail;			// campospulido@hotmail.com
	String ccEmail;			// campospulido@hotmail.com, elisendacanals@hotmail.com
	String textServei;
	String descripcioServei;
	String nomClient;
	String cognomsClient;
	String telefonsClient;
	String emailsClient;
	String nomProf;
	String cognomsProf;
	String telefonsProf;
	String emailsProf;
	String location;
	ArrayList<DateTime> arrStartDt;
	ArrayList<DateTime> arrEndDt;
	double tarifa;
	boolean isCorrecte;
	String IDReserva;
	String grupFuncional;
	String tipusServei;
	  
	public MissatgeServei(String pTextMissatge) {
		/*
		 0  * campospulido@hotmail.com								TO
		 1  * campospulido@hotmail.com, elisendacanals@hotmail.com	CC
		 2  * Cuidar persona gran									TÍTOL DEL SERVEI
		 3  * Detall del servei										DESCRIPCIÓ DEL SERVEI
		 4	* Grup funcional										GRUP FUNCIONAL
		 5	* Tipus servei											TIPUS DE SERVEI
		 6  * Client.nom											CLIENT
		 7  * Client.cognoms
		 8  * Client.telefons
		 9  * Client.emails
		 10 * Professional.nom										PROFESSIONAL
		 11 * Professional.cognoms
		 12 * Professional.telefons
		 13 * Professional.emails
		 14 * C_Música 6, 2º-4ª.08191 Rubí.Barcelona						LOCATION
		 15 * 2021-02-22_00:00:00_01:00:00,2021-02-22_00:00:00_01:00:00,	DATA INI_FI
		 16 * 20															TARIFA
		 17 * RESERVA20210312174800											ID RESERVA
		 */
		setCorrecte(false);
		String[] strMS = pTextMissatge.split("!");
		if (strMS.length > 17) {
			setToEmail(strMS[0]);
			setCcEmail(strMS[1]);
			setTextServei(strMS[2]);
			setDescripcioServei(strMS[3]);
			setGrupFuncional(strMS[4]);
			setTipusServei(strMS[5]);
			setNomClient(strMS[6]);
			setCognomsClient(strMS[7]);
			setTelefonsClient(strMS[8]);
			setEmailsClient(strMS[9]);
			setNomProf(strMS[10]);
			setCognomsProf(strMS[11]);
			setTelefonsProf(strMS[12]);
			setEmailsProf(strMS[13]);
			setLocation(strMS[14]);
			// 2021-02-22_00:00:00
			try {
				// 2021-02-22_00:00:00_01:00:00, 2021-02-22_00:00:00_01:00:00,
				SimpleDateFormat outputFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
				String[] strDataHora = strMS[15].split(",");
				for(String strDataHoraAux : strDataHora) {
					String[] strDataHoraSp = strDataHoraAux.split("_");
					//
					DateTime dtStart = new DateTime(outputFormatter.parse(strDataHoraSp[0] +"_"+strDataHoraSp[1]));
					afegirDtStart(dtStart);
					DateTime dtEnd = new DateTime(outputFormatter.parse(strDataHoraSp[0] +"_"+strDataHoraSp[2]));
					afegirDtEnd(dtEnd);	
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			setTarifa(Double.parseDouble(strMS[16]));
			setIDReserva(strMS[17]);
			setCorrecte(true);
		}
	}
	
	public ArrayList<DateTime> getArrStartDt() {
		return arrStartDt;
	}

	public void setArrStartDt(ArrayList<DateTime> arrStartDt) {
		this.arrStartDt = arrStartDt;
	}

	public ArrayList<DateTime> getArrEndDt() {
		return arrEndDt;
	}

	public void setArrEndDt(ArrayList<DateTime> arrEndDt) {
		this.arrEndDt = arrEndDt;
	}

	private void afegirDtEnd(DateTime dtEnd) {
		if (arrEndDt == null)
			arrEndDt = new ArrayList<DateTime>();
		arrEndDt.add(dtEnd);		
	}

	private void afegirDtStart(DateTime dtStart) {
		if (arrStartDt == null)
			arrStartDt = new ArrayList<DateTime>();
		arrStartDt.add(dtStart);		
	}

	public String getIDReserva() {
		return IDReserva;
	}

	public void setIDReserva(String iDReserva) {
		IDReserva = iDReserva;
	}

	public String getGrupFuncional() {
		return grupFuncional;
	}

	public void setGrupFuncional(String grupFuncional) {
		this.grupFuncional = grupFuncional;
	}

	public String getTipusServei() {
		return tipusServei;
	}

	public void setTipusServei(String tipusServei) {
		this.tipusServei = tipusServei;
	}

	public String getTextServei() {
		return textServei;
	}

	public void setTextServei(String textServei) {
		this.textServei = textServei;
	}

	public String getDescripcioServei() {
		return descripcioServei;
	}

	public void setDescripcioServei(String descripcioServei) {
		this.descripcioServei = descripcioServei;
	}

	public String getNomClient() {
		return nomClient;
	}

	public void setNomClient(String nomClient) {
		this.nomClient = nomClient;
	}

	public String getCognomsClient() {
		return cognomsClient;
	}

	public void setCognomsClient(String cognomsClient) {
		this.cognomsClient = cognomsClient;
	}

	public String getTelefonsClient() {
		return telefonsClient;
	}

	public void setTelefonsClient(String telefonsClient) {
		this.telefonsClient = telefonsClient;
	}

	public String getEmailsClient() {
		return emailsClient;
	}

	public void setEmailsClient(String emailsClient) {
		this.emailsClient = emailsClient;
	}

	public String getNomProf() {
		return nomProf;
	}

	public void setNomProf(String nomProf) {
		this.nomProf = nomProf;
	}

	public String getCognomsProf() {
		return cognomsProf;
	}

	public void setCognomsProf(String cognomsProf) {
		this.cognomsProf = cognomsProf;
	}

	public String getTelefonsProf() {
		return telefonsProf;
	}

	public void setTelefonsProf(String telefonsProf) {
		this.telefonsProf = telefonsProf;
	}

	public String getEmailsProf() {
		return emailsProf;
	}

	public void setEmailsProf(String emailsProf) {
		this.emailsProf = emailsProf;
	}

	public double getTarifa() {
		return tarifa;
	}

	public void setTarifa(double tarifa) {
		this.tarifa = tarifa;
	}

	public String getCcEmail() {
		return ccEmail;
	}

	public void setCcEmail(String ccEmail) {
		this.ccEmail = ccEmail;
	}

	public boolean isCorrecte() {
		return isCorrecte;
	}

	public void setCorrecte(boolean isCorrecte) {
		this.isCorrecte = isCorrecte;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getToEmail() {
		return toEmail;
	}
	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
}
