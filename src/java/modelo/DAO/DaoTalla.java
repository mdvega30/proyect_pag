/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAO;

import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.BEAN.BeanPrenda;
import modelo.BEAN.BeanTalla;

/**
 *
 * @author David
 */
public class DaoTalla extends Conexion {

    private Statement statement = null;
    private String consulta = "";

    /**
     * Constructor
     */
    public DaoTalla() {
        super();
        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();
        } catch (Exception e) {
        }
    }

    /**
     * Metodo que trae toda la informacion de las tallas de la base de datos
     *
     * @return ArrayList
     */
    public ArrayList<BeanTalla> listarTodasLasTallas() {
        PreparedStatement ps = null;
        ArrayList<BeanTalla> listaTallas = new ArrayList<>();
        try {
            consulta = "select * from talla";
            ps = conexion.prepareStatement(consulta);

            ResultSet print = ps.executeQuery();
            /**
             * Recorre los datos devueltos de la base de datos
             */
            while (print.next()) {

                BeanTalla beanTalla = new BeanTalla();

                beanTalla.setIdTalla(print.getInt("idTalla"));
                beanTalla.setPrecio_talla(print.getString("Precio_talla"));
                beanTalla.setTalla_nombre(print.getString("Talla_nombre"));

                listaTallas.add(beanTalla);

            }

        } catch (Exception e) {
            System.out.println("Ocurrio error al listar" + e);
        }

        return listaTallas;

    }

    public ArrayList<BeanTalla> listarTallasPorPrenda(BeanPrenda bnPrenda) {
        PreparedStatement ps = null;
        ArrayList<BeanTalla> listaTallas = new ArrayList<>();
        listaTallas.clear();
        try {
            consulta = "CALL listarTallasPorPrenda(?)";
            ps = conexion.prepareStatement(consulta);
            ps.setInt(1, bnPrenda.getIdPrenda());
            ResultSet print = ps.executeQuery();
            /**
             * Recorre los datos devueltos de la base de datos
             */
            while (print.next()) {

                BeanTalla bnTalla = new BeanTalla();

                bnTalla.setIdTalla(print.getInt("idTalla"));
                bnTalla.setTalla_nombre(print.getString("Talla_nombre"));
                bnTalla.setPrecio_talla(print.getString("Precio_talla"));
                listaTallas.add(bnTalla);

            }

        } catch (Exception e) {
            System.out.println("Ocurrio error al listar" + e);
        }

        return listaTallas;

    }

    public static void main(String[] args) {

        DaoTalla daoTalla = new DaoTalla();
        BeanTalla beanTalla = new BeanTalla();
        /**
         * PRUEBA METODO listar todas las tallas
         */

//        ArrayList<BeanTalla> listaTallas = daoTalla.listarTodasLasTallas();
//
//        for (BeanTalla beanTall : listaTallas) {
//            System.out.println("______________________");
//            System.out.println(beanTall.getIdTalla());
//            System.out.println(beanTall.getPrecio_talla());
//            System.out.println(beanTall.getTalla_nombre());
//            System.out.println("______________________");
//        }
        /**
         * PRUEBA METODO listar Tallas Por Prenda
         */
        BeanPrenda bnPrenda = new BeanPrenda();

        bnPrenda.setIdPrenda(53);
        ArrayList<BeanTalla> listaTallas = daoTalla.listarTallasPorPrenda(bnPrenda);

        for (BeanTalla beanTall : listaTallas) {
            System.out.println("______________________");
            System.out.println(beanTall.getIdTalla());
            System.out.println(beanTall.getPrecio_talla());
            System.out.println(beanTall.getTalla_nombre());
            System.out.println("______________________");
        }
    }

}
