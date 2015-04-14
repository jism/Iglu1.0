<%-- 
    Document   : Registro
    Created on : 13/03/2015, 11:43:06 PM
    Author     : JesúsIván
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
    </head>
    <body>
        <h1>Registro</h1>
        <p><a href="login.jsp">Iniciar sesión</a></p>
        
        
        <form action="Register" method="post">
            <p>Nombre: <input type="text" name="nombre"></p>
            <p>Apellido Paterno: <input type="text" name="email"></p>
			<p>Apellido Materno: <input type="text" name="email"></p>
			<p>Correo electrónico: <input type="text" name="correo"></p>
			<p>Universidad: <input type="text" name="email"></p>
			<p>Número de cuenta: <input type="text" name="email"></p>
			<p>Email: <input type="text" name="email"></p>
            <input type="file" name="file"/> 
			<br /> 
			<input type="submit" value="Subir Imagen" /> 
            <p>Confirma contraseña <input type="password" name="password2"></p>
            <p><input type="submit" value="Registrar"></p>
        </form>
    </body>
</html>
