 package modelo.DAO;

import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.BEAN.BeanInstitucion;
import modelo.BEAN.BeanTipoInstitucion;
import modelo.BEAN.BeanTipoUniforme;

/**
 * Esta clase se encarga de hacer las peticiones a la base de datos
 *
 * @author David
 * @version: 10/03/2017/A
 */
public class DaoInstitucion extends Conexion {

    private Statement statement = null;
    private String consulta = "";

    /**
     * Constructor
     */
    public DaoInstitucion() {
        super();

        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();
        } catch (Exception e) {
        }
    }

    /**
     * Metodo encargado de insertar las instiruciones
     *
     * @param beanInstitucion
     * @return booleano
     */
    public boolean insertarInstitucion(BeanInstitucion beanInstitucion) {
        PreparedStatement ps = null;
        try {
            consulta = "CALL insertarInstitucion(?,?,?,?)";
            ps = conexion.prepareCall(consulta);

            ps.setString(1, beanInstitucion.getNombre_intitucion());
            ps.setString(2, beanInstitucion.getDescripcion_institucion());
            ps.setString(3, beanInstitucion.getUrl_logo_institucion());
            ps.setInt(4, beanInstitucion.getId_tipoInstitucion());

            if (ps.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error al insertar en la tabla Institucion " + e);
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

    /**
     * Metodo encargado de actualizar una institucion
     *
     * @param beanInstitucion objeto tipo Institucion
     * @return boleano
     */
    public boolean actualizarInstitucion(BeanInstitucion beanInstitucion) {

        PreparedStatement ps = null;
        try {
            consulta = "CALL actualizarInstituto(?,?,?,?,?)";
            ps = conexion.prepareCall(consulta);

            ps.setString(1, beanInstitucion.getNombre_intitucion());
            ps.setString(2, beanInstitucion.getDescripcion_institucion());
            ps.setString(3, beanInstitucion.getUrl_logo_institucion());
            ps.setInt(4, beanInstitucion.getId_tipoInstitucion());
            ps.setInt(5, beanInstitucion.getId_institucion());

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

    /**
     * Metodo encargado de eliminar un uniforme por su ID
     *
     * @param beanInstitucion
     * @return boleano
     */
    public boolean eliminarInstitucion(BeanInstitucion beanInstitucion) {

        PreparedStatement ps = null;
        try {
            consulta = "CALL eliminarInstitucion(?)";
            ps = conexion.prepareCall(consulta);

            ps.setInt(1, beanInstitucion.getId_institucion());

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

    /**
     * Metodo encargado de listar las intituciones de la base de datos
     *
     * @param pagina
     * @param numeroRegistro
     * @return ArrayList(BeanInstitucion)
     */
    public ArrayList<BeanInstitucion> listarInstitucion(int pagina, int numeroRegistro) {
        PreparedStatement ps = null;

        ArrayList<BeanInstitucion> listaInstitucion = new ArrayList<>();

        try {
            consulta = "call listarInstitucion(?,?)";
            ps = conexion.prepareCall(consulta);
            ps.setInt(1, pagina);
            ps.setInt(2, numeroRegistro);
           

            ResultSet print = ps.executeQuery();
            /**
             * Recorre los datos devueltos de la base de datos
             */
            while (print.next()) {

                BeanInstitucion bnInstitucion = new BeanInstitucion();
               
             
                
                bnInstitucion.setId_institucion(print.getInt("idInstitucion"));
                bnInstitucion.setNombre_intitucion(print.getString("Nombre_institucion"));
                bnInstitucion.setDescripcion_institucion(print.getString("Descripcion_institucion"));
                bnInstitucion.setUrl_logo_institucion(print.getString("Url_logo_institucion"));
//                bnInstitucion.setNombre_tipo_institucion(print.getString("Nombre_tipo_institucion"));
                bnInstitucion.setNombre_tipo_institucion(print.getString("Nombre_tipo_institucion"));

                listaInstitucion.add(bnInstitucion);

            }

        } catch (Exception e) {
            System.out.println("Ocurrio error al listar" + e);
        }

        return listaInstitucion;
    }

    /**
     * Metodo que trae solo una institucion para poder mostrarla y
     * posteriormente editarla en otro metodo de esta clase
     *
     * @param beanInstitucion
     * @return beanInstitucion
     */
    public BeanInstitucion verPrenda(BeanInstitucion beanInstitucion) {
        PreparedStatement ps = null;

        try {
            consulta = "CALL verInstitucion(?)";
            ps = conexion.prepareCall(consulta);

            ps.setInt(1, beanInstitucion.getId_institucion());
            ResultSet print = ps.executeQuery();

            while (print.next()) {

                beanInstitucion.setId_institucion(print.getInt("idInstitucion"));
                beanInstitucion.setNombre_intitucion(print.getString("Nombre_institucion"));
                beanInstitucion.setDescripcion_institucion(print.getString("Descripcion_institucion"));
                beanInstitucion.setUrl_logo_institucion(print.getString("Url_logo_institucion"));
                beanInstitucion.setId_tipoInstitucion(print.getInt("Tipo_institucion_idTipo_institucion"));

                return beanInstitucion;
            }
            ps.close();

        } catch (Exception e) {
            e.getMessage();
        }
        return beanInstitucion;
    }

    /**
     * Methodo relacionado con la paginacion devulve el registro totales de la
     * tabla
     *
     * @return entero
     */
    public int verRegistrosTotales() {
        PreparedStatement ps = null;
        int contador = 0;
        try {
            consulta = "SELECT * FROM Institucion";
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
        BeanInstitucion beanInstitucion = new BeanInstitucion();
        DaoInstitucion daoInstitucion = new DaoInstitucion();
        /*PRUEBA  INSERTAR INSTITUCION*/
//        beanInstitucion.setNombre_intitucion("Colegio Main");
//        beanInstitucion.setDescripcion_institucion("solo es una prueba");
//        beanInstitucion.setUrl_logo_institucion("prueba.png");
//        beanInstitucion.setId_tipoInstitucion(1);
//
//        if (daoInstitucion.insertarInstitucion(beanInstitucion)) {
//
//            System.out.println("Se ha insertado correctamente");
//
//        } else {
//            System.out.println("!ERROR! No se ha insertado ");
//
//        }
        /*PRUEBA  INSERTAR INSTITUCION*/
 /*PRUEBA LISTAR INSTITUCIONES */

        ArrayList<BeanInstitucion> listaInstitucion = daoInstitucion.listarInstitucion(1, 10);

        for (BeanInstitucion beanInstitucio : listaInstitucion) {
            System.out.println(beanInstitucio.getId_institucion());
            System.out.println(beanInstitucio.getNombre_intitucion());
            System.out.println(beanInstitucio.getDescripcion_institucion());
            System.out.println(beanInstitucio.getUrl_logo_institucion());
            System.out.println(beanInstitucio.getNombre_tipo_institucion());
            System.out.println("_______________________________________");
        }
        /*PRUEBA LISTAR INSTITUCIONES */
 /*PRUEBA VER REGISTROS */

//        int r = daoInstitucion.verRegistrosTotales();
//        System.out.println(r);

        /*PRUEBA ACTUALIZAR*/
//        beanInstitucion.setNombre_intitucion("Prueba desde main java");
//        beanInstitucion.setDescripcion_institucion("ACTUALIZAR SIN IMAGEN");
//        beanInstitucion.setUrl_logo_institucion("");
//        beanInstitucion.setId_tipoInstitucion(1);
//        beanInstitucion.setId_institucion(1);
//        if (daoInstitucion.actualizarInstitucion(beanInstitucion)) {
//            System.out.println("Se a actualizado correctamente");
//        } else {
//            System.out.println("!ERROR! No se ha actualizado");
//
//        }
        /*PRUEBA METODO VER INSTITUTO*/
//        beanInstitucion.setId_institucion(1);
//
//        BeanInstitucion ver = daoInstitucion.verPrenda(beanInstitucion);
//
//        System.out.println(ver.getId_institucion());
//        System.out.println(ver.getNombre_intitucion());
//        System.out.println(ver.getDescripcion_institucion());
//        System.out.println(ver.getUrl_logo_institucion());
//        System.out.println(ver.getId_tipoInstitucion());

        /*PRUEBA METODO ELIMINAR INSTITUCION*/
//        beanInstitucion.setId_institucion(4);
//        if (daoInstitucion.eliminarInstitucion(beanInstitucion)) {
//            System.out.println("Se ha eliminado correctamente");
//        } else {
//            System.out.println("!ERROR! No se ha podido eliminar");
//
//        }

    }
}
