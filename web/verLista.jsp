<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.*" %>
<%@ page import="controlador.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>Lista de Elementos</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
    </head>
    <body>

        <%
            // Obtener las listas de objetos desde la base de datos
            List<Desarrollador> desarrolladores = GestorConsultas.obtenerDesarrolladores();
            List<Banda> bandas = GestorConsultas.obtenerBandas();
            List<Fabricante> fabricantes = GestorConsultas.obtenerFabricantes();
            List<Consola> consolas = GestorConsultas.obtenerConsolas();
            List<Juego> juegos = GestorConsultas.obtenerJuegos();
            List<Jugador> jugadores = GestorConsultas.obtenerJugadores();
        %>

        <!-- Menú de selección de categoría -->
        <h1>Selecciona una categoría:</h1>
        <select id="categoriaSelector" onchange="mostrarElementos()">
            <option value="escoge">Escoge una opción</option>
            <option value="desarrolladores">Desarrolladores</option>
            <option value="bandas">Bandas</option>
            <option value="fabricantes">Fabricantes</option>
            <option value="consolas">Consolas</option>
            <option value="juegos">Juegos</option>
            <option value="jugadores">Jugadores</option>
        </select>

        <!-- Sección de Desarrolladores -->
        <div id="desarrolladores" style="display: none;">
            <h1>Lista de Desarrolladores</h1>
            <% for (Desarrollador desarrollador : desarrolladores) {%>
            <section>
                <h2>Desarrollador <%= desarrollador.getCodigo()%></h2>
                <!-- Artículo para mostrar información del desarrollador -->
                <article class="elemento" onclick="window.location.href = 'https://www.google.com/search?q=<%= desarrollador.getNombre()%>'">
                    <!-- Contenedor div para información de texto -->
                    <div>
                        <p><b>Nombre:</b> <%= desarrollador.getNombre()%></p>
                        <p><b>Sede:</b> <%= desarrollador.getSede()%></p>
                    </div>
                    <!-- Imagen del Desarrollador -->
                    <img class="imgLista" src="<%= desarrollador.getFoto()%>" alt="Foto del Desarrollador"/>
                </article>
            </section>
            <% } %>
        </div>

        <!-- Sección de Bandas -->
        <div id="bandas" style="display: none;">
            <h1>Lista de Bandas</h1>
            <% for (Banda banda : bandas) {%>
            <section>
                <h2>Banda <%= banda.getCodigo()%></h2>
                <!-- Artículo para mostrar información de la banda -->
                <article class="elemento" onclick="window.location.href = 'https://www.google.com/search?q=<%= banda.getNombre()%>'">
                    <!-- Contenedor div para información de texto -->
                    <div>
                        <p><b>Nombre:</b> <%= banda.getNombre()%></p>
                        <p><b>Género:</b> <%= banda.getGenero()%></p>
                    </div>
                    <!-- Imagen de la Banda -->
                    <img class="imgLista" src="<%= banda.getFoto()%>" alt="Foto del compositor de la Banda"/>
                </article>
            </section>
            <% } %>
        </div>

        <!-- Sección de Fabricantes -->
        <div id="fabricantes" style="display: none;">
            <h1>Lista de Fabricantes</h1>
            <% for (Fabricante fabricante : fabricantes) {%>
            <section>
                <h2>Fabricante <%= fabricante.getCodigo()%></h2>
                <!-- Artículo para mostrar información del fabricante -->
                <article class="elemento" onclick="window.location.href = 'https://www.google.com/search?q=<%= fabricante.getNombre()%>'">
                    <!-- Contenedor div para información de texto -->
                    <div>
                        <p><b>Nombre:</b> <%= fabricante.getNombre()%></p>
                        <p><b>Sede:</b> <%= fabricante.getSede()%></p>
                    </div>
                    <!-- Imagen del Fabricante -->
                    <img class="imgLista" src="<%= fabricante.getFoto()%>" alt="Foto del Fabricante"/>
                </article>
            </section>
            <% } %>
        </div>

        <!-- Sección de Consolas -->
        <div id="consolas" style="display: none;">
            <h1>Lista de Consolas</h1>
            <% for (Consola consola : consolas) {%>
            <section>
                <h2>Consola <%= consola.getCodigo()%></h2>
                <!-- Artículo para mostrar información de la consola -->
                <article class="elemento" onclick="window.location.href = 'https://www.google.com/search?q=<%= consola.getNombre()%>'">
                    <!-- Contenedor div para información de texto -->
                    <div>
                        <p><b>Nombre:</b> <%= consola.getNombre() != null ? consola.getNombre() : "Sin nombre"%></p>
                        <p><b>Fabricante:</b> <%= (consola.getFabricante() != null && consola.getFabricante().getNombre() != null) ? consola.getFabricante().getNombre() : "Sin fabricante"%></p>
                        <p><b>Lanzamiento:</b> <%= consola.getLanzamiento() != null ? UtilidadFechas.formatearFecha(consola.getLanzamiento()) : "Sin fecha"%></p>
                    </div>
                    <!-- Imagen de la Consola -->
                    <img class="imgLista" src="<%= consola.getFoto()%>" alt="Foto de la Consola"/>
                </article>
            </section>
            <% } %>
        </div>

        <!-- Sección de Juegos -->
        <div id="juegos" style="display: none;">
            <h1>Lista de Juegos</h1>
            <% for (Juego juego : juegos) {%>
            <section>
                <h2>Juego <%= juego.getCodigo()%></h2>
                <!-- Artículo para mostrar información del juego -->
                <article class="elemento" onclick="window.location.href = 'https://www.google.com/search?q=<%= juego.getTitulo()%>'">
                    <!-- Contenedor div para información de texto -->
                    <div>
                        <p><b>Título:</b> <%= juego.getTitulo()%></p>
                        <p><b>Género:</b> <%= juego.getGenero()%></p>
                        <p><b>Desarrollador:</b> <%= juego.getDesarrollador().getNombre()%></p>
                        <p><b>Consola:</b> <%= juego.getConsola().getNombre()%></p>
                        <p><b>Banda:</b> <%= juego.getBanda().getNombre()%></p>
                    </div>
                    <!-- Imagen del Juego -->
                    <img class="imgLista" src="<%= juego.getFoto()%>" alt="Foto del Juego"/>
                </article>
            </section>
            <% } %>
        </div>

        <!-- Sección de Jugadores -->
        <div id="jugadores" style="display: none;">
            <h1>Lista de Jugadores</h1>
            <% for (Jugador jugador : jugadores) {%>
            <section>
                <h2>Jugador <%= jugador.getCodigo()%></h2>
                <!-- Artículo para mostrar información del jugador -->
                <article class="elemento" onclick="window.location.href = 'https://www.google.com/search?q=<%= jugador.getNombre()%>'">
                    <!-- Contenedor div para información de texto -->
                    <div>
                        <p><b>Nombre:</b> <%= jugador.getNombre()%></p>
                        <p><b>Edad:</b> <%= jugador.getEdad()%></p>
                        <p><b>Consola:</b> <%= jugador.getConsola().getNombre()%></p>
                    </div>
                    <!-- Imagen del Jugador -->
                    <img class="imgLista" src="<%= jugador.getFoto()%>" alt="Foto del Jugador"/>
                </article>
            </section>
            <% }%>
        </div>

        <button onclick="document.location.href = 'index.jsp'">Volver a la página anterior</button>

        <!-- Inclusión del script JavaScript -->
        <script type="text/javascript" src="js/script.js"></script>

    </body>
</html>
