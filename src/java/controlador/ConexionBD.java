package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private static final String URL = "jdbc:derby://localhost:1527/Practica9BD";
    private static final String USUARIO = "usuario";
    private static final String CONTRASENA = "usuario";

    public static Connection obtenerConexion() {
        Connection conexion = null;
        try {
            // Cargar el controlador JDBC
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            // Establecer la conexión a la base de datos
            conexion = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
            
            // Testing
            System.out.println("Conexión establecida");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conexion;
    }

    public static void cerrarConexion(Connection conexion) {
        try {
            if (conexion != null && !conexion.isClosed()) {
                conexion.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
