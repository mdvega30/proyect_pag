/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.BEAN;

/**
 *
 * @author David
 */
public class BeanTalla {

    private int idTalla;
    private String Precio_talla;
    private String Talla_nombre;

    public BeanTalla() {
    }

    public BeanTalla(int idTalla, String Precio_talla, String Talla_nombre) {
        this.idTalla = idTalla;
        this.Precio_talla = Precio_talla;
        this.Talla_nombre = Talla_nombre;
    }

    public int getIdTalla() {
        return idTalla;
    }

    public void setIdTalla(int idTalla) {
        this.idTalla = idTalla;
    }

    public String getPrecio_talla() {
        return Precio_talla;
    }

    public void setPrecio_talla(String Precio_talla) {
        this.Precio_talla = Precio_talla;
    }

    public String getTalla_nombre() {
        return Talla_nombre;
    }

    public void setTalla_nombre(String Talla_nombre) {
        this.Talla_nombre = Talla_nombre;
    }

}
