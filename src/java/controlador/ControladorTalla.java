package controlador;

import java.util.ArrayList;
import modelo.BEAN.BeanTalla;
import modelo.DAO.DaoTalla;

/**
 *
 * @author David
 */
public class ControladorTalla {

    private String tallas = "";

    public String getTallas() {

        BeanTalla beanTalla = new BeanTalla();
        DaoTalla daoTalla = new DaoTalla();

        ArrayList<BeanTalla> listaTallas = daoTalla.listarTodasLasTallas();

        for (BeanTalla beanTall : listaTallas) {
            tallas += "<option value=\"" + beanTall.getIdTalla() + "\">" + beanTall.getTalla_nombre() + "</option>";
        }

        return tallas;
    }

}
