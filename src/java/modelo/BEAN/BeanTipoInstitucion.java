package modelo.BEAN;

/**
 *
 * Esta clase hace parte del modelo de la base de datos 'TipoInstitucion'
 *
 * @author David
 * @version: 10/03/2017/A
 *
 */
public class BeanTipoInstitucion {

    /**
     * Atributos usados en el modelo de la base de datos
     */
    private int idTipo_institucion;
    private String Nombre_tipo_institucion;
    private String Descripcion_tipo_institucion;

    /**
     * Constructor sin parametros
     *
     */
    public BeanTipoInstitucion() {
    }

    /**
     * @param idTipo_institucion
     * @param Nombre_tipo_institucion
     * @param Descripcion_tipo_institucion
     */
    public BeanTipoInstitucion(int idTipo_institucion, String Nombre_tipo_institucion, String Descripcion_tipo_institucion) {
        this.idTipo_institucion = idTipo_institucion;
        this.Nombre_tipo_institucion = Nombre_tipo_institucion;
        this.Descripcion_tipo_institucion = Descripcion_tipo_institucion;
    }

    /**
     * Encapsulacion de los atributos
     */
    
    /**
     *
     * @return tipo de institucion
     */
    public int getIdTipo_institucion() {
        return idTipo_institucion;
    }

    /**
     * @param idTipo_institucion
     */
    public void setIdTipo_institucion(int idTipo_institucion) {
        this.idTipo_institucion = idTipo_institucion;
    }

    /**
     *
     * @return Nombre_tipo_institucion
     */
    public String getNombre_tipo_institucions() {
        return Nombre_tipo_institucion;
    }

    /**
     *
     * @param Nombre_tipo_institucion
     */
    public void setNombre_tipo_institucions(String Nombre_tipo_institucion) {
        this.Nombre_tipo_institucion = Nombre_tipo_institucion;
    }

    /**
     *
     * @return Descripcion_tipo_institucion
     */
    public String getDescripcion_tipo_institucion() {
        return Descripcion_tipo_institucion;
    }

    /**
     *
     * @param Descripcion_tipo_institucion
     */
    public void setDescripcion_tipo_institucion(String Descripcion_tipo_institucion) {
        this.Descripcion_tipo_institucion = Descripcion_tipo_institucion;
    }

}
