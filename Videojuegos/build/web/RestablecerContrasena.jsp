<%-- 
    Document   : RestablecerContrasena
    Created on : 20/05/2015, 04:36:44 PM
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head> 
        <title>Contraseña</title>
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
                                response.sendRedirect("Index.jsp");
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
            
            <!-- Seccion de la pagina con fondo anaranjado-->
            <div class="row-bot">
                <div class="row-bot-bg">
                    <div class="main">
                    <!-- SECCION A EDITAR AL CAMBIAR DE PAGINAS -->    
                    
                        <!-- Slider de las 3 imagenes principales de la pagina -->
                        <article class="column-2">
                            <br><h3>Restablecer Contraseña</h3>
                        <form action="CambiarContrasena" method="post">
                            <pre>Correo electrónico:     <input type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" name="correo" required></pre>
                            <pre>Apellido Paterno:       <input type="text" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]{1,30}" name="appat" required></pre>
                            <pre>Número de cuenta:     <input type="text" pattern="[0-9a-zA-Z]{2,20}$" name="cuenta" required></pre>
                            <input type="submit" class="button-2" value="Restablecer Contraseña">
                        </form>
                        <%  
                          String msg=(String) request.getAttribute("msg");
                          if(msg!=null){
                              if(msg.equals("correo")){
                                  %><h6 class="p2"><font color="#eee">Correoe Electronico Ya Registrado!</font></h6><%
                              }else if(msg.equals("datos")){
                                  %><h6 class="p2"><font color="#eee">Los datos que has introducido son incorrectos</font></h6><%
                              }else if(msg.equals("fracaso")){
                                  %><h6 class="p2"><font color="#eee">Tu solicitud no ha podido ser procesada, intenta mas tarde</font></h6><%
                              }else if(msg.equals("exito")){
                                  %><h6 class="p2"><font color="#eee">Contraseña cambiada exitosamente, se te notificara por correo el cambio de tu contraseña</font></h6><%
                              }
                          }
                        %>
                       </article>
                       <article class="column-2">
                	<div class="maxheight indent-bot">
                            <br><h3 class="p1">Información</h3>
                            <h6 class="p2">Por seguridad deberas introducir los siguientes datos que ingresaste al sistema al registrarte</h6>
                            <h6 class="p2">Puedes modificar tu contraseña indicando una longitud mínima de 8 y máxima de 16 caracteres alfanúmericos incluyendo los caracteres especiales # $ % & / ; : . _ [ ] </h6>
                            <h6 class="p2">Al modificar tu contraseña se te norificara por correo electrónico</h6>
                            <a class="button-2" href="Index.jsp">Regresar al Inicio</a>
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

        <!-- Script que inicia el Slider de las 3 imagenes principales -->
        <script type="text/javascript"> Cufon.now(); </script>
        <script type="text/javascript">
            $(window).load(function() {
		$('.slider')._TMS({
                    duration:1000,
                    easing:'easeOutQuint',
                    preset:'slideDown',
                    slideshow:3000,
                    banners:false,
                    pauseOnHover:true,
                    pagination:true,
                    pagNums:false
                });
            });
        </script>
        
    </body>
</html>

