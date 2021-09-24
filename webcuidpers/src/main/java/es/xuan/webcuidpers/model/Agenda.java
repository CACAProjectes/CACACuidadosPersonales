package es.xuan.webcuidpers.model;

import java.io.Serializable;
import java.util.Calendar;

public class Agenda implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer idProfessional;
	private Integer idClient;
	private Calendar dataCita;
	private String color;
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Integer getIdProfessional() {
		return idProfessional;
	}
	public void setIdProfessional(Integer idProfessional) {
		this.idProfessional = idProfessional;
	}
	public Integer getIdClient() {
		return idClient;
	}
	public void setIdClient(Integer idClient) {
		this.idClient = idClient;
	}
	public Calendar getDataCita() {
		return dataCita;
	}
	public void setDataCita(Calendar dataCita) {
		this.dataCita = dataCita;
	}

	

}
