package es.xuan.proves.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

public class Calendari implements Serializable {
    private String nomMes;
    private int any;
    private Calendar avui;
    private Celda[][] dies;    // 6 x 7
    private Celda[] capcalera;	// 7

    public Celda[][] getDies() {
		return dies;
	}

	public void setDies(Celda[][] dia) {
		this.dies = dies;
	}

	public String getNomMes() {
        return nomMes;
    }

    public void setNomMes(String nomMes) {
        this.nomMes = nomMes;
    }

    public int getAny() {
        return any;
    }

    public void setAny(int any) {
        this.any = any;
    }

    public Calendar getAvui() {
        return avui;
    }

    public void setAvui(Calendar avui) {
        this.avui = avui;
    }

    public Calendari() {
        Calendar cal = Calendar.getInstance();
        //	Omplir avui
        setAvui(cal);
        //  Omplir el mes actual
        SimpleDateFormat dateFormatMes = new SimpleDateFormat("MMMM", Locale.getDefault());
        SimpleDateFormat dateFormatDia = new SimpleDateFormat("EEE", Locale.getDefault());
        setNomMes(dateFormatMes.format(cal.getTime()));
        //  Omplir el any actual
        //dateFormat = new SimpleDateFormat("YYYY", Locale.getDefault());
        //setAny(Integer.parseInt(dateFormat.format(cal.getTime())));
        setAny(cal.get(Calendar.YEAR));
        //  Omplir les celdes amb els dies
        capcalera = new Celda[7];
        dies = new Celda[6][7];        
        //
        int dia = cal.get(Calendar.DAY_OF_MONTH);   	// Dia avui
        cal.add(Calendar.DAY_OF_WEEK , 1 - dia);       	// Dia 1 del mateix mes
        int diaSetmana = cal.get(Calendar.DAY_OF_WEEK); // Dia de la setmana
        //	Omplir dies del mes anterior
        int jInicio = diaSetmana - 2;
        cal.add(Calendar.DAY_OF_WEEK , -jInicio);
        for(int j=0;j<jInicio;j++) {
        	dia = cal.get(Calendar.DAY_OF_MONTH);
        	dies[0][j] = new Celda(String.format("% 2d", dia), "", false);        	
            capcalera[j] = new Celda(dateFormatDia.format(cal.getTime()), "", false);
            //
            cal.add(Calendar.DAY_OF_WEEK , 1);
        }
        //	Omplir dies del mes actual i els dies del mes següent fins pròxim diumenge
        for(int i=0;i<6;i++) {
            for(int j=jInicio;j<7;j++) {
            	dia = cal.get(Calendar.DAY_OF_MONTH);
            	dies[i][j] = new Celda(String.format("% 2d", dia), "", false);
            	if (i==0)
            		capcalera[j] = new Celda(dateFormatDia.format(cal.getTime()), "", false);
                //
                cal.add(Calendar.DAY_OF_WEEK , 1);
            }
            jInicio = 0;
        }
    }

	public Celda[] getCapcalera() {
		return capcalera;
	}

	public void setCapcalera(Celda[] capcalera) {
		this.capcalera = capcalera;
	}
}
