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
import modelo.BEAN.BeanTipoUniforme;

/**
 *
 * @author David
 */
public class DaoTipoUniforme extends Conexion {

    private Statement statement = null;
    private String consulta = "";

    public DaoTipoUniforme() {

        super();

        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();
        } catch (Exception e) {
        }
    }

    public ArrayList<BeanTipoUniforme> listarTodosTiposDeUniforme() {
        PreparedStatement ps = null;

        ArrayList<BeanTipoUniforme> listaTiposUniformes = new ArrayList<>();

        try {
            consulta = "select * from tipo_uniforme";
            ps = conexion.prepareStatement(consulta);

            ResultSet print = ps.executeQuery();
            while (print.next()) {
                BeanTipoUniforme bnTipoUnifor = new BeanTipoUniforme();

                bnTipoUnifor.setId_tipo_uniforme(print.getInt("idTipo_Uniforme"));
                bnTipoUnifor.setNombre_tipo_uniforme(print.getString("Nombre_Tipo"));
                bnTipoUnifor.setDescripcion_tipo_uniforme(print.getString("Descripcion_tipo_uniforme"));

                listaTiposUniformes.add(bnTipoUnifor);

            }

        } catch (Exception e) {
            System.out.println("Ocurrio error al listar" + e);
        }

        return listaTiposUniformes;

    }

    public static void main(String[] args) {
        BeanTipoUniforme bnTipoUniforme = new BeanTipoUniforme();
        DaoTipoUniforme daoTipoUniforme = new DaoTipoUniforme();

        ArrayList<BeanTipoUniforme> listaTipoUniforme = daoTipoUniforme.listarTodosTiposDeUniforme();

        for (BeanTipoUniforme bnTipoU : listaTipoUniforme) {

            System.out.println("_____________________________");
            System.out.println(bnTipoU.getId_tipo_uniforme());
            System.out.println(bnTipoU.getNombre_tipo_uniforme());
            System.out.println(bnTipoU.getDescripcion_tipo_uniforme());
            System.out.println("_____________________________");
        }

    }

}
