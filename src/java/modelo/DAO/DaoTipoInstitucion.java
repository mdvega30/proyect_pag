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
import modelo.BEAN.BeanTipoInstitucion;

/**
 *
 * @author David
 */
public class DaoTipoInstitucion extends Conexion {

    private Statement statement = null;
    private String consulta = "";

    public DaoTipoInstitucion() {
        super();

        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();

        } catch (Exception e) {
        }

    }

    public ArrayList<BeanTipoInstitucion> listarTodosTiposDeInstitucion() {
        PreparedStatement ps = null;

        ArrayList<BeanTipoInstitucion> listaTipoInstitucion = new ArrayList<>();

        try {
            consulta = "select * from tipo_institucion";
            ps = conexion.prepareStatement(consulta);

            ResultSet print = ps.executeQuery();
            while (print.next()) {
                BeanTipoInstitucion bnTipoInstituc = new BeanTipoInstitucion();

                bnTipoInstituc.setIdTipo_institucion(print.getInt("idTipo_institucion"));
                bnTipoInstituc.setNombre_tipo_institucions(print.getString("Nombre_tipo_institucion"));
                bnTipoInstituc.setDescripcion_tipo_institucion(print.getString("Descripcion_tipo_institucion"));

                listaTipoInstitucion.add(bnTipoInstituc);

            }

        } catch (Exception e) {
            System.out.println("Ocurrio error al listar" + e);
        }

        return listaTipoInstitucion;

    }

    public static void main(String[] args) {
        DaoTipoInstitucion daoTipoInstitucion = new DaoTipoInstitucion();
        BeanTipoInstitucion bnTipoIntitucion = new BeanTipoInstitucion();
        ArrayList<BeanTipoInstitucion> listaTipoInst = daoTipoInstitucion.listarTodosTiposDeInstitucion();

        for (BeanTipoInstitucion bnTipoIns : listaTipoInst) {
            System.out.println(bnTipoIns.getIdTipo_institucion());
            System.out.println(bnTipoIns.getNombre_tipo_institucions());
            System.out.println(bnTipoIns.getDescripcion_tipo_institucion());
        }

    }

}
