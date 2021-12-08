package es.xuan.proves;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import es.xuan.proves.model.Calendari;

public class Prova implements Serializable {

	public static void main(String[] args) {
		Calendari calendari = new Calendari();
		//
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.THURSDAY, Calendar.THURSDAY);
		SimpleDateFormat dateFormat = new SimpleDateFormat("EEE", Locale.getDefault());
		System.out.println(dateFormat.format(cal.getTime()));

	}

}
