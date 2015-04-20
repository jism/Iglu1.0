<%-- 
    Document   : Administrador
    Created on : 13/03/2015, 11:59:34 PM
    Author     : JesúsIván
--%>

<!DOCTYPE html>

<html lang="en">

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
                    <div class="wrapper">
                        <!-- Encabezado de pagina que manda a la pagina principal -->
                        <h1><a href="Administrador.jsp">VideojuegosIglu<span>.com</span></a></h1>
                        <nav>
                            <!-- Opciones del menu principal en el encabezado -->
                            <ul class="menu">
                                <li><a href="ListaVideojuegos.jsp">Categorias</a></li>
                                <li><a href="RevisarSolicitudCredito">Solicitudes</a></li>
                                <li><a href="SubirJuego.jsp">Subir Videojuego</a></li>
                                <li><a href="index.html">Cerrar Sesion</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            
            <!-- Seccion de la pagina con fondo anaranjado-->
            <div class="row-bot">
                <div class="row-bot-bg">
                    <div class="main">
                    <!-- SECCION A EDITAR AL CAMBIAR DE PAGINAS -->
                    
                    
                    
                    
                    <article class="column-1">
                	<div class="maxheight indent-bot">
                            <h3 class="p1">Administrador</h3>
                            <h6 class="p2">Has accedido como administrador</h6>
                            <h6 class="p2">Desde Admiistrador puedes revisar las solicitudes de los estudiantes para poder otorgar creditos</h6>
                            <h6 class="p2">Los creditos se otorgan de acuerdo a criterios de promedio y avance de creditos. Los creditos son intransferibles y solo pueden solicitarse una vez por semestre.</h6>
                            <h6 class="p2">Desde Aministrador puedes editar videojuegos, desde modificarlos hasta subir nuevos videojuegos</h6>
                            <h6 class="p2">Para editar un videojuego solo busca el videojuego en las multiples categorias y da clic en editar para modificar sus caracteristicas o hasta eliminar el videojuego</h6>
                            <h6 class="p2">Para subir un videojuego solo da clic en la pesta�a subir videojuego y llena los campos necesarios para subir el videojuego</h6>
                        </div>
                    </article>
                    
                    
                    
                    
                    
                    
                    
                    
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
                	<a href="#"><img class="img-border" src="images/banner-1.jpg" alt=""></a>
                    </article>
                    <article class="col-1">
                	<a href="#"><img class="img-border" src="images/banner-2.jpg" alt=""></a>
                    </article>
                    <article class="col-2">
                	<a href="#"><img class="img-border" src="images/banner-3.jpg" alt=""></a>
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
                    <a rel="nofollow" class="link" target="_blank" href="index.html">Videojuegos Iglu</a> by VideojuegosIglu.com
                </div>
            </div>
        </footer>
        
    </body>
</html>
