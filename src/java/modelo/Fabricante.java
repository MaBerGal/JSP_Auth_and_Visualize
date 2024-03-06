
package modelo;

import java.io.Serializable;

// Clase relativa a la tabla Fabricante (modelo JavaBeans)
public class Fabricante implements Serializable {
    
    private static final long serialVersionUID = 4L;
    private int codigo;
    private String nombre;
    private String sede;
    private String foto;
    
    public Fabricante() {

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
