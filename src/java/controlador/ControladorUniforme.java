/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import modelo.BEAN.BeanUniforme;
import modelo.DAO.DaoUniforme;

/**
 *
 * @author David
 */
public class ControladorUniforme {

    private String uniforme = "";

    public String getUniformes() {
        DaoUniforme daoUniforme = new DaoUniforme();

        ArrayList<BeanUniforme> listaUnforme = daoUniforme.listarTodosLosUniformes();

        for (BeanUniforme beanUni : listaUnforme) {

            uniforme += "<option value=\"" + beanUni.getId_uniforme() + "\">" + beanUni.getNombre_uniforme() + "</option>";

        }

        return uniforme;
    }

}
