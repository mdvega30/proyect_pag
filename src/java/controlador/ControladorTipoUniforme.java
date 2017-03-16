/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import modelo.BEAN.BeanTipoUniforme;
import modelo.BEAN.BeanUniforme;
import modelo.DAO.DaoTipoUniforme;

/**
 *
 * @author David
 */
public class ControladorTipoUniforme {

    private String tipoUniforme = "";

    public String getTipoUniforme(BeanUniforme bnUniforme) {
        DaoTipoUniforme daoTipoUniforme = new DaoTipoUniforme();
        ArrayList<BeanTipoUniforme> listaTipoUniforme = daoTipoUniforme.listarTodosTiposDeUniforme();
        for (BeanTipoUniforme bnTipoU : listaTipoUniforme) {
            if (bnUniforme.getId_tipoUniforme() == bnTipoU.getId_tipo_uniforme()) {
                tipoUniforme += "<option selected value=\"" + bnTipoU.getId_tipo_uniforme() + "\">" + bnTipoU.getNombre_tipo_uniforme() + "</option>";

            } else {
                tipoUniforme += "<option value=\"" + bnTipoU.getId_tipo_uniforme() + "\">" + bnTipoU.getNombre_tipo_uniforme() + "</option>";

            }

        }

        return tipoUniforme;
    }

}
