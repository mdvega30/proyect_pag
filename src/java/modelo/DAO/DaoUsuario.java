package modelo.DAO;

import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;
import modelo.BEAN.BeanUsuario;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author David
 */
public class DaoUsuario extends Conexion {

    BeanUsuario beanUs = new BeanUsuario();
    private Connection conexion = null;
    private Statement statement = null;
    private ResultSet resulset = null;
    private String consulta = "";
    private BeanUsuario usuario;

    public BeanUsuario getBeanUs() {
        return beanUs;
    }

    public void setBeanUs(BeanUsuario beanUs) {
        this.beanUs = beanUs;
    }

    public DaoUsuario() {
        super();

        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();

        } catch (Exception e) {
        }

    }

    public boolean crearUsuario(BeanUsuario beanUs) {

        PreparedStatement ps = null;
        String encriptado = DigestUtils.md5Hex(DigestUtils.sha1Hex(beanUs.getContraseña()));
        try {
            consulta = "call insertarUsuario(?,?,?,?,?,?,?,?,?,?)";
            ps = conexion.prepareCall(consulta);

            ps.setInt(1, beanUs.getId_rol());
            ps.setInt(2, beanUs.getId_tipodocumento());
            ps.setString(3, beanUs.getNombre1());
            ps.setString(4, beanUs.getNombre2());
            ps.setString(5, beanUs.getApellido1());
            ps.setString(6, beanUs.getApellido2());
            ps.setString(7, beanUs.getDocumento());
            ps.setString(8, beanUs.getCorreo());
            ps.setString(9, beanUs.getDireccion());
            ps.setString(10, encriptado);

            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error " + e);
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

    public boolean autenticarUsuario(BeanUsuario beanUs) {
        PreparedStatement ps = null;
        String encriptado = DigestUtils.md5Hex(DigestUtils.sha1Hex(beanUs.getContraseña()));
        try {
            consulta = "call  autenticacionUsu (?,?)";
            ps = conexion.prepareCall(consulta);

            ps.setString(1, beanUs.getCorreo());
            ps.setString(2, encriptado);
            resulset = ps.executeQuery();
            if (resulset.absolute(1)) {

                this.beanUs = contruirObjetoUsuario(beanUs);
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error " + e);

        } finally {
            try {
                if (ObternerConexion() != null) {
                    ObternerConexion().close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (resulset != null) {
                    ps.close();
                }

            } catch (Exception e) {
            }
        }

        return false;
    }

    public boolean autenticarAdmin(BeanUsuario beanUs) {
        PreparedStatement ps = null;
        String encriptado = DigestUtils.md5Hex(DigestUtils.sha1Hex(beanUs.getContraseña()));
        try {
            consulta = "call autenticacionAdmin (?,?,?)";
            ps = conexion.prepareCall(consulta);

            ps.setString(1, beanUs.getCorreo());
            ps.setString(2, encriptado);
            ps.setInt(3, 2);
            resulset = ps.executeQuery();
            if (resulset.absolute(1)) {
                this.beanUs = contruirObjetoUsuario(beanUs);
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error " + e);

        }

        return false;
    }

    public boolean validarCorreo(BeanUsuario us) {
        PreparedStatement ps = null;
        try {
            consulta = "call datosObjUsuario(?) ";
            ps = conexion.prepareCall(consulta);

            ps.setString(1, us.getCorreo());

            resulset = ps.executeQuery();
            if (resulset.absolute(1)) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Error " + e);

        }

        return false;
    }

    public BeanUsuario contruirObjetoUsuario(BeanUsuario usuario) {

        PreparedStatement ps = null;
        try {
            consulta = "call datosObjUsuario(?)";
            ps = conexion.prepareCall(consulta);
            ps.setString(1, usuario.getCorreo());
            ResultSet print = ps.executeQuery();

            while (print.next()) {

                usuario.setId_Usuario(print.getInt("Id_usuario"));
                usuario.setId_rol(print.getInt("Id_rol"));
                usuario.setNombre1(print.getString("Nombre1"));
                usuario.setNombre2(print.getString("Nombre2"));
                usuario.setApellido1(print.getString("Apellido1"));
                usuario.setApellido2(print.getString("Apellido2"));
                usuario.setDocumento(print.getString("Documento"));
                usuario.setCorreo(print.getString("Correo"));
                usuario.setDireccion(print.getString("Direccion"));

                return usuario;
            }

        } catch (Exception e) {
        }
        return usuario;

    }

    public boolean actualizarDatosUsuario(BeanUsuario usuarios) {

        PreparedStatement ps = null;
        if (usuarios.getContraseña() == null || usuarios.getContraseña().contentEquals("")) {

            try {

                consulta = "call actualizarUsuario1(?,?,?,?,?,?)";
                ps = conexion.prepareCall(consulta);
                ps.setString(1, usuarios.getNombre1());
                ps.setString(2, usuarios.getNombre2());
                ps.setString(3, usuarios.getApellido1());
                ps.setString(4, usuarios.getApellido2());
                ps.setString(5, usuarios.getDireccion());
                ps.setString(6, usuarios.getCorreo());
                int fila = ps.executeUpdate();
                if (fila > 0) {

                    return true;

                } else {
                    return false;
                }

            } catch (Exception e) {
                System.out.println("Error" + e.getMessage());
                return false;
            }

        } else {

            String encriptado = DigestUtils.md5Hex(DigestUtils.sha1Hex(usuarios.getContraseña()));

            try {

                consulta = "call actualizarUsuario(?,?,?,?,?,?,?)";
                ps = conexion.prepareCall(consulta);
                ps.setString(1, usuarios.getNombre1());
                ps.setString(2, usuarios.getNombre2());
                ps.setString(3, usuarios.getApellido1());
                ps.setString(4, usuarios.getApellido2());
                ps.setString(5, usuarios.getDireccion());
                ps.setString(6, encriptado);
                ps.setString(7, usuarios.getCorreo());

                int fila = ps.executeUpdate();
                if (fila > 0) {
                    return true;
                } else {
                    return false;
                }

            } catch (Exception e) {
                System.out.println("Error" + e.getMessage());
                return false;
            }
        }

    }

    public ArrayList<BeanUsuario> listarUsuarios(int pagina, int numeRegistro) {
        PreparedStatement ps = null;

        ArrayList<BeanUsuario> listaUsuarios = new ArrayList<>();
        try {
            consulta = "SELECT * FROM usuario LIMIT ?,?";
            ps = conexion.prepareStatement(consulta);
            ps.setInt(1, pagina);
            ps.setInt(2, numeRegistro);

            ResultSet print = ps.executeQuery();

            while (print.next()) {
                BeanUsuario usuarios = new BeanUsuario();
                usuarios.setNombre1(print.getString("Nombre1"));
                usuarios.setApellido1(print.getString("Apellido1"));
                usuarios.setCorreo(print.getString("Correo"));
                usuarios.setDocumento(print.getString("Documento"));
                usuarios.setDireccion(print.getString("Direccion"));
                listaUsuarios.add(usuarios);

            }
            ps.close();
        } catch (Exception e) {

            System.out.println("Error " + e);

        }
        return listaUsuarios;
    }

    public int verRegistrosTotales() {
        PreparedStatement ps = null;
        int contador = 0;
        try {
            consulta = "SELECT * FROM usuario";
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

///*******//////PRUEBA DE CONSULTAS//////********///
    public static void main(String[] args) {

//        *****/////crear usuario////////******
//        DaoUsuario daoUs = new DaoUsuario();
//        BeanUsuario beanUs = new BeanUsuario();
//        beanUs.setNombre1("David");
//        beanUs.setNombre2("Andres");
//        beanUs.setApellido1("Daza");
//        beanUs.setApellido2("Diaz");
//        beanUs.setCorreo("falso@xxx.xx");
//        beanUs.setDireccion("Crea 105 n°154a-36");
//        beanUs.setDocumento("1026580077");
//        beanUs.setContraseña("123");
//        beanUs.setId_tipodocumento(1);
//        beanUs.setId_rol(2);
//        System.out.println(daoUs.crearUsuario(beanUs));
//        *****///////Verificar Usuario////////*****
//        DaoUsuario daoUs = new DaoUsuario();
//        BeanUsuario beanUs = new BeanUsuario();
//        beanUs.setCorreo("david.d.08@hooo");
//        beanUs.setContraseña("123");
//        System.out.println(daoUs.autenticarUsuario(beanUs));
//        *****///////Verificar Admin////////*****       
//        BeanUsuario beanUs = new BeanUsuario();
//        DaoUsuario daous = new DaoUsuario();
//        beanUs.setCorreo("david.d.08@h");
//        beanUs.setContraseña("123");
//        System.out.println(daous.autenticarAdmin(beanUs));
//        *****///////Verificar datos de ususario////////******         
//        DaoUsuario daous = new DaoUsuario();
//        BeanUsuario beanUs = new BeanUsuario();
//        beanUs.setCorreo("falso@xxx.xx");
//        System.out.println(beanUs.getCorreo());
//        daous.contruirObjetoUsuario(beanUs);
//        System.out.println(beanUs.getApellido1());
//        System.out.println(beanUs.getDireccion());
//        *****///////Verificar Correo////////*****
////        BeanUsuario beanUs = new BeanUsuario();
////        DaoUsuario daous = new DaoUsuario();
////        beanUs.setCorreo("falso@xxx.xx");
////        System.out.println(daous.validarCorreo(beanUs));
//        *****///////Listar Usuarios////////*****
//        BeanUsuario beanUs = new BeanUsuario();
//        DaoUsuario daous = new DaoUsuario();
//
//        ArrayList<BeanUsuario> listaUsuarios = new ArrayList<>();
//        beanUs.setId_rol(1);
//        listaUsuarios = daous.listarUsuarios(beanUs);
//        int contador = 1;
//        for (BeanUsuario listaUsuario : listaUsuarios) {
//
//            System.out.println("------Numero° " + contador++ + "-------");
//            System.out.println(listaUsuario.getNombre1());
//            System.out.println(listaUsuario.getApellido1());
//            System.out.println(listaUsuario.getCorreo());
//            System.out.println(listaUsuario.getDireccion());
//            System.out.println(listaUsuario.getDocumento());
//            System.out.println("___________________________");
//        }
//
//        BeanUsuario beanUs = new BeanUsuario();
//        DaoUsuario daous = new DaoUsuario();
//////        
//        beanUs.setContraseña("123");
//        beanUs.setCorreo("da@da");
//        beanUs.setDireccion("ahahaha no se");
//        
//        System.out.println(daous.actualizarDatosUsuario(beanUs)); 
//        
//        System.out.println(beanUs.getContraseña());
//        System.out.println(beanUs.getDireccion());
//
////  clave 123 encriptada es: 6116afedcb0bc31083935c1c262ff4c9
    }
}
