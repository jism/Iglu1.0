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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author r
 */
public class ListaVideojuego extends HttpServlet {

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
            out.println("<title>Servlet ListaVideojuego</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListaVideojuego at " + request.getContextPath() + "</h1>");
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
        String c="0";
        if(request.getParameter("c") != null){
            c=request.getParameter("c");
        }
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
             
                
                
        LinkedList<Videojuego> lista = p.videojuegos();
        LinkedList<Videojuego> lista2 = new LinkedList();
        boolean b=true;
        if(c.equals("0")){
            request.setAttribute("lista", lista);
            b=false;
        }else if(c.equals("1")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("Android"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("2")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("Emuladores"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("3")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("iPhone"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("4")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("PC"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("5")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("PSP"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("6")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("PSX"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("7")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("Rooms"))
                    lista2.add(lista.get(i));
            }
        }else{
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("Otros"))
                    lista2.add(lista.get(i));
            }
        }
        
        if(b)
            request.setAttribute("lista", lista2);
        request.setAttribute("c", c);
        
        HttpSession sesion = request.getSession();
        String correo= (String) sesion.getAttribute("usuario");
            if(sesion != null){
                LinkedList<String> ids=p.videojuegousuario(correo);
                request.setAttribute("lista2", ids);
            }
        
        request.getRequestDispatcher("/ListaVideojuegos.jsp").forward(request, response);
        
        }catch (SQLException e){
                System.out.println("Error "+e);
            }catch (Exception e){
                System.out.println("Error "+e);
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
        String c="0";
        if(request.getParameter("c") != null){
            c=request.getParameter("c");
        }
        ConexionBD p = new ConexionBD();
          try{
            Class.forName("org.postgresql.Driver");
            p.conexion =DriverManager.getConnection(p.url, p.username, p.password);
            System.out.println("Conexion Exitosa");
            p.sentencia = p.conexion.createStatement();
             
                
                
        LinkedList<Videojuego> lista = p.videojuegos();
        LinkedList<Videojuego> lista2 = new LinkedList();
        boolean b=true;
        if(c.equals("0")){
            request.setAttribute("lista", lista);
            b=false;
        }else if(c.equals("1")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("Android"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("2")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("Emuladores"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("3")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("iPhone"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("4")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("PC"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("5")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("PSP"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("6")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("PSX"))
                    lista2.add(lista.get(i));
            }
        }else if(c.equals("7")){
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("Rooms"))
                    lista2.add(lista.get(i));
            }
        }else{
            for(int i=0; i<lista.size(); i++){
                if(lista.get(i).getCategoria().equals("Otros"))
                    lista2.add(lista.get(i));
            }
        }
        
        if(b)
            request.setAttribute("lista", lista2);
        request.setAttribute("c", c);
        
        HttpSession sesion = request.getSession();
        String correo= (String) sesion.getAttribute("usuario");
            if(sesion != null){
                LinkedList<String> ids=p.videojuegousuario(correo);
                request.setAttribute("lista2", ids);
            }
        
        request.getRequestDispatcher("/ListaVideojuegos.jsp").forward(request, response);
        
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
