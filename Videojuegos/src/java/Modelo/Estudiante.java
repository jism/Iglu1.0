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
public class Estudiante {
    String nombre;
    String appat;
    String apmat;
    String correoe;
    String universidad;
    String nocuenta;

    public Estudiante(String nombre, String appat, String apmat, String correoe, String universidad, String cuenta) {
        this.nombre = nombre;
        this.appat = appat;
        this.apmat = apmat;
        this.correoe = correoe;
        this.universidad = universidad;
        this.nocuenta = cuenta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAppat() {
        return appat;
    }

    public void setAppat(String appat) {
        this.appat = appat;
    }

    public String getApmat() {
        return apmat;
    }

    public void setApmat(String apmat) {
        this.apmat = apmat;
    }

    public String getCorreoe() {
        return correoe;
    }

    public void setCorreoe(String correoe) {
        this.correoe = correoe;
    }

    public String getUniversidad() {
        return universidad;
    }

    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }

    public String getCuenta() {
        return nocuenta;
    }

    public void setCuenta(String cuenta) {
        this.nocuenta = cuenta;
    }
    
    
}
