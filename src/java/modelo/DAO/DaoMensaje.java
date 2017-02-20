/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAO;

import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import modelo.BEAN.BeanMensaje;

/**
 *
 * @author Andrés
 */
public class DaoMensaje extends Conexion {

    private Connection conexion = null;
    private Statement statement = null;
    private String consulta = "";

    public DaoMensaje() {
        super();

        try {
            conexion = this.ObternerConexion();
            statement = conexion.createStatement();
        } catch (Exception e) {
        }
    }

    public boolean crearMensaje(BeanMensaje beanMen) {
        PreparedStatement ps = null;

        try {

            consulta = "call insertarMensaje(?,?,?,?,?,?,?,?,?)";
            ps = conexion.prepareCall(consulta);
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            beanMen.setUsuario_idUsuario(1);
            ps.setInt(1, beanMen.getUsuario_idUsuario());
            ps.setString(2, beanMen.getEstado_Mensaje());
            ps.setString(3, beanMen.getNombre());
            ps.setString(4, beanMen.getApellido());
            ps.setString(5, beanMen.getCorreo());
            ps.setString(6, beanMen.getEmpresa());
            ps.setString(7, beanMen.getFecha());
            ps.setString(8, beanMen.getAsunto());
            ps.setString(9, beanMen.getMensaje());

            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error " + e);
            e.printStackTrace();
        }
        return false;

    }

    public ArrayList<BeanMensaje> listarMensajes(int pagina, int numeRegistro) {
        PreparedStatement ps = null;

        ArrayList<BeanMensaje> listaMensaje = new ArrayList<>();
        try {
            consulta = "SELECT * FROM mensajes LIMIT ?,?";
            ps = conexion.prepareStatement(consulta);
            ps.setInt(1, pagina);
            ps.setInt(2, numeRegistro);

            ResultSet print = ps.executeQuery();

            while (print.next()) {
                BeanMensaje mensajes = new BeanMensaje();
                mensajes.setNombre(print.getString("Nombre"));
                mensajes.setApellido(print.getString("Apellido"));
                mensajes.setCorreo(print.getString("Correo"));
                mensajes.setEmpresa(print.getString("Empresa"));
                mensajes.setFecha(print.getString("Fecha"));
                mensajes.setAsunto(print.getString("Asunto"));
                mensajes.setMensaje(print.getString("Mensaje"));
                listaMensaje.add(mensajes);

            }
            ps.close();
        } catch (Exception e) {

            System.out.println("Error " + e);

        }
        return listaMensaje;
    }

    public int verRegistrosMensajes() {
        PreparedStatement ps = null;
        int contador = 0;
        try {
            consulta = "SELECT * FROM mensajes";
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

        java.util.Date ahora = new java.util.Date();
        SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        DaoMensaje ms = new DaoMensaje();
        BeanMensaje bnMs = new BeanMensaje();
        bnMs.setUsuario_idUsuario(1);
        bnMs.setNombre("ss");
        bnMs.setApellido("apesdlsso");
        bnMs.setAsunto("aaas");
        bnMs.setEstado_Mensaje("assaagfdg");
        bnMs.setFecha("2017-02-14-02:01:49");
        bnMs.setCorreo("FCDFSFD");
        bnMs.setEmpresa("dsffdsdf");
        bnMs.setMensaje("asdfdsdsad");

        if (ms.crearMensaje(bnMs)) {

            System.out.println("Agregado ddd");
        } else {
            System.out.println("No creado");
        }

    }

}
