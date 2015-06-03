/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
 
public class Encriptar
{
    private static final char[] CONSTS_HEX = { '0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f' };
    
    public Encriptar(){
        
    }
    
    public String encriptaEnMD5(String stringAEncriptar)
    {
        try
        {
           MessageDigest msgd = MessageDigest.getInstance("MD5");
           byte[] bytes = msgd.digest(stringAEncriptar.getBytes());
           StringBuilder strbCadenaMD5 = new StringBuilder(2 * bytes.length);
           for (int i = 0; i < bytes.length; i++)
           {
               int bajo = (int)(bytes[i] & 0x0f);
               int alto = (int)((bytes[i] & 0xf0) >> 4);
               strbCadenaMD5.append(CONSTS_HEX[alto]);
               strbCadenaMD5.append(CONSTS_HEX[bajo]);
           }
           return strbCadenaMD5.toString();
        } catch (NoSuchAlgorithmException e) {
           return null;
        }
    }
 
    public static void main(String args[])
    {
        Encriptar en = new Encriptar();
        System.out.println("\n\nEncriptacion en MD5 de 123: '"+en.encriptaEnMD5("iigglluu271707")+"'");
        System.out.println("Encriptacion en MD5 de hola: '"+en.encriptaEnMD5("hola")+"'");
    }
}
