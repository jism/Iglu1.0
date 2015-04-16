/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.*;

public class SQLiteJDBC
{
  public static void main( String args[] )
  {
    Connection c = null;
    Statement stmt = null;
    try {
      Class.forName("org.sqlite.JDBC");
      c = DriverManager.getConnection("jdbc:sqlite:Iglu");
      System.out.println("Opened database successfully");
      
      c.setAutoCommit(false);

      stmt = c.createStatement();
      String sql = "INSERT INTO administrador(correoe, nombre) " +
                   "VALUES ('iglu@gmail.com', 'Iglu');"; 
      stmt.executeUpdate(sql);

      stmt.executeUpdate(sql);
      stmt.close();
      c.commit();
      c.close();
     
      
    } catch ( Exception e ) {
      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
      System.exit(0);
    }
  }
}
