<%-- 
    Document   : ListaUsuarios
    Created on : 20/05/2015, 07:53:19 PM
    Author     : Ivan
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%if(session.getAttribute("administrador") == null){
        response.sendRedirect("Index.jsp");
    }else if(session.getAttribute("administrador").equals("iglu20151@gmail.com")){
                                
    %>
    <head>  
    <title>Usuarios</title>
    <meta charset="utf-8">
    
    <!-- 
    css y js que se utilizan para darle estilo y forma a la pagina
    -->
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen"> 
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script> 
    <script src="js/Dynalight_400.font.js" type="text/javascript"></script>
    <script src="js/FF-cash.js" type="text/javascript"></script>
    <script src="js/tms-0.3.js" type="text/javascript"></script>
    <script src="js/tms_presets.js" type="text/javascript"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="js/jquery.equalheights.js" type="text/javascript"></script> 
    </head>

    <body id="page1">
        <header>
            <!-- Encabezado de la pagina. Seccion de la pagina con fondo negro-->
            <div class="row-top">
                <div class="main">
                    <ul id="nav">
                        <h1><a href="Index.jsp"><span>Administrador</span></a></h1>
                        <li><a class="hsubs" href="CerrarSesion">Cerrar Sesion&nbsp;</a></li>
                        <li><a class="hsubs" href="RevisarSolicitudCredito">Solicitudes&nbsp;&nbsp;&nbsp;</a></li>
                        <li><a class="hsubs" href="Usuarios">Ver Usuarios&nbsp;&nbsp;</a></li>
                        <li><a class="hsubs" href="SubirJuego.jsp">Subir Videojuego</a></li>
                        <li><a class="hsubs" href="ListaVideojuego">Categorías&nbsp;&nbsp;&nbsp;</a>
                            <ul class="subs">
                                <li><a href="ListaVideojuego?c=1">Android&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="ListaVideojuego?c=2">Emuladores</a></li>
                                <li><a href="ListaVideojuego?c=3">iPhone&nbsp;&nbsp;&nbsp;&nbsp&nbsp;</a></li>
                                <li><a href="ListaVideojuego?c=4">PC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="ListaVideojuego?c=5">PSP&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="ListaVideojuego?c=6">PSX&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="ListaVideojuego?c=7">Rooms&nbsp;&nbsp;</a></li>
                                <li><a href="ListaVideojuego?c=8">Otros&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                            </ul>
                        </li>
                        <div id="lavalamp"></div>
                    </ul>
                </div>
            </div>
            
            <!-- Seccion de la pagina con fondo anaranjado-->
            <%if(session.getAttribute("e") != null){
                if(session.getAttribute("e").equals("1")){%>
                    <script type="text/javascript">
                         alert("Usuario Eliminado del Sistema");
                    </script>
                <%
                }
                session.removeAttribute("e");
            }                  
            %>
            <div class="row-bot">
                <div class="row-bot-bg">
                    <div class="main">
                    <!-- SECCION A EDITAR AL CAMBIAR DE PAGINAS -->
                      <article class="column-4">
                          <h3 class="p1">Lista de Usuarios</h3>
                        <table style="width:100%">
                        <%
                            try{
                                LinkedList<Usuario> lista=(LinkedList) request.getAttribute("lista");
                                if(lista.size()==0){
                                    %><h6 class="p2"><%out.println("No hay usuarios registrados en el sistema");%></h6><%}else{%>
                        <!--    <tr>
                                <td><font color="#eee">Nombre</font></td>
                                <td><font color="#eee">Correo Electrónico</font></td>
                                <td><font color="#eee">Creditos</font></td>
                                <td><font color="#eee">Detalles</font></td>
                            </tr>   -->
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                                    <%
                                for(int i=0; i<lista.size(); i++){
                        %>
                            <tr>
                                <td><h10>&nbsp;&nbsp;<% out.print(lista.get(i).getFechavenc()); %></h10></td>
                                <td><h10><% out.print(lista.get(i).getCorreoe()); %></h10></td>
                                <td><h10>Créditos: $ <% out.print(lista.get(i).getContrasena()); %></h10></td>
                                <td><h10><form action="Usuario" method="post"><input type="hidden" name="correoe" value="<% out.print(lista.get(i).getCorreoe()); %>"><input type="image" value="Confirmar" src="images/informacion.png" name="image" width="170" height="30"></form></h10></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <%      }
                                }
                            }catch(java.lang.NullPointerException e){
                            }
                            %>
                        </table>
                      </article>
                    <!-- TERMINA SECCION A EDITAR -->
                    </div>
                </div>
            </div>
        </header>

        <!-- Pie de pagina. Seccion de la pagina con fondo negro -->
        <!-- informacion acerca de Iglu -->
        <footer>
            <div class="main">
        	<div class="aligncenter">
                    <span>Iglu &copy; 2015</span>
                    <a rel="nofollow" class="link" target="_blank" href="Index.jsp">Videojuegos Iglu</a> by iglu20151@gmail.com
                </div>
            </div>
        </footer>
        <%}else{
            response.sendRedirect("Index.jsp");
        }%>

    </body>
</html>
