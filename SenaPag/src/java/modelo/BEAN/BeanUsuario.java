package modelo.BEAN;

public class BeanUsuario {

    private int Id_Usuario;
    private int Id_tipodocumento;
    private int id_rol;
    private String Nombre1;
    private String Nombre2;
    private String Apellido1;
    private String Apellido2;
    private String Documento;
    private String Correo;
    private String Direccion;

   

    public BeanUsuario() {
    }

    public BeanUsuario(int Id_Usuario, int Id_tipodocumento, int id_rol, String Nombre1, String Nombre2, String Apellido1, String Apellido2, String Documento, String Correo, String Direccion, String Contraseña) {
        this.Id_Usuario = Id_Usuario;
        this.Id_tipodocumento = Id_tipodocumento;
        this.id_rol = id_rol;
        this.Nombre1 = Nombre1;
        this.Nombre2 = Nombre2;
        this.Apellido1 = Apellido1;
        this.Apellido2 = Apellido2;
        this.Documento = Documento;
        this.Correo = Correo;
        this.Direccion = Direccion;
        this.Contraseña = Contraseña;
    }
    

    
 public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }
    private String Contraseña;
    
    public int getId_Usuario() {
        return Id_Usuario;
    }

    public void setId_Usuario(int Id_Usuario) {
        this.Id_Usuario = Id_Usuario;
    }

    public String getNombre1() {
        return Nombre1;
    }

    public void setNombre1(String Nombre1) {
        this.Nombre1 = Nombre1;
    }

    public String getNombre2() {
        return Nombre2;
    }

    public void setNombre2(String Nombre2) {
        this.Nombre2 = Nombre2;
    }

    public String getApellido1() {
        return Apellido1;
    }

    public void setApellido1(String Apellido1) {
        this.Apellido1 = Apellido1;
    }

    public String getApellido2() {
        return Apellido2;
    }

    public void setApellido2(String Apellido2) {
        this.Apellido2 = Apellido2;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    public int getId_tipodocumento() {
        return Id_tipodocumento;
    }

    public void setId_tipodocumento(int Id_tipodocumento) {
        this.Id_tipodocumento = Id_tipodocumento;
    }
      public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

}
