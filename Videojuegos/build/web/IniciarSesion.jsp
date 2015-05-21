<%-- 
    Document   : IniciarSesion
    Created on : 18/05/2015, 01:25:11 PM
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head> 
    <title>Iniciar Sesion</title>
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
                        <li><a class="hsubs" href="#">Iniciar Sesión</a>
                            <ul class="subs">
                                <li><a href="#"><input type="text" name="nombre"><br> </a></li>
                                <li><a>Nombre</a></li>
                                <li><a href="#"><input type="text" pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" name="email" required/></a></li>
                                <li><a>Email</a></li>
                                <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Acceder"></a></li>
                                <li><a href="#">Olvidaste contraseña</a></li>
                           </ul>
                        </li>
                        <li><a href="#">Registrarse&nbsp;&nbsp;&nbsp;</a></li>
                        <li><a class="hsubs" href="#">Categorías&nbsp;&nbsp;&nbsp;</a>
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
                    </ul>
                </div>
            </div> 
            
            <!-- Seccion de la pagina con fondo anaranjado-->
            <div class="row-bot">
                <div class="row-bot-bg">
                    <div class="main">
                    <!-- SECCION A EDITAR AL CAMBIAR DE PAGINAS -->    
                    
                        <!-- Barra lateral izquierda con las categorias de los videojuegos -->
                        <article class="column-3">
                            <div class="indent-left">
                                <div class="maxheight indent-bot">
                                    <h3>Categorias</h3>
                                    <ul class="list-1">
                                        <li><a href="#">Accion</a></li>
                                        <li><a href="#">Aventura</a></li>
                                        <li><a href="#">Coches</a></li>
                                        <li><a href="#">Deportes</a></li>
                                        <li><a href="#">De Mesa</a></li>
                                        <li><a href="#">Disparos</a></li>
					<li><a href="#">Infantiles</a></li>
					<li><a href="#">Multijugador</a></li>
                                        <li><a href="#">Puzzles</a></li>
                                    </ul>
                                </div>
                                <a class="button-2" href="ListaVideojuego">Ver Mas</a>
                            </div>
                        </article>
        
                         

En el formulario debes agregar lo siguiente: 

<form action="" method="" id="" name="" onsubmit="return validacion()">
Nombre:<br> 
<input type="text" name="nombre"><br> 
País:<br> 
<input type="text" name="pais"><br> 
Email:<br> 
<input type="text" pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" name="email" required/><br><br> 
<input type="submit" value="Enviar"> 
</form> 

<script> 
function revisar() { 
if(true) { alert('Debes poner el nombre') ; return false ; } 
if(formulario.pais.equals("")) { alert('Debes poner el país') ; return false ; } 
if(formulario.email.equals("")) { alert('Debes poner el email') ; return false ; } 
} 
</script>
                        
                       
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
                	<a href="ListaVideojuego"><img class="img-border" src="images/banner-1.jpg" alt=""></a>
                    </article>
                    <article class="col-1">
                	<a href="ListaVideojuego"><img class="img-border" src="images/banner-2.jpg" alt=""></a>
                    </article>
                    <article class="col-2">
                	<a href="ListaVideojuego"><img class="img-border" src="images/banner-3.jpg" alt=""></a>
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

