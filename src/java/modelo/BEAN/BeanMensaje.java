/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.BEAN;

/**
 *
 * @author Andrés
 */
public class BeanMensaje {

    private int idMensajes;
    private int Usuario_idUsuario;
    private String Estado_Mensaje;
    private String Nombre;
    private String Apellido;
    private String Correo;
    private String Empresa;
    private String Fecha;
    private String Asunto;
    private String Mensaje;
    
    
       public BeanMensaje() {
    }

    public BeanMensaje(int idMensajes, int Usuario_idUsuario , String Estado_Mensaje, String Nombre,
            String Apellido, String Correo, String Empresa, String Fecha, String Asunto, String Mensaje) {
        this.idMensajes = idMensajes;
        this.Usuario_idUsuario = Usuario_idUsuario;
        this.Estado_Mensaje = Estado_Mensaje;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Correo = Correo;
        this.Empresa = Empresa;
        this.Fecha = Fecha;
        this.Asunto = Asunto;
        this.Mensaje = Mensaje;
    }

    public int getIdMensajes() {
        return idMensajes;
    }

    public void setIdMensajes(int idMensajes) {
        this.idMensajes = idMensajes;
    }

    public int getUsuario_idUsuario() {
        return Usuario_idUsuario;
    }

    public void setUsuario_idUsuario(int Usuario_idUsuario) {
        this.Usuario_idUsuario = Usuario_idUsuario;
    }

    public String getEstado_Mensaje() {
        return Estado_Mensaje;
    }

    public void setEstado_Mensaje(String Estado_Mensaje) {
        this.Estado_Mensaje = Estado_Mensaje;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getEmpresa() {
        return Empresa;
    }

    public void setEmpresa(String Empresa) {
        this.Empresa = Empresa;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getAsunto() {
        return Asunto;
    }

    public void setAsunto(String Asunto) {
        this.Asunto = Asunto;
    }

    public String getMensaje() {
        return Mensaje;
    }

    public void setMensaje(String Mensaje) {
        this.Mensaje = Mensaje;
    }

   
    
}

