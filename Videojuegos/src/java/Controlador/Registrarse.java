/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Estudiante;
import Modelo.FileUpload;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
        
        String nombre="";
        String appat="";
        String apmat="";
        String correoe="";
        String universidad="";
        String cuenta="";
        String ruta="";
        
        ServletFileUpload upload = new ServletFileUpload();
        try{
            FileItemIterator itr = upload.getItemIterator(request);
            while(itr.hasNext()){
                FileItemStream item = itr.next();
                if(item.isFormField()){
                    //do field spacific process
                    String fieldName= item.getFieldName();
                    InputStream is = item.openStream();
                    byte[] b=new byte[is.available()];
                    is.read(b);
                    String value = new String(b);
                    if(fieldName.equals("nombre"))
                        nombre=value;
                    else if(fieldName.equals("appat"))
                        appat=value;
                    else if(fieldName.equals("apmat"))
                        apmat=value;
                    else if(fieldName.equals("correo"))
                        correoe=value;
                    else if(fieldName.equals("universidad"))
                        universidad=value;
                    else if(fieldName.equals("cuenta"))
                        cuenta=value;
                    //response.getWriter().println(fieldName+":"+value+"<br/>");
						
                }else{
                    //do file upload specific process
                    String path = getServletContext().getRealPath("/");
                    ruta=path;
                    System.out.println("Path:   "+path);
                    //call a method to upload file.
                    if(FileUpload.processFilePDF(path, item, correoe))
                        //response.getWriter().println("file uploaded successfully");
                        System.out.println("file upload successfully");
                    else
                        //response.getWriter().println("file uploading falied");
                        System.out.println("file uploading falied");
                }
            }
	}catch(FileUploadException fue){
            fue.printStackTrace();
	}
        
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
            
            cbd.rs1 = cbd.sentencia.executeQuery("select nocuenta, universidad from estudiante ");
            while(cbd.rs1.next()){
                if(cbd.rs1.getString("nocuenta").equals(cuenta) && cbd.rs1.getString("universidad").equals(universidad)){
                    String f="c";
                    request.setAttribute("msg", f);
                    request.getRequestDispatcher("/Registro.jsp").forward(request, response);
                }
            }
            
            if(b){
            cbd.registrarse(nombre, appat, apmat, correoe, universidad, cuenta, ruta);
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
