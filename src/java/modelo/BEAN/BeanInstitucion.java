
package modelo.BEAN;

public class BeanInstitucion {
    
    private int id_institucion;
    private String nombre_intitucion;
    private String descripcion_institucion;
    private String url_logo_institucion;
    private int id_tipoInstitucion;
    
    public BeanInstitucion(){
        
    }

    public BeanInstitucion(int id_institucion, String nombre_intitucion, String descripcion_institucion, String url_logo_institucion, int id_tipoInstitucion) {
        this.id_institucion = id_institucion;
        this.nombre_intitucion = nombre_intitucion;
        this.descripcion_institucion = descripcion_institucion;
        this.url_logo_institucion = url_logo_institucion;
        this.id_tipoInstitucion = id_tipoInstitucion;
    }

    public int getId_institucion() {
        return id_institucion;
    }

    public void setId_institucion(int id_institucion) {
        this.id_institucion = id_institucion;
    }

    public String getNombre_intitucion() {
        return nombre_intitucion;
    }

    public void setNombre_intitucion(String nombre_intitucion) {
        this.nombre_intitucion = nombre_intitucion;
    }

    public String getDescripcion_institucion() {
        return descripcion_institucion;
    }

    public void setDescripcion_institucion(String descripcion_institucion) {
        this.descripcion_institucion = descripcion_institucion;
    }

    public String getUrl_logo_institucion() {
        return url_logo_institucion;
    }

    public void setUrl_logo_institucion(String url_logo_institucion) {
        this.url_logo_institucion = url_logo_institucion;
    }

    public int getId_tipoInstitucion() {
        return id_tipoInstitucion;
    }

    public void setId_tipoInstitucion(int id_tipoInstitucion) {
        this.id_tipoInstitucion = id_tipoInstitucion;
    }
    
    
    
    
    
}
