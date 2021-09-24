package es.xuan.webcuidpers.model;

import java.io.Serializable;

public class Resultat implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer codi = 0;
	private String descripcio = "";
	
	public Integer getCodi() {
		return codi;
	}
	public void setCodi(Integer codi) {
		this.codi = codi;
	}
	public String getDescripcio() {
		return descripcio;
	}
	public void setDescripcio(String descripcio) {
		this.descripcio = descripcio;
	}
	

}
