/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAO;

import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class DaoPrendaUniformeInstitucion extends Conexion {

    private Statement statement = null;
    private String consulta = "";

    public DaoPrendaUniformeInstitucion() {
        super();

        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();
        } catch (Exception e) {
        }
    }

    public boolean insertarUniformeCatalogo() {
        try {
            PreparedStatement ps = null;
            consulta="";
            ps = conexion.prepareCall(consulta);
            

        } catch (Exception e) {
            
            e.printStackTrace();
        }
        return false;
    }

}
