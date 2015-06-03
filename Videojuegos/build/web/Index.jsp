<%-- 
    Document   : Index
    Created on : 19/05/2015, 02:17:03 PM
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head> 
    <title>Videojuegos Iglu</title>
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
                                <input type="hidden" name="val" value="1">
                              </form>
                                <li><a href="RestablecerContrasena.jsp">Olvidaste contraseña</a></li>
                                <%  
                                    String msg=(String) request.getAttribute("msg");
                                    if(msg!=null){
                                        if(msg.equals("correo")){
                                            %><li><a>Correo Electronico Invalido!</a></li><%
                                        }else if(msg.equals("contrasena")){
                                            %><li><a>Contraseña Incorrecta!</a></li><%
                                        }
                                    }
                                %>
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
            
            <!-- Seccion de la pagina con fondo anaranjado-->
            <%
            String mensaje=(String) request.getParameter("m");
                if(mensaje!=null){
                    if(mensaje.equals("1")){
                    %> 
                        <script type="text/javascript">
                            alert("Usuario Eliminado del Sistema");
                        </script>
                    <%
                    }
                }          
            %>
            
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
            <div class="row-bot">
                <div class="row-bot-bg">
                    <div class="main">
                    <!-- SECCION A EDITAR AL CAMBIAR DE PAGINAS -->    
                    
                        <!-- Barra lateral izquierda con las categorias de los videojuegos -->
                        <article class="column-3">
                            <br><div class="indent-left">
                                <div class="maxheight indent-bot">
                                    <h3>Categorías</h3>
                                    <ul class="list-1">
                                        <li><a href="ListaVideojuego?c=1">Android</a></li>
                                        <li><a href="ListaVideojuego?c=2">Emuladores</a></li>
                                        <li><a href="ListaVideojuego?c=3">iPhone</a></li>
                                        <li><a href="ListaVideojuego?c=4">PC</a></li>
                                        <li><a href="ListaVideojuego?c=5">PSP</a></li>
                                        <li><a href="ListaVideojuego?c=6">PSX</a></li>
                                        <li><a href="ListaVideojuego?c=7">Rooms</a></li>
                                        <li><a href="ListaVideojuego?c=8">Otros</a></li>
                                    </ul>
                                </div>
                                <a class="button-2" href="ListaVideojuego">Ver Mas</a>
                            </div>
                        </article>
        
                        <!-- Slider de las 3 imagenes principales de la pagina -->
                        <br><div class="slider-wrapper">
                            <div class="slider">
                                <ul class="items">
                                    <li>
                                        <img src="images/slider-img1.jpg" alt="" />
                                    </li>
                                    <li>
                                        <img src="images/slider-img2.jpg" alt="" />
                                    </li>
                                    <li>
                                        <img src="images/slider-img3.jpg" alt="" />
                                    </li>
                                </ul>
                            </div>
                        </div>
                       
                        <!-- TERMINA SECCION A EDITAR -->
                    </div>
                </div>
            </div>
        </header>
        <!-- Seccion de la pagina con fondo blanco-->
        <section id="content"><div class="ic"></div>
            <div class="main">
                <!-- 3 imagenes secundarias (los juegos o categorias mas importantes o descargadas) -->
                <div class="wrapper img-indent-bot">
                    <article class="col-1">
                	<a href="MuestraVideojuego?i=0"><img class="img-border" src="images/banner-1.jpg" alt=""></a>
                    </article>
                    <article class="col-1">
                	<a href="MuestraVideojuego?i=1"><img class="img-border" src="images/banner-2.jpg" alt=""></a>
                    </article>
                    <article class="col-2">
                	<a href="MuestraVideojuego?i=3"><img class="img-border" src="images/banner-3.jpg" alt=""></a>
                    </article>
                </div>
            </div>
        </section>
    
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
