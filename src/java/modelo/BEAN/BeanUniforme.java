package modelo.BEAN;

public class BeanUniforme {
    
    private int id_tipoUniforme;
    private String nombreTipoUniforme;

    public BeanUniforme() {
        
    }

    public BeanUniforme(int id_tipoUniforme, String nombreTipoUniforme) {
        this.id_tipoUniforme = id_tipoUniforme;
        this.nombreTipoUniforme = nombreTipoUniforme;
    }
    
    public int getId_tipoUniforme() {
        return id_tipoUniforme;
    }

    public void setId_tipoUniforme(int id_tipoUniforme) {
        this.id_tipoUniforme = id_tipoUniforme;
    }

    public String getNombreTipoUniforme() {
        return nombreTipoUniforme;
    }

    public void setNombreTipoUniforme(String nombreTipoUniforme) {
        this.nombreTipoUniforme = nombreTipoUniforme;
    }



   
}
