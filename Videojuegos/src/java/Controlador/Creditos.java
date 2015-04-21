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
         if(creditos.equals("") || correoe.equals("")){
            request.getRequestDispatcher("RevisarSolicitudCredito").forward(request, response);
        }else{
            ConexionBD cbd=new ConexionBD();
            cbd.cuenta(correoe, creditos);
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
         if(creditos.equals("") || correoe.equals("")){
            request.getRequestDispatcher("RevisarSolicitudCredito").forward(request, response);
        }else{
            ConexionBD cbd=new ConexionBD();
            try{
            Class.forName("org.postgresql.Driver");
            cbd.conexion =DriverManager.getConnection(cbd.url, cbd.username, cbd.password);
            System.out.println("Conexion Exitosa");
            cbd.sentencia = cbd.conexion.createStatement();
            cbd.cuenta(correoe, creditos);
            request.getRequestDispatcher("/RevisarSolicitudCredito").forward(request, response);
        }catch (SQLException e){
            System.out.println("Error "+e);
        }catch (Exception e){
            System.out.println("Error "+e);
        }
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
