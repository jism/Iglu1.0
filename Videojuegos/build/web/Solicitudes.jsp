<%-- 
    Document   : Solicitudes
    Created on : 14/03/2015, 12:04:53 AM
<<<<<<< HEAD
    Author     : Jes�sIv�n
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
=======
    Author     : JesúsIván
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

<head>
    <title>Videojuegos Iglu</title>
    <meta charset="utf-8">

    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen"> 
</head>

>>>>>>> LeonardoAyalaPractica1
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script> 
    <script src="js/Dynalight_400.font.js" type="text/javascript"></script>
    <script src="js/FF-cash.js" type="text/javascript"></script>
    <script src="js/tms-0.3.js" type="text/javascript"></script>
    <script src="js/tms_presets.js" type="text/javascript"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
<<<<<<< HEAD
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
=======
    <script src="js/jquery.equalheights.js" type="text/javascript"></script>    


<body id="page1">

<header>
    	<div class="row-top">
        	<div class="main">
            	<div class="wrapper">
                	<h1><a href="index.html">VideojuegosIglu<span>.com</span></a></h1>
                    <nav>
                        <ul class="menu">
                            <li><a href="index.html">Subir Videojuego</a></li>
                            <li><a href="Solicitudes.jsp">Revisar Solicitudes</a></li>
                            <li><a href="index.html">CERRAR SESION</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
       
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
        
                <font color="white">
                    <table style="width:100%" color="white">
                        <tr>
                            <td>Jesus Saavedra</td>
                            <td>UNAM</td> 
                            <td>309203094</td>
                            <td>HISTORIAL</td>
                            <td>
                                <form action="CreditoOtorgado.jsp">
                                    Creditos: $<input type="text" name="fname">
                                    <input type="submit" value="Otorgar Creditos">
                                </form>
                            </td>
                          </tr>
                          <tr>
                            <td>Uriel Quezada</td>
                            <td>UNAM</td> 
                            <td>309136593</td>
                            <td>HISTORIAL</td>
                            <td>
                                <form action="CreditoOtorgado.jsp">
                                    Creditos: $<input type="text" name="fname">
                                    <input type="submit" value="Otorgar Creditos">
                                </form>
                            </td>
                          </tr>
                        </table>    
                    </font>
                </div>
            </div>
        </div>
    </header>
    
    <section id="content"><div class="ic"></div>
        <div class="main">
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



            <div class="wrapper">
                <article class="column-2">
                	<div class="maxheight indent-bot">
                        <h3 class="p1">Bienvenidos Estudiantes</h3>
                        <h6 class="p2">VideojuegosIglu otorga creditos a los estudiantes con un buen desempeÃ±o academico que te serviran para comprar los mejores videojuegos</h6>
                        <p class="p2">Solo tienes que dar clic en <a href="index.html" target="_blank">Registrarse</a>  llenar tus datos y sube tu historial academico </p>
                        Los creditos se otorgan de acuerdo a criterios de promedio y avance de creditos. Los creditos son intransferibles y solo pueden solicitarse una vez por semestre.
                    </div>
                </article>
            </div>
        </div>
    </section>
    
	

    <footer>
        <div class="main">
        	<div class="aligncenter">
            	<span>Iglu &copy; 2015</span>
                <a rel="nofollow" class="link" target="_blank" href="index.html">Videojuegos Iglu</a> by VideojuegosIglu.com</a>.
            </div>
        </div>
    </footer>

    <script type="text/javascript"> Cufon.now(); </script>
    <script type="text/javascript">
		$(window).load(function() {
			$('.slider')._TMS({
				duration:1000,
				easing:'easeOutQuint',
				preset:'slideDown',
				slideshow:7000,
				banners:false,
				pauseOnHover:true,
				pagination:true,
				pagNums:false
			});
		});
    </script>
</body>
</html>


>>>>>>> LeonardoAyalaPractica1
