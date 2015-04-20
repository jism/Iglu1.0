/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.sql;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SistemasSalud7
 */
public abstract class ConectaServidor {

    protected Connection obj_conector;

    public abstract void conectar() throws java.sql.SQLException;

    public Properties abrirConfiguracion() {
        Properties configuracion = new Properties();
        try {
            Properties sistema = new Properties();
            sistema.load(new FileInputStream("properties/system.conf"));
            configuracion.load(new FileInputStream(sistema.getProperty("ruta_database_config")));
        } catch (FileNotFoundException ex) {
            
        } catch (IOException ex) {
            
        }
        return configuracion;
    }

    public ResultSet consultaSQL(String query) {
        ResultSet respuesta = null;
        try {
            Statement obj_rs = obj_conector.createStatement();
            ResultSet executeQuery = obj_rs.executeQuery(query);
            respuesta = executeQuery;
        } catch (SQLException e_esql) {
            System.err.println(e_esql);
        }
        return respuesta;
    }

    public Integer cuentaRegistros(String query) {
        ResultSet respuesta = null;
        Integer numero;
        try {
            Statement obj_rs = obj_conector.createStatement();
            numero = obj_rs.executeQuery(query).getRow();
        } catch (SQLException e_esql) {
            numero = null;
            System.err.println(e_esql);
        }
        return numero;
    }

    public boolean actualizaSQL(String query) {
        boolean status = false;
        try {
            Statement obj_rs = obj_conector.createStatement();
            obj_rs.executeUpdate(query);
            status = true;
        } catch (SQLException esql) {
            System.err.println(esql + "algo fallo ");
        }
        return status;
    }

    public PreparedStatement obtenerPreparedStatement(String consulta) throws SQLException {
        return obj_conector.prepareStatement(consulta);
    }

    public boolean conexionCerrada(){
        boolean status = false;
        try {
             status = obj_conector == null || obj_conector.isClosed();
        } catch (SQLException ex) {
            
        }
        return status;
    }

    public void cerrar() {
        try {
            if (obj_conector != null) {
                obj_conector.close();
            }
        } catch (Exception e) {
            System.err.println(e);
        }
    }
}
