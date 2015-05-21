/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Estudiante;
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

/**
 *
 * @author Ivan
 */
@WebServlet(name = "Registrarse", urlPatterns = {"/Registrarse"})
public class Registrarse extends HttpServlet {

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
            out.println("<title>Servlet Registrarse</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Registrarse at " + request.getContextPath() + "</h1>");
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
        
        String nombre = request.getParameter("nombre");
        String appat = request.getParameter("appat");
        String apmat = request.getParameter("apmat");
        String correoe = request.getParameter("correo");
        String universidad = request.getParameter("universidad");
        String cuenta = request.getParameter("cuenta");
        
    try{   
        ConexionBD cbd=new ConexionBD();
        Class.forName("org.postgresql.Driver");
        cbd.conexion =DriverManager.getConnection(cbd.url, cbd.username, cbd.password);
        System.out.println("Conexion Exitosa");
        cbd.sentencia = cbd.conexion.createStatement();
        
        if(nombre.equals("") || appat.equals("") || apmat.equals("") || correoe.equals("") || universidad.equals("") || cuenta.equals("") ){
            String f="f";
            request.setAttribute("msg", f);
            request.getRequestDispatcher("/Registro.jsp").forward(request, response);
        }else{
            LinkedList<Estudiante> lista=cbd.correos();
            boolean b=true, admin=false;
            if(correoe.equals("iglu20151@gmail.com"))
                admin = true;
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCorreoe().equals(correoe) || admin){
                    String f="f";
                    request.setAttribute("msg", f);
                    request.getRequestDispatcher("/Registro.jsp").forward(request, response);
                    b=false;
                }
            }
            if(b){
            cbd.registrarse(nombre, appat, apmat, correoe, universidad, cuenta);
            String t="t";
            request.setAttribute("msg", t);
            request.getRequestDispatcher("/Registro.jsp").forward(request, response);
            }
        }
        
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
