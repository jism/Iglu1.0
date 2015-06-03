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
<%String edoev = "0";%>
<header>
    	<div class="row-top">
                <div class="main">
                    <ul id="nav">
                        <%if(session.getAttribute("administrador") != null){
                                if(session.getAttribute("administrador").equals("iglu20151@gmail.com")){
                                    //response.sendRedirect("Administrador.jsp");
                            %>
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
                                    
                            <%    }
                            }else if(session.getAttribute("usuario") == null){
                            %>
                        <h1><a href="Index.jsp">VideojuegosIglu<span>.com</span></a></h1>
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
                    
            <%if(session.getAttribute("l") != null){
                if(session.getAttribute("l").equals("1")){%>
                    <script type="text/javascript">
                         alert("Has iniciado sesión");
                    </script>
                <%
                }
                session.removeAttribute("l");
            }                  
            %>
            <%if(session.getAttribute("ev") != null){
                if(session.getAttribute("ev").equals("1")){%>
                    <script type="text/javascript">
                         alert("Videojuego Eliminado Exitosamente");
                    </script>
                <%
                }
                session.removeAttribute("ev");
            }                  
            %>
       
        <div class="row-bot">
            <div class="row-bot-bg">
            	<div class="main">
                    <%
                        String c = (String) request.getAttribute("c");
                        if(c == null || c.equals("0")){
                            c="0";%>
                            <h3 class="p2">Lista de Videojuegos</h3><%
                        }else if(c.equals("1")){%>
                        <h3 class="p2">Android&nbsp;&nbsp;&nbsp;<IMG SRC="images/Android.png" WIDTH=42 HEIGHT=42 BORDER=2></h3><%
                        }else if(c.equals("2")){%>
                            <h3 class="p2">Emuladores&nbsp;&nbsp;&nbsp;<IMG SRC="images/Emuladores.png" WIDTH=76 HEIGHT=52 BORDER=2></h3><%
                        }else if(c.equals("3")){%>
                            <h3 class="p2">iPhone&nbsp;&nbsp;&nbsp;<IMG SRC="images/iPhone.png" WIDTH=38 HEIGHT=38 BORDER=2></h3><%
                        }else if(c.equals("4")){%>
                            <h3 class="p2">PC&nbsp;&nbsp;&nbsp;<IMG SRC="images/PC.png" WIDTH=52 HEIGHT=52 BORDER=2></h3><%
                        }else if(c.equals("5")){%>
                            <h3 class="p2">PSP&nbsp;&nbsp;&nbsp;<IMG SRC="images/PSP.png" WIDTH=86 HEIGHT=64 BORDER=2></h3><%
                        }else if(c.equals("6")){%>
                            <h3 class="p2">PSX&nbsp;&nbsp;&nbsp;<IMG SRC="images/PSX.png" WIDTH=42 HEIGHT=42 BORDER=2></h3><%
                        }else if(c.equals("7")){%>
                            <h3 class="p2">Rooms&nbsp;&nbsp;&nbsp;<IMG SRC="images/Rooms.png" WIDTH=48 HEIGHT=48 BORDER=2></h3><%
                        }else{%>
                            <h3 class="p2">Otros&nbsp;&nbsp;&nbsp;<IMG SRC="images/Otros.png" WIDTH=60 HEIGHT=40 BORDER=2></h3><%
                        }%>
                    
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
                                
                            <%if(session.getAttribute("administrador") != null){
                                    if(session.getAttribute("administrador").equals("iglu20151@gmail.com")){
                                        if(lista.get(i).getCosto() > 0){
                                            %><td><br>Precio $ <%out.print(lista.get(i).getCosto());%>&nbsp;&nbsp;&nbsp;</td><%
                                        }else{%>
                                            <td><br>Gratuito&nbsp;&nbsp;&nbsp;</td>
                                        <%}
                                        %>
                                        <td><br><input type="image" src="images/informacion.png" name="image" width="170" height="30"></td>
                                        <%
                                    }
                              }else{
                                if(lista.get(i).getCosto() > 0){
                                    if(lista2 != null){
                                        if(lista2.contains(Integer.toString(lista.get(i).getIdvj()))){%>
                                            <td><br>Comprado&nbsp;&nbsp;&nbsp;</td>
                                            <td><br><form action="archivo/<%out.print(lista.get(i).getArchivo());%>"><input type="image" src="images/descargar.png" name="image" width="170" height="30" formaction="archivo/<%out.print(lista.get(i).getArchivo());%>"></form></td>
                                
                                        <%}else{%>
                                            <td><br>Precio $ <%out.print(lista.get(i).getCosto());%>&nbsp;&nbsp;&nbsp;</td>
                                            <% if(bool.equals("true")){%>
                                                <td><br><input type="image" value="Confirmar" src="images/comprar.png" name="image" width="170" height="30"></td>
                                            <%}else{%>
                                                <td><br><form action="ListaVideojuego" method="post"><input type="hidden" name="c" value="<%out.print(c);%>"><input type="image" onclick="pregunta('false')" value="Confirmar" src="images/comprar.png" name="image" width="170" height="30"></form></td>
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
