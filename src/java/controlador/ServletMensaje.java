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
import modelo.BEAN.BeanMensaje;
import modelo.DAO.DaoMensaje;

/**
 *
 * @author David
 */
public class ServletMensaje extends HttpServlet {

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

        if (request.getParameter("textMensaje") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        int opcion = Integer.parseInt(request.getParameter("textMensaje"));
        BeanMensaje beanMs = new BeanMensaje();
        beanMs.setEstado_Mensaje("Estado");
        beanMs.setNombre(request.getParameter("nombre"));
        beanMs.setApellido(request.getParameter("apellido"));
        beanMs.setCorreo(request.getParameter("correo"));
        beanMs.setEmpresa(request.getParameter("empresa"));
        beanMs.setFecha(request.getParameter("fecha"));
        beanMs.setAsunto(request.getParameter("asunto"));
        beanMs.setMensaje(request.getParameter("mensaje"));
        beanMs.setUsuario_idUsuario(1);

        switch (opcion) {
            case 1: //Agregar Registro
                DaoMensaje daoMs = new DaoMensaje();

                if (daoMs.crearMensaje(beanMs)) {
                    
                    request.setAttribute("exito", "El mensaje se ha enviado");
                    request.getRequestDispatcher("contactenos.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "<script> alert('EL MENSAJE NO FUE ENVIADO')</script>");
                }
                request.getRequestDispatcher("contactenos.jsp").forward(request, response);
                break;
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
