/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ivan
 */
public class Creditos extends HttpServlet {

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
            out.println("<title>Servlet Creditos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Creditos at " + request.getContextPath() + "</h1>");
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
        String creditos = request.getParameter("creditos");
        String correoe = request.getParameter("correoe");
        String revision = request.getParameter("revision");
         if(creditos.equals("") || correoe.equals("") || revision.equals("0")){
            request.getRequestDispatcher("RevisarSolicitudCredito").forward(request, response);
        }else{
            ConexionBD cbd=new ConexionBD();
            if(revision.equals("1")){
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
                Email e=new Email();
                boolean envio=e.sendM(correoe, creditos, contrasena, true, "");
                if(envio){
                    System.out.println("Enviado");
                    cbd.cuenta(correoe, creditos);
                }else
                    System.out.println("No Enviado");
            }
            request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
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
        String creditos = request.getParameter("creditos");
        String correoe = request.getParameter("correoe");
        String revision = request.getParameter("valido");
         if(creditos.equals("") || correoe.equals("")){
            request.getRequestDispatcher("RevisarSolicitudCredito").forward(request, response);
        }else{
                String base = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
                int LargoContrasena = 8;
                int longitud = base.length();
                String contrasena="";
                for(int i=0; i<LargoContrasena;i++){ 
                    int numero = (int)(Math.random()*(longitud)); 
                    String caracter=base.substring(numero, numero+1); 
                    contrasena=contrasena+caracter; 
                }
                //System.out.println("Pass: " +contrasena);
          if(revision !=null){
            if(revision.equals("1")){
                Email e=new Email();
                boolean envio=e.sendM(correoe, creditos, contrasena, true, "");
                if(envio){
                    ConexionBD cbd=new ConexionBD();
                    try{
                        Class.forName("org.postgresql.Driver");
                        cbd.conexion =DriverManager.getConnection(cbd.url, cbd.username, cbd.password);
                        System.out.println("Conexion Exitosa");
                        cbd.sentencia = cbd.conexion.createStatement();
                        cbd.cuenta(correoe, creditos);
                        Encriptar en=new Encriptar();
                        String pass=en.encriptaEnMD5(contrasena);
                        cbd.usuario(correoe, pass);
                        String t=correoe;
                        request.setAttribute("msg", t);
                        request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
                    }catch (SQLException ex){
                        System.out.println("Error "+ex);
                    }catch (Exception ex){
                        System.out.println("Error "+ex);
                    }
                }else
                    request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
              }
                //request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
            }else{
                
                String [] invalido = request.getParameterValues("invalido");
                if(invalido == null)
                    request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
                String nota="\n\n";
                for(int i=0; i<invalido.length; i++){
                    if(invalido[i] != null)
                        nota=nota+"-"+invalido[i]+"\n";
                }
                Email e=new Email();
                boolean envio=e.datosIncorrectos(correoe, nota);
                if(envio){
                    ConexionBD cbd=new ConexionBD();
                    try{
                        Class.forName("org.postgresql.Driver");
                        cbd.conexion =DriverManager.getConnection(cbd.url, cbd.username, cbd.password);
                        System.out.println("Conexion Exitosa");
                        cbd.sentencia = cbd.conexion.createStatement();
                        cbd.sentencia.executeUpdate("Delete From estudiante Where correoe = '"+correoe+"'");
                        request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
                    }catch (SQLException ex){
                        System.out.println("Error "+ex);
                    }catch (Exception ex){
                        System.out.println("Error "+ex);
                    }
                    //request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
                }else
                    request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
            }   
        }
         request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
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
