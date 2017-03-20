<%@page import="modelo.BEAN.BeanUniforme"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanUniform" scope="page" class="modelo.BEAN.BeanUniforme"></jsp:useBean>
<jsp:useBean id="daoUnifor" scope="page" class="modelo.DAO.DaoUniforme"></jsp:useBean>
<jsp:useBean id="controInstitucion" scope="page" class="controlador.ControladorInstitucion"></jsp:useBean>
<jsp:useBean id="controTipoUniforme" scope="page" class="controlador.ControladorTipoUniforme"></jsp:useBean>
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


<%    if (request.getParameter("idUni") != null) {

        beanUniform.setId_uniforme(Integer.parseInt(request.getParameter("idUni")));
        beanUniform = daoUnifor.verUniforme(beanUniform);
    }
%>

<form method="POST" action="Editar" enctype="multipart/form-data" name="actualizar">

    <div class="form-group">
        <label>Nombre Uniforme</label>
        <input type="text" name="txtnombreU" placeholder="Nombre de Uniforme" value="<%= beanUniform.getNombre_uniforme()%>" class="form-control"/>

        <input type="hidden"  value="<%=beanUniform.getId_uniforme()%>" name="idEdits"/>
    </div>

    <div class="form-group">
        <label>Tipo uniforme</label>
        <select id="opTipoU" name="opTipoU" class="form-control">
            <%= controTipoUniforme.getTipoUniforme(beanUniform)%>
        </select>
    </div>
    <div class="form-group">
        <label>Instituciòn</label>
        <select id="opTipoInsti" name="opTipoInsti" class="form-control"  >
            <%=controInstitucion.getInstitucion(beanUniform)%>

        </select>
    </div>
    <div class="form-group">
        <label>Precio</label>
        <input type="number" name="txtPrecio" placeholder="Precio" value="<%= beanUniform.getPrecio()%>" class="form-control"/>
    </div>

    <div class="form-group">
        <label>Descripción</label>
        <textarea  name="textareaDescripU" id="textareaDescrip" class="form-control input-sm" placeholder="Escriba una descripción"><%=beanUniform.getDescripcion_uniforme()%></textarea>
    </div>
    <div class="form-group">
        <label>Estado</label><br>
        <select id="opEstadoU" name="opEstadoU" class="form-control">
            <%
                if (beanUniform.isEstadoUniforme()) {%>
            <option selected value="true">En venta</option>
            <option value="False">No está en venta</option>
            <%} else {%>
            <option selected value="False">No está en venta</option>
            <option  value="true">En venta</option>
            <%}%>
        </select>
    </div>


    <div class="form-group">
        <label>Cambiar Imagen</label>

        <div class="input-group">
            <span class="input-group-btn">
                <span class="btn btn-info btn-file ">
                    Subir <input class="btn btn-default btn-file disabled" type="file" name="file"  id="imgInp">
                </span>
            </span>
            <input type="text" name="imge" class="form-control" readonly value="<%=beanUniform.getUrl_diseño_Uniforme()%>">
        </div>
        <br>
        <div id="contenedorimg">
            <img id='img-upload'/>
        </div>

    </div>
    <button  class="btn btn-warning btn-lg mandaredit" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Actualizar</button>

</form>
<script src="js/_jspp.js" type="text/javascript"></script>


