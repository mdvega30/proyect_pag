package controlador;

import java.util.ArrayList;
import modelo.BEAN.BeanPrenda;
import modelo.BEAN.BeanTalla;
import modelo.DAO.DaoTalla;

/**
 *
 * @author David
 */
public class ControladorTalla {

    private String tallas = "";
    private String tallasPorPrenda = "";
    private String tallasAll = "";

    public ControladorTalla() {
        tallas = "";
        tallasPorPrenda = "";
    }

    BeanTalla beanTalla = new BeanTalla();
    DaoTalla daoTalla = new DaoTalla();

    /**
     * Lista todas la tallas que hay en la base de datos
     *
     * @return
     */
    public String getTallas() {

        /*Aray todas las */
        ArrayList<BeanTalla> listaTallas = daoTalla.listarTodasLasTallas();

        for (BeanTalla beanTall : listaTallas) {

            tallas += "<option value=\"" + beanTall.getIdTalla() + "\">" + beanTall.getTalla_nombre() + "</option>";
        }

        return tallas;
    }

    /**
     * Lista todas las tallas de cada prenda
     *
     * @param bnPrenda
     * @return
     */
    public String getTallasPorPrenda(BeanPrenda bnPrenda) {
        ArrayList<BeanTalla> listaTallas = new ArrayList<>();
        listaTallas.clear();
        tallasPorPrenda = "";
        listaTallas = daoTalla.listarTallasPorPrenda(bnPrenda);
        for (BeanTalla listaTalla : listaTallas) {

            tallasPorPrenda += "<option value=\"" + listaTalla.getIdTalla() + "\">" + listaTalla.getTalla_nombre() + "</option>";
        }

        return tallasPorPrenda;

    }

    public String getTallasPorPrendaAllTallas(BeanPrenda bnPrenda) {
        ArrayList<BeanTalla> listaTodasLasTallas = daoTalla.listarTallasPorPrenda(bnPrenda);
        ArrayList<BeanTalla> listaTallass = daoTalla.listarTodasLasTallas();
        for (BeanTalla listaTalla : listaTallass) {
            if (inArrayList(listaTodasLasTallas, listaTalla.getIdTalla())) {
                tallasAll += "<option value=\"" + listaTalla.getIdTalla() + "\" selected>" + listaTalla.getTalla_nombre() + "</option>";
            } else {
                tallasAll += "<option value=\"" + listaTalla.getIdTalla() + "\">" + listaTalla.getTalla_nombre() + "</option>";
            }
        }

        return tallasAll;
    }

    public boolean inArrayList(ArrayList<BeanTalla> myArrayList, int Id) {
        boolean isMySize = false;
        for (BeanTalla arrayList : myArrayList) {
            if (arrayList.getIdTalla() == Id) {
                isMySize = true;
                break;
            }
        }
        return isMySize;
    }

}
