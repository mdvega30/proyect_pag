/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import modelo.BEAN.BeanPrenda;
import modelo.DAO.DaoPrenda;

/**
 *
 * @author David
 */
public class ControladorPrendas {

    private String prendas;
    private int numRegistros;

    public String listarPrendas(int pagina, int numeroRegistro) {

        DaoPrenda daoPrenda = new DaoPrenda();

        ArrayList<BeanPrenda> listaPrendas = daoPrenda.listarPrendas(pagina, numeroRegistro);
        int cont = pagina * 10;
        for (BeanPrenda beanPren : listaPrendas) {
            prendas += "<tr>"
                    + "<td>" + (cont + 1) + "</td>\n"
                    + "                                                <td>" + beanPren.getNombre_Prenda() + "</td>\n"
                    + "                                                <td class=\"tx\"><textarea disabled=\"\" class=\"txtareal\">" + beanPren.getDescripcion_prenda() + "</textarea> </td>\n"
                    + "                                                <td><img class=\"imgl\" src=\"images/" + beanPren.getUrl_Diseño() + "\" alt=\"\"/></td>\n"
                    + "                                                <td class=\"imgt\" >" + beanPren.getNombre_Uniforme() + "</td>\n"
                    + "                                                <td class=\"imgt\" >" + beanPren.getTalla_nombre() + "</td>\n"
                    + "\n"
                    + "                                                <td><a data-placement=\"top\" data-toggle=\"tooltip\" title=\"Edit\"  ><button class=\"btn btn-primary btn-xs btnInstitu editarI\" data-title=\"Edit\" value=\"" + beanPren.getIdPrenda() + "\" data-toggle=\"modal\" data-target=\"#editPrenda\" ><span class=\"glyphicon glyphicon-pencil\"></span></button></a></td>\n"
                    + "                                                <td><a data-placement=\"top\" data-toggle=\"tooltip\" title=\"Delete\"><button class=\"btn btn-danger btn-xs btnInstitu eliminaI\"  value=\"" + beanPren.getIdPrenda() + "\" data-title=\"Delete\" data-toggle=\"modal\" data-target=\"#deletePrenda\" ><span class=\"glyphicon glyphicon-trash\"></span></button></a></td>\n"
                    + "</tr>";
            cont++;
        }

        return prendas;
    }
    
    public int getNumerodeRegistros(){
        
        DaoPrenda daoPrenda = new DaoPrenda();
        
        numRegistros= daoPrenda.verRegistrosTotales();
        return numRegistros;
    }

}
