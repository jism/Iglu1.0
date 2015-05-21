package Controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
@WebServlet(urlPatterns = {"/IniciarSesion"})
public class IniciarSesion extends HttpServlet {

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
            out.println("<title>Servlet IniciarSesion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IniciarSesion at " + request.getContextPath() + "</h1>");
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
     * Metodo que redirecciona a Administrador.jsp
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        //omite la verificacion de la contraseña
        //response.sendRedirect("Administrador.jsp");
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
        String correoe=request.getParameter("correo");
        String contrasena=request.getParameter("contrasena");
        Encriptar en=new Encriptar();
        contrasena=en.encriptaEnMD5(contrasena);
        ConexionBD p=new ConexionBD();
        try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
            
        String[] datos = p.getAdministrador();
        if(datos[0].equals(correoe) && datos[1].equals(contrasena)){
            sesion.setAttribute("administrador", correoe);
            response.sendRedirect("Administrador.jsp");
        }else{
            LinkedList<Usuario> usuarios=p.usuarios();
            for(int i=0; i<usuarios.size(); i++){
                if(usuarios.get(i).getCorreoe().equals(correoe)){
                    if(usuarios.get(i).getContrasena().equals(contrasena)){
                        sesion.setAttribute("usuario", correoe);
                        i=usuarios.size();
                        response.sendRedirect("Index.jsp");
                    }else{
                        String t="contrasena";
                        request.setAttribute("msg", t);
                        request.getRequestDispatcher("/Index.jsp").forward(request, response);
                        i=usuarios.size();
                    }
                }
            }
            String t="correo";
            request.setAttribute("msg", t);
            request.getRequestDispatcher("/Index.jsp").forward(request, response);
        }
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
