/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ivan
 */
@WebServlet(name = "EliminaUsuario", urlPatterns = {"/EliminaUsuario"})
public class EliminaUsuario extends HttpServlet {

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
            out.println("<title>Servlet EliminaUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EliminaUsuario at " + request.getContextPath() + "</h1>");
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
        String correo= (String) request.getParameter("correoe");
        String usuario= (String) request.getParameter("usuario");
        ConexionBD p = new ConexionBD();
        try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
        
            p.sentencia.executeUpdate("delete from videojuegousuario where correoe='"+correo+"'");
            p.sentencia.executeUpdate("delete from usuario where correoe='"+correo+"'");
            p.sentencia.executeUpdate("delete from cuenta where correoe='"+correo+"'");
            p.sentencia.executeUpdate("delete from estudiante where correoe='"+correo+"'");
            
            if(usuario != null){
                HttpSession sesion = request.getSession();
                if(sesion!=null)
                    sesion.invalidate();
                response.sendRedirect("Index.jsp?m=1");
            }
            //request.setAttribute("estudiante", e);
            HttpSession sesion = request.getSession();
            sesion.setAttribute("e", "1");
            request.getRequestDispatcher("Usuarios").forward(request, response);
        
        }catch (SQLException e){
            System.out.println("Error "+e);
        }catch (Exception e){
            System.out.println("Error "+e);
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
