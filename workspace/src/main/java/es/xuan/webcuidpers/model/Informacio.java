package es.xuan.webcuidpers.model;

import java.io.Serializable;
import java.util.Date;

public class Informacio implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Date dataInfo;
	private String informacio;
	
	public Date getDataInfo() {
		return dataInfo;
	}
	public void setDataInfo(Date dataInfo) {
		this.dataInfo = dataInfo;
	}
	public String getInformacio() {
		return informacio;
	}
	public void setInformacio(String informacio) {
		this.informacio = informacio;
	}
	
	

}
