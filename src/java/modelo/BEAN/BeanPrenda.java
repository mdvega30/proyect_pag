package modelo.BEAN;

/**
 *
 * @author David
 */
public class BeanPrenda {

    private int idPrenda;
    private String Nombre_Prenda;
    private String Descripcion_prenda;
    private String Url_Diseño;
    private int uniforme_idUniforme;
    private int idTalla;
    private String Nombre_Uniforme;
    private String Talla_nombre;
    private double precioPrenda;

    public BeanPrenda() {
    }

    public BeanPrenda(int idPrenda, String Nombre_Prenda, String Descripcion_prenda, String Url_Diseño, int uniforme_idUniforme, int idTalla, String Nombre_Uniforme, String Talla_nombre, double precioPrenda) {
        this.idPrenda = idPrenda;
        this.Nombre_Prenda = Nombre_Prenda;
        this.Descripcion_prenda = Descripcion_prenda;
        this.Url_Diseño = Url_Diseño;
        this.uniforme_idUniforme = uniforme_idUniforme;
        this.idTalla = idTalla;
        this.Nombre_Uniforme = Nombre_Uniforme;
        this.Talla_nombre = Talla_nombre;
        this.precioPrenda = precioPrenda;
    }

    public double getPrecioPrenda() {
        return precioPrenda;
    }

    public void setPrecioPrenda(double precioPrenda) {
        this.precioPrenda = precioPrenda;
    }

    public int getIdPrenda() {
        return idPrenda;
    }

    public void setIdPrenda(int idPrenda) {
        this.idPrenda = idPrenda;
    }

    public String getNombre_Prenda() {
        return Nombre_Prenda;
    }

    public void setNombre_Prenda(String Nombre_Prenda) {
        this.Nombre_Prenda = Nombre_Prenda;
    }

    public String getDescripcion_prenda() {
        return Descripcion_prenda;
    }

    public void setDescripcion_prenda(String Descripcion_prenda) {
        this.Descripcion_prenda = Descripcion_prenda;
    }

    public String getUrl_Diseño() {
        return Url_Diseño;
    }

    public void setUrl_Diseño(String Url_Diseño) {
        this.Url_Diseño = Url_Diseño;
    }

    public int getUniforme_idUniforme() {
        return uniforme_idUniforme;
    }

    public void setUniforme_idUniforme(int uniforme_idUniforme) {
        this.uniforme_idUniforme = uniforme_idUniforme;
    }

    public int getIdTalla() {
        return idTalla;
    }

    public void setIdTalla(int idTalla) {
        this.idTalla = idTalla;
    }

    public String getNombre_Uniforme() {
        return Nombre_Uniforme;
    }

    public void setNombre_Uniforme(String Nombre_Uniforme) {
        this.Nombre_Uniforme = Nombre_Uniforme;
    }

    public String getTalla_nombre() {
        return Talla_nombre;
    }

    public void setTalla_nombre(String Talla_nombre) {
        this.Talla_nombre = Talla_nombre;
    }
}
