
package modelo;

import java.io.Serializable;

// Clase relativa a la tabla Jugador (modelo JavaBeans)
public class Jugador implements Serializable {
    
    private static final long serialVersionUID = 6L;
    private int codigo;
    private String nombre;
    private int edad;
    private Consola consola;
    private String foto;
    
    public Jugador() {

    }

    // Getters y setters

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public Consola getConsola() {
        return consola;
    }

    public void setConsola(Consola consola) {
        this.consola = consola;
    }
    
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
}
