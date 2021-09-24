package es.xuan.webcuidpers;

import java.io.Serializable;
import java.net.URISyntaxException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import es.xuan.webcuidpers.model.MissatgeServei;
import es.xuan.webcuidpers.model.Resultat;
import net.fortuna.ical4j.model.Dur;
import net.fortuna.ical4j.model.component.VEvent;
import net.fortuna.ical4j.model.property.Clazz;
import net.fortuna.ical4j.model.property.Description;
import net.fortuna.ical4j.model.property.Location;
import net.fortuna.ical4j.model.property.Organizer;
import net.fortuna.ical4j.model.property.Priority;

/**
 * @author Juan J. Campos
 */
@Path("/events")
public class EventsService implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private static final String CTE_USERNAME = "cacaprojectsapps.cacacuidpers@gmail.com";
	private static final String CTE_PWD = "Miquel_01";
	private static final String CTE_SMTP = "smtp.gmail.com";
	private static final String CTE_PORT = "587";
	private static final String CTE_AUTH = "true";
	private static final String CTE_STARTTLS_ENABLE ="true";
    
	/*
	 * http://192.168.1.130:8080/webcuidpers/services/events/enviarServeiEvent/campospulido@gmail.com!campospulido@hotmail.com,cacaesports@gmail.com!Cuidar persona gran!Detall del servei!Grup funcional!Tipus servei!Client.nom!Client.cognoms!Client.telefons!Client.emails!Professional.nom!Professional.cognoms!Professional.telefons!Professional.emails!C_Música 6, 2º-4ª.08191 Rubí.Barcelona!2021-02-12_18:00:00!2021-02-12_19:15:00!20!RESERVA20210312174800!
	 */
	@GET 
	@Path("enviarServeiEvent/{textMissatge}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Resultat enviarServeiEvent(@PathParam("textMissatge") String pTextMissatge) {
		Resultat resultat = new Resultat();
		MissatgeServei ms = new MissatgeServei(pTextMissatge);
		if (ms.isCorrecte())
			SendEmailTLS(ms);
		//System.out.println("enviarEvent: " + pTextMissatge);
		return resultat;
	}
	
	private net.fortuna.ical4j.model.Calendar getEvent(MissatgeServei pMS, int pOrden) {
		  //Creating a new calendar
		  net.fortuna.ical4j.model.Calendar calendar = new net.fortuna.ical4j.model.Calendar();
		  //
		  long diff = pMS.getArrEndDt().get(pOrden).getTime() - pMS.getArrStartDt().get(pOrden).getTime();
		  int min = (int)(diff / (1000 * 60));		  
		  Dur dur = new Dur(0,0,min,0);
		  //Creating a meeting event
		  VEvent meeting = new VEvent(pMS.getArrStartDt().get(pOrden), dur, capcaleraDeContratacioCalendar(pMS));
		  meeting.getProperties().add(new Location(parserLocation(pMS)));		  
		  meeting.getProperties().add(new Description(bodyCalendar(pMS)));		  
		  meeting.getProperties().add(Priority.MEDIUM);
	      meeting.getProperties().add(Clazz.PUBLIC);
		  
		  try {
			  meeting.getProperties().add(new Organizer("MAILTO:" + pMS.getToEmail()));
		  } catch (URISyntaxException e) {
			  e.printStackTrace();
		  }		  
		  calendar.getComponents().add(meeting);		  
		  return calendar;
		 }

	private String parserLocation(MissatgeServei pMS) {
		return pMS.getLocation();
	}

	private void SendEmailTLS(MissatgeServei pMS) {
		//	Properties
        Properties prop = new Properties();
        prop.put("mail.smtp.host", CTE_SMTP);
        prop.put("mail.smtp.port", CTE_PORT);
        prop.put("mail.smtp.auth", CTE_AUTH);
        prop.put("mail.smtp.starttls.enable", CTE_STARTTLS_ENABLE);
        // Session
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(CTE_USERNAME, CTE_PWD);
                    }
                });
        // Lista de events
        for(int i=0;i<pMS.getArrStartDt().size();i++) {
        	// Message
	        try {
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(CTE_USERNAME));
	            message.addRecipients(
	        		Message.RecipientType.TO, 
	                InternetAddress.parse(pMS.getToEmail()));
	            message.addRecipients(
	        		Message.RecipientType.CC, 
	                InternetAddress.parse(pMS.getCcEmail()));
	            //
	            Multipart multipart = new MimeMultipart();
	            ///////////////////////////
	            //	Event per al calendari
	            ///////////////////////////
	            net.fortuna.ical4j.model.Calendar calendar = getEvent(pMS, i);
	            if (calendar != null) {
	                // Another part for the calendar invite
	                MimeBodyPart invite = new MimeBodyPart();
	                invite.setHeader("Content-Type", "text/calendar; charset=ISO-8859-1; method=REQUEST");
	                invite.setContent(calendar.toString(), "text/calendar");
	                multipart.addBodyPart(invite);
	            }
	            ///////////////////////////
	            //	Títol de l'email
	            ///////////////////////////  
	            //message.setSubject(pMS.getSubject());   
	            message.setSubject(capcaleraDeContratacio(pMS));  
	            ///////////////////////////
	            //	Contingut de l'email
	            ///////////////////////////            
	            MimeBodyPart bodyPart1 = new MimeBodyPart();
	            bodyPart1.setText(bodyEmail(pMS, i), "ISO-8859-1", "html");
	            bodyPart1.setHeader("Content-Type", "text/html; charset=ISO-8859-1");
	            multipart.addBodyPart(bodyPart1);
	            //
	            message.setContent(multipart);
	            //
	            Transport.send(message);
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
        }
    }
	private String capcaleraDeContratacio(MissatgeServei pMS) {
		return "CuidPers - Contractació de Servei per " + pMS.getNomClient();
	}
	private String capcaleraDeContratacioCalendar(MissatgeServei pMS) {
		return "CuidPers - Contractació de Servei per " + pMS.getNomClient();
	}
	private String bodyCalendar(MissatgeServei pMS) {
		return pMS.getTextServei() + 
				"\n\r" +
				pMS.getDescripcioServei() +
				"\n\r";
	}
	private String bodyEmail(MissatgeServei pMS, int pOrden) {
		return	pMS.getNomProf() + " " + pMS.getCognomsProf() + ",<br>" + 
				"S'ha sol·licitat un servei de <b>"+pMS.getGrupFuncional()+"</b> per <b>"+pMS.getTipusServei()+"</b>.<br>" + 
				"	<br>" + 
				"En concret es tracta de <br>" + 
				"	&emsp;"+pMS.getTextServei()+"<br>" + 
				"	&emsp;"+pMS.getDescripcioServei()+"<br>" + 
				"	<br>" + 
				"El professional és<br>" + 
				"	<b>&emsp;"+pMS.getNomProf() + " " + pMS.getCognomsProf()+"<br>" + 
				"	&emsp;"+pMS.getTelefonsProf()+"<br>" + 
				"	&emsp;"+pMS.getEmailsProf()+"</b><br>" + 
				"	<br>" + 
				"El client és<br>" + 
				"	<b>&emsp;"+pMS.getNomClient() + " " + pMS.getCognomsClient()+"<br>" + 
				"	&emsp;"+pMS.getTelefonsClient()+"<br>" + 
				"	&emsp;"+pMS.getEmailsClient()+"</b><br>" + 
				"	<br>" + 
				"L'agenda és <br>" + 
				"	<b>&emsp;"+pMS.getArrStartDt().get(pOrden)+ " " +pMS.getArrEndDt().get(pOrden)+ "</b><br>" + 
				"	<br>" + 
				"L'adreça del servei és<br>" + 
				"	<b>&emsp;"+pMS.getLocation()+"</b><br>" + 
				"	<br>" + 
				"La tarifa per <b>Serveis sanitaris a persones</b> per <b>Atendre a adults</b> és<br>" + 
				"	<b>&emsp;"+pMS.getTarifa()+"&euro;/hora</b><br>" + 
				"	<br>" + 
				"Heu de confirmar el servei en aquest enllaç <a href=\"#\">Confirmació del Servei per <b>Juan</b></a> i a continuació, rebrà el email de confirmació.<br>" + 
				"	<br>" + 
				"Att. CuidPers<br>";
	}
}
