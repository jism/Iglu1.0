<%-- 
    Document   : Usuario
    Created on : 29/05/2015, 03:45:57 PM
    Author     : Ivan
--%>

<%@page import="Modelo.Videojuego"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="row-bot">
            <div class="row-bot-bg">
            	<div class="main">
                    <article class="column-2">
                        <%
                            try{
                                int creditos = (int) request.getAttribute("creditos");
                                Estudiante e=(Estudiante) request.getAttribute("estudiante");
                        %>
                        <h3 class="p2">Datos del Usuario</h3>    
                        <pre>Correo:<%out.print("      "+request.getAttribute("correoe"));%></pre>
                        <pre>Créditos:<%out.print("   $"+creditos);%></pre>
                        
                        <h3 class="p2">Datos de Estudiante</h3>
                        <pre><%out.print(e.getNombre()+" "+e.getAppat()+" "+e.getApmat());%></pre>
                        <pre>Universidad:<%out.print("   "+e.getUniversidad());%></pre>
                        <pre>Cuenta:<%out.print("           "+e.getCuenta());%></pre>
                        <form target="_blank" action="pdf/<%out.print(request.getAttribute("correoe"));%>.pdf"><input type="image" src="images/historial.png" name="image" width="170" height="30"></form>
                        <br><form name="tuformulario" action="EliminaUsuario" method="post">
                                <input type="hidden" name="correoe" value="<%out.print(request.getAttribute("correoe"));%>">
                            </form>
                            <input type="image" src="images/eliminar.png" name="image" onclick="pregunta()" width="230" height="35">
                        <%     
                        }catch(java.lang.NullPointerException e){
                        }
                        %>
                    </article>
                        
                    <!-- lista de videojuegos comprados   -->
                    <article class="column-2">
                        <h3 class="p2">Videojuegos Comprados</h3>
                        <%
                            LinkedList<Videojuego> lista = (LinkedList<Videojuego>) request.getAttribute("lista");
                            if(lista == null || lista.size() == 0){
                        %>
                        <h6 class="p2">Usuario no ha comprado videojuegos</h6>
                        <%
                            }else{
                                for(int i=0; i<lista.size(); i++){
                                %><pre><%out.print(lista.get(i).getNombre()+"\n"+"Precio: $"+lista.get(i).getCosto());%></pre><%
                                }
                            }
                        %>
                    </article>
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
    
        <script language="JavaScript"> 
            function pregunta(){
                var r = confirm('¿Estás seguro de eliminar el usuario?');
                if (r){ 
                    document.tuformulario.submit()
                }else{
                    txt = "You pressed Cancel!";
                }
            } 
        </script>
    </body>
</html>