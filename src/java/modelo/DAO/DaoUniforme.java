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
import java.util.Iterator;
import modelo.BEAN.BeanEstadoUniforme;
import modelo.BEAN.BeanTipoUniforme;
import modelo.BEAN.BeanUniforme;
import modelo.BEAN.BeanUsuario;

/**
 *
 * @author David
 */
public class DaoUniforme extends Conexion {

    private Statement statement = null;
    private String consulta = "";

    public DaoUniforme() {
        super();

        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();
        } catch (Exception e) {
        }
    }

    public boolean insertarUniforme(BeanUniforme beanUniforme) {
        PreparedStatement ps = null;
        try {
            consulta = "call insertar_uniforme(?,?,?,?,?,?,?)";
            ps = conexion.prepareCall(consulta);
            
            ps.setString(1, beanUniforme.getNombre_uniforme());
            ps.setString(2, beanUniforme.getDescripcion_uniforme());
            ps.setString(3, beanUniforme.getUrl_diseño_Uniforme());
            ps.setDouble(4, beanUniforme.getPrecio());
            ps.setBoolean(5, beanUniforme.isEstadoUniforme());
            ps.setInt(6, beanUniforme.getId_tipoUniforme());
            ps.setInt(7, beanUniforme.getInstitucion_idInstitucion());
            if (ps.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error al insertar en la tabla uniforme " + e);
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (ObternerConexion() != null) {
                    ObternerConexion().close();
                }

            } catch (Exception e) {
            }
        }
        return false;
    }

    public ArrayList<BeanUniforme> listarUniforme(int pagina, int numeroRegistro) {
        PreparedStatement ps = null;

        ArrayList<BeanUniforme> listaUniformes = new ArrayList<>();

        try {
            consulta = "call listar_uniformes(?,?)";
            ps = conexion.prepareCall(consulta);
            ps.setInt(1, pagina);
            ps.setInt(2, numeroRegistro);

            ResultSet print = ps.executeQuery();
            while (print.next()) {
                BeanUniforme bnUnifor = new BeanUniforme();

                bnUnifor.setId_uniforme(print.getInt("idUniforme"));
                bnUnifor.setNombre_uniforme(print.getString("Nombre_Uniforme"));
                bnUnifor.setDescripcion_uniforme(print.getString("Descripcion_Uniforme"));
                bnUnifor.setUrl_diseño_Uniforme(print.getString("Url_Diseño_Uniforme"));
                bnUnifor.setPrecio(print.getDouble("Precio"));
                bnUnifor.setEstadoUniforme(print.getBoolean("EstadoUniforme"));
                bnUnifor.setNombreTipo(print.getString("Nombre_Tipo"));
                bnUnifor.setEstadoUniforme(print.getBoolean("EstadoUniforme"));
                bnUnifor.setNombre_tipo_institucion(print.getString("Nombre_institucion"));
                
                listaUniformes.add(bnUnifor);

            }

        } catch (Exception e) {
            System.out.println("Ocurrio error al listar" + e);
        }

        return listaUniformes;
    }

    public ArrayList<BeanUniforme> listarUniformeCatalog(int pagina, int numeroRegistro, String bucar) {
        PreparedStatement ps = null;

        ArrayList<BeanUniforme> listaUniformes = new ArrayList<>();
//SET FOREIGN_KEY_CHECKS = on
        try {
            consulta = "call listar_uniformesCatalogo(?,?,?)";
            ps = conexion.prepareCall(consulta);
            ps.setInt(1, pagina);
            ps.setInt(2, numeroRegistro);
            ps.setString(3, bucar);

            ResultSet print = ps.executeQuery();
            while (print.next()) {
                BeanUniforme bnUnifor = new BeanUniforme();

                bnUnifor.setId_uniforme(print.getInt("idUniforme"));
                bnUnifor.setNombre_uniforme(print.getString("Nombre_Uniforme"));
                bnUnifor.setDescripcion_uniforme(print.getString("Descripcion_Uniforme"));
                bnUnifor.setUrl_diseño_Uniforme(print.getString("Url_Diseño_Uniforme"));
                bnUnifor.setPrecio(print.getDouble("Precio"));
                bnUnifor.setEstadoUniforme(print.getBoolean("EstadoUniforme"));
                bnUnifor.setNombreTipo(print.getString("Nombre_Tipo"));

                listaUniformes.add(bnUnifor);

            }

        } catch (Exception e) {
            System.out.println("Ocurrio error al listar" + e);
        }

        return listaUniformes;
    }

    /*
    public ArrayList<BeanUniforme> buscarUniforme(String pagina) {
        PreparedStatement ps = null;

        ArrayList<BeanUniforme> listaUniformes = new ArrayList<>();

        try {
            consulta = "select* FROM uniforme WHERE Nombre_uniforme like ?";
            ps = conexion.prepareStatement(consulta);
            ps.setString(1,"%"+pagina+"%");

            ResultSet print = ps.executeQuery();
            while (print.next()) {
                BeanUniforme bnUnifor = new BeanUniforme();

                bnUnifor.setId_uniforme(print.getInt("idUniforme"));
                bnUnifor.setNombre_uniforme(print.getString("Nombre_Uniforme"));
                bnUnifor.setDescripcion_uniforme(print.getString("Descripcion_Uniforme"));
                bnUnifor.setUrl_diseño_Uniforme(print.getString("Url_Diseño_Uniforme"));
                bnUnifor.setPrecio(print.getDouble("Precio"));
                bnUnifor.setEstadoUniforme(print.getBoolean("EstadoUniforme"));
                
                listaUniformes.add(bnUnifor);

            }

        } catch (Exception e) {
            System.out.println("Ocurrio error al listar" + e);
        }

        return listaUniformes;
    }
     */
    public boolean eliminarUniforme(BeanUniforme beanUniforme) {

        PreparedStatement ps = null;
        try {
            consulta = "call eliminarUniformes(?)";
            ps = conexion.prepareCall(consulta);

            ps.setInt(1, beanUniforme.getId_uniforme());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error al eliminar un uniforme" + e);
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (ObternerConexion() != null) {
                    ObternerConexion().close();
                }

            } catch (Exception e) {
            }
        }
        return false;
    }

    public BeanUniforme verImg(BeanUniforme beanUniforme) {

        PreparedStatement ps = null;
        BeanUniforme uniforme = new BeanUniforme();
        try {
            consulta = "call verImg_Uniforme(?)";
            ps = conexion.prepareCall(consulta);

            ps.setInt(1, beanUniforme.getId_uniforme());
            ResultSet print = ps.executeQuery();
            while (print.next()) {
                uniforme.setUrl_diseño_Uniforme(print.getString("Url_Diseño_Uniforme"));
                return uniforme;
            }

        } catch (Exception e) {
            System.out.println("Error al eliminar un uniforme" + e);
            e.printStackTrace();
        }
        return uniforme;
    }

    public boolean actualizarUniforme(BeanUniforme beanUniforme) {

        PreparedStatement ps = null;
        try {
            consulta = "call actualizar_uniforme(?,?,?,?,?,?,?,?)";
            ps = conexion.prepareCall(consulta);
        

            if (beanUniforme.getUrl_diseño_Uniforme().equals("")) {
                beanUniforme.setUrl_diseño_Uniforme(null);
            }
            ps.setString(1, beanUniforme.getNombre_uniforme());
            ps.setString(2, beanUniforme.getDescripcion_uniforme());
            ps.setString(3, beanUniforme.getUrl_diseño_Uniforme());
            ps.setDouble(4, beanUniforme.getPrecio());
            ps.setBoolean(5, beanUniforme.isEstadoUniforme());
            ps.setInt(6, beanUniforme.getId_tipoUniforme());
            ps.setInt(7, beanUniforme.getId_uniforme());
            ps.setInt(8, beanUniforme.getInstitucion_idInstitucion());
            int fila = ps.executeUpdate();
            if (fila > 0) {
                return true;
            } else {
                return false;

            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public BeanUniforme verUniforme(BeanUniforme bnUnifor) {
        PreparedStatement ps = null;

        try {
            consulta = "call ver_Uniforme(?)";
            ps = conexion.prepareCall(consulta);

            ps.setInt(1, bnUnifor.getId_uniforme());
            ResultSet print = ps.executeQuery();

            while (print.next()) {

                bnUnifor.setId_uniforme(print.getInt("idUniforme"));
                bnUnifor.setNombre_uniforme(print.getString("Nombre_Uniforme"));
                bnUnifor.setDescripcion_uniforme(print.getString("Descripcion_Uniforme"));
                bnUnifor.setUrl_diseño_Uniforme(print.getString("Url_Diseño_Uniforme"));
                bnUnifor.setPrecio(print.getDouble("Precio"));
                bnUnifor.setEstadoUniforme(print.getBoolean("EstadoUniforme"));
                bnUnifor.setId_tipoUniforme(print.getInt("Tipo_Uniforme_idTipo_Uniforme"));

                return bnUnifor;
            }
            ps.close();

        } catch (Exception e) {
            e.getMessage();
        }
        return bnUnifor;
    }

///paginación
    public int verRegistrosTotales() {
        PreparedStatement ps = null;
        int contador = 0;
        try {
            consulta = "SELECT * FROM Uniforme";
            ps = conexion.prepareStatement(consulta);
            ResultSet print = ps.executeQuery();

            while (print.next()) {
                contador++;
            }
            ps.close();
            return contador;
        } catch (Exception e) {
            e.getMessage();
        }
        return contador = 1;
    }

    public static void main(String[] args) {

//        BeanUniforme bnUniforme = new BeanUniforme();
//        bnUniforme.setNombre_uniforme("no se");
//        bnUniforme.setDescripcion_uniforme("Prueba descrip");
//        bnUniforme.setUrl_diseño_Uniforme("imgimf.png");
//        bnUniforme.setPrecio(Double.parseDouble("10.2"));
//        bnUniforme.setEstadoUniforme(Boolean.parseBoolean("false"));
//        bnUniforme.setId_tipoUniforme(1);
//        
//
//        DaoUniforme uni = new DaoUniforme();
//
//        if (uni.insertarUniforme(bnUniforme)) {
//            System.out.println("se creo el dato");
//
//        } else {
//            System.out.println("No se puedo crear");
//        }
        BeanUniforme bnUniforme = new BeanUniforme();
        DaoUniforme uni = new DaoUniforme();

        ArrayList<BeanUniforme> listaUniforme = uni.listarUniforme(0, 10);

        for (BeanUniforme BeanUnforme : listaUniforme) {
            System.out.println("------------------------------------");
            System.out.println(BeanUnforme.getId_uniforme());
            System.out.println(BeanUnforme.getNombre_uniforme());
            System.out.println(BeanUnforme.getDescripcion_uniforme());
            System.out.println(BeanUnforme.getUrl_diseño_Uniforme());
            System.out.println(BeanUnforme.getNombreTipo());
            System.out.println(BeanUnforme.isEstadoUniforme());
            System.out.println(BeanUnforme.getNombre_tipo_institucion());
            System.out.println("-------------------------------------");
        }
//        BeanUniforme bnUniforme = new BeanUniforme();
//        DaoUniforme uni = new DaoUniforme();
//        bnUniforme.setId_uniforme(4);
////       
//
////       
////      
//        bnUniforme.setNombre_uniforme("no se");
//        bnUniforme.setDescripcion_uniforme("Prueba descrip");
//        bnUniforme.setUrl_diseño_Uniforme("imgimf.png");
//        bnUniforme.setPrecio(Double.parseDouble("10.2"));
//        bnUniforme.setEstadoUniforme(Boolean.parseBoolean("false"));
//        bnUniforme.setId_tipoUniforme(1);
//
//        if (uni.actualizarUniforme(bnUniforme)) {
//            System.out.println("se actualizzo");
//
//        } else {
//            System.out.println("No se puedo crear");
//        }
/*
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_uniformesCatalogo`(IN `pagina` INT, IN `numrRegistros` INT, IN `nombre_Uni` VARCHAR(45))
BEGIN
if nombre_Uni is null THEN
select u.idUniforme,u.Nombre_Uniforme,u.Descripcion_Uniforme,
u.Url_Diseño_Uniforme,
u.Precio, t.Nombre_Tipo,u.EstadoUniforme
from uniforme u
INNER JOIN tipo_uniforme t on u.Tipo_Uniforme_idTipo_Uniforme= t.idTipo_Uniforme 
where u.EstadoUniforme=1
limit pagina,numrRegistros;
ELSE
select u.idUniforme,u.Nombre_Uniforme,u.Descripcion_Uniforme,u.Url_Diseño_Uniforme,
u.Precio, t.Nombre_Tipo,u.EstadoUniforme
from uniforme u
INNER JOIN tipo_uniforme t on u.Tipo_Uniforme_idTipo_Uniforme= t.idTipo_Uniforme 
where u.Nombre_Uniforme LIKE CONCAT('%',nombre_Uni,' %')
limit pagina,numrRegistros;
END IF;
END$$
DELIMITER ;
         */
    }
}
