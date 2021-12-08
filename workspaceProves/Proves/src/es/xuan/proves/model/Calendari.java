package es.xuan.proves.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

public class Calendari implements Serializable {
    private String nomMes;
    private int any;
    private Calendar avui;
    private Celda[][] celda;    // 6 x 7

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

    public Celda[][] getCelda() {
        return celda;
    }

    public void setCelda(Celda[][] celda) {
        this.celda = celda;
    }

    public Calendari() {
        Calendar cal = Calendar.getInstance();
        //	Omplir avui
        setAvui(cal);
        //  Omplir el mes actual
        SimpleDateFormat dateFormat = new SimpleDateFormat("MMMM", Locale.getDefault());
        setNomMes(dateFormat.format(cal.getTime()));
        //  Omplir el any actual
        //dateFormat = new SimpleDateFormat("YYYY", Locale.getDefault());
        //setAny(Integer.parseInt(dateFormat.format(cal.getTime())));
        setAny(cal.get(Calendar.YEAR));
        //  Omplir les celdes amb els dies
        celda = new Celda[6][7];
        //
        int dia = cal.get(Calendar.DAY_OF_MONTH);   	// Dia avui
        cal.add(Calendar.DAY_OF_WEEK , 1 - dia);       	// Dia 1 del mateix mes
        int diaSetmana = cal.get(Calendar.DAY_OF_WEEK); // Dia de la setmana
        //	Omplir dies del mes anterior
        int jInicio = diaSetmana - 2;
        cal.add(Calendar.DAY_OF_WEEK , -jInicio);
        for(int j=0;j<jInicio;j++) {
        	dia = cal.get(Calendar.DAY_OF_MONTH);
            celda[0][j] = new Celda(dia, "", false);
            cal.add(Calendar.DAY_OF_WEEK , 1);
        }
        //	Omplir dies del mes actual i els dies del mes següent fins pròxim diumenge
        for(int i=0;i<6;i++) {
            for(int j=jInicio;j<7;j++) {
            	dia = cal.get(Calendar.DAY_OF_MONTH);
                celda[i][j] = new Celda(dia, "", false);
                cal.add(Calendar.DAY_OF_WEEK , 1);
            }
            jInicio = 0;
        }
    }
}
