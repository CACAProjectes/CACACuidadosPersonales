package es.xuan.webcuidpers.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Professional extends Persona implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer idProf;
	private String color;
	private List<Professio> llistaProfessions;
	private List<Agenda> llistaAgenda;
	private List<Servei> llistaServeis;
	
	public List<Servei> getLlistaServeis() {
		return llistaServeis;
	}
	public void setLlistaServeis(List<Servei> llistaServeis) {
		this.llistaServeis = llistaServeis;
	}
	public List<Agenda> getLlistaAgenda() {
		return llistaAgenda;
	}
	public void setLlistaAgenda(List<Agenda> llistaAgenda) {
		this.llistaAgenda = llistaAgenda;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Integer getIdProf() {
		return idProf;
	}
	public void setIdProf(Integer idProf) {
		this.idProf = idProf;
	}
	public List<Professio> getLlistaProfessions() {
		return llistaProfessions;
	}
	public void setLlistaProfessions(List<Professio> llistaProfessions) {
		this.llistaProfessions = llistaProfessions;
	}
	public void addProfessio(Professio professio) {
		if (llistaProfessions == null)
			llistaProfessions = new ArrayList<Professio>();
		llistaProfessions.add(professio);		
	}
	public void addAgenda(Agenda agenda) {
		if (llistaAgenda == null)
			llistaAgenda = new ArrayList<Agenda>();
		llistaAgenda.add(agenda);		
	}
	public void addServei(Servei servei) {
		if (llistaServeis == null)
			llistaServeis = new ArrayList<Servei>();
		llistaServeis.add(servei);		
	}
}
