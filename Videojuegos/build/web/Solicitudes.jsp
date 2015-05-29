<%-- 
    Document   : Solicitudes
    Created on : 14/03/2015, 12:04:53 AM
    Author     : JesúsIván
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Estudiante"%>
<%@page import="Modelo.Estudiante"%>
<html>
    <%if(session.getAttribute("administrador") == null){
        response.sendRedirect("Index.jsp");
    }else if(session.getAttribute("administrador").equals("iglu20151@gmail.com")){
                                
    %>
    <head>  
    <title>Solicitudes</title>
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
                    <!-- SECCION A EDITAR AL CAMBIAR DE PAGINAS -->
                      <article class="column-4">
                          <h3 class="p1">Lista de Solicitudes de Credito Pendientes</h3>
                        <table style="width:100%">
                        <%
                            try{
                                LinkedList<Estudiante> lista=(LinkedList) request.getAttribute("lista");
                                if(lista.size()==0){
                                    %><h6 class="p2"><%out.println("No hay solicitudes pendientes");%></h6><%}else{%>
                            
                        <!--  
                            <tr>
                                <td><font color="#eee">Nombre</font></td>
                                <td><font color="#eee">Correo Electrónico</font></td>
                                <td><font color="#eee">Universidad</font></td>
                                <td><font color="#eee">Cuenta</font></td>
                            </tr>   --> 
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                                    <%
                                for(int i=0; i<lista.size(); i++){
                                    String nombre=lista.get(i).getNombre()+" "+lista.get(i).getAppat()+" "+lista.get(i).getApmat();
                        %>
                          <form action="Creditos" method="post">
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% out.print(nombre); %></td>
                                <td><% out.print(lista.get(i).getUniversidad()); %></td>
                                <td><a rel="nofollow" class="link" target="_blank" href="pdf/<%out.print(lista.get(i).getCorreoe());%>.pdf" title=><h9>&nbsp;&nbsp;&nbsp;Ver Historial Académico&nbsp;&nbsp;&nbsp;</h9></a><br></td>
                                <td><input type="hidden" name="correoe" value="<% out.print(lista.get(i).getCorreoe()); %>">Créditos: &nbsp;&nbsp; <input type="text" size="6" pattern="[0-9]{1,6}$" NAME="creditos" required></textarea></td>
                                    
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% out.print(lista.get(i).getCorreoe()); %></td>
                                <td><% out.print(lista.get(i).getCuenta()); %></td>
                                
                                    <td>
    <div class="multiselect">
        <div class="selectBox" onclick="showCheckboxes()">
            <select>
                <option>Selecciona una opcion</option>
            </select>
            <div class="overSelect"></div>
        </div>
        <div id="checkboxes">
            <label for="one"><input type="checkbox" name="valido" value="1"/>Datos Validos</label>
            <label for="two"><input type="checkbox" name="invalido" value="Nombre Incorrecto"/>Nombre Incorrecto</label>
            <label for="three"><input type="checkbox" name="invalido" value="Universidad Incorrecta"/>Universidad Incorrecta</label>
            <label for="four"><input type="checkbox" name="invalido" value="Cuenta Incorrecta"/>Cuenta Incorrecta</label>
            <label for="five"><input type="checkbox" name="invalido" value="Archivo Incorrecto"/>Archivo Incorrecto</label>
        </div>
    </div>
                                        
<script>
    var expanded = false;
    function showCheckboxes() {
        var checkboxes = document.getElementById("checkboxes");
        if (!expanded) {
            checkboxes.style.display = "block";
            expanded = true;
        } else {
            checkboxes.style.display = "none";
            expanded = false;
        }
    }
</script>
                                    </td>
                                    <td><input type="submit" value="Asignar"></td>
                                    
                                
                                </tr>
                              </form>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <%      }
                                }
                            }catch(java.lang.NullPointerException e){
                            }
                            %>
                        </table>
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
