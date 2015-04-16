/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.FileOutputStream;
import java.io.OutputStream;

/**
 *
 * @author Ivan
 */
public class PDF {
    public static boolean leerArchivo(byte[] fileBytes, String archivoDestino){ 
        boolean correcto = false; 
            try { 
               OutputStream out = new FileOutputStream(archivoDestino); 
                out.write(fileBytes); 
                out.close();         
                correcto = true; 
            } catch (Exception e) { 
                e.printStackTrace(); 
            }         
        return correcto;
    }
    
    public static boolean guardarArchivo(byte[] fileBytes, String archivoDestino){ 
   boolean correcto = false; 
   try { 
     OutputStream out = new FileOutputStream(archivoDestino); 
     out.write(fileBytes); 
     out.close();         
     correcto = true; 
   } catch (Exception e) { 
     e.printStackTrace(); 
   }         
     return correcto;

}
}
