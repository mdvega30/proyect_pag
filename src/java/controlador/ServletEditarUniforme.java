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
import modelo.BEAN.BeanUniforme;
import modelo.DAO.DaoUniforme;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author David
 */
public class ServletEditarUniforme extends HttpServlet {

    private String carpeta = "Uniformes";
    private String path;
    private boolean isMultiPart;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        BeanUniforme beanUniforme = new BeanUniforme();
        DaoUniforme daoUniforme = new DaoUniforme();

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
                            case "txtnombreU":
                                beanUniforme.setNombre_uniforme(value);
                                break;
                            case "opTipoInsti":
                                beanUniforme.setInstitucion_idInstitucion(Integer.parseInt(value));
                                break;
                            case "opTipoU":
                                beanUniforme.setId_tipoUniforme(Integer.parseInt(value));
                                break;
                            case "txtPrecio":
                                beanUniforme.setPrecio(Double.parseDouble(value));
                                break;
                            case "textareaDescripU":
                                beanUniforme.setDescripcion_uniforme(value);
                                break;
                            case "imge":
                                beanUniforme.setUrl_diseño_Uniforme(value);
                                break;
                            case "opEstadoU":
                                beanUniforme.setEstadoUniforme(Boolean.parseBoolean(value));

                                break;
                            case "idEdits":
                                beanUniforme.setId_uniforme(Integer.parseInt(value));
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
                            beanUniforme.setUrl_diseño_Uniforme(item.getName());

                            String paths = getServletContext().getRealPath("/");//Se obtiene el path del la carpeta imagenes del servidor
                            String items = bns.getUrl_diseño_Uniforme();//El nombre del archivo es decir de la img

                            if (FileUpload.DeleteFile(paths, items, carpeta)) {//el metodo que se creo devuelve verdadero si se elimino correctamente 

                            }

                        }

                        beanUniforme.setUrl_diseño_Uniforme(item.getName());//trae el nombre de la imagen que se va a editar 
                        if (daoUniforme.actualizarUniforme(beanUniforme)) {//actualiza el uniforme
                            if (!item.getName().equals("")) {//Evalua que se haya subido una imagen al momento de editar
                                beanUniforme.setUrl_diseño_Uniforme(item.getName());
                                if (FileUpload.processFile(path, item, "Uniformes")) {//agrega la imagen al servidor 
                                    request.setAttribute("acualizado", "");
                                    request.getRequestDispatcher("Adduniformes.jsp").forward(request, response);

                                } else {
                                    request.setAttribute("noActualizado", "");
                                    request.getRequestDispatcher("Adduniformes.jsp").forward(request, response);
                                }
                            }
                            request.setAttribute("acualizado", "");
                            request.getRequestDispatcher("Adduniformes.jsp").forward(request, response);
                        } else {
                            request.setAttribute("noActualizado", "");
                            request.getRequestDispatcher("Adduniformes.jsp").forward(request, response);
                        }
                    }
                }
            } catch (FileUploadException fue) {
                fue.printStackTrace();
            }
        } else {
            request.getRequestDispatcher("Adduniformes.jsp").forward(request, response);
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
