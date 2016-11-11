
package modelo.BEAN;


public class BeanTipoUniforme {
    
    private int id_tipo_uniforme;
    private String nombre_tipo_uniforme;
    private String descripcion_uniforme;

    public BeanTipoUniforme() {
    }

    public BeanTipoUniforme(int id_tipo_uniforme, String nombre_tipo_uniforme, String descripcion_uniforme) {
        this.id_tipo_uniforme = id_tipo_uniforme;
        this.nombre_tipo_uniforme = nombre_tipo_uniforme;
        this.descripcion_uniforme = descripcion_uniforme;
    }

    public int getId_tipo_uniforme() {
        return id_tipo_uniforme;
    }

    public void setId_tipo_uniforme(int id_tipo_uniforme) {
        this.id_tipo_uniforme = id_tipo_uniforme;
    }

    public String getNombre_tipo_uniforme() {
        return nombre_tipo_uniforme;
    }

    public void setNombre_tipo_uniforme(String nombre_tipo_uniforme) {
        this.nombre_tipo_uniforme = nombre_tipo_uniforme;
    }

    public String getDescripcion_uniforme() {
        return descripcion_uniforme;
    }

    public void setDescripcion_uniforme(String descripcion_uniforme) {
        this.descripcion_uniforme = descripcion_uniforme;
    }
    
    
    
    
}
