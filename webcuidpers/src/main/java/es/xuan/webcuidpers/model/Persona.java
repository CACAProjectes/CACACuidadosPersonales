package es.xuan.webcuidpers.model;

import java.io.Serializable;
import java.util.Date;

public class Persona implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer idPers;
	private String nifNie;
	private String nom;
	private String cognoms;
	private Date dataNaixement;
	private String telefon;
	private String telefonBis;
	private String email;
	private String adreca;
	private String codiPostal;
	private String localitat;
	private String provincia;
	private String pais;
	private String idioma;
	private String estat;

	public String getEstat() {
		return estat;
	}
	public void setEstat(String estat) {
		this.estat = estat;
	}
	public Integer getIdPers() {
		return idPers;
	}
	public void setIdPers(Integer idPers) {
		this.idPers = idPers;
	}
	public String getNifNie() {
		return nifNie;
	}
	public void setNifNie(String nifNie) {
		this.nifNie = nifNie;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getCognoms() {
		return cognoms;
	}
	public void setCognoms(String cognoms) {
		this.cognoms = cognoms;
	}
	public Date getDataNaixement() {
		return dataNaixement;
	}
	public void setDataNaixement(Date dataNaixement) {
		this.dataNaixement = dataNaixement;
	}
	public String getTelefon() {
		return telefon;
	}
	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}
	public String getTelefonBis() {
		return telefonBis;
	}
	public void setTelefonBis(String telefonBis) {
		this.telefonBis = telefonBis;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdreca() {
		return adreca;
	}
	public void setAdreca(String adreca) {
		this.adreca = adreca;
	}
	public String getCodiPostal() {
		return codiPostal;
	}
	public void setCodiPostal(String codiPostal) {
		this.codiPostal = codiPostal;
	}
	public String getLocalitat() {
		return localitat;
	}
	public void setLocalitat(String localitat) {
		this.localitat = localitat;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getIdioma() {
		return idioma;
	}
	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}
	
}
