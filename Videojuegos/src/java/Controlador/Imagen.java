/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 *
 * @author Ivan
 */
public class Imagen {
    byte[] imagen;

    public Imagen(){
    
    }
    public Imagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
    
    public byte[] generaImagen(BufferedImage img){
        double h=img.getHeight();
        System.out.println("h: "+h);
        double w=img.getWidth();
        System.out.println("w: "+w);
        h=128/h;
        System.out.println("h2: "+h);
        w=128/w;
        System.out.println("w2: "+w);
        img=modificarTamano(img, h, w);
        WritableRaster raster = img.getRaster();
        DataBufferByte data   = (DataBufferByte) raster.getDataBuffer();
        byte[] array=data.getData();
        return array;
    }
    
    public static BufferedImage modificarTamano(BufferedImage imagen, double b, double h) {
        final int X = (int)(imagen.getWidth() * b);
	final int Y = (int)(imagen.getHeight() * h);
	
        BufferedImage img = new BufferedImage(X, Y, BufferedImage.TYPE_INT_RGB);
        double x_r = 1/b;
	double y_r = 1/h;
	int x, y;
	for (int i = 0; i < X; i++) {
            x = (int)Math.floor(i * x_r);
            for (int j = 0; j < Y; j++) {
		y = (int)Math.floor(j * y_r);
		img.setRGB(i, j, imagen.getRGB(x, y));
		}
	}
        return img;
    }
    
    public static void main(String[] args){
         try {
        File img = new File("cg_nero_dt.jpg");
        Image image = ImageIO.read(img);
        BufferedImage bi = (BufferedImage) image;
        
        Imagen imagen=new Imagen();
        byte[] array=imagen.generaImagen(bi);
        
        for(int i=0; i<10; i++){
            System.out.println(array[i]);
        }
        
         } catch (FileNotFoundException e) {
          System.out.println("Archivo no encontrado");
      }catch (IOException ex) {
          System.out.println("No se pudo leer la imagen");
      } 
    }
    
}
