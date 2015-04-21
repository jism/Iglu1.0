<%-- 
    Document   : ListaVideojuegos
    Created on : 13/03/2015, 11:18:38 PM
    Author     : JesúsIván
--%>

<%@page import="Modelo.Videojuego"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Lista de videojuegos</title>
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
                            <li><a href="ListaVideojuego">Categorias</a></li>
                                <li><a href="RevisarSolicitudCredito">Solicitudes</a></li>
                                <li><a href="SubirJuego.jsp">Subir Videojuego</a></li>
                                <li><a href="index.html">Cerrar Sesion</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
       
        <div class="row-bot">
            <div class="row-bot-bg">
            	<div class="main">
                    <h3 class="p2">Lista de Videojuegos</h3>
                    <table style="width:100%">
                        <%
                            try{
                                LinkedList<Videojuego> lista=(LinkedList) request.getAttribute("lista");
                                
                                if(lista.size()==0){
                                    %><h6 class="p2"><%out.println("Lista de Videojuegos vacia");%></h6><%
                                }
                                
                                for(int i=0; i<lista.size(); i++){
                        %>
                            <tr>
                                <td><% out.print(lista.get(i).getNombre()); %></td>
                                <td><% out.print(lista.get(i).getAnio()); %></td>                       
                                <td>$<% out.print(lista.get(i).getCosto()); %></td>
                                <td><% out.print(lista.get(i).getCategoria()); %></td>
                                <td><% out.print(lista.get(i).getDesarrollador()); %></td>
                                <td>Video <a title="Ver video" href="javascript:void(0);" onclick="window.open('<%out.print(lista.get(i).getVideo());%>'+'&autoplay=1', 'popup', 'left=390, top=200, width=425, height=344, toolbar=0, resizable=1')"><img src="http://www.hopechiro.com/wp-content/uploads/2013/03/icon-Play.png" title="Ver video" /></a></td>
                                <td><input type="button" onclick=" location.href='<%out.print(lista.get(i).getArchivo());%>' " name="descarga" value="Descarga" ></td>
                            </tr>
                            <% 
                                }
                            }catch(java.lang.NullPointerException e){
                            }
                            %>
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
</body>
</html>
