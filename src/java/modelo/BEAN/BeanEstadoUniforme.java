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
public class BeanEstadoUniforme {

   private int idEstadoUniforme;
   private String Nombre_estado;

    public BeanEstadoUniforme() {
    }

    public BeanEstadoUniforme(int idEstadoUniforme, String Nombre_estado) {
        this.idEstadoUniforme = idEstadoUniforme;
        this.Nombre_estado = Nombre_estado;
    }
   
   
    public int getIdEstadoUniforme() {
        return idEstadoUniforme;
    }

    public void setIdEstadoUniforme(int idEstadoUniforme) {
        this.idEstadoUniforme = idEstadoUniforme;
    }

    public String getNombre_estado() {
        return Nombre_estado;
    }

    public void setNombre_estado(String Nombre_estado) {
        this.Nombre_estado = Nombre_estado;
    }
   
}
