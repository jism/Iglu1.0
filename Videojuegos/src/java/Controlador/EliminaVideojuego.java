/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

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
@WebServlet(name = "EliminaVideojuego", urlPatterns = {"/EliminaVideojuego"})
public class EliminaVideojuego extends HttpServlet {

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
            out.println("<title>Servlet EliminaVideojuego</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EliminaVideojuego at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
                cbd.sentencia.executeUpdate("delete from videojuegousuario where idvj="+idvj);
                cbd.sentencia.executeUpdate("delete from videojuego where idvj="+idvj);
                sesion.setAttribute("ev", "1");
                request.getRequestDispatcher("/ListaVideojuego").forward(request, response);
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
