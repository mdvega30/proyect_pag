
package Negocio;

import java.util.Properties;


public class EnviarCorreo {
    
    private boolean enviado;
    public boolean enviarCorreo(String para, String mensaje,String asusnto){
        
        
        try {
            String host = "smtp.gmail.com";
            Properties propiedades = System.getProperties();
            propiedades.put("mail.smtp.starttls.enable", "true");
           
        } catch (Exception e) {
        }
        
        
        return enviado = false;
    }
    
    
    
}
