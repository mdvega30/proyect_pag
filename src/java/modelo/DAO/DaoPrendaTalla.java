package modelo.DAO;

import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.Statement;
import modelo.BEAN.BeanInstitucion;
import modelo.BEAN.BeanPrenda;
import modelo.BEAN.BeanPrendaTalla;
import modelo.BEAN.BeanTalla;

/**
 *
 * @author David
 */
public class DaoPrendaTalla extends Conexion {

    private Statement statement = null;
    private String consulta = "";

    /**
     * Constructor
     */
    public DaoPrendaTalla() {
        super();
        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();
        } catch (Exception e) {
        }
    }

    /**
     * inserta las tallas de cada prenda por la id de la ultima prenda agregada
     *
     * @param beanTalla
     * @return boleano
     */
    public boolean insertarTallaPorPrenda(BeanPrendaTalla beanTalla) {
        ObternerConexion();
        PreparedStatement ps = null;
        try {
            consulta = "CALL insertarTallasPrenda(?)";
            ps = conexion.prepareCall(consulta);
            ps.setInt(1, beanTalla.getTalla_idTalla());
            if (ps.executeUpdate() == 1) {
                return true;
            }

            CerrarConexion();

        } catch (Exception e) {
            System.out.println("Error al insertar en la tabla Institucion " + e);
            e.printStackTrace();
        }
        return false;
    }

    /**
     *
     * @param beanTalla
     * @return
     */
    public boolean insertarTallaPorId(BeanPrendaTalla beanTalla,BeanPrenda beanPrenda) {
        ObternerConexion();
        PreparedStatement ps = null;
        try {
            consulta = "CALL insertarTallasPrendaId(?,?)";
            ps = conexion.prepareCall(consulta);
            ps.setInt(1, beanTalla.getTalla_idTalla());
            ps.setInt(2, beanPrenda.getIdPrenda());
            if (ps.executeUpdate() == 1) {
                return true;
            }

            CerrarConexion();

        } catch (Exception e) {
            System.out.println("Error al insertar en la tabla Institucion " + e);
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminarTodasLasTallas(BeanPrenda beanPrenda) {

        PreparedStatement ps = null;
        try {
            consulta = "CALL eliminarTallasPrendas(?)";
            ps = conexion.prepareCall(consulta);

            ps.setInt(1, beanPrenda.getIdPrenda());

            if (ps.executeUpdate() > 0) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error al eliminar un uniforme" + e);
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {

        BeanPrendaTalla beanPrendaTalla = new BeanPrendaTalla();
        DaoPrendaTalla daoPrendaTalla = new DaoPrendaTalla();
        BeanPrenda beanPrenda = new BeanPrenda();
        beanPrenda.setIdPrenda(1);
        beanPrendaTalla.setTalla_idTalla(4);

        if (daoPrendaTalla.insertarTallaPorId(beanPrendaTalla,beanPrenda)) {
            System.out.println("Talla de la prenda insertada con exito");

        } else {
            System.out.println("!Error! la talla de la prenda no se ha insertado");

        }
//        beanPrenda.setIdPrenda(6);
//        ;
//        if (daoPrendaTalla.eliminarTodasLasTallas(beanPrenda)) {
//            System.out.println("se han eliminado");
//
//        } else {
//            System.out.println("No se han eliminado");
//        }

    }

}
