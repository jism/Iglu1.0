<!DOCTYPE html>

<html lang="en">
    
    <%if(session.getAttribute("administrador") == null){
        response.sendRedirect("Index.jsp");
    }else if(session.getAttribute("administrador").equals("iglu20151@gmail.com")){
                                
    %>

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
                    <ul id="nav">
                        <h1><a href="Index.jsp"><span>Administrador</span></a></h1>
                        <li><a class="hsubs" href="CerrarSesion">Cerrar Sesion&nbsp;</a></li>
                        <li><a class="hsubs" href="RevisarSolicitudCredito">Solicitudes&nbsp;&nbsp;&nbsp;</a></li>
                        <li><a class="hsubs" href="Usuarios">Ver Usuarios&nbsp;&nbsp;</a></li>
                        <li><a class="hsubs" href="SubirJuego.jsp">Subir Videojuego</a></li>
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
                    </ul>
                </div>
            </div>
            
            <!-- Seccion de la pagina con fondo anaranjado-->
            <%
            String mensaje=(String) request.getParameter("s");
                if(mensaje!=null){
                    if(mensaje.equals("1")){
                    %> 
                        <script type="text/javascript">
                            alert("Solicitud Eliminada Datos Incorrectos");
                        </script>
                    <%
                    }
                }          
            %>
            <div class="row-bot">
                <div class="row-bot-bg">
                    <div class="main">
                    <!-- SECCION A EDITAR AL CAMBIAR DE PAGINAS -->
                    
                    <article class="column-1">
                	<div class="maxheight indent-bot">
                            <h3 class="p1">Administrador</h3>
                            <h6 class="p2">Has accedido como administrador</h6>
                            <h6 class="p2">Desde Admiistrador puedes revisar las solicitudes de los estudiantes para poder otorgar créditos (hasta 999999)</h6>
                            <h6 class="p2">Los créditos se otorgan de acuerdo a critérios de promedio y avance de créditos. Los créditos son intransferibles y solo pueden solicitarse una vez por semestre.</h6>
                            <h6 class="p2">Desde Aministrador puedes editar videojuegos, desde modificarlos hasta subir nuevos videojuegos</h6>
                            <h6 class="p2">Para editar un videojuego solo busca el videojuego en las multiples categorías y da clic en editar para modificar sus caracteristicas o hasta eliminar el videojuego</h6>
                            <h6 class="p2">Para subir un videojuego solo da clic en la pestaña subir videojuego y llena los campos necesarios para subir el videojuego</h6>
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
        
        <%}else{
            response.sendRedirect("Index.jsp");
        }%>
        
    </body>
</html>
