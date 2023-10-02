package es.xuan.webcuidpers.model;

import java.io.Serializable;

public class GrupFuncional implements Serializable {
	private static final long serialVersionUID = 1L;
	private String nom;
	private Integer id;
	private String descripcio;
	private String idioma;
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

}
