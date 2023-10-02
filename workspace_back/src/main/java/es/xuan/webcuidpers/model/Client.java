package es.xuan.webcuidpers.model;

import java.io.Serializable;

public class Client extends Persona implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer idClient;
	private String color;
	private Persona contacte1;
	private Persona contacte2;
	private Informacio infoRelevant;
	
	public Persona getContacte1() {
		return contacte1;
	}
	public void setContacte1(Persona contacte1) {
		this.contacte1 = contacte1;
	}
	public Persona getContacte2() {
		return contacte2;
	}
	public void setContacte2(Persona contacte2) {
		this.contacte2 = contacte2;
	}
	public Informacio getInfoRelevant() {
		return infoRelevant;
	}
	public void setInfoRelevant(Informacio infoRelevant) {
		this.infoRelevant = infoRelevant;
	}
	public Integer getIdClient() {
		return idClient;
	}
	public void setIdClient(Integer idClient) {
		this.idClient = idClient;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
