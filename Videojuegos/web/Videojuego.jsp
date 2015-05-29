<%-- 
    Document   : Videojuego
    Created on : 28/05/2015, 07:29:50 PM
    Author     : Ivan
--%>

<%@page import="Modelo.Videojuego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Videojuego</title>
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
                                Videojuego videojuego=(Videojuego) request.getAttribute("videojuego");
                                String iid=Integer.toString(videojuego.getIdvj());
                            %>
                        <li><a class="hsubs">Iniciar Sesión</a>
                            <ul class="subs">
                              <form action="IniciarSesion" method="post">
                                <li><a><input type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" name="correo" size="19" placeholder="Correo" required></a></li>
                                <li><a>Correo</a></li>
                                <li><a><input type="password" pattern="[0-9a-zA-Z.-_#$%&/]{8,16}" size="19" name="contrasena" placeholder="Contraseña" required></a></li>
                                <li><a>Contraseña</a></li>
                                <li><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Acceder"></a></li>
                              <input type="hidden" name="val" value="4">
                              <input type="hidden" name="idd" value="<%out.print(iid);%>">
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
                    <%  
                        HttpSession sesion = request.getSession();
                        String correo= (String) sesion.getAttribute("usuario");
                        String bool="false";
                        if(correo != null){
                            bool="true";
                        }
                        try{
                            Videojuego videojuego=(Videojuego) request.getAttribute("videojuego");                    
                            if(videojuego == null){
                                //response.sendRedirect("Index.jsp");
                            }%>
                                
                        <article class="column-5">
                            <div class="indent-left">
                                <h3 class="p1"><%out.print(videojuego.getNombre());%></h3>
                            <!--    <center><a href="javascript:void(0);" title="Clic para ver el video" onclick="window.open('Super Mario Bross NESS.mp4', 'sickg', 'left=390, top=200, width=435, height=354, toolbar=0, resizable=1')"><div align="center"><img src="IMAGEN'Super Mario Bross NESS.mp4" title="Clic para ver el vídeo" /></div></a></center>     -->
                                <video width="520" controls autoplay>
                                    <source src="video/<%out.print(videojuego.getNombre()+" "+videojuego.getDesarrollador());%>.mp4" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                            </div>
                        </article>
                              
                        <article class="column-6">
                            <br><br><div class="indent-right">
                                <!--    <IMG SRC="imagen/Super Mario Bross NESS.png" WIDTH=320 HEIGHT=240 BORDER=2> -->
                                
                                <%
                                    String t="no";
                                    String b = (String) request.getAttribute("ids");
                                    
                                    if(b != null){
                                        if(b.equals("true"))
                                            t="si";
                                    }
                                    if(videojuego.getCosto() > 0 && t.equals("si")){
                                %>
                                <h6 class="p2">Compra Exitosa!</h6>
                                <form action="archivo/<%out.print(videojuego.getArchivo());%>"><input type="image" src="images/descargar.png" name="image" width="170" height="30"></form>
                                <%}else  if(videojuego.getCosto() > 0){
                                    String creditos = (String) request.getAttribute("creditos");
                                    if(creditos != null){
                                        if(creditos.equals("0")){
                                            %>
                                <h6 class="p2">Créditos Insuficientes!&nbsp;&nbsp;&nbsp;</h6>
                                            <%
                                        }
                                    }
                                %>
                                
                                <h6 class="p2">Precio:&nbsp;&nbsp;&nbsp;$&nbsp;<% out.print(videojuego.getCosto()); %>&nbsp;&nbsp;&nbsp;</h6>
                                    <form  method="post" name=tuformulario action="MuestraVideojuego">
                                    <input type="hidden" name="precio" value="<% out.print(videojuego.getCosto()); %>">
                                    <input type="hidden" name="idvj" value="<% out.print(videojuego.getIdvj()); %>">
                                    </form>
                                    <input type="image" onclick="pregunta(<% if(bool.equals("true")){%>'true'<%}else{%>'false'<%}%>)" value="Confirmar" src="images/comprar.png" name="image" width="170" height="30">
                                <%}else{%>
                                    <h6 class="p2">Gratuito&nbsp;&nbsp;&nbsp;</h6>
                                    <form action="archivo/<%out.print(videojuego.getArchivo());%>"><input type="image" src="images/descargar.png" name="image" width="170" height="30" onclick="pregunta()"></form>
                                <%}%>
                                
                                <h6 class="p2">Categoría: <%out.print(videojuego.getCategoria());%></h6>
                                <h6 class="p2">Desarrollador: <%out.print(videojuego.getDesarrollador());%></h6>
                                <h6 class="p2">Año: <%out.print(videojuego.getAnio());%></h6>
                                <br><h6 class="p2">Descripción:</h6>
                                <h6 class="p2"><%out.print(videojuego.getDescripcion());%></h6>
                            
                            </div>
                        </article>
                    <% 
                        }catch(java.lang.NullPointerException e){
                        }
                    %>
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
                        var r = confirm('¿Estas seguro de realizar la compra?');
                        if (r){ 
                            document.tuformulario.submit()
                        }else{
                            txt = "You pressed Cancel!";
                        }
                }else{
                    var s = confirm('Debes iniciar sesión para realizar una compra');
                }
            } 
        </script>
</body>
</html>
