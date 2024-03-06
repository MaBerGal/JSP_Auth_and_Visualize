
package modelo;

import java.io.Serializable;

// Clase relativa a la tabla Desarrollador (modelo JavaBeans)
public class Desarrollador implements Serializable {

    private static final long serialVersionUID = 3L;
    private int codigo;
    private String nombre;
    private String sede;
    private String foto;

    public Desarrollador() {

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

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }
    
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
}

