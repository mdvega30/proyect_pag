/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Negocio.FileUpload;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.BEAN.BeanPrenda;
import modelo.DAO.DaoPrenda;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author David
 */
public class ServletPrenda extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String carpeta;
    private boolean isMultiPart;
    private String path;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /**
         * Instancia objetos de tipo prenda
         */
        BeanPrenda beanPrenda = new BeanPrenda();
        DaoPrenda daoPrenda = new DaoPrenda();
        carpeta = "Prendas";

        /**
         * Inserta la prenda
         */
        isMultiPart = ServletFileUpload.isMultipartContent(request);//obtiene todos los valores y nombres de los campos
        if (isMultiPart) {//Valida que sea correcto
            ServletFileUpload upload = new ServletFileUpload();//instancia el metodo de coomons upload
            try {
                FileItemIterator itr = upload.getItemIterator(request);//obtiene cada campo del form
                while (itr.hasNext()) {//lo recorre
                    FileItemStream item = itr.next();
                    if (item.isFormField()) {//Valida que sean campos y no tipo FILE
                        //Hace los pocesos especificos del campo
                        String fieldName = item.getFieldName();//obtiene el nombre
                        InputStream is = item.openStream();
                        byte[] b = new byte[is.available()];//crea array de bits y le da el tamaño por cada item
                        is.read(b);
                        String value = new String(b);//Obtiene el valor del campo
                        switch (fieldName) {//obtiene el nombre y los divide en un switch para ahcerle el tratamiento especifico a cada campo
                            case "txtPrenda":
                                beanPrenda.setNombre_Prenda(value);
                                break;
                            case "txaDescripcionP":
                                beanPrenda.setDescripcion_prenda(value);
                                break;
                            case "tipoUniforme":
                                beanPrenda.setUniforme_idUniforme(Integer.parseInt(value));

                                break;
                            case "imgPren":
                                beanPrenda.setUrl_Diseño(value);

                                break;
                            case "tallaUni":
                                beanPrenda.setIdTalla(Integer.parseInt(value));

                                break;
                            default:

                        }
//                        response.getWriter().println(fieldName + ":" + value
//                                + "<br/>");

                    } else {
                        // Hace lo especifico al archivo
                        path = getServletContext().getRealPath("/");//Pat del servidor
                        //Lama metodo para procesar y subir el archivo
                        beanPrenda.setUrl_Diseño(item.getName());//

                        if (daoPrenda.insertarPrenda(beanPrenda)) {

                            if (FileUpload.processFile(path, item, carpeta)) {
                                request.setAttribute("acualizado", "Se a guardado el archivo y los datos correctamente");
                                request.getRequestDispatcher("Addprendas.jsp").forward(request, response);

                                response.getWriter().print("pribando 1");
                            } else {
                                request.setAttribute("noActualizado", "No se pudo guardar el archivo");
                                request.getRequestDispatcher("Addprendas.jsp").forward(request, response);
                                response.getWriter().print("pribando 2");
                            }
                        } else {
                            request.setAttribute("noActualizado", "No se puedo insertar ");
                            request.getRequestDispatcher("Addprendas.jsp").forward(request, response);
                            response.getWriter().print("pribando 2");
                        }
                    }
                }
            } catch (FileUploadException fue) {
                fue.printStackTrace();
            }

        } else {
            request.getRequestDispatcher("Addinstitucion.jsp").forward(request, response);
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
