/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.BEAN.BeanUsuario;
import modelo.DAO.DaoUsuario;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author David
 */
public class ServletUsuario extends HttpServlet {

    private static final String PATTERN_EMAIL = "/\\w+@\\w+\\.+[a-z]/";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int opcion = Integer.parseInt(request.getParameter("textOpcion"));
        BeanUsuario beanUs = new BeanUsuario();
        DaoUsuario daoUsu = new DaoUsuario();

        beanUs.setNombre1(request.getParameter("nombre1"));
        beanUs.setNombre2(request.getParameter("nombre2"));
        beanUs.setApellido1(request.getParameter("apellido1"));
        beanUs.setApellido2(request.getParameter("apellido2"));
        beanUs.setDireccion(request.getParameter("direccion"));
        beanUs.setDocumento(request.getParameter("doc"));
        beanUs.setCorreo(request.getParameter("correo"));
        beanUs.setContraseña(request.getParameter("pass"));
        beanUs.setId_rol(1);
        BeanUsuario BeanUsuario = beanUs;

        switch (opcion) {
            case 1://Autentica el usuario (Contraseña,correo) y el rol

                if (daoUsu.autenticarAdmin(beanUs)) {

                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("admin", beanUs.getCorreo());
                    sesion.setAttribute("nombre", beanUs.getNombre1());
                    request.setAttribute("exito", "");
                    request.getRequestDispatcher("menuAdmin.jsp").forward(request, response);

                } else if (daoUsu.autenticarUsuario(beanUs)) {

                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("usuario", beanUs.getCorreo());
                    sesion.setAttribute("nombre", beanUs.getNombre1());
                    sesion.setAttribute("nombre2", beanUs.getNombre2());
                    sesion.setAttribute("apellido1", beanUs.getApellido1());
                    sesion.setAttribute("apellido2", beanUs.getApellido2());
                    sesion.setAttribute("direccion", beanUs.getDireccion());
                    sesion.setAttribute("correo", beanUs.getCorreo());

                    request.getRequestDispatcher("menu.jsp").forward(request, response);

                } else {
                    request.setAttribute("error", "");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

                break;

            case 2://Registra el ususario
                beanUs.setId_tipodocumento(Integer.parseInt(request.getParameter("tipoDoc")));
                if (daoUsu.crearUsuario(beanUs)) {
                    request.setAttribute("registro", "");
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                } else {
                    request.setAttribute("error", "");

                    request.getRequestDispatcher("registro.jsp").forward(request, response);
                }
                break;

            case 3://Destruye la sesion
                HttpSession sesion = request.getSession(true);
                sesion.invalidate();
                response.sendRedirect("index.jsp");
                break;

            case 4://verifica la existencia de un correo 
                boolean responseUserExist = daoUsu.validarCorreo(beanUs);
                if (responseUserExist) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    out.print("ok");
                } else {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    out.print("false");
                }

                break;
            case 5://Actualizar cuenta 
                HttpSession sesiones = request.getSession(false);
                String correoss = (String) sesiones.getAttribute("correo");
                beanUs.setCorreo(correoss);

                if (daoUsu.actualizarDatosUsuario(beanUs)) {

                    request.setAttribute("acualizado", "");
                    request.getRequestDispatcher("menu.jsp").forward(request, response);

                } else {

                    request.setAttribute("noActualizado", "");
                    request.getRequestDispatcher("menu.jsp").forward(request, response);

                }

                break;
            case 6://Validate form
                // Compiles the given regular expression into a pattern.
                Pattern pattern = Pattern.compile(PATTERN_EMAIL);
                // Match the given input against this pattern
                Matcher matcher = pattern.matcher(beanUs.getCorreo());
                String error = "ok";

//                if (!matcher.matches()) {
//                    error += "Digite un correo valido<br>";
//                }
                if (beanUs.getNombre1().length() < 1 || beanUs.getNombre1().length() > 50) {
                    error += "El campo nombre debe tener entre 1 y 50 caracteres<br>";
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.print(error);
                break;
            case 7:

                break;

            default:
                throw new AssertionError();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
