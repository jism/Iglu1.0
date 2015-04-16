/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control.sql;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SistemasSalud7
 */
public class ConectaServidorSQLite extends ConectaServidor{
    
    @Override
    public void conectar() throws SQLException {
        try {
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:";
            //String db = configuracion.getProperty("sqliteFile");
            String db = "database/Iglu.db";
            url = url + db;
            obj_conector = DriverManager.getConnection(url);
        } catch (ClassNotFoundException ex) {
            System.err.println(ex);
            System.err.println("controlador de SQLite no encontrado");
        }
    }
    
    public static void main(String[] pps){
        /*
        ConectaServidorSQLite sqlite = new ConectaServidorSQLite();
        try {
            sqlite.conectar();
            ResultSet resultado = sqlite.consultaSQL("select * from cliente");
            while(resultado.next()){
                for(int i=1;i<=resultado.getMetaData().getColumnCount();i++){
                    System.out.println(resultado.getString(i) + "|");
                }
                System.out.println();
            }
            resultado.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConectaServidorSQLite.class.getName()).log(Level.SEVERE, null, ex);
        }
                */
    }
}