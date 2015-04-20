/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author r
 */
public class Videojuego {
    
    int idvj;
    String nombre;
    int anio;
    String descripcion;
    String categoria;
    String desarrollador;
    int costo;
    String video;

    public Videojuego(int idvj, String nombre, int anio, String descripcion, String categoria, String desarrollador, int costo, String video) {
        this.idvj = idvj;
        this.nombre = nombre;
        this.anio = anio;
        this.descripcion = descripcion;
        this.categoria = categoria;
        this.desarrollador = desarrollador;
        this.costo = costo;
        this.video = video;
    }

    public int getIdvj() {
        return idvj;
    }

    public void setIdvj(int idvj) {
        this.idvj = idvj;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDesarrollador() {
        return desarrollador;
    }

    public void setDesarrollador(String desarrollador) {
        this.desarrollador = desarrollador;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }
    
    
    
}
