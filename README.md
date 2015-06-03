# Iglu

Instalación del Sistema

Para instalar el sistema en tu computador debes seguir los siguientes pasos:

1- Restaurar la base de datos adjunta (backupIglu.backup) en tu localhost, ya sea por medio de algun programa como Pgadmin3 o desde la terminal.

Una vez instalado el sistema configurar el siguiente archivo:

/Videojuegos/src/java/Controlador/ConexionBD.java

modificar las lineas:

33 username = "";

ingresar el nombre de usuario que se tiene en postgresql

34 password = "";

ingresar la contraseña del usuario que se tiene en postgresql


2- Se tiene un proyecto de netbeans se puede abrir el programa de Netbeans abrir el proyecto y ejecutarlo