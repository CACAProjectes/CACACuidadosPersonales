package es.xuan.proves.model;

import java.io.Serializable;

public class Celda implements Serializable {
    private int numDia;         // 1,2,3,4,5,6,...
    private String nomTorn;     // M-Matí, T-Tarda, N-Nit, D-Dia cap de setmana, N-Nit cap de setmana
    private boolean menjador;   // S/N

    public Celda(int pDia, String pTorn, boolean pMenjador) {
        setNumDia(pDia);
        setNomTorn(pTorn);
        setMenjador(pMenjador);
    }

    public String getNomTorn() {
        return nomTorn;
    }

    public void setNomTorn(String nomTorn) {
        this.nomTorn = nomTorn;
    }

    public boolean isMenjador() {
        return menjador;
    }

    public void setMenjador(boolean menjador) {
        this.menjador = menjador;
    }

    public int getNumDia() {
        return numDia;
    }

    public void setNumDia(int numDia) {
        this.numDia = numDia;
    }
}
