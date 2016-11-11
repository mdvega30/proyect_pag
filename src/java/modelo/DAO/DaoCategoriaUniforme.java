
package modelo.DAO;

import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.Statement;
import modelo.BEAN.BeanUniforme;


public class DaoCategoriaUniforme extends Conexion{

    private Statement statement = null;
    private String consulta="";
    public DaoCategoriaUniforme() {
        super();
         try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();

        } catch (Exception e) {
        }
    
    }
    
    public boolean crearTipoUniforme(BeanUniforme bnUniforme){
        PreparedStatement ps = null;
        try {
            consulta="";
            ps = conexion.prepareCall(consulta);
            ps.setString(1,"");
            
            
        } catch (Exception e) {
        }
        
        return true;
    }
    public void EditarTipoUniforme(){
        
    }
    public void EliminarTipoUniforme(){
        
    }
    public void ListarTipoUniforme(){
        
    }
    
    
    
    
}
