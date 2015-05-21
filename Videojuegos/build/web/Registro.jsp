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
                                <li><a href="#">PSP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">PSX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
                                <li><a href="#">Otros&nbsp;&nbsp;</a></li>
                            </ul>
                        </li>
                        <div id="lavalamp"></div>
                        <%
                            }else{
                                response.sendRedirect("Index.jsp");
                            %>
                        <li><a class="hsubs" href="CerrarSesion">Cerrar Sesión</a>
                            <ul class="subs">
                                <li><a><%out.print(session.getAttribute("usuario"));%></a></li>
                            </ul>
                        </li>
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
            
            <!-- Seccion de la pagina con fondo anaranjado-->
            <div class="row-bot">
                <div class="row-bot-bg">
                    <div class="main">
                    <!-- SECCION A EDITAR AL CAMBIAR DE PAGINAS -->

                        <article class="column-2">
                        <h3>Registro</h3>
                        
                        <%  
                          String msg=(String) request.getAttribute("msg");
                          try{  
                           if(msg.equals(null))
                               msg="a";
                          }catch(java.lang.NullPointerException e){
                              msg="a";
                          }
                            if(msg.equals("t")){
                                %><h6 class="p2">Estudiante Registrado</h6>
                                  <h6 class="p2">Tu solicitud sera revisada y se te informara por correo electronico el proceso de tu solicitud</h6>
                                  <a class="button-2" href="Index.jsp">Regresar</a>
                            <%}else{%>
                        <form action="Registrarse" method="post">
                            <pre>Nombre:                     <input type="text" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ+ ]{1,30}" name="nombre" required/></pre>
                            <pre>Apellido Paterno:       <input type="text" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]{1,30}" name="appat" required></pre>
                            <pre>Apellido Materno:      <input type="text" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]{1,30}" name="apmat" required></pre>
                            <pre>Correo electrónico:     <input type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" name="correo" required></pre>
                            <pre>Universidad:               <select name="universidad">
  <option value="UNAM">UNAM</option>
  <option value="IPN">IPN</option>
  <option value="UAM">UAM</option>
  <option value="ITESM">ITESM</option>
  <option value="ITAM">ITAM</option>
  <option value="UDLAP">UDLAP</option>
  <option value="UIA">UIA</option>
  <option selected="Otra" value="Otra">Otra</option>
</select><br /></pre>
                            <pre>Número de cuenta:     <input type="text" pattern="[0-9a-zA-Z]{2,20}$" name="cuenta" required></pre>
                            <pre>Historial Académico:  <input type="file" name="archivo"/><br /></pre>
                            <%if(msg.equals("f")){
                            %><h6 class="p2"><font color="#eee">Correoe Electronico Ya Registrado!</font></h6>
                            <%}%>
                            <input type="submit" class="button-2" value="Registrarse">
                        </form>
                            <%}%>
                       </article>
                    
                        <article class="column-2">
                	<div class="maxheight indent-bot">
                            <h3 class="p1">Bienvenidos Estudiantes</h3>
                            <h6 class="p2">VideojuegosIglu otorga créditos a los estudiantes con un buen desempeño académico que te serviran para comprar los mejores videojuegos</h6>
                            <h6 class="p2">Solo tienes que dar clic en Registrarse llenar tus datos y sube tu historial académico </h6>
                            <h6 class="p2">Los créditos se otorgan de acuerdo a criterios de promedio y avance de creditos. Los creditos son intransferibles y solo pueden solicitarse una vez por semestre.</h6>
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

    </body>
</html>