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
import modelo.BEAN.BeanInstitucion;
import modelo.BEAN.BeanUniforme;
import modelo.DAO.DaoInstitucion;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author David
 */
public class ServletEditarInstitucion extends HttpServlet {

    private String carpeta;
    private String path;
    private boolean isMultiPart;

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

        BeanInstitucion beanInstitucion = new BeanInstitucion();
        DaoInstitucion daoInstitucion = new DaoInstitucion();
        carpeta = "institucion";

        ///elimina
        if (request.getParameter("txtOpc") != null && Integer.parseInt(request.getParameter("txtOpc")) == 2
                && request.getParameter("idEliminarIns") != null) {
            beanInstitucion.setId_institucion(Integer.parseInt(request.getParameter("idEliminarIns")));
            BeanInstitucion beanInstitu = daoInstitucion.verUniforme(beanInstitucion);
            if (beanInstitu.getUrl_logo_institucion() != null) {

                String path = getServletContext().getRealPath("/");//Se obtiene el path del la carpeta imagenes del servidor
                String item = beanInstitu.getUrl_logo_institucion();//El nombre del archivo es decir de la img
                if (daoInstitucion.eliminarInstitucion(beanInstitu)) {

                    if (FileUpload.DeleteFile(path, item, carpeta)) {//el metodo que se creo devuelve verdadero si se elimino correctamente 
                        request.setAttribute("acualizado", "");
                        request.getRequestDispatcher("Adduniformes.jsp").forward(request, response);

                    } else {
                        request.setAttribute("noActualizadoS", "");
                        request.getRequestDispatcher("Adduniformes.jsp").forward(request, response);

                    }

                } else {
                    request.setAttribute("noActualizado", "");
                    request.getRequestDispatcher("Adduniformes.jsp").forward(request, response);

                }
            } else {
                request.setAttribute("noActualizado", "");
                request.getRequestDispatcher("Adduniformes.jsp").forward(request, response);
            }

        }

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
                            case "txtInstitucion":
                                beanInstitucion.setNombre_intitucion(value);
                                break;
                            case "idEdits":
                                beanInstitucion.setId_institucion(Integer.parseInt(value));
                                break;
                            case "txaDescripcion":
                                beanInstitucion.setDescripcion_institucion(value);
                                break;
                            case "tipoInstitucion":
                                beanInstitucion.setId_tipoInstitucion(Integer.parseInt(value));
                                break;
                            case "nomImgen":
                                beanInstitucion.setUrl_logo_institucion(value);
                                break;
                            default:

                        }
//                        response.getWriter().println(fieldName + ":" + value
//                                + "<br/>");

                    } else {
                        // Hace lo especifico al archivo
                        path = getServletContext().getRealPath("/");//Pat del servidor
                        //Lama metodo para procesar y subir el archivo
                        BeanUniforme bns = new BeanUniforme();

                        if (bns.getUrl_diseño_Uniforme() != null) {///Pendiente para eliminar el archivo y agregar el nuevo archivo
                            beanInstitucion.setUrl_logo_institucion(item.getName());

                            String paths = getServletContext().getRealPath("/");//Se obtiene el path del la carpeta imagenes del servidor
                            String items = bns.getUrl_diseño_Uniforme();//El nombre del archivo es decir de la img

                            if (FileUpload.DeleteFile(paths, items, carpeta)) {//el metodo que se creo devuelve verdadero si se elimino correctamente 

                            }

                        }

                        beanInstitucion.setUrl_logo_institucion(item.getName());//trae el nombre de la imagen que se va a editar 
                        if (daoInstitucion.actualizarInstitucion(beanInstitucion)) {//actualiza el uniforme
                            if (!item.getName().equals("")) {//Evalua que se haya subido una imagen al momento de editar
                                beanInstitucion.setDescripcion_institucion(item.getName());
                                if (FileUpload.processFile(path, item, carpeta)) {//agrega la imagen al servidor 
                                    request.setAttribute("acualizado", "");
                                    request.getRequestDispatcher("Addinstitucion.jsp").forward(request, response);

                                } else {
                                    request.setAttribute("noActualizado", "");
                                    request.getRequestDispatcher("Addinstitucion.jsp").forward(request, response);
                                }
                            }
                            request.setAttribute("acualizado", "");
                            request.getRequestDispatcher("Addinstitucion.jsp").forward(request, response);
                        } else {
                            request.setAttribute("noActualizado", "");
                            request.getRequestDispatcher("Addinstitucion.jsp").forward(request, response);
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
