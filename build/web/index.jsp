<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bienvenida</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
    </head>
    <body class="bodyIndex">
        <h1 class="h1Index">Bienvenido a la Práctica 9 de JSP</h1>

        <!-- Formulario de persona -->
        <!-- Al enviar los datos, se cambia a verZodiaco.jsp -->
        <form action="verZodiaco.jsp" method="post">
            Nombre: <input type="text" name="nombre" placeholder="Introduce tu nombre" required><br>
            Apellido: <input type="text" name="apellido" placeholder="Introduce tu apellido" required><br>
            Fecha de nacimiento: <input type="date" name="fechaNacimiento" required><br>
            <input type="submit" value="Ver Zodiaco">
        </form>

        <!-- Enlaces a otras páginas -->
        <p><a class="aIndex" href="verLista.jsp">⚪ Ver Lista ⚪</a></p>
        <p><a class ="aIndex" href="verTabla.jsp">⚪ Ver Tabla ⚪</a></p>
    </body>
</html>
