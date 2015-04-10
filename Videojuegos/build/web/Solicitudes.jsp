<%-- 
    Document   : Solicitudes
    Created on : 14/03/2015, 12:04:53 AM
    Author     : JesúsIván
--%>

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
                    <div class="wrapper">
                        <!-- Encabezado de pagina que manda a la pagina principal -->
                        <h1><a href="index.html">VideojuegosIglu<span>.com</span></a></h1>
                        <nav>
                            <!-- Opciones del menu principal en el encabezado -->
                            <ul class="menu">
                                <li><a href="index.html">Categorias</a></li>
                                <li><a href="index.html">Solicitudes</a></li>
                                <li><a href="index.html">Subir Videojuego</a></li>
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
                        <br>  
                        <table style="width:100%" color="white">
                            <tr>
                                <td>Leonardo Ayala</td>
                                <td>301122334</td> 
                                <td>UNAM</td>
                                <td>
                                    <form action="#">
                                        <input type="submit" value="Historial Academico">
                                    </form><br>
                                </td>
                            </tr>
                            <tr>
                                <td>Uriel Quezada</td>
                                <td>300099887</td> 
                                <td>UNAM</td>
                                <td>
                                    <form action="#">
                                        <input type="submit" value="Historial Academico">
                                    </form><br>
                                </td>
                            </tr>
                            <tr>
                                <td>Gibram Abud</td>
                                <td>307755664</td> 
                                <td>UNAM</td>
                                <td>
                                    <form action="#">
                                        <input type="submit" value="Historial Academico">
                                    </form><br>
                                </td>
                            </tr>
                        </table>    
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
