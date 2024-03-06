
package modelo;

import java.io.Serializable;

// Clase relativa a la tabla Banda (modelo JavaBeans)
public class Banda implements Serializable {

    private static final long serialVersionUID = 1L;
    private int codigo;
    private String nombre;
    private String genero;
    private String foto;

    public Banda() {

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

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

}
