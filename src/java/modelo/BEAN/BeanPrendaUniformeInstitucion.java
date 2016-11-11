
package modelo.BEAN;


public class BeanPrendaUniformeInstitucion {
   
   private int id_prenda_uniformeInstitucion;
   private int prenda_idPrenda;
   private int institucion_idInstitucion;
   private int institucion_idTipoInstitucion;
   private int uniforme_idUniforme;
   private int uniforme_idTipoUniforme;

    public BeanPrendaUniformeInstitucion() {
    }

    public BeanPrendaUniformeInstitucion(int id_prenda_uniformeInstitucion, int institucion_idInstitucion, int institucion_idTipoInstitucion, int uniforme_idUniforme, int uniforme_idTipoUniforme) {
        this.id_prenda_uniformeInstitucion = id_prenda_uniformeInstitucion;
        this.institucion_idInstitucion = institucion_idInstitucion;
        this.institucion_idTipoInstitucion = institucion_idTipoInstitucion;
        this.uniforme_idUniforme = uniforme_idUniforme;
        this.uniforme_idTipoUniforme = uniforme_idTipoUniforme;
    }

    public int getId_prenda_uniformeInstitucion() {
        return id_prenda_uniformeInstitucion;
    }

    public void setId_prenda_uniformeInstitucion(int id_prenda_uniformeInstitucion) {
        this.id_prenda_uniformeInstitucion = id_prenda_uniformeInstitucion;
    }

    public int getPrenda_idPrenda() {
        return prenda_idPrenda;
    }

    public void setPrenda_idPrenda(int prenda_idPrenda) {
        this.prenda_idPrenda = prenda_idPrenda;
    }

    public int getInstitucion_idInstitucion() {
        return institucion_idInstitucion;
    }

    public void setInstitucion_idInstitucion(int institucion_idInstitucion) {
        this.institucion_idInstitucion = institucion_idInstitucion;
    }

    public int getInstitucion_idTipoInstitucion() {
        return institucion_idTipoInstitucion;
    }

    public void setInstitucion_idTipoInstitucion(int institucion_idTipoInstitucion) {
        this.institucion_idTipoInstitucion = institucion_idTipoInstitucion;
    }

    public int getUniforme_idUniforme() {
        return uniforme_idUniforme;
    }

    public void setUniforme_idUniforme(int uniforme_idUniforme) {
        this.uniforme_idUniforme = uniforme_idUniforme;
    }

    public int getUniforme_idTipoUniforme() {
        return uniforme_idTipoUniforme;
    }

    public void setUniforme_idTipoUniforme(int uniforme_idTipoUniforme) {
        this.uniforme_idTipoUniforme = uniforme_idTipoUniforme;
    }
   
   
   
   
    
    
}
