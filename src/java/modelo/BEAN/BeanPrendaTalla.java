package modelo.BEAN;

/**
 *
 * @author David
 */
public class BeanPrendaTalla {

    private int id_prenda_talla;
    private int prenda_idPrenda;
    private int talla_idTalla;

    public BeanPrendaTalla() {
    }

    public BeanPrendaTalla(int id_prenda_talla, int prenda_idPrenda, int talla_idTalla) {
        this.id_prenda_talla = id_prenda_talla;
        this.prenda_idPrenda = prenda_idPrenda;
        this.talla_idTalla = talla_idTalla;
    }

    public int getId_prenda_talla() {
        return id_prenda_talla;
    }

    public void setId_prenda_talla(int id_prenda_talla) {
        this.id_prenda_talla = id_prenda_talla;
    }

    public int getPrenda_idPrenda() {
        return prenda_idPrenda;
    }

    public void setPrenda_idPrenda(int prenda_idPrenda) {
        this.prenda_idPrenda = prenda_idPrenda;
    }

    public int getTalla_idTalla() {
        return talla_idTalla;
    }

    public void setTalla_idTalla(int talla_idTalla) {
        this.talla_idTalla = talla_idTalla;
    }

}
