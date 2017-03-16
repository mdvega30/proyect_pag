package modelo.DAO;

import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.BEAN.BeanPrenda;

/**
 *
 * @author David
 */
public class DaoPrenda extends Conexion {

    private Statement statement = null;
    private String consulta = "";

    /**
     * Constructor
     */
    public DaoPrenda() {
        super();
        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();

        } catch (Exception e) {
        }

    }

    /**
     * Metodo que inserta una prenda a la base de datos
     *
     * @param beanPrenda
     * @return boleano
     */
    public boolean insertarPrenda(BeanPrenda beanPrenda) {

        PreparedStatement ps = null;
        try {
            consulta = "CALL insertarPrenda(?,?,?,?,?)";
            ps = conexion.prepareCall(consulta);

            ps.setString(1, beanPrenda.getNombre_Prenda());
            ps.setString(2, beanPrenda.getDescripcion_prenda());
            ps.setString(3, beanPrenda.getUrl_Diseño());
            ps.setInt(4, beanPrenda.getUniforme_idUniforme());
            ps.setInt(5, beanPrenda.getIdTalla());

            if (ps.executeUpdate() < 1) {
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
     * Metodo que sirve para actualizar o editar una prenda
     *
     * @param beanPrenda
     * @return
     */
    public boolean actualizarPrenda(BeanPrenda beanPrenda) {

        PreparedStatement ps = null;
        try {
            consulta = "CALL ";
            ps = conexion.prepareCall(consulta);

            ps.setInt(1, beanPrenda.getIdPrenda());
            ps.setString(2, beanPrenda.getNombre_Prenda());
            ps.setString(3, beanPrenda.getDescripcion_prenda());
            ps.setString(4, beanPrenda.getUrl_Diseño());
            ps.setInt(5, beanPrenda.getIdTalla());
            ps.setInt(6, beanPrenda.getUniforme_idUniforme());

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
     * Metodo que lista las prendas y las gurda en un array de objetos
     *
     * @param pagina
     * @param numeroRegistro
     * @return
     */
    public ArrayList<BeanPrenda> listarPrendas(int pagina, int numeroRegistro) {
        PreparedStatement ps = null;

        ArrayList<BeanPrenda> listaPrenda = new ArrayList<>();

        try {
            consulta = "call listarPrendas(?,?)";
            ps = conexion.prepareCall(consulta);
            ps.setInt(1, pagina);
            ps.setInt(2, numeroRegistro);

            ResultSet print = ps.executeQuery();
            /**
             * Recorre los datos devueltos de la base de datos
             */
            while (print.next()) {

                BeanPrenda beanPrenda = new BeanPrenda();

                beanPrenda.setIdPrenda(print.getInt("idPrenda"));
                beanPrenda.setNombre_Prenda(print.getString("Nombre_Prenda"));
                beanPrenda.setDescripcion_prenda(print.getString("Descripcion_prenda"));
                beanPrenda.setUrl_Diseño(print.getString("Url_Diseño"));
                beanPrenda.setNombre_Uniforme(print.getString("Nombre_Uniforme"));
                beanPrenda.setTalla_nombre(print.getString("Talla_nombre"));

                listaPrenda.add(beanPrenda);

            }

        } catch (Exception e) {
            System.out.println("Ocurrio error al listar" + e);
        }

        return listaPrenda;
    }

    /**
     * Metodo que sirve para retornar la cantidad de registros totales de la
     * tabla prenda
     *
     * @return entero
     */
    public int verRegistrosTotales() {
        PreparedStatement ps = null;
        int contador = 0;
        try {
            consulta = "SELECT * FROM Prenda";
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
        BeanPrenda beanPrenda = new BeanPrenda();
        DaoPrenda daoPrenda = new DaoPrenda();
        /**
         * PRUEBA METODO INSERTAR PRENDA
         */
        //        beanPrenda.setNombre_Prenda("prenda prueba main");
        //        beanPrenda.setDescripcion_prenda("desc prueba main java");
        //        beanPrenda.setUrl_Diseño("pruebamain.jpg");
        //        beanPrenda.setUniforme_idUniforme(36);
        //        beanPrenda.setIdTalla(3);
        //
        //        if (daoPrenda.insertarPrenda(beanPrenda)) {
        //            System.out.println("Se ha insertado correctamente");
        //
        //        } else {
        //            System.out.println("!Error! no se ha insertado");
        //        }

        /**
         * PRUEBA METODO LISTAR PRENDAS
         */
//        ArrayList<BeanPrenda> listaPrendas = daoPrenda.listarPrendas(0, 20);
//
//        for (BeanPrenda beanPrend : listaPrendas) {
//
//            System.out.println("______________________________");
//            System.out.println(beanPrend.getIdPrenda());
//            System.out.println(beanPrend.getNombre_Prenda());
//            System.out.println(beanPrend.getDescripcion_prenda());
//            System.out.println(beanPrend.getUrl_Diseño());
//            System.out.println(beanPrend.getNombre_Uniforme());
//            System.out.println(beanPrend.getTalla_nombre());
//            System.out.println("______________________________");
//
//        }
        /**
         * PRUEBA METODO VER REGISTROS TOTALES
         */
        System.out.println(daoPrenda.verRegistrosTotales());

    }
}
