/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAO;

import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.*;
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
 		PreparedStatement ps ;

		try {
			conexion = this.ObternerConexion();
			consulta = "call insertarMensaje(?,?,?,?,?,?,?,?,?)";
			ps = conexion.prepareCall(consulta);

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

	public static void main(String[] args) {

		DaoMensaje ms = new DaoMensaje();
		BeanMensaje bnMs = new BeanMensaje();
		bnMs.setUsuario_idUsuario(1);
		bnMs.setNombre("ss");
		bnMs.setApellido("apesdlsso");
		bnMs.setAsunto("aaas");
		bnMs.setEstado_Mensaje("assaagfdg");
		bnMs.setFecha("AAAss");
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
