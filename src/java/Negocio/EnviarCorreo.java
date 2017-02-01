package Negocio;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnviarCorreo {

    private boolean enviado;
    private String correo;
    private String contrasena;

    public EnviarCorreo() {

    }

    public boolean enviarCorreo(Correo datosCorreo) {
        correo = "javamailtuniforme@gmail.com";
        contrasena = "wgsqfsvgblazwchm";//Generador de contraseña para aplicaciones gmail
        try {
            // Propiedades de la conexión
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", correo);
            props.setProperty("mail.smtp.auth", "true");

            // Preparamos la sesion
            Session session = Session.getDefaultInstance(props);

            // Contruir mensaje
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(correo));//De donde se envia el correo
            message.addRecipient(
                    Message.RecipientType.TO,
                    new InternetAddress(datosCorreo.getDestinatario()));//Destinatario
            message.setSubject(datosCorreo.getAsunto());//Asunto del mensaje 
            message.setContent(datosCorreo.getMensaje(), "text/html; charset=utf-8");
//          message.setText(datosCorreo.getMensaje());//Cuerpo o contenido dle mensaje

            // Enviar correo
            Transport t = session.getTransport("smtp");
            t.connect(correo, contrasena);//contraseña y correo de la cuenta
            t.sendMessage(message, message.getAllRecipients());

            // Cierre.
            t.close();
            return enviado = true;
        } catch (Exception e) {
            e.printStackTrace();

            return enviado = false;
        }
    }

}
