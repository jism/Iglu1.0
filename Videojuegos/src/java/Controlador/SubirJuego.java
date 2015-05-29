/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.FileUpload;
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

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
        String nombre = "";
        String desarrollador = "";
        String ano = "";
        String categoria = "";
        String precio = "";
        String descripcion = "";
        String archivo = "";
        String ruta = "";
        int i=0;
        
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
                    else if(fieldName.equals("desarrollador"))
                        desarrollador=value;
                    else if(fieldName.equals("ano"))
                        ano=value;
                    else if(fieldName.equals("categoria"))
                        categoria=value;
                    else if(fieldName.equals("precio"))
                        precio=value;
                    else if(fieldName.equals("descripcion"))
                        descripcion=value;
                    //response.getWriter().println(fieldName+":"+value+"<br/>");
						System.out.println(nombre);
                                                System.out.println(desarrollador);
                                                System.out.println(ano);
                                                System.out.println(categoria);
                                                System.out.println(precio);
                                                System.out.println(descripcion);
                }else{
                    //do file upload specific process
                  if(i==0){    
                    String path = getServletContext().getRealPath("/");
                    ruta=path;
                    System.out.println("Path:   "+path);
                    //call a method to upload file.
                    if(FileUpload.processFileImagen(path, item, nombre+" "+desarrollador))
                        //response.getWriter().println("file uploaded successfully");
                        System.out.println("file upload successfully");
                    else
                        //response.getWriter().println("file uploading falied");
                        System.out.println("file uploading falied");
                    i++;
                  }else if(i==1){    
                    String path = getServletContext().getRealPath("/");
                    ruta=path;
                    System.out.println("Path:   "+path);
                    //call a method to upload file.
                    if(FileUpload.processFileVideo(path, item, nombre+" "+desarrollador))
                        //response.getWriter().println("file uploaded successfully");
                        System.out.println("file upload successfully");
                    else
                        //response.getWriter().println("file uploading falied");
                        System.out.println("file uploading falied");
                    i++;
                  }else if(i==2){    
                    String path = getServletContext().getRealPath("/");
                    ruta=path;
                    System.out.println("Path:   "+path);
                    //call a method to upload file.
                    if(FileUpload.processFileArchivo(path, item, nombre+" "+desarrollador)){
                        archivo=nombre+" "+desarrollador+item.getName();
                        //response.getWriter().println("file uploaded successfully");
                        System.out.println("file upload successfully");
                    }else
                        //response.getWriter().println("file uploading falied");
                        System.out.println("file uploading falied");
                    i++;
                  }
                }
            }
	}catch(FileUploadException fue){
            fue.printStackTrace();
	}

            ConexionBD cbd=new ConexionBD();
            cbd.subirVideojuego(nombre, ano, descripcion, desarrollador, precio, categoria, ruta, ruta, archivo);
            
            String t="exito";
            request.setAttribute("msg", t);
            request.getRequestDispatcher("/VideojuegoExitoso.jsp").forward(request, response);
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
