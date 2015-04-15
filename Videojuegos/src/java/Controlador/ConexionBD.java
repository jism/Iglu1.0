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
import Modelo.Estudiante;
import java.sql.*;
import java.util.LinkedList;
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
    
    public void registrarse(String nombre, String appat, String apmat, String correoe, String universidad, String cuenta){
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();

            p.sentencia.executeUpdate("insert into estudiante(nombre, appat, apmat, correoe, universidad, nocuenta) values('"+nombre+"', '"+appat+"', '"+apmat+"', '"+correoe+"', '"+universidad+"', '"+cuenta+"')");
            p.sentencia.close();
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
        
        public void subirVideojuego(String nombre, String ano, String descripcion, String desarrollador, String costo, String categoria, byte[] video, byte[] imagen, String url){
            ConexionBD p = new ConexionBD();
                try{
                    Class.forName("org.postgresql.Driver");
                    p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
                    System.out.println("Conexion Exitosa");
                    p.sentencia = p.conexion.createStatement();
                    
                    String idvj="1";
                    String v=p.openFileToString(video);
                    String i=p.openFileToString(imagen);
                    p.sentencia.executeUpdate("insert into videojuego(idvj, nombre, ano, descripcion, desarrollador, costo, categoria) values("+idvj+"'"+nombre+"', "+ano+", '"+descripcion+"', '"+desarrollador+"', "+costo+", '"+categoria+"')");
                    //p.sentencia.executeUpdate("insert into videojuego(idvj, nombre, ano, descripcion, desarrollador, costo, categoria, video, imagen, archivo) values("+idvj+"'"+nombre+"', "+ano+", '"+descripcion+"', '"+desarrollador+"', "+costo+", '"+categoria+"', "+v+", "+i+")");
                    p.sentencia.close();
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

        public String openFileToString(byte[] _bytes)
{
    String file_string = "";

    for(int i = 0; i < _bytes.length; i++)
    {
        file_string += (char)_bytes[i];
    }

    return file_string;
}
    
    public LinkedList solicitudes(){
        LinkedList<Estudiante> lista=new LinkedList();
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
                
                rs1 = sentencia.executeQuery("Select * From estudiante");
                Estudiante e;
                
                while(rs1.next()){
                    e=new Estudiante(rs1.getString("nombre"), rs1.getString("appat"), rs1.getString("apmat"), rs1.getString("correoe"), rs1.getString("universidad"), rs1.getString("nocuenta"));
                    lista.add(e);
                }
                rs1.close();
                
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
                return lista;
            }
    }
    
    public static void main(String[] args) {
        ConexionBD p = new ConexionBD();
      try{
    
        Class.forName("org.postgresql.Driver");
        p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
        System.out.println("Conexion Exitosa");
        p.sentencia = p.conexion.createStatement();
    /*    
        //Ejemplo consulta
        //p.sentencia.executeUpdate("insert into estudiante (correoe) values('");
        p.rs1 = p.sentencia.executeQuery("Select * From estudiante");
        //p.registrarse("ivan", "s", "m", "iv@ciencias", "unam", "3");
            while(p.rs1.next()){
                System.out.println(p.rs1.getString("correoe")+" - "+ p.rs1.getString("nombre"));
            }
            System.out.println("\n\n\n");
            p.rs1.close();
  */
        LinkedList<Estudiante> lista = p.solicitudes();
        for(int i=0; i<lista.size(); i++){
            System.out.println(lista.get(i).getNombre() + " 1");
        }
        
    //}catch (SQLException e){
      //      System.out.println("Error "+e);
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