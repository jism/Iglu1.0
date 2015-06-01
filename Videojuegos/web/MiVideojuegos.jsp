<%-- 
    Document   : MiVideojuegos
    Created on : 20/05/2015, 09:08:50 PM
    Author     : Ivan
--%>

<%@page import="Modelo.Videojuego"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Mis Videojuegos</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen"> 
</head>

    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script> 
    <script src="js/Dynalight_400.font.js" type="text/javascript"></script>
    <script src="js/FF-cash.js" type="text/javascript"></script>
    <script src="js/tms-0.3.js" type="text/javascript"></script>
    <script src="js/tms_presets.js" type="text/javascript"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="js/jquery.equalheights.js" type="text/javascript"></script>    


<body id="page1">

<header>
    	<div class="row-top">
                <div class="main">
                    <ul id="nav">
                        <h1><a href="Index.jsp">VideojuegosIglu<span>.com</span></a></h1>
                        <%if(session.getAttribute("administrador") != null){
                                if(session.getAttribute("administrador").equals("iglu20151@gmail.com")){
                                    response.sendRedirect("Administrador.jsp");
                                }
                            }else if(session.getAttribute("usuario") == null){
                            %>
                        <li><a class="hsubs">Iniciar Sesión</a>
                            <ul class="subs">
                              <form action="IniciarSesion" method="post">
                                <li><a><input type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" name="correo" size="19" placeholder="Correo" required></a></li>
                                <li><a>Correo</a></li>
                                <li><a><input type="password" pattern="[0-9a-zA-Z.-_#$%&/]{8,16}" size="19" name="contrasena" placeholder="Contraseña" required></a></li>
                                <li><a>Contraseña</a></li>
                                <li><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Acceder"></a></li>
                              </form>
                                <li><a href="RestablecerContrasena">Olvidaste contraseña</a></li>
                           </ul>
                        </li>
                        <li><a href="Registro.jsp">Registrarse&nbsp;&nbsp;&nbsp;</a></li>
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
                        <%
                            }else{
                                //response.sendRedirect("Index.jsp");
                            %>
                        <li><a class="hsubs" href="CerrarSesion">Cerrar Sesión</a></li>
                        <li><a href="Cuenta">Mi Cuenta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                        <li><a href="MisVideojuegos">Mis Videojuegos</a></li>
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
                        <%}//else%>
                    </ul>
                </div>
            </div>
       
        <div class="row-bot">
            <div class="row-bot-bg">
            	<div class="main">
                        <h3 class="p2">Videojuegos Comprados</h3>
                    <!--    <a class="button-2" href="Index.jsp">Regresar al Inicio</a> -->
                    
                        <table style="width:100%">
                        <%
                            try{
                                LinkedList<Videojuego> lista=(LinkedList) request.getAttribute("lista");
                                
                                if(lista.size()==0){
                                    %><h6 class="p2"><%out.println("No has realizado ninguna compra");%></h6><%}%>
                                    <%
                                for(int i=0; i<lista.size(); i++){
                        %>
                            <tr onclick="document.location='MuestraVideojuego?i=<%out.print(lista.get(i).getIdvj());%>'">
                                <td>&nbsp;<IMG SRC="imagen/<%out.print(lista.get(i).getNombre()+" "+lista.get(i).getDesarrollador());%>.png" WIDTH=220 HEIGHT=78 BORDER=2></td>
                                <td><br><h8><% out.print(lista.get(i).getNombre()); %></h8></td>
                                <td><br><% out.print(lista.get(i).getCategoria()); %>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><br>Comprado: $&nbsp;<% out.print(lista.get(i).getCosto()); %></td>
                                <td><br><form action="archivo/<%out.print(lista.get(i).getArchivo());%>"><input type="image" src="images/descargar.png" name="image" width="170" height="30" formaction="archivo/<%out.print(lista.get(i).getArchivo());%>"></form></td>
                                
                            </tr>
                            <% 
                                }
                            }catch(java.lang.NullPointerException e){
                            }
                            %>
                        </table>
                        
                </div>
            </div>
        </div>
    </header>
    
    <footer>
            <div class="main">
        	<div class="aligncenter">
                    <span>Iglu &copy; 2015</span>
                    <a rel="nofollow" class="link" target="_blank" href="Index.jsp">Videojuegos Iglu</a> by iglu20151@gmail.com
                </div>
            </div>
        </footer>
</body>
</html>