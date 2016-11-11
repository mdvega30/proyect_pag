package modelo.BEAN;

public class BeanUniforme {
    
   private int id_uniforme;
   private String nombre_uniforme;
   private String descripcion_uniforme;
   private String url_diseño_Uniforme;
   private int id_tipoUniforme;

    public BeanUniforme() {
    }

    public BeanUniforme(int id_uniforme, String nombre_uniforme, String descripcion_uniforme, String url_diseño_Uniforme, int id_tipoUniforme) {
        this.id_uniforme = id_uniforme;
        this.nombre_uniforme = nombre_uniforme;
        this.descripcion_uniforme = descripcion_uniforme;
        this.url_diseño_Uniforme = url_diseño_Uniforme;
        this.id_tipoUniforme = id_tipoUniforme;
    }

    public int getId_uniforme() {
        return id_uniforme;
    }

    public String getNombre_uniforme() {
        return nombre_uniforme;
    }

    public String getDescripcion_uniforme() {
        return descripcion_uniforme;
    }

    public String getUrl_diseño_Uniforme() {
        return url_diseño_Uniforme;
    }

    public int getId_tipoUniforme() {
        return id_tipoUniforme;
    }
   
   



   
}
