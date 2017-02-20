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

        this.destinatario = "dadaza770@misena.edu.co";
        this.asunto = "Verificacion de correo Tuniforme";
        this.mensaje = "Hola <b>" + beanUsu.getNombre1() + "</b><br>"
                + "Por favor verifique su cuenta, visitando el siguiente enlace.<br>"
                + "http://localhost:8080/ProyectoSenaTuniforme/verificarCorreo.jsp?token="+beanUsu.getToken()+"";
        
        
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
