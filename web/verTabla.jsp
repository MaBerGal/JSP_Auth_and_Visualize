<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="modelo.*"%>
<%@page import="controlador.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver Tabla</title>
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
    </head>
    <body>

        <!-- Selector de categoría para mostrar cada tabla por get (se refresca la página cada vez) -->
        <h1>Selecciona una categoría:</h1>
        <form action="" method="get" id="categoriaForm">
            <select id="categoriaSelector" name="categoria" onchange="document.getElementById('categoriaForm').submit()">
                <option value="escoge">Escoge una opción</option>
                <option value="desarrolladores" <%= ("desarrolladores".equals(request.getParameter("categoria"))) ? "selected" : ""%>>Desarrolladores</option>
                <option value="bandas" <%= ("bandas".equals(request.getParameter("categoria"))) ? "selected" : ""%>>Bandas</option>
                <option value="fabricantes" <%= ("fabricantes".equals(request.getParameter("categoria"))) ? "selected" : ""%>>Fabricantes</option>
                <option value="consolas" <%= ("consolas".equals(request.getParameter("categoria"))) ? "selected" : ""%>>Consolas</option>
                <option value="juegos" <%= ("juegos".equals(request.getParameter("categoria"))) ? "selected" : ""%>>Juegos</option>
                <option value="jugadores" <%= ("jugadores".equals(request.getParameter("categoria"))) ? "selected" : ""%>>Jugadores</option>
            </select>
        </form>

        <%
            String categoriaSeleccionada = request.getParameter("categoria");
            List<?> elementos = null;

            // Si la opción es "escoge", establece la categoría a null
            if ("escoge".equals(categoriaSeleccionada)) {
                categoriaSeleccionada = null;
            }

            // En caso de que no sea null, se cargan los elementos correspondientes
            if (categoriaSeleccionada != null) {
                switch (categoriaSeleccionada) {
                    case "desarrolladores":
                        elementos = GestorConsultas.obtenerDesarrolladores();
                        break;
                    case "bandas":
                        elementos = GestorConsultas.obtenerBandas();
                        break;
                    case "fabricantes":
                        elementos = GestorConsultas.obtenerFabricantes();
                        break;
                    case "consolas":
                        elementos = GestorConsultas.obtenerConsolas();
                        break;
                    case "juegos":
                        elementos = GestorConsultas.obtenerJuegos();
                        break;
                    case "jugadores":
                        elementos = GestorConsultas.obtenerJugadores();
                        break;
                }
            }

            // Obtener los atributos de la clase correspondiente
            Field[] atributos = null;
            if (elementos != null && !elementos.isEmpty()) {
                atributos = elementos.get(0).getClass().getDeclaredFields();
            }
        %>

        <!-- Mostrar el título de la tabla -->
        <h1><%= (categoriaSeleccionada != null) ? "Tabla de " + categoriaSeleccionada : "No hay una tabla seleccionada."%></h1>
        <div>
            <%
                if (categoriaSeleccionada != null && atributos != null) {
            %>
            <!-- Crear la tabla y sus encabezados -->
            <table id="<%= categoriaSeleccionada%>Tabla">
                <thead>
                    <tr>
                        <% for (Field atributo : atributos) {
                                // Omitir la columna si el atributo es "foto" o "serialVersionUID"
                                if (!"foto".equals(atributo.getName()) && !"serialVersionUID".equals(atributo.getName())) {
                        %>
                        <th><%= atributo.getName()%></th>
                            <% }
                                } %>
                    </tr>
                </thead>
                <tbody>
                    <% for (Object elemento : elementos) { %>
                    <tr>
                        <% for (Field atributo : atributos) {
                                // Omitir la celda si el atributo es "foto" o "serialVersionUID"
                                if (!"foto".equals(atributo.getName()) && !"serialVersionUID".equals(atributo.getName())) {
                                    atributo.setAccessible(true);
                                    Object valorAtributo = atributo.get(elemento);

                                    // Verificar que no sea null y que no sea un tipo primitivo ni String
                                    // para realizar procesamiento adicional cuando haya que recuperar datos de la
                                    // referencia a otro objeto
                                    if (valorAtributo != null && !atributo.getType().isPrimitive() && !atributo.getType().isAssignableFrom(String.class)) {
                                        String[] posiblesNombresDeMetodos = {"getNombre", "getTitulo"};
                                        Method metodo = null;

                                        // Intentar buscar todos los nombres de métodos necesarios
                                        for (String nombreMetodo : posiblesNombresDeMetodos) {
                                            try {
                                                metodo = valorAtributo.getClass().getMethod(nombreMetodo);
                                                break;
                                            } catch (NoSuchMethodException e) {
                                                System.out.println("No existe el método");
                                            }
                                        }

                                        if (metodo != null) {
                                            valorAtributo = metodo.invoke(valorAtributo);
                                        }
                                    }

                                    // Convertir la fecha a formato dd-MM-yyyy
                                    if (valorAtributo instanceof Date) {
                                        valorAtributo = UtilidadFechas.formatearFecha((Date) valorAtributo);
                                    }
                        %>
                        <!-- Mostrar el valor del atributo en la celda -->
                        <td><%= (valorAtributo != null) ? valorAtributo : "No hay información"%></td>
                        <% }
                            } %>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <%
            } else {
            %>
            <!-- Mensaje si no hay elementos para mostrar -->
            <p>No hay elementos disponibles para mostrar.</p>
            <%
                }
            %>
        </div>

        <button onclick="document.location.href = 'index.jsp'">Volver a la página anterior</button>

    </body>
</html>
