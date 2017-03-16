<%-- 
    Document   : editarprenda
    Created on : 15-mar-2017, 16:35:23
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesion = request.getSession(false);
    String usuario1 = (String) sesion.getAttribute("admin");
    String usuario2 = (String) sesion.getAttribute("usuario");
    String nombre = (String) sesion.getAttribute("nombre");

    if (sesion.getAttribute("usuario") != null) {
        response.sendRedirect("menu.jsp");
    } else if (sesion.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    }


%>


<%    if (request.getParameter("idInstitucion") != null) {

        beanInstitucion.setId_institucion(Integer.parseInt(request.getParameter("idInstitucion")));
        beanInstitucion = daoInstitucion.verUniforme(beanInstitucion);
    }
%>

<form method="POST" action="EditarInstitucion" enctype="multipart/form-data" name="actualizar">

    <div class="form-group">
        <label>Nombre Institución</label>
        <input type="text" name="txtInstitucion" id="txtInstitucion" placeholder="Nombre de Institucion" value="<%= beanInstitucion.getNombre_intitucion()%>" class="form-control"/>
        <input type="hidden" value="<%=beanInstitucion.getId_institucion()%>" name="idEdits"/>
        <div id="respuesta1" class="  alert-danger" ></div>
    </div>

    <div class="form-group">
        <label>Descripción</label>
        <textarea  name="txaDescripcion" id="txaDescripcion" class="form-control input-sm" placeholder="Escriba una descripción de la institucion"><%= beanInstitucion.getDescripcion_institucion()%></textarea>
    </div>
    <div id="respuesta3" class="  alert-danger" ></div>


    <div class="form-group">
        <label>Tipo de Institución</label>
        <select id="tipoInstitucion" name="tipoInstitucion" class="form-control">
            <option value="1">Escolar</option>
        </select>
    </div>
    <div class="form-group">
        <label>Nueva Imagen de logo</label>
        <div class="input-group">
            <span class="input-group-btn">
                <span class="btn btn-info btn-file ">
                    Subir <input class="btn btn-default btn-file disabled btnfi" type="file" name="file" id="imgInp"  accept="image/*" >
                </span>
            </span>
            <input type="text" name="nomImgen" id="nomImgen" class="form-control imgsubir" readonly value="<%=beanInstitucion.getUrl_logo_institucion()%>">
        </div>
        <div id="respuesta1" class="  alert-danger" ></div>
        <br>
        <div id="contenedorimg">
            <img id='img-upload'/>
        </div>
    </div>

    <button  class="btn btn-warning btn-lg mandaredit" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Actualizar</button>
</form>

<script src="js/jsInstitucion.js" type="text/javascript"></script>

