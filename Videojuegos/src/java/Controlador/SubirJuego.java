/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ivan
 */
@WebServlet(name = "SubirJuego", urlPatterns = {"/SubirJuego"})
public class SubirJuego extends HttpServlet {

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
            out.println("<title>Servlet SubirJuego</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubirJuego at " + request.getContextPath() + "</h1>");
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
        String nombre = request.getParameter("nombre");
        String desarrollador = request.getParameter("desarrollador");
        String ano = request.getParameter("ano");
        String categoria = request.getParameter("categoria");
        String precio = request.getParameter("precio");
        String descripcion = request.getParameter("descripcion");
        String video = request.getParameter("video");
        String archivo = request.getParameter("archivo");
        
        
        if(nombre.equals("") || desarrollador.equals("") || ano.equals("") || categoria.equals("") || precio.equals("") || descripcion.equals("") || video.equals("") | archivo.equals("") ){
            String f="f";
            request.setAttribute("msg", f);
            request.getRequestDispatcher("/SubirJuego.jsp").forward(request, response);
        }else{
            ConexionBD cbd=new ConexionBD();
            cbd.subirVideojuego(nombre, ano, descripcion, desarrollador, precio, categoria, video, null, archivo);
            
            String t="t";
            request.setAttribute("msg", t);
            request.getRequestDispatcher("/SubirJuego.jsp").forward(request, response);
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
