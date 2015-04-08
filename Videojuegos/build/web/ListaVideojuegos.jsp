<%-- 
    Document   : ListaVideojuegos
    Created on : 13/03/2015, 11:18:38 PM
    Author     : JesúsIván
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Videojuegos Iglu</title>
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
            	<div class="wrapper">
                	<h1><a href="index.html">VideojuegosIglu<span>.com</span></a></h1>
                    <nav>
                        <ul class="menu">
                            <li><a href="ListaVideojuegos.jsp">Lista Videojuegos</a></li>
                            <li><a href="index.html">Contacto</a></li>
                            <li><a href="index.html">Registrarse</a></li>
                            <li><a href="index.html">Iniciar Sesion</a></li>
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
                            <td>Mario Bros</td>
                            <td>Nintendo</td> 
                            <td>$0</td>
                            <td>
                                <form action="Descargado.jsp">
                                    <input type="submit" value="Descargar">
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td>Candy Crush</td>
                            <td>Ring</td> 
                            <td>$0</td>
                            <td>
                                <form action="Descargado.jsp">
                                    <input type="submit" value="Descargar">
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td>Plantas vs Zombies</td>
                            <td>Cop Cap</td> 
                            <td>$20</td>
                            <td>
                                <form action="Descargado.jsp">
                                    <input type="submit" value="Descargar">
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
