/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Estudiante;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ivan
 */
@WebServlet(name = "CambiarContrasena", urlPatterns = {"/CambiarContrasena"})
public class CambiarContrasena extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CambiarContrasena</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CambiarContrasena at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        if(sesion == null){
            String appat = request.getParameter("appat");
            String correoe = request.getParameter("correo");
            String cuenta = request.getParameter("cuenta");
            String contrasena = request.getParameter("contrasena");
            
            ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
            
            LinkedList<Usuario> usuarios=p.usuarios();
            LinkedList<Estudiante> estudiantes=p.estudiantes();
            Usuario u=null;
            Estudiante e=null;
            for(int i=0; i<usuarios.size();i++){
                if(usuarios.get(i).getCorreoe().equals(correoe)){
                    u=usuarios.get(i);
                    i=usuarios.size(); 
                }
            }
            
            if(u==null){
                String t="correo";
                request.setAttribute("msg", t);
                request.getRequestDispatcher("/RestablecerContrasena.jsp").forward(request, response);
            }
            
            for(int i=0; i<estudiantes.size();i++){
                if(estudiantes.get(i).getCorreoe().equals(correoe)){
                    e=estudiantes.get(i);
                    i=estudiantes.size(); 
                }
            }
            
            if(correoe.equals(e.getCorreoe()) && appat.equals(e.getAppat()) && cuenta.equals(e.getCuenta())){
                Encriptar encr=new Encriptar();
                String pass=encr.encriptaEnMD5(contrasena);
                boolean b= p.cambiaContrasena(correoe, pass);
                if(b){
                    String t="exito";
                    request.setAttribute("msg", t);
                    request.getRequestDispatcher("/RestablecerContrasena.jsp").forward(request, response);
                }else{
                    String t="fracaso";
                    request.setAttribute("msg", t);
                    request.getRequestDispatcher("/RestablecerContrasena.jsp").forward(request, response);
                }
            }else{
                String t="datos";
                request.setAttribute("msg", t);
                request.getRequestDispatcher("/RestablecerContrasena.jsp").forward(request, response);
            }
            
          }catch (SQLException ex){
            System.out.println("Error "+ex);
          }catch (Exception ex){
            System.out.println("Error "+ex);
          }
        }else{
            
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession sesion = request.getSession();
        if(sesion != null){
            String appat = request.getParameter("appat");
            String correoe = request.getParameter("correo");
            String cuenta = request.getParameter("cuenta");
            String base = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int LargoContrasena = 8;
            int longitud = base.length();
            String contrasena="";
            for(int i=0; i<LargoContrasena;i++){ 
                int numero = (int)(Math.random()*(longitud)); 
                String caracter=base.substring(numero, numero+1); 
                contrasena=contrasena+caracter; 
            }
            System.out.println("Pass: " +contrasena);
            
            ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
            
            LinkedList<Usuario> usuarios=p.usuarios();
            LinkedList<Estudiante> estudiantes=p.estudiantes();
            Usuario u=null;
            Estudiante e=null;
            for(int i=0; i<usuarios.size();i++){
                if(usuarios.get(i).getCorreoe().equals(correoe)){
                    u=usuarios.get(i);
                    i=usuarios.size(); 
                }
            }
            
            if(u==null){
                String t="correo";
                request.setAttribute("msg", t);
                request.getRequestDispatcher("/RestablecerContrasena.jsp").forward(request, response);
            }
            
            for(int i=0; i<estudiantes.size();i++){
                if(estudiantes.get(i).getCorreoe().equals(correoe)){
                    e=estudiantes.get(i);
                    i=estudiantes.size(); 
                }
            }
            
            if(correoe.equals(e.getCorreoe()) && appat.equals(e.getAppat()) && cuenta.equals(e.getCuenta())){
                Encriptar encr=new Encriptar();
                String pass=encr.encriptaEnMD5(contrasena);
                boolean b= p.cambiaContrasena(correoe, pass);
                if(b){
                    Email email=new Email();
                    boolean envio=email.cambioContrasena(correoe, contrasena);
                    String t="exito";
                    request.setAttribute("msg", t);
                    request.getRequestDispatcher("/RestablecerContrasena.jsp").forward(request, response);
                }else{
                    String t="fracaso";
                    request.setAttribute("msg", t);
                    request.getRequestDispatcher("/RestablecerContrasena.jsp").forward(request, response);
                }
            }else{
                String t="datos";
                request.setAttribute("msg", t);
                request.getRequestDispatcher("/RestablecerContrasena.jsp").forward(request, response);
            }
            
          }catch (SQLException ex){
            System.out.println("Error "+ex);
          }catch (Exception ex){
            System.out.println("Error "+ex);
          }
        }else{
            String t="fracaso";
            request.setAttribute("msg", t);
            request.getRequestDispatcher("/RestablecerContrasena.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
