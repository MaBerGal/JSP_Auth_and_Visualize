package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import modelo.*;

public class GestorConsultas {

    public static List<Desarrollador> obtenerDesarrolladores() {
        List<Desarrollador> desarrolladores = new ArrayList<>();
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Desarrollador");
                ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int codigo = resultSet.getInt("codigo");
                String nombre = resultSet.getString("nombre");
                String sede = resultSet.getString("sede");
                String foto = resultSet.getString("foto");

                Desarrollador desarrollador = new Desarrollador();
                desarrollador.setCodigo(codigo);
                desarrollador.setNombre(nombre);
                desarrollador.setSede(sede);
                desarrollador.setFoto(foto);
                desarrolladores.add(desarrollador);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return desarrolladores;
    }

    public static List<Banda> obtenerBandas() {
        List<Banda> bandas = new ArrayList<>();
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Banda");
                ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int codigo = resultSet.getInt("codigo");
                String nombre = resultSet.getString("nombre");
                String genero = resultSet.getString("genero");
                String foto = resultSet.getString("foto");

                Banda banda = new Banda();
                banda.setCodigo(codigo);
                banda.setNombre(nombre);
                banda.setGenero(genero);
                banda.setFoto(foto);
                bandas.add(banda);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bandas;
    }

    public static List<Fabricante> obtenerFabricantes() {
        List<Fabricante> fabricantes = new ArrayList<>();
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Fabricante");
                ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int codigo = resultSet.getInt("codigo");
                String nombre = resultSet.getString("nombre");
                String sede = resultSet.getString("sede");
                String foto = resultSet.getString("foto");

                Fabricante fabricante = new Fabricante();
                fabricante.setCodigo(codigo);
                fabricante.setNombre(nombre);
                fabricante.setSede(sede);
                fabricante.setFoto(foto);
                fabricantes.add(fabricante);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fabricantes;
    }

    public static List<Consola> obtenerConsolas() {
        List<Consola> consolas = new ArrayList<>();
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Consolas");
                ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int codigo = resultSet.getInt("codigo");
                String nombre = resultSet.getString("nombre");
                int fabricanteCodigo = resultSet.getInt("fabricanteCodigo");
                String foto = resultSet.getString("foto");

                // Utiliza lanzamientoStr directamente, sin convertir a Date
                String lanzamientoStr = resultSet.getString("lanzamiento");

                Fabricante fabricante = obtenerFabricantePorCodigo(fabricanteCodigo);

                // Si lanzamientoStr es null, lanzamiento será null
                Date lanzamiento = (lanzamientoStr != null) ? UtilidadFechas.convertirFecha(lanzamientoStr) : null;

                Consola consola = new Consola();
                consola.setCodigo(codigo);
                consola.setNombre(nombre);
                consola.setFabricante(fabricante);
                consola.setLanzamiento(lanzamiento);
                consola.setFoto(foto);
                consolas.add(consola);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return consolas;
    }

    public static List<Juego> obtenerJuegos() {
        List<Juego> juegos = new ArrayList<>();
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Juego");
                ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int codigo = resultSet.getInt("codigo");
                String titulo = resultSet.getString("titulo");
                String genero = resultSet.getString("genero");
                int desarrolladorCodigo = resultSet.getInt("desarrolladorCodigo");
                int consolaCodigo = resultSet.getInt("consolaCodigo");
                int bandaCodigo = resultSet.getInt("bandaCodigo");
                String foto = resultSet.getString("foto");

                Desarrollador desarrollador = obtenerDesarrolladorPorCodigo(desarrolladorCodigo);
                Consola consola = obtenerConsolaPorCodigo(consolaCodigo);
                Banda banda = obtenerBandaPorCodigo(bandaCodigo);

                Juego juego = new Juego();
                juego.setCodigo(codigo);
                juego.setTitulo(titulo);
                juego.setGenero(genero);
                juego.setDesarrollador(desarrollador);
                juego.setConsola(consola);
                juego.setBanda(banda);
                juego.setFoto(foto);
                juegos.add(juego);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return juegos;
    }

    public static List<Jugador> obtenerJugadores() {
        List<Jugador> jugadores = new ArrayList<>();
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Jugador");
                ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int codigo = resultSet.getInt("codigo");
                String nombre = resultSet.getString("nombre");
                int edad = resultSet.getInt("edad");
                int consolaCodigo = resultSet.getInt("consolaCodigo");
                String foto = resultSet.getString("foto");

                Consola consola = obtenerConsolaPorCodigo(consolaCodigo);

                Jugador jugador = new Jugador();
                jugador.setCodigo(codigo);
                jugador.setNombre(nombre);
                jugador.setEdad(edad);
                jugador.setConsola(consola);
                jugador.setFoto(foto);
                jugadores.add(jugador);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jugadores;
    }

    private static Desarrollador obtenerDesarrolladorPorCodigo(int codigo) {
        Desarrollador desarrollador = null;
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Desarrollador WHERE codigo = ?")) {
            statement.setInt(1, codigo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    String sede = resultSet.getString("sede");
                    String foto = resultSet.getString("foto");

                    desarrollador = new Desarrollador();
                    desarrollador.setCodigo(codigo);
                    desarrollador.setNombre(nombre);
                    desarrollador.setSede(sede);
                    desarrollador.setFoto(foto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return desarrollador;
    }

    private static Banda obtenerBandaPorCodigo(int codigo) {
        Banda banda = null;
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Banda WHERE codigo = ?")) {
            statement.setInt(1, codigo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    String genero = resultSet.getString("genero");
                    String foto = resultSet.getString("foto");

                    banda = new Banda();
                    banda.setCodigo(codigo);
                    banda.setNombre(nombre);
                    banda.setGenero(genero);
                    banda.setFoto(foto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return banda;
    }

    private static Fabricante obtenerFabricantePorCodigo(int codigo) {
        Fabricante fabricante = null;
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Fabricante WHERE codigo = ?")) {
            statement.setInt(1, codigo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    String sede = resultSet.getString("sede");
                    String foto = resultSet.getString("foto");

                    fabricante = new Fabricante();
                    fabricante.setCodigo(codigo);
                    fabricante.setNombre(nombre);
                    fabricante.setSede(sede);
                    fabricante.setFoto(foto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fabricante;
    }

    private static Consola obtenerConsolaPorCodigo(int codigo) {
        Consola consola = null;
        try (Connection conexion = ConexionBD.obtenerConexion();
                PreparedStatement statement = conexion.prepareStatement("SELECT * FROM Consolas WHERE codigo = ?")) {
            statement.setInt(1, codigo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    int fabricanteCodigo = resultSet.getInt("fabricanteCodigo");
                    // Utiliza lanzamientoStr directamente, sin convertir a Date
                    String lanzamientoStr = resultSet.getString("lanzamiento");
                    String foto = resultSet.getString("foto");

                    // Si lanzamientoStr es null, lanzamiento será null
                    Date lanzamiento = (lanzamientoStr != null) ? UtilidadFechas.convertirFecha(lanzamientoStr) : null;

                    Fabricante fabricante = obtenerFabricantePorCodigo(fabricanteCodigo);

                    consola = new Consola();
                    consola.setCodigo(codigo);
                    consola.setNombre(nombre);
                    consola.setFabricante(fabricante);
                    consola.setLanzamiento(lanzamiento);
                    consola.setFoto(foto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return consola;
    }

}
