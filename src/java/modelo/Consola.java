
package modelo;

import java.util.Date;

import java.io.Serializable;

// Clase relativa a la tabla Consola (modelo JavaBeans)
public class Consola implements Serializable {
    
    private static final long serialVersionUID = 2L;
    private int codigo;
    private String nombre;
    private Fabricante fabricante;
    private Date lanzamiento;
    private String foto;

    public Consola() {

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

    public Fabricante getFabricante() {
        return fabricante;
    }

    public void setFabricante(Fabricante fabricante) {
        this.fabricante = fabricante;
    }

    public Date getLanzamiento() {
        return lanzamiento;
    }

    public void setLanzamiento(Date lanzamiento) {
        this.lanzamiento = lanzamiento;
    }
    
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
}

