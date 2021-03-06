/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Estudiante;
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
@WebServlet(name = "Usuario", urlPatterns = {"/Usuario"})
public class Usuario extends HttpServlet {

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
            out.println("<title>Servlet Usuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Usuario at " + request.getContextPath() + "</h1>");
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
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
        
            LinkedList<Modelo.Cuenta> creditos=p.getCuenta();
            int n=-1;
            for(int i=0; i<creditos.size();i++){
                if(creditos.get(i).getCorreoe().equals(correo)){
                    n=creditos.get(i).getCreditos();
                    i=creditos.size();
                }
            }
            Estudiante e=null;
            LinkedList<Estudiante> estudiantes= p.estudiantes();
            for(int i=0; i<estudiantes.size();i++){
                if(estudiantes.get(i).getCorreoe().equals(correo)){
                    e=estudiantes.get(i);
                    i=estudiantes.size();
                }
            }
            request.setAttribute("correoe", correo);
            request.setAttribute("creditos", n);
            request.setAttribute("estudiante", e);
            
            LinkedList<Videojuego> lista = p.videojuegos();
            LinkedList<Videojuego> lista2 = new LinkedList();
            LinkedList<String> ids=null;
            
            ids=p.videojuegousuario(correo);
            
            for(int i=0; i< lista.size(); i++){
                for(int j=0; j< ids.size(); j++){
                    if(lista.get(i).getIdvj() == Integer.parseInt(ids.get(j))){
                        lista2.add(lista.get(i));
                        j=ids.size();
                    }
                }
            }
        
            request.setAttribute("lista", lista2);
            
            request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
        
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
