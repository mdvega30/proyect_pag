/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import modelo.BEAN.BeanInstitucion;
import modelo.BEAN.BeanTipoInstitucion;

import modelo.DAO.DaoTipoInstitucion;

/**
 *
 * @author David
 */
public class ControladorTipoInstitucion {

    private String tipoInstitucion = "";

    public String getTipoIntitucion(BeanInstitucion bnInstittucion) {

        DaoTipoInstitucion daoTipoInstitucion = new DaoTipoInstitucion();
        BeanTipoInstitucion bnTipoIntitucion = new BeanTipoInstitucion();
        ArrayList<BeanTipoInstitucion> listaTipoInst = daoTipoInstitucion.listarTodosTiposDeInstitucion();

        for (BeanTipoInstitucion bnTipoIns : listaTipoInst) {
            if (bnInstittucion.getId_tipoInstitucion() == bnTipoIns.getIdTipo_institucion()) {

                tipoInstitucion += "<option selected value=\"" + bnTipoIns.getIdTipo_institucion() + "\">" + bnTipoIns.getNombre_tipo_institucions() + "</option>";
            } else {

                tipoInstitucion += "<option value=\"" + bnTipoIns.getIdTipo_institucion() + "\">" + bnTipoIns.getNombre_tipo_institucions() + "</option>";
            }
        }

        return tipoInstitucion;
    }
}
