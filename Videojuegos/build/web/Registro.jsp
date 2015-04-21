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
                    <div class="wrapper">
                        <!-- Encabezado de pagina que manda a la pagina principal -->
                        <h1><a href="index.html">VideojuegosIglu<span>.com</span></a></h1>
                        <nav>
                            <!-- Opciones del menu principal en el encabezado -->
                            <ul class="menu">
                                <li><a href="ListaVideojuego">Categorias</a></li>
                                <li><a href="Registro.jsp">Registrarse</a></li>
                                <li><a href="IniciarSesion">Iniciar Sesion</a></li>
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

                        <article class="column-2">
                        <h3>Registro</h3>
                        
                        <%  String msg=(String) request.getAttribute("msg");
                          try{  
                           if(msg.equals(null))
                               msg="a";
                          }catch(java.lang.NullPointerException e){
                              msg="a";
                          }
                            if(msg.equals("t")){
                                %><h6 class="p2">Estudiante Registrado</h6>
                                  <h6 class="p2">Tu solicitud sera revisada y se te informara por correo electronico el proceso de tu solicitud</h6>
                                  <a class="button-2" href="index.html">Regresar</a>
                            <%}else{%>
                        <form action="Registrarse" method="post">
                            <pre>Nombre:                   <input type="text" name="nombre"></pre>
                            <pre>Apellido Paterno:      <input type="text" name="appat"></pre>
                            <pre>Apellido Materno:      <input type="text" name="apmat"></pre>
                            <pre>Correo electronico:    <input type="text" name="correo"></pre>
                            <pre>Universidad:             <input type="text" name="universidad"></pre>
                            <pre>Numero de cuenta:    <input type="text" name="cuenta"></pre>
                            <pre>Historial Academico:  <input type="file" name="archivo"/><br /></pre>
                            <%if(msg.equals("f")){
                                %><h6 class="p2">Favor de llenar todos los campos</h6>
                            <%}%>
                            <input type="submit" class="button-2" value="Registrarse">
                        </form>
                            <%}%>
                       </article>
                    
                        <article class="column-2">
                	<div class="maxheight indent-bot">
                            <h3 class="p1">Bienvenidos Estudiantes</h3>
                            <h6 class="p2">VideojuegosIglu otorga creditos a los estudiantes con un buen desempe?o academico que te serviran para comprar los mejores videojuegos</h6>
                            <h6 class="p2">Solo tienes que dar clic en Registrarse llenar tus datos y sube tu historial academico </h6>
                            <h6 class="p2">Los creditos se otorgan de acuerdo a criterios de promedio y avance de creditos. Los creditos son intransferibles y solo pueden solicitarse una vez por semestre.</h6>
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