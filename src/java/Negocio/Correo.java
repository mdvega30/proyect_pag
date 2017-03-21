package Negocio;

import modelo.BEAN.BeanUsuario;

public class Correo {

    private String destinatario;
    private String asunto;
    private String mensaje;

    public Correo(String destinatario, String asunto, String mensaje) {
        this.destinatario = destinatario;
        this.asunto = asunto;
        this.mensaje = mensaje;
    }

    public Correo() {
    }

    public void envirCorreeoDeVerificacion(BeanUsuario beanUsu) {

        this.destinatario = beanUsu.getCorreo();
        this.asunto = "Verificacion de correo Tuniforme";
        this.mensaje = "<img src=\"http://i67.tinypic.com/11v0gnk.png\" alt=\"\"/>"
                + "<h1 style=\" color:#3687c9\">Tuniforme.com</h1>"
                + "<br><h3>Hola <b>" + beanUsu.getNombre1() + "</b><br>"
                + "Por favor verifique su cuenta, visitando el siguiente enlace.<br>"
                + "http://localhost:8080/ProyectoSenaTuniforme/verificarCorreo.jsp?token="+beanUsu.getToken()+"</h3>";
        
        
        EnviarCorreo enviarVerificacion = new EnviarCorreo();
        enviarVerificacion.enviarCorreo(this);
        
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

}
