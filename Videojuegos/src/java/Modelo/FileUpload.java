/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Ivan
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import org.apache.commons.fileupload.FileItemStream;

/**
 *
 * @author Ivan
 */
public class FileUpload {
    public static boolean processFile(String path, FileItemStream item){
		try{
                        System.out.println(path+File.separator+"images");
			File f= new File(path+File.separator+"images");
			if(!f.exists())f.mkdir();
			File savedFile= new File(f.getAbsolutePath()+File.separator+item.getName());
			FileOutputStream fos = new FileOutputStream(savedFile);
			InputStream is = item.openStream();
			int x= 0;
			byte[] b = new byte[1024];
			while((x=is.read(b))!= -1){
				fos.write(b, 0, x);
			}
			fos.flush();
			fos.close();
			return true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
                return false;
	}
    
    public static boolean processFilePDF(String path, FileItemStream item, String correo){
		try{
                        System.out.println(path+File.separator+"pdf");
			File f= new File(path+File.separator+"pdf");
			if(!f.exists())f.mkdir();
			File savedFile= new File(f.getAbsolutePath()+File.separator+correo+".pdf");
			FileOutputStream fos = new FileOutputStream(savedFile);
			InputStream is = item.openStream();
			int x= 0;
			byte[] b = new byte[1024];
			while((x=is.read(b))!= -1){
				fos.write(b, 0, x);
			}
			fos.flush();
			fos.close();
			return true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
                return false;
	}
    
    public static boolean processFileImagen(String path, FileItemStream item, String nombre){
		try{
                        System.out.println(path+File.separator+"imagen");
			File f= new File(path+File.separator+"imagen");
			if(!f.exists())f.mkdir();
			File savedFile= new File(f.getAbsolutePath()+File.separator+nombre+".png");
			FileOutputStream fos = new FileOutputStream(savedFile);
			InputStream is = item.openStream();
			int x= 0;
			byte[] b = new byte[1024];
			while((x=is.read(b))!= -1){
				fos.write(b, 0, x);
			}
			fos.flush();
			fos.close();
			return true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
                return false;
	}
    
    public static boolean processFileVideo(String path, FileItemStream item, String nombre){
		try{
                        System.out.println(path+File.separator+"video");
			File f= new File(path+File.separator+"video");
			if(!f.exists())f.mkdir();
			File savedFile= new File(f.getAbsolutePath()+File.separator+nombre+".mp4");
			FileOutputStream fos = new FileOutputStream(savedFile);
			InputStream is = item.openStream();
			int x= 0;
			byte[] b = new byte[1024];
			while((x=is.read(b))!= -1){
				fos.write(b, 0, x);
			}
			fos.flush();
			fos.close();
			return true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
                return false;
	}
    
    public static boolean processFileArchivo(String path, FileItemStream item, String nombre){
		try{
                        System.out.println(path+File.separator+"archivo");
			File f= new File(path+File.separator+"archivo");
			if(!f.exists())f.mkdir();
			File savedFile= new File(f.getAbsolutePath()+File.separator+nombre+item.getName());
			FileOutputStream fos = new FileOutputStream(savedFile);
			InputStream is = item.openStream();
			int x= 0;
			byte[] b = new byte[1024];
			while((x=is.read(b))!= -1){
				fos.write(b, 0, x);
			}
			fos.flush();
			fos.close();
			return true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
                return false;
	}
}
