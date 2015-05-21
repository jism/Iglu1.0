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
public class Usuario {
    private String correoe;
    private String contrasena;
    private String fechavenc;
    
    public Usuario(){
        
    }

    public Usuario(String correoe, String contrasena) {
        this.correoe = correoe;
        this.contrasena = contrasena;
    }
    
    public Usuario(String correoe, String contrasena, String fechavenc) {
        this.correoe = correoe;
        this.contrasena = contrasena;
        this.fechavenc=fechavenc;
    }

    public String getCorreoe() {
        return correoe;
    }

    public void setCorreoe(String correoe) {
        this.correoe = correoe;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getFechavenc() {
        return fechavenc;
    }

    public void setFechavenc(String fechavenc) {
        this.fechavenc = fechavenc;
    }
    
    
}
