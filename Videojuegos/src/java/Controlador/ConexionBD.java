package Controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ivan
 */
import java.sql.*;
import java.util.Scanner;

/**
 *
 * @author ivan
 */
public class ConexionBD{
    String url,username,password;
        Connection conexion;
        Statement sentencia;
        PreparedStatement st;
        ResultSet rs1, rs2;

    public ConexionBD(){
        url = "jdbc:postgresql://localhost:5432/Iglu";
        username = "postgres";
        password = "89631139";
        conexion = null;
        sentencia=null;
        st = null;
        rs1=null;
        rs2 = null;
        
    } 
    
    public static void main(String[] args) {
        ConexionBD p = new ConexionBD();
      try{
        Class.forName("org.postgresql.Driver");
        p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
        System.out.println("Conexion Exitosa");
        p.sentencia = p.conexion.createStatement();
        
        //Ejemplo consulta
        
        p.rs1 = p.sentencia.executeQuery("Select * From administrador");
            while(p.rs1.next()){
                System.out.println(p.rs1.getString("correoe")+" - "+ p.rs1.getString("nombre"));
            }
            System.out.println("\n");
            p.rs1.close();
        
    }catch (SQLException e){
            System.out.println("Error "+e);
    }catch (Exception e){
            System.out.println("Error "+e);
    }finally{
            if(p.conexion != null){
                try{
                    p.conexion.close();
                }catch(SQLException e){
                    System.out.println("Error "+e);
                }
            }
    }
}
}
