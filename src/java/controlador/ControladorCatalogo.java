/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.text.DecimalFormat;
import java.util.ArrayList;
import modelo.BEAN.BeanPrenda;
import modelo.BEAN.BeanUniforme;
import modelo.DAO.DaoPrenda;
import modelo.DAO.DaoUniforme;

/**
 *
 * @author David
 */
public class ControladorCatalogo {

    private String productos = "";
    private String avisos = "";
    private int estado;

    public String getProductos(int pagina, int numeroRegistro, String buscar, int tipoBusqueda) {
        BeanUniforme beanUniforme = new BeanUniforme();
        DaoUniforme daoUniforme = new DaoUniforme();

        productos = "";
        ArrayList<BeanUniforme> listarCatalogos = new ArrayList<>();
        listarCatalogos.clear();
        listarCatalogos = daoUniforme.listarUniformeCatalog(pagina, numeroRegistro, buscar, tipoBusqueda);

        for (BeanUniforme listaCatalogo : listarCatalogos) {

            productos += "<div class=\"product\">\n"
                    + "                                                                                  \n"
                    + "                                                                                    <div class=\"make3D\">\n"
                    + "                                                                                        <div class=\"product-front\">\n"
                    + "                                                                                            <div class=\"shadow\"></div>\n"
                    + "                                                                                            <img src=\"images/" + listaCatalogo.getUrl_diseño_Uniforme() + "\" alt=\"\" />\n"
                    + "                                                                                            <div class=\"image_overlay\"></div>\n"
                    + "                                                                                            <a href=\"detalleProducto.jsp?product=" + listaCatalogo.getId_uniforme() + "\" target=\"_blank\"><div class=\"add_to_cart\" >VER DETALLES</div></a>\n"
                    + "                                                                                            <div class=\"view_gallery\">View gallery</div>                \n"
                    + "                                                                                            <div class=\"stats\">         \n"
                    + "                                                                                                <div class=\"stats-container\">\n"
                    + "                                                                                                    <span class=\"product_price\">$" + String.format("%1$,.0f", listaCatalogo.getPrecio()) + "</span>\n"
                    + "                                                                                                    <span class=\"product_name\"> " + listaCatalogo.getNombre_tipo_institucion() + "</span>    \n"
                    + "                                                                                                    <p>" + listaCatalogo.getNombre_uniforme() + "</p>                                            \n"
                    + "\n"
                    + "                                                                                                    <div class=\"product-options\">\n"
                    + "                                                                                                        <strong>Descripcion</strong>\n"
                    + "                                                                                                        <span>" + listaCatalogo.getDescripcion_uniforme() + "</span>\n"
                    + "\n"
                    + "\n"
                    + "                                                                                                    </div>                       \n"
                    + "                                                                                                </div>                         \n"
                    + "                                                                                            </div>\n"
                    + "                                                                                        </div>\n"
                    + "                                                                                    </div>  \n"
                    + "                                                                                </div>";

        }

        return productos;
    }

    public String getAvisosCatalogo(int estado) {
        if (estado == 1) {

            avisos += "<h3 style=\"margin-left: 35%;color: gray \"></h3> ";
        } else if (estado == 2) {
            avisos += "<img  style=\"width: 100px; height: 100px; margin-left: 41% \"src=\"imagenes/advertencia-triangulo_318-28807.jpg\" alt=\"\"/>\n"
                    + "<h1 style=\"margin-left: 27% \">Resultado de Búsqueda</h1> \n"
                    + "<h2 style=\"margin-left: 29%; color: gray\">0 resultados encontrados</h2> ";
        }

        return avisos;
    }

    public BeanUniforme getArticulo(BeanUniforme bnUniforme) {

        return new DaoUniforme().verUniforme(bnUniforme);
    }

    public ArrayList<BeanPrenda> getPrendasPorUniforme(BeanUniforme bnuniforme) {
        ArrayList<BeanPrenda> listaPrendas = new ArrayList<>();
        DaoPrenda daoPrenda = new DaoPrenda();
        return listaPrendas = daoPrenda.verPrendaPorIdUniforme(bnuniforme);
    }

}
