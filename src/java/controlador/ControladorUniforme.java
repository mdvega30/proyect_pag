/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import modelo.BEAN.BeanPrenda;
import modelo.BEAN.BeanUniforme;
import modelo.DAO.DaoUniforme;

/**
 *
 * @author David
 */
public class ControladorUniforme {

    private String uniforme = "";
    private String listaUnfiormes = "";
    private static DaoUniforme daoUniforme = new DaoUniforme();

    /**
     * Metodo que lista todos los uniformes en el formulario addPrenda.jsp
     *
     * @param bnPrenda
     * @return String
     */
    public String getUniformes(BeanPrenda bnPrenda) {

        ArrayList<BeanUniforme> listaUnforme = daoUniforme.listarTodosLosUniformes();

        String intitucionActual = "";
        for (BeanUniforme beanUni : listaUnforme) {
            /**
             * if que funciona para hacer los grupos de las intituciones
             */
            if (!beanUni.getNombre_tipo_institucion().equals(intitucionActual) || intitucionActual.isEmpty()) {
                uniforme += "</optgroup>";
                uniforme += "<optgroup label=\"" + beanUni.getNombre_tipo_institucion() + " \" value=\"\"></option>";
                /**
                 * else if que sirve para seleccionar el item seleccionado
                 * editar Prenda
                 */
            } else if (bnPrenda.getUniforme_idUniforme() == beanUni.getId_uniforme()) {
                uniforme += "<option selected value=\"" + beanUni.getId_uniforme() + "\">" + beanUni.getNombre_uniforme() + "</option>";

            }
            intitucionActual = beanUni.getNombre_tipo_institucion();
            uniforme += "<option value=\"" + beanUni.getId_uniforme() + "\">" + beanUni.getNombre_uniforme() + "</option>";

        }

        return uniforme;
    }

    public String getListaUniformes(int pagina, int numeroRegistros) {

        ArrayList<BeanUniforme> listaUniformesVista = daoUniforme.listarUniforme(pagina * 10, 10);
        int cont = pagina*10;
        for (BeanUniforme beanUnforme : listaUniformesVista) {

            listaUnfiormes += "<tr> \n"
                    + "\n"
                    + "\n"
                    + "                                                                <td>" + (cont + 1) + "</td>\n"
                    + "                                                                <td>" + beanUnforme.getNombre_uniforme() + "</td>\n"
                    + "                                                                <td class=\"imgt\" >" + beanUnforme.getNombreTipoUniforme() + "</td>\n"
                    + "                                                                <td class=\"\" >" + beanUnforme.getNombre_tipo_institucion() + "</td>\n"
                    + "                                                                <td>$" + String.format("%1$,.0f", beanUnforme.getPrecio()) + "</td> \n"
                    + "                                                                <td><img class=\"imgl\" src=\"images/" + beanUnforme.getUrl_diseño_Uniforme() + "\" alt=\"\"/></td>\n"
                    + "                                                                <td class=\"tx\"><textarea disabled=\"\" class=\"txtareal\">" + beanUnforme.getDescripcion_uniforme() + "</textarea> </td>";
            if (beanUnforme.isEstadoUniforme()) {
                listaUnfiormes += "<td ><input   checked=\"\" type=\"checkbox\" class=\"checkthis\" disabled=\"\" /></td> ";
            } else {
                listaUnfiormes += "<td > <input type=\"checkbox\" class=\"checkthis\" disabled=\"\"/></td>";
            }
            listaUnfiormes += "<td><a data-placement=\"top\" data-toggle=\"tooltip\" title=\"Edit\"  ><button class=\"btn btn-primary btn-xs editar\" data-title=\"Edit\" value=\"" + beanUnforme.getId_uniforme() + "\" data-toggle=\"modal\" data-target=\"#edit\" ><span class=\"glyphicon glyphicon-pencil\"></span></button></a></td>\n"
                    + "                                                                <td><a data-placement=\"top\" data-toggle=\"tooltip\" title=\"Delete\"><button class=\"btn btn-danger btn-xs elimina\"  value=\"" + beanUnforme.getId_uniforme() + "\" data-title=\"Delete\" data-toggle=\"modal\" data-target=\"#delete\" ><span class=\"glyphicon glyphicon-trash\"></span></button></a></td>\n"
                    + "                                                            </tr>";

            cont++;
        }

        return listaUnfiormes;
    }

}
