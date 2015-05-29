<%-- 
    Document   : ListaVideojuegos
    Created on : 13/03/2015, 11:18:38 PM
    Author     : JesúsIván
--%>

<%@page import="Modelo.Videojuego"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Lista de videojuegos</title>
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
                              <input type="hidden" name="val" value="2">
                              </form>
                                <li><a href="RestablecerContrasena.jsp">Olvidaste contraseña</a></li>
                           </ul>
                        </li>
                        <li><a href="Registro.jsp">Registrarse&nbsp;&nbsp;&nbsp;</a></li>
                        <li><a class="hsubs" href="ListaVideojuego">Categorías&nbsp;&nbsp;&nbsp;</a>
                            <ul class="subs">
                                <li><a href="#">Android&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">Emuladores</a></li>
                                <li><a href="#">iPhone&nbsp;&nbsp;&nbsp;&nbsp&nbsp;</a></li>
                                <li><a href="#">PC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">PSP&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">PSX&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">Rooms&nbsp;&nbsp;</a></li>
                                <li><a href="#">Otros&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
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
                                <li><a href="#">Android&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">Emuladores</a></li>
                                <li><a href="#">iPhone&nbsp;&nbsp;&nbsp;&nbsp&nbsp;</a></li>
                                <li><a href="#">PC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">PSP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">PSX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">Otros&nbsp;&nbsp;</a></li>
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
                    
                    <h3 class="p2">Lista de Videojuegos</h3>
                    <table style="width:100%">
                        <%
                            HttpSession sesion = request.getSession();
                            String correo= (String) sesion.getAttribute("usuario");
                            String bool="false";
                            if(correo != null){
                                bool="true";
                            }
                            try{
                                LinkedList<Videojuego> lista=(LinkedList) request.getAttribute("lista");
                                LinkedList<String> lista2=(LinkedList) request.getAttribute("lista2");
                                
                                if(lista.size()==0){
                                    %><h6 class="p2"><%out.println("Lista de Videojuegos vacia");%></h6><%}%>
                                    <%
                                for(int i=0; i<lista.size(); i++){
                        %>
                            <tr onclick="document.location='MuestraVideojuego?i=<%out.print(lista.get(i).getIdvj());%>'">
                                <td>&nbsp;<IMG SRC="imagen/<%out.print(lista.get(i).getNombre()+" "+lista.get(i).getDesarrollador());%>.png" WIDTH=220 HEIGHT=78 BORDER=2></td>
                                <td><br><h8><% out.print(lista.get(i).getNombre()); %></h8></td>
                                <td><br><% out.print(lista.get(i).getCategoria()); %>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <%if(lista.get(i).getCosto() > 0){
                                    if(lista2 != null){
                                        if(lista2.contains(Integer.toString(lista.get(i).getIdvj()))){%>
                                            <td><br>Comprado&nbsp;&nbsp;&nbsp;</td>
                                            <td><br><form action="archivo/<%out.print(lista.get(i).getArchivo());%>"><input type="image" src="images/descargar.png" name="image" width="170" height="30" formaction="archivo/<%out.print(lista.get(i).getArchivo());%>"></form></td>
                                
                                        <%}else{%>
                                            <td><br>Precio $ <%out.print(lista.get(i).getCosto());%>&nbsp;&nbsp;&nbsp;</td>
                                            <% if(bool.equals("true")){%>
                                                <td><br><input type="image" value="Confirmar" src="images/comprar.png" name="image" width="170" height="30"></td>
                                            <%}else{%>
                                                <td><br><form action="#"><input type="image" onclick="pregunta('false')" value="Confirmar" src="images/comprar.png" name="image" width="170" height="30"></form></td>
                                            <%}%>
                                        <%
                                        }
                                    }
                                }else{%>
                                    <td><br>Gratuito&nbsp;&nbsp;&nbsp;</td>
                                    <td><br><form action="archivo/<%out.print(lista.get(i).getArchivo());%>"><input type="image" src="images/descargar.png" name="image" width="170" height="30" formaction="archivo/<%out.print(lista.get(i).getArchivo());%>"></form></td>
                                <%}%>
                            </tr>
                            <% 
                                }
                            }catch(java.lang.NullPointerException e){
                            }
                            %>
                        </table>
                        <br><br>
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
    <script language="JavaScript"> 
            function pregunta(bool){
                if(bool == "true"){
                    document.tuformulario.submit()
                }else{
                    var s = confirm('Debes iniciar sesión para realizar una compra');
                    document.tuformulario.submit()
                }
            } 
        </script>
        
</body>
</html>
