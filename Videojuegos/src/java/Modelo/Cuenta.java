/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Ivan
 */
public class Cuenta {
    private String correoe;
    private int creditos;
    private String fechavenc;

    public Cuenta(String correoe, int creditos, String fechavenc) {
        this.correoe = correoe;
        this.creditos = creditos;
        this.fechavenc = fechavenc;
    }

    public String getCorreoe() {
        return correoe;
    }

    public void setCorreoe(String correoe) {
        this.correoe = correoe;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public String getFechavenc() {
        return fechavenc;
    }

    public void setFechavenc(String fechavenc) {
        this.fechavenc = fechavenc;
    }
    
    
}
