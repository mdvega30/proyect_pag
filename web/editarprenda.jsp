<%-- 
    Document   : editarprenda
    Created on : 15-mar-2017, 16:35:23
    Author     : David
--%>
<jsp:useBean id="beanPrenda" scope="page" class="modelo.BEAN.BeanPrenda"></jsp:useBean>
<jsp:useBean id="daoPrenda" scope="page" class="modelo.DAO.DaoPrenda"></jsp:useBean>
<jsp:useBean id="contPrendas" scope="page" class="controlador.ControladorPrendas"></jsp:useBean>
<jsp:useBean id="contUniforme" scope="page" class="controlador.ControladorUniforme"></jsp:useBean>
<jsp:useBean id="contTalla" scope="page" class="controlador.ControladorTalla"></jsp:useBean>
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
<link href="js/libreriasVista/select-multiple/css/multiple-select.css" rel="stylesheet" type="text/css"/>

<%    if (request.getParameter("idPrenda") != null) {

        beanPrenda.setIdPrenda(Integer.parseInt(request.getParameter("idPrenda")));
        beanPrenda = daoPrenda.verPrenda(beanPrenda);
    }
%>

<form method="POST" action="EditarPrenda" enctype="multipart/form-data" name="formEditarPr" id="form-AddUniforme">

    <div class="form-group">
        <label>Nombre de la prenda</label>
        <input type="hidden" value="<%=beanPrenda.getIdPrenda()%>" name="idEditP"/>
        <input type="text" name="txtPrenda" id="txtPrenda" placeholder="Nombre de la prenda" value="<%=beanPrenda.getNombre_Prenda()%>" class="form-control"/>
    </div>
    <div id="respuesta1" class="  alert-danger" ></div>

    <div class="form-group">
        <label>Descripción</label>
        <textarea  name="txaDescripcionP" id="txaDescripcionP" class="form-control input-sm" placeholder="Escriba una descripción de la prenda"><%=beanPrenda.getDescripcion_prenda()%></textarea>
    </div>
    <div id="respuesta3" class="  alert-danger" ></div>
    <div class="form-group">
        <label>Precio</label>
        <input type="number" name="txtPrecioP" placeholder="Precio" value="<%= beanPrenda.getPrecioPrenda()%>" class="form-control"/>
    </div>
    <div class="form-group">
        <label> Uniforme</label>
        <select id="tipoUniforme"  name="tipoUniforme" class="form-control">
            <%=contUniforme.getUniformes(beanPrenda)%>
        </select>
    </div>


    <div class="form-group">
        <label>Tallas para la prenda</label>
        <select id="selectTallass" name="selectTallass" multiple="multiple">
            <%= contTalla.getTallasPorPrendaAllTallas(beanPrenda)%>
        </select>
    </div>

    <div class="form-group">
        <label>Subir Imagen de Logo </label>
        <div class="input-group">
            <span class="input-group-btn">
                <span class="btn btn-info btn-file ">
                    Subir <input class="btn btn-default btn-file disabled btnfi" type="file" name="file" id="imgPren" accept="image/*" >
                </span>
            </span>
            <input type="text" id="imgPre" name="imgPre" class="form-control imgsubir" readonly value="<%=beanPrenda.getUrl_Diseño()%>">
        </div>
        <div id="respuesta1" class="  alert-danger" ></div>
        <br>
        <div id="contenedorimg">
            <img id='img-upload'/>
        </div>
    </div>
    <button class="btn btn-success btn-lg btnsubir" id="subir" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Guardar</button>
</form>
        <script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jsPrendas.js" type="text/javascript"></script>
<script src="js/libreriasVista/select-multiple/js/multiple-select.js" type="text/javascript"></script>
<script>
    $(function () {
        $('#selectTallass').change(function () {
            console.log($(this).val());
        }).multipleSelect({
            width: '100%'
        });
    });
</script>