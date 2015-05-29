<%-- 
    Document   : VideojuegoExitoso
    Created on : 26/05/2015, 11:13:15 AM
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
    <%if(session.getAttribute("administrador") == null){
        response.sendRedirect("Index.jsp");
    }else if(session.getAttribute("administrador").equals("iglu20151@gmail.com")){
                                
    %>

    <head>  
        <title>Administrador</title>
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
                        <h1><a href="Index.jsp">VideojuegosIglu<span>.com</span></a></h1>
                        <li><a class="hsubs" href="CerrarSesion">Cerrar Sesion&nbsp;</a></li>
                        <li><a class="hsubs" href="SubirJuego.jsp">Subir Videojuego</a></li>
                        <li><a class="hsubs" href="Usuarios">Ver Usuarios&nbsp;&nbsp;</a></li>
                        <li><a class="hsubs" href="RevisarSolicitudCredito">Solicitudes&nbsp;&nbsp;&nbsp;</a></li>
                        <div id="lavalamp"></div>
                    </ul>
                </div>
            </div>
            
            <!-- Seccion de la pagina con fondo anaranjado-->
            <div class="row-bot">
                <div class="row-bot-bg">
                    <div class="main">
                    <!-- SECCION A EDITAR AL CAMBIAR DE PAGINAS -->
                    
                    <article class="column-2">
                        <br>
                        <%  
                          String msg=(String) request.getAttribute("msg");
                          if(msg!=null){
                              if(msg.equals("fracaso")){
                                  %><h6 class="p2"><font color="#eee">Tu solicitud no ha podido ser procesada, intenta mas tarde</font></h6><%
                              }else if(msg.equals("exito")){
                                  %><h6 class="p2"><font color="#eee">Videojuego Cargado Exitosamente!</font></h6><%
                              }
                          }
                        %>
                        <a class="button-2" href="Administrador.jsp">Regresar al Inicio</a>
                        </article>
                        <article class="column-2">
                	<div class="maxheight indent-bot">
                            <h3 class="p1">Información</h3>
                            <h6 class="p2">Los archivos se han cargado exitosamente, Imagen, Video, Archivo</h6>
                            <h6 class="p2">El videojuego ya esta disponible para su descarga, los videojuegos de paga es necesario haber otorgado créditos al usuario</h6>
                            <h6 class="p2">Para modificar la información del videojuego o su costo vaya a la pestaña Videojuegos</h6>
                        </div>
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
