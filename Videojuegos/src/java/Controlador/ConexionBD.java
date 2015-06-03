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
import Modelo.Usuario;
import Modelo.Videojuego;
import java.sql.*;
import java.text.DateFormat;
import java.util.Arrays;
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
        username = "";
        password = "";
        conexion = null;
        sentencia=null;
        st = null;
        rs1=null;
        rs2 = null;
        
    }
    
    public boolean cuenta(String correoe, String creditos){
        boolean b=false;
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
            boolean bandera=true;
            
            try{
                p.rs2 = sentencia.executeQuery("Select * From cuenta");
                try{
                while(p.rs2.next()){
                    if(p.rs2.getString("correoe").equals(correoe)){
                       bandera=false; 
                    }
                }
                }catch(java.lang.NullPointerException e){
                    System.out.println("Vacio");
                }
                if(bandera){
                    p.sentencia.executeUpdate("insert into cuenta(fechavenc, creditos, correoe) values('2015-12-31', '"+creditos+"', '"+correoe+"')");
                    b=true;
                }else
                    b=false;
            }catch(java.lang.NullPointerException npe){
                    
            }
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
          return b;
    }
    
    public boolean cambiaContrasena(String correoe, String contrasena){
        boolean b=false;
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
            boolean bandera=true;
            
            try{
                sentencia.executeUpdate("update usuario set contrasena = '"+contrasena+"' where correoe = '"+correoe+"'");
                b=true;
            }catch(java.lang.NullPointerException npe){
                    
            }
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
          return b;
    }
    
    public LinkedList getCuenta(){
        LinkedList<Modelo.Cuenta> lista=new LinkedList();
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
                
                rs1 = sentencia.executeQuery("Select * From cuenta");
                Modelo.Cuenta c;
                
                try{
                while(rs1.next()){
                    c=new Modelo.Cuenta(rs1.getString("correoe"), Integer.parseInt(rs1.getString("creditos")), rs1.getString("fechavenc"));
                    
                    lista.add(c);
                }
                }catch(java.lang.NullPointerException npe){
                    return lista;
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
    
    public LinkedList datosUsuarios(){
        LinkedList<Usuario> lista=new LinkedList();
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
                
                rs1 = sentencia.executeQuery("select nombre ||' '|| appat ||' '|| apmat AS \"nombrecompleto\", correoe, creditos from estudiante natural join cuenta");
                Usuario u;
                
                try{
                while(rs1.next()){
                    u=new Usuario(rs1.getString("correoe"), rs1.getString("creditos"), (String) rs1.getString("nombrecompleto"));
                    lista.add(u);
                }
                }catch(java.lang.NullPointerException npe){
                    return lista;
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
    
    public boolean usuario(String correoe, String contrasena){
        boolean b=false;
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
            boolean bandera=true;
            
            try{
                p.rs2 = sentencia.executeQuery("Select * From usuario");
                try{
                while(p.rs2.next()){
                    if(p.rs2.getString("correoe").equals(correoe)){
                       bandera=false; 
                    }
                }
                }catch(java.lang.NullPointerException e){
                    System.out.println("Vacio");
                }
                if(bandera){
                    p.sentencia.executeUpdate("insert into usuario(correoe, contrasena) values('"+correoe+"', '"+contrasena+"')");
                    b=true;
                }else
                    b=false;
            }catch(java.lang.NullPointerException npe){
                    
            }
            p.sentencia.close();
            
        }catch (SQLException e){
            System.out.println("Error "+e);
        }catch (Exception e){
            System.out.println("Error "+e);
        }finally{
            if(p.conexion != null){
                try{
                    p.conexion.close();
                    return b;
                }catch(SQLException e){
                    System.out.println("Error "+e);
                }
                }
        }
        return b;
    }
    
    public Videojuego videojuego(String idvj){
        ConexionBD p = new ConexionBD();
        Videojuego v=null;
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
            
            try{
                p.rs1 = sentencia.executeQuery("Select * From videojuego where idvj="+idvj);
                try{
                    v=new Videojuego(Integer.parseInt(rs1.getString("idvj")), rs1.getString("nombre"), Integer.parseInt(rs1.getString("año")), rs1.getString("descripcion"), rs1.getString("categoria"), rs1.getString("desarrollador"), Integer.parseInt(rs1.getString("costo")), rs1.getString("archivo"), rs1.getString("video"));
                }catch(java.lang.NullPointerException e){
                    System.out.println("Vacio");
                }
            }catch(java.lang.NullPointerException npe){
                    System.out.println("Error al leer base de datos");
            }
            p.sentencia.close();
            
        }catch (SQLException e){
            System.out.println("Error "+e);
        }catch (Exception e){
            System.out.println("Error "+e);
        }finally{
            if(p.conexion != null){
                try{
                    p.conexion.close();
                    return v;
                }catch(SQLException e){
                    System.out.println("Error "+e);
                }
                }
        }
        return v;
    }
    
    public void registrarse(String nombre, String appat, String apmat, String correoe, String universidad, String cuenta, String ruta){
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();

            p.sentencia.executeUpdate("insert into estudiante(nombre, appat, apmat, correoe, universidad, nocuenta, histacd) values('"+nombre+"', '"+appat+"', '"+apmat+"', '"+correoe+"', '"+universidad+"', '"+cuenta+"', '"+ruta+"')");
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
        
    public int subirVideojuego(String nombre, String ano, String descripcion, String desarrollador, String costo, String categoria, String imagen, String video, String archivo){
        ConexionBD p = new ConexionBD();
        int id=0;
        try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
            
            p.rs1=p.sentencia.executeQuery("select * from videojuego");
            try{
                while(p.rs1.next()){
                    id++;
                }
                if(id != 0){
                    p.rs2=p.sentencia.executeQuery("select * from videojuego");
                    int[] ids=new int[id];
                    int k=0;
                    while(p.rs2.next()){
                        ids[k]=Integer.parseInt(p.rs2.getString("idvj"));
                    }
                    Arrays.sort(ids);
                    id=ids[id-1]+1;
                }
            }catch(java.lang.NullPointerException e){
                id=0;
            }
            
            String idvj=Integer.toString(id);
            System.out.println(id);
            //String v=p.openFileToString(video);
            //String i=p.openFileToString(imagen);
            p.sentencia.executeUpdate("insert into videojuego(idvj, nombre, año, descripcion, desarrollador, costo, categoria, imagen, video, archivo) values("+idvj+",'"+nombre+"', "+ano+", '"+descripcion+"', '"+desarrollador+"', "+costo+", '"+categoria+"', '"+imagen+"', '"+video+"', '"+archivo+"')");
            //p.sentencia.executeUpdate("insert into videojuego(idvj, nombre, ano, descripcion, desarrollador, costo, categoria, video, imagen, archivo) values("+idvj+"'"+nombre+"', "+ano+", '"+descripcion+"', '"+desarrollador+"', "+costo+", '"+categoria+"', "+v+", "+i+")");
            p.sentencia.close();
            return id;
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
        return id;
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
        
    public LinkedList estudiantes(){
        LinkedList<Estudiante> lista=new LinkedList();
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
                
                rs1 = sentencia.executeQuery("Select * From estudiante");
                Estudiante e;
                
                try{
                while(rs1.next()){
                    e=new Estudiante(rs1.getString("nombre"), rs1.getString("appat"), rs1.getString("apmat"), rs1.getString("correoe"), rs1.getString("universidad"), rs1.getString("nocuenta"));
                    lista.add(e);
                }
                }catch(java.lang.NullPointerException npe){
                    return lista;
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
    
    public LinkedList videojuegousuario(String correoe){
        LinkedList<String> lista=new LinkedList();
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
                
                rs1 = sentencia.executeQuery("Select * From videojuegousuario where correoe='"+correoe+"'");
                String idvj;
                try{
                while(rs1.next()){
                    idvj=rs1.getString("idvj");
                    lista.add(idvj);
                }
                }catch(java.lang.NullPointerException npe){
                    return lista;
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
                
                try{
                while(rs1.next()){
                    e=new Estudiante(rs1.getString("nombre"), rs1.getString("appat"), rs1.getString("apmat"), rs1.getString("correoe"), rs1.getString("universidad"), rs1.getString("nocuenta"));
                    lista.add(e);
                }
                }catch(java.lang.NullPointerException npe){
                    return lista;
                }
                try{
                rs1 = sentencia.executeQuery("Select * From cuenta");
                while(rs1.next()){
                    for(int i=0; i< lista.size(); i++){
                        if(rs1.getString("correoe").equals(lista.get(i).getCorreoe()))
                            lista.remove(i);
                    }
                }
                }catch(java.lang.NullPointerException npe){
                    return lista;
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
    
    public LinkedList usuarios(){
        LinkedList<Usuario> lista=new LinkedList();
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
                
                rs1 = sentencia.executeQuery("Select * From usuario");
                Usuario u;
                
                try{
                while(rs1.next()){
                    u=new Usuario(rs1.getString("correoe"), rs1.getString("contrasena"));
                    lista.add(u);
                }
                }catch(java.lang.NullPointerException npe){
                    return lista;
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
    
    public LinkedList correos(){
        LinkedList<Estudiante> lista=new LinkedList();
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
                
                rs1 = sentencia.executeQuery("Select * From estudiante");
                Estudiante e;
                
                try{
                while(rs1.next()){
                    e=new Estudiante(rs1.getString("nombre"), rs1.getString("appat"), rs1.getString("apmat"), rs1.getString("correoe"), rs1.getString("universidad"), rs1.getString("nocuenta"));
                    lista.add(e);
                }
                }catch(java.lang.NullPointerException npe){
                    return lista;
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
    
    public String[] getAdministrador(){
        String[] datos=new String[2];
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
                
                rs1 = sentencia.executeQuery("Select * From administrador");
                
                try{
                while(rs1.next()){
                        datos[0]=rs1.getString("correoe");
                        datos[1]=rs1.getString("nombre");
                        break;
                }
                }catch(java.lang.NullPointerException npe){
                    return null;
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
                return datos;
            }
        }
    
    public LinkedList videojuegos(){
        LinkedList<Videojuego> lista=new LinkedList();
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
                
                rs1 = sentencia.executeQuery("Select * From videojuego");
                Videojuego v;
                
                while(rs1.next()){
                    v=new Videojuego(Integer.parseInt(rs1.getString("idvj")), rs1.getString("nombre"), Integer.parseInt(rs1.getString("año")), rs1.getString("descripcion"), rs1.getString("categoria"), rs1.getString("desarrollador"), Integer.parseInt(rs1.getString("costo")), rs1.getString("archivo"), rs1.getString("video"));
                    lista.add(v);
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
        //p.cuenta("diego@ciencias.unam.mx", "20");
         // p.subirVideojuego("Mario Bros", "1989", "Clasico juego de Super Mario Bros", "NES", "10", "Clasicos", "https://www.youtube.com/watch?v=Boq3ghiTKHA", null, "http://download.freeroms.com/nes_roms/08/super_mario_bros._(usajapan).zip");
            
        
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