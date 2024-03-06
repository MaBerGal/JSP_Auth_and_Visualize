<%@ page import="controlador.JspCalendar" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Ver Zodiaco</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
    </head>
    <body>
        <h1>Información del Zodiaco</h1>

        <article>

            <section>
                <h2>Edad</h2>
                <%
                    // Obtener los parámetros del formulario enviado desde index.jsp
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String fechaNacimientoStr = request.getParameter("fechaNacimiento");

                    // Convertir la fecha de nacimiento a un objeto Date
                    Date fechaNacimiento = java.sql.Date.valueOf(fechaNacimientoStr);

                    // Calcular la edad
                    JspCalendar jspCalendar = new JspCalendar();
                    jspCalendar.setTime(fechaNacimiento);
                    int age = jspCalendar.getYear() - jspCalendar.getYear();

                    // Mostrar la edad
                    out.println("<p>" + nombre + " " + apellido + ", tu edad es: <b>" + age + " años</b></p>");

                    // Obtener el mes y día de nacimiento
                    int mesNacimiento = jspCalendar.getMonthInt();
                    int diaNacimiento = jspCalendar.getDayOfMonth();

                    // Obtener el signo del zodiaco
                    String signoZodiaco = jspCalendar.getZodiacSign(mesNacimiento, diaNacimiento);

                    out.println("<h2>Signo del Zodiaco</h2>");
                    // Mostrar el signo del zodiaco
                    out.println("<p>Tu signo del zodiaco es: <b>" + signoZodiaco + "</b></p>");
                %>
            </section>

            <section>
                <%
                    // Convertir la imagen del zodiaco a minúsculas
                    String imagenZodiaco = "images/" + signoZodiaco + ".png";
                    imagenZodiaco = imagenZodiaco.toLowerCase();
                %>
                <img class="imgZodiaco" src="<%= imagenZodiaco%>" alt="Signo del Zodiaco">
            </section>
        </article>

        <button onclick="document.location.href = 'index.jsp'">Volver a la página anterior</button>
    </body>
</html>
