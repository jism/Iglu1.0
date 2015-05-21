<!DOCTYPE html>

<html lang="en">
    <%if(session.getAttribute("administrador") == null){
        response.sendRedirect("Index.jsp");
    }else if(session.getAttribute("administrador").equals("iglu20151@gmail.com")){
                                
    %>
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
                        
                            <h3>Subir Videojuego</h3><br>
                                <form action="SubirJuego" method="post">
                                    <article class="column-2">
					  <pre>      Nombre:                     <input type="text" name="nombre"></pre>
					  <pre>      Desarrollador:            <input type="text" name="desarrollador"></pre>
					  <pre>      Año Lanzamiento:     <input type="text" name="ano"></pre>
					  <pre>      Categoria:                  <input type="text" name="categoria"></pre>
					  <pre>      Precio:                       <input type="text" name="precio"></pre>
                                          <pre>      Descripcion:              <textarea COLS=21 ROWS=5 NAME="descripcion"></textarea></pre>
                                    </article>
                                    <article class="column-2">
                                        <!--
                                          <pre>Imagen:        <input type="file" name="imagen"/><br /></pre><br>
                                          <pre>Video:          <input type="file" name="video"/><br /></pre><br>
					  <pre>Videojuego:   <input type="file" name="archivo"/><br /></pre><br>
                                          <input type="submit" class="button-2" value="Subir Videojuego">
                                          -->
                                          <pre>Imagen:        <input type="file" name="file"/></pre><br>
                                          <pre>Video:          <input type="text" name="video"></pre><br>
					  <pre>Videojuego:   <input type="text" name="archivo"></pre><br>
                                          <input type="submit" class="button-2" value="Guardar">
                                          
                                          <%  String msg=(String) request.getAttribute("msg");
                          try{  
                           if(msg.equals(null))
                               msg="a";
                          }catch(java.lang.NullPointerException e){
                              msg="a";
                          }
                            if(msg.equals("t")){
                                %><h6 class="p2">Videojuego Guardado Exitosamente</h6>
                            <%}%>
                                    </article>
                                </form>
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
