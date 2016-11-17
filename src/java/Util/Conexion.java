
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Conexion {
    public  String driver, urldb, passbd, userbd,bd;
    public Connection conexion;
    private Statement consulta=null;
    private ResultSet   data = null;
    public Conexion(){
        
        driver="com.mysql.jdbc.Driver";
        userbd="root";
        passbd="";
        bd= "db_tuniformevf";
        urldb="jdbc:mysql://localhost:3306/"+bd;
        
        try {
            Class.forName(driver).newInstance();
            conexion= DriverManager.getConnection(urldb,userbd,passbd);
            System.out.println("conexion  a BD OK");
        } catch (Exception e) {
            System.out.println("conexion  ERRONEA "+e);
        }
        
    }  
    public Connection ObternerConexion(){
        return  conexion;
    }
    
    public  Connection CerrarConexion() throws SQLException{
        conexion.close();
        conexion= null;
        return conexion;
    }
    
    
    public static void main(String[] args) {
        new Conexion();
    }
    
}
