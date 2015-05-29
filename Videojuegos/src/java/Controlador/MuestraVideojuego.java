/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Videojuego;
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
@WebServlet(name = "MuestraVideojuego", urlPatterns = {"/MuestraVideojuego"})
public class MuestraVideojuego extends HttpServlet {

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
            out.println("<title>Servlet MuestraVideojuego</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MuestraVideojuego at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String idvj = request.getParameter("i");
        Videojuego v=null;
        System.out.println("El idvj es: "+idvj);
        ConexionBD cbd=new ConexionBD();
        try{
            Class.forName("org.postgresql.Driver");
            cbd.conexion =DriverManager.getConnection(cbd.url, cbd.username, cbd.password);
            System.out.println("Conexion Exitosa");
            cbd.sentencia = cbd.conexion.createStatement();
            LinkedList<Videojuego> videojuegos=cbd.videojuegos();
            for(int i=0; i<videojuegos.size(); i++){
                if(videojuegos.get(i).getIdvj() == Integer.parseInt(idvj)){
                    v=videojuegos.get(i);
                    i=videojuegos.size();
                }
            }
            //System.out.println("El nombre del vj es: "+v.getNombre());
            request.setAttribute("videojuego", v);
            
            HttpSession sesion = request.getSession();
            if(sesion != null){
        
            String correo= (String) sesion.getAttribute("usuario");
            LinkedList<String> ids=cbd.videojuegousuario(correo);
            for(int i=0; i<ids.size(); i++){
                if(idvj.equals(ids.get(i))){
                    System.out.println("Si lo encontre");
                    request.setAttribute("ids", "true");
                    i=ids.size();
                }else
                    request.setAttribute("ids", "false");
            }
            
            }
            
            request.getRequestDispatcher("/Videojuego.jsp").forward(request, response);
        }catch (SQLException ex){
            System.out.println("Error "+ex);
        }catch (Exception ex){
            System.out.println("Error "+ex);
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
        String idvj = request.getParameter("idvj");
        ConexionBD cbd=new ConexionBD();
        try{
            Class.forName("org.postgresql.Driver");
            cbd.conexion =DriverManager.getConnection(cbd.url, cbd.username, cbd.password);
            System.out.println("Conexion Exitosa");
            cbd.sentencia = cbd.conexion.createStatement();
            HttpSession sesion = request.getSession();
            if(sesion == null)
                request.getRequestDispatcher("/Index.jsp").forward(request, response);
            else{
        
            String correo= (String) sesion.getAttribute("usuario");
            String precio = request.getParameter("precio");
            
            LinkedList<Modelo.Cuenta> creditos=cbd.getCuenta();
            int n=-1;
            for(int i=0; i<creditos.size();i++){
                if(creditos.get(i).getCorreoe().equals(correo)){
                    n=creditos.get(i).getCreditos();
                    i=creditos.size();
                }
            }
            
            if(n>=Integer.parseInt(precio)){
                n=n-Integer.parseInt(precio);
                cbd.sentencia.executeUpdate("update cuenta set creditos = "+n+" where correoe='"+correo+"'");
                cbd.sentencia.executeUpdate("insert into videojuegousuario(idvj, correoe) values("+idvj+", '"+correo+"')");
            }else{
                request.setAttribute("creditos", "0");
            }
            
            
            
            LinkedList<String> ids=cbd.videojuegousuario(correo);
            for(int i=0; i<ids.size(); i++){
                if(idvj.equals(ids.get(i))){
                    request.setAttribute("ids", "true");
                    i=ids.size();
                }else
                    request.setAttribute("ids", "false");
            }
            
            
            }
        }catch (SQLException ex){
            System.out.println("Error "+ex);
        }catch (Exception ex){
            System.out.println("Error "+ex);
        }
        
        Videojuego v=null;
        System.out.println("El idvj es: "+idvj);
        
        try{
            Class.forName("org.postgresql.Driver");
            cbd.conexion =DriverManager.getConnection(cbd.url, cbd.username, cbd.password);
            System.out.println("Conexion Exitosa");
            cbd.sentencia = cbd.conexion.createStatement();
            LinkedList<Videojuego> videojuegos=cbd.videojuegos();
            for(int i=0; i<videojuegos.size(); i++){
                if(videojuegos.get(i).getIdvj() == Integer.parseInt(idvj)){
                    v=videojuegos.get(i);
                    i=videojuegos.size();
                }
            }
            //System.out.println("El nombre del vj es: "+v.getNombre());
            request.setAttribute("videojuego", v);
            request.getRequestDispatcher("/Videojuego.jsp").forward(request, response);
        }catch (SQLException ex){
            System.out.println("Error "+ex);
        }catch (Exception ex){
            System.out.println("Error "+ex);
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
