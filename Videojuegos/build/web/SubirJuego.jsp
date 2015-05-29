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
                                <form action="SubirJuego" method="post" enctype="multipart/form-data">
                                    <article class="column-2">
					  <pre>      Nombre:                     <input type="text" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ+ ]{1,30}" name="nombre" required/></pre>
					  <pre>      Desarrollador:            <input type="text" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ+ ]{1,30}" name="desarrollador" required/></pre>
					  <pre>      Año Lanzamiento:     <select name="ano" required>
                                                                                    <option selected> ---
                                                                                    <option value="1972">1972</option>
                                                                                    <option value="1973">1973</option>
                                                                                    <option value="1974">1974</option>
                                                                                    <option value="1975">1975</option>
                                                                                    <option value="1976">1976</option>
                                                                                    <option value="1977">1977</option>
                                                                                    <option value="1978">1978</option>
                                                                                    <option value="1979">1979</option>
                                                                                    <option value="1980">1980</option>
                                                                                    <option value="1972">1972</option>
                                                                                    <option value="1973">1973</option>
                                                                                    <option value="1974">1974</option>
                                                                                    <option value="1975">1975</option>
                                                                                    <option value="1976">1976</option>
                                                                                    <option value="1977">1977</option>
                                                                                    <option value="1978">1978</option>
                                                                                    <option value="1979">1979</option>
                                                                                    <option value="1980">1980</option>
                                                                                    <option value="1981">1980</option>
                                                                                    <option value="1982">1982</option>
                                                                                    <option value="1983">1983</option>
                                                                                    <option value="1984">1984</option>
                                                                                    <option value="1985">1985</option>
                                                                                    <option value="1986">1986</option>
                                                                                    <option value="1987">1987</option>
                                                                                    <option value="1988">1988</option>
                                                                                    <option value="1989">1989</option>
                                                                                    <option value="1990">1990</option>
                                                                                    <option value="1991">1991</option>
                                                                                    <option value="1992">1992</option>
                                                                                    <option value="1993">1993</option>
                                                                                    <option value="1994">1994</option>
                                                                                    <option value="1995">1995</option>
                                                                                    <option value="1996">1996</option>
                                                                                    <option value="1997">1997</option>
                                                                                    <option value="1998">1998</option>
                                                                                    <option value="1999">1999</option>
                                                                                    <option value="2000">2000</option>
                                                                                    <option value="2001">2001</option>
                                                                                    <option value="2002">2002</option>
                                                                                    <option value="2003">2003</option>
                                                                                    <option value="2004">2004</option>
                                                                                    <option value="2005">2005</option>
                                                                                    <option value="2006">2006</option>
                                                                                    <option value="2007">2007</option>
                                                                                    <option value="2008">2008</option>
                                                                                    <option value="2009">2009</option>
                                                                                    <option value="2010">2010</option>
                                                                                    <option value="2011">2011</option>
                                                                                    <option value="2012">2012</option>
                                                                                    <option value="2013">2013</option>
                                                                                    <option value="2014">2014</option>
                                                                                    <option value="2015">2015</option>
                                                                                 </select></pre>
                                          <pre>      Categoria:                  <select name="categoria" required >
                                                                                    <option selected> ---
                                                                                    <option value="Android">Android</option>
                                                                                    <option value="Emuladores">Emuladores</option>
                                                                                    <option value="iPhone">iPhone</option>
                                                                                    <option value="PC">PC</option>
                                                                                    <option value="PSP">PSP</option>
                                                                                    <option value="PSX">PSX</option>
                                                                                    <option value="Rooms">Rooms</option>
                                                                                    <option value="Otros">Otros</option>
                                                                                 </select></pre>
					  <pre>      Precio:                       <input type="text" size="6" pattern="[0-9]{1,6}$" NAME="precio" required></pre>
                                          <pre>      Descripcion:              <textarea COLS=21 ROWS=5 pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ+ ]{2,100}" NAME="descripcion" required></textarea></pre>
                                    </article>
                                    <article class="column-2">
                                        <!--
                                          <pre>Imagen:        <input type="file" name="imagen"/><br /></pre><br>
                                          <pre>Video:          <input type="file" name="video"/><br /></pre><br>
					  <pre>Videojuego:   <input type="file" name="archivo"/><br /></pre><br>
                                          <input type="submit" class="button-2" value="Subir Videojuego">
                                          -->
                                          <pre>Imagen:        <input type="file" name="file" required/></pre><br>
                                          <pre>Video:          <input type="file" name="file2" required/></pre><br>
					  <pre>Videojuego:   <input type="file" name="file3" required/></pre><br>
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
