package es.xuan.webcuidpers.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TipusServei implements Serializable {
	private static final long serialVersionUID = 1L;
	private String nom;
	private Integer id;
	private String descripcio;
	private String idioma;
	private List<Servei> llistaServeis;
	private String estat;
	
	public String getEstat() {
		return estat;
	}
	public void setEstat(String estat) {
		this.estat = estat;
	}
	public String getIdioma() {
		return idioma;
	}
	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}
	public List<Servei> getLlistaServeis() {
		return llistaServeis;
	}
	public void setLlistaServeis(List<Servei> llistaServeis) {
		this.llistaServeis = llistaServeis;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescripcio() {
		return descripcio;
	}
	public void setDescripcio(String descripcio) {
		this.descripcio = descripcio;
	}
	public void addServei(Servei servei) {
		if (llistaServeis == null)
			llistaServeis = new ArrayList<Servei>();
		llistaServeis.add(servei);		
	}

}
