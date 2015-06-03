/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
*/
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.swing.JOptionPane;


public class Email {
    
    String usuarioCorreo;
    String password;
    
    String rutaArchivo;
    String nombreArchivo;
    
    String destinatario;
    String asunto;
    String mensaje;
    
    public Email(){
        
    }
    
    public Email(String usuarioCorreo, String password, String rutaArchivo, String nombreArchivo, String destinatario, String asunto,String mensaje) {
        this.usuarioCorreo = usuarioCorreo;
        this.password = password;
        this.rutaArchivo = rutaArchivo;
        this.nombreArchivo = nombreArchivo;
        this.destinatario = destinatario;
        this.asunto = asunto;
        this.mensaje = mensaje;
    }
    
    public Email(String usuarioCorre,String password,String destinatario,String mensaje){
        this(usuarioCorre,password,"","",destinatario,"",mensaje);
    }
    
    public Email(String usuarioCorre,String password,String destinatario,String asunto,String mensaje){
        this(usuarioCorre,password,"","",destinatario,asunto,mensaje);
    }    

    public boolean sendMail(){
        try
        {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", usuarioCorreo);
            props.setProperty("mail.smtp.auth", "true");

            Session session = Session.getDefaultInstance(props, null);
            BodyPart texto = new MimeBodyPart();
            texto.setText(mensaje);

            BodyPart adjunto = new MimeBodyPart();
            if (!rutaArchivo.equals("")){
                 adjunto.setDataHandler(
                    new DataHandler(new FileDataSource(rutaArchivo)));
                adjunto.setFileName(nombreArchivo);                
            }

            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);
            if (!rutaArchivo.equals("")){
                multiParte.addBodyPart(adjunto);
            }

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(usuarioCorreo));
            message.addRecipient(
                Message.RecipientType.TO,
                new InternetAddress(destinatario));
                message.setSubject(asunto);
            message.setContent(multiParte);

            Transport t = session.getTransport("smtp");
            t.connect(usuarioCorreo, password);
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }        
    }
    
    public boolean sendM(String destinatario, String creditos, String contrasena, boolean acreditado, String error){
        String mensaje;
        if(acreditado){
            mensaje="Videojuegos Iglu\n\nTu solicitud de créditos a sido verificada\nCréditos otorgados: "+creditos+"\n"
                    + "\nPodras acceder al sistema ingresando tu correo electrónico y la siguiente contraseña"
                    + "\nContraseña: "+contrasena;
        }else{
            mensaje="Videojuegos Iglu\n\nTu solicitud de creditos a sido verificada\n"
                    + "\nLos datos que ingresaste al sistema son incorrectos\n"
                    +"Detalles: "+error
                    + "\n\nIngresa al sistema con tu correo electronico y la siguiente contraseña para modificar tus datos"
                    + "\nContraseña: "+contrasena;
        }
        String clave = "ulgi5102"; 
        Email e = new Email("iglu20151@gmail.com",clave, destinatario,"Solicitud de Créditos",mensaje);
        if (e.sendMail())
            return true;
        else
            return false;
    }
    
    public boolean cambioContrasena(String destinatario, String contrasena){
        String mensaje="Videojuegos Iglu\n\nTu contraseña ha sido modificada\n"
                    + "\nPodras acceder al sistema ingresando tu nueva contraseña"
                    + "\nContraseña: "+contrasena;
        
        String clave = "ulgi5102"; 
        Email e = new Email("iglu20151@gmail.com",clave, destinatario,"Cambio de Contraseña",mensaje);
        if (e.sendMail())
            return true;
        else
            return false;
    }
    
    public boolean datosIncorrectos(String destinatario, String nota){
        String mensaje="Videojuegos Iglu\n\nTu solicitud de créditos ha sido revisada\n"
                    + "\nLos datos que has ingresado al sistema no son correctos"
                    + "\nPor favor revisa los siguientes datos que ingresaste al sistema"
                    +nota
                    + "\nVuelve a registrarte al sistema con los datos correctos";
        
        String clave = "ulgi5102"; 
        Email e = new Email("iglu20151@gmail.com",clave, destinatario,"Solicitud de Créditos",mensaje);
        if (e.sendMail())
            return true;
        else
            return false;
    }
    
    public static void main(String[] args){
    /*    String clave = "ulgi5102"; 
        Email e = new Email("iglu20151@gmail.com",clave, "jism@ciencias.unam.mx","Solicitud de Creditos","Prueba del tutorial para mandar un email");
        if (e.sendMail()){
            JOptionPane.showMessageDialog(null,"El email se mandÃ³ correctamente");
        }else{
            JOptionPane.showMessageDialog(null,"El email no se mandÃ³ correctamente");
        } */
        Email e=new Email();
        boolean b=e.sendM("jism@ciencias.unam.mx", "200", "12345678", true, "");
        if(b)
            System.out.println("SI");
        else
            System.out.println("NO");
    }

}

