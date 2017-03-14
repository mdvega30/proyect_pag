package modelo.BEAN;

public class BeanUniforme extends BeanTipoUniforme {

    private int id_uniforme;
    private String nombre_uniforme;
    private String descripcion_uniforme;
    private String url_diseño_Uniforme;
    private double precio;
    private boolean estadoUniforme;
    private int id_tipoUniforme;
    private String nombreTipo;
    private int institucion_idInstitucion;

    private String Nombre_tipo_institucion;

    public BeanUniforme(int id_uniforme, String nombre_uniforme, String descripcion_uniforme, String url_diseño_Uniforme, double precio, boolean estadoUniforme, int id_tipoUniforme, String nombreTipo, int institucion_idInstitucion, String Nombre_tipo_institucion) {
        this.id_uniforme = id_uniforme;
        this.nombre_uniforme = nombre_uniforme;
        this.descripcion_uniforme = descripcion_uniforme;
        this.url_diseño_Uniforme = url_diseño_Uniforme;
        this.precio = precio;
        this.estadoUniforme = estadoUniforme;
        this.id_tipoUniforme = id_tipoUniforme;
        this.nombreTipo = nombreTipo;
        this.institucion_idInstitucion = institucion_idInstitucion;
        this.Nombre_tipo_institucion = Nombre_tipo_institucion;
    }

    public BeanUniforme() {
    }

    public int getId_uniforme() {
        return id_uniforme;
    }

    public void setId_uniforme(int id_uniforme) {
        this.id_uniforme = id_uniforme;
    }

    public String getNombre_uniforme() {
        return nombre_uniforme;
    }

    public void setNombre_uniforme(String nombre_uniforme) {
        this.nombre_uniforme = nombre_uniforme;
    }

    public String getDescripcion_uniforme() {
        return descripcion_uniforme;
    }

    public void setDescripcion_uniforme(String descripcion_uniforme) {
        this.descripcion_uniforme = descripcion_uniforme;
    }

    public String getUrl_diseño_Uniforme() {
        return url_diseño_Uniforme;
    }

    public void setUrl_diseño_Uniforme(String url_diseño_Uniforme) {
        this.url_diseño_Uniforme = url_diseño_Uniforme;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isEstadoUniforme() {
        return estadoUniforme;
    }

    public void setEstadoUniforme(boolean estadoUniforme) {
        this.estadoUniforme = estadoUniforme;
    }

    public int getId_tipoUniforme() {
        return id_tipoUniforme;
    }

    public void setId_tipoUniforme(int id_tipoUniforme) {
        this.id_tipoUniforme = id_tipoUniforme;
    }

    public String getNombreTipo() {
        return nombreTipo;
    }

    public void setNombreTipo(String nombreTipo) {
        this.nombreTipo = nombreTipo;
    }

    public int getInstitucion_idInstitucion() {
        return institucion_idInstitucion;
    }

    public void setInstitucion_idInstitucion(int institucion_idInstitucion) {
        this.institucion_idInstitucion = institucion_idInstitucion;
    }

    public String getNombre_tipo_institucion() {
        return Nombre_tipo_institucion;
    }

    public void setNombre_tipo_institucion(String Nombre_tipo_institucion) {
        this.Nombre_tipo_institucion = Nombre_tipo_institucion;
    }
}
