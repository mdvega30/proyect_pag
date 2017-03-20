package controlador;


import java.util.ArrayList;
import modelo.BEAN.BeanInstitucion;
import modelo.BEAN.BeanUniforme;
import modelo.DAO.DaoInstitucion;

/**
 *
 * @author David
 */
public class ControladorInstitucion {

    private String opcInstitucion = "";

    public String getInstitucion(BeanUniforme bnUniforme) {

        BeanInstitucion beanInstitucion = new BeanInstitucion();
        DaoInstitucion daoInstitucion = new DaoInstitucion();
        ArrayList<BeanInstitucion> listaInstitucion = daoInstitucion.listarInstitucion(0, 20);

        for (BeanInstitucion beanInsti : listaInstitucion) {
            if (bnUniforme.getInstitucion_idInstitucion() == beanInsti.getId_institucion()) {

                opcInstitucion += "<option selected=\"" + beanInsti.getId_institucion() + "\" value=\"" + beanInsti.getId_institucion() + "\">" + beanInsti.getNombre_intitucion() + "</option>";

            } else {

                opcInstitucion += "<option value=\"" + beanInsti.getId_institucion() + "\">" + beanInsti.getNombre_intitucion() + "</option>";
            }

        }

        return opcInstitucion;
    }

}
