<%-- 
    Document   : Addprendas
    Created on : 14-mar-2017, 21:54:21
    Author     : David
--%>

<%@page import="controlador.ControladorUniforme"%>
<%@page import="modelo.DAO.DaoUniforme"%>
<%@page import="modelo.DAO.DaoUsuario"%>
<%@page import="modelo.BEAN.BeanUsuario"%>
<jsp:useBean id="controUniforme" scope="page" class="controlador.ControladorUniforme"></jsp:useBean>
<jsp:useBean id="controTalla" scope="page" class="controlador.ControladorTalla"></jsp:useBean>
<jsp:useBean id="controPrenda" scope="page" class="controlador.ControladorPrendas"></jsp:useBean>
<jsp:useBean id="beanPrenda" scope="page" class="modelo.BEAN.BeanPrenda"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <link rel="shortcut icon" href="imagenes/icono.png">  
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
        <link href="js/libreriasVista/select-multiple/css/multiple-select.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Prenda</title>
    </head>
    <body>
        <%  BeanUsuario beanUs = new BeanUsuario();
            DaoUsuario daoUs = new DaoUsuario();
            beanUs.setCorreo(usuario1);
            daoUs.contruirObjetoUsuario(beanUs);
        %>
    <nav class="navbar navbar-inverse" >
        <div class="container">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="menu.jsp"><img src="imagenes/icono.png" alt=""/></a>

                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">

                        <li><a href="menuAdmin.jsp">Inicio</a></li>

                        <!--Menu desplegable-->
                        <li class="dropdown ">

                            <a href="#" class="glyphicon glyphicon-wrench " data-toggle="dropdown" > Opciones  <span class="caret "></span> </a>

                            <ul class="dropdown-menu ">

                                <li class="col-sm-3">
                                <li><a href="menuA_listar.jsp?pagina=0"><i class="glyphicon glyphicon-list"></i> Listar de Usuarios </a></li>



                            </ul>
                        </li>
                        <!--Menu fin desplegable-->
                        <!--Menu desplegable-->
                        <li class="dropdown ">

                            <a href="#" class="glyphicon glyphicon-option-vertical " data-toggle="dropdown" > Agregar/Editar  <span class="caret "></span> </a>

                            <ul class="dropdown-menu ">

                                <li class="col-sm-3">
                                <li><a href="Addinstitucion.jsp"><i class="glyphicon glyphicon-tasks"></i> Construir Uniforme </a></li>
                                <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Prendas </a></li>
                                <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Instituciones </a></li>



                            </ul>
                        </li>
                        <!--Menu fin desplegable-->
                        <!--Menu desplegable-->
                        <li class="dropdown ">

                            <a href="#" class="glyphicon glyphicon-globe " data-toggle="dropdown" > Redes Sociales  <span class="caret "></span> </a>

                            <ul class="dropdown-menu ">
                                <li class="col-sm-3">
                                <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> FaceBook </a></li>
                                <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Twitter </a></li>
                            </ul>
                        </li>
                        <!--Menu fin desplegable-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown"><img src="imagenes/avatar4.png" alt=""/><b> <%= beanUs.getNombre1()%></b> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="listarMensajes.jsp"><i class="icon-envelope"></i> Mensajes <span class="badge badge-info">4</span></a></li>
                                <li><a href="iniciar?textOpcion=3">Salir<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>  
                                <li class="divider"></li>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!--Fin nav var-->
    <div class="container">
        <!--INICIO ALETARS O RESPUESTAS DE SERVIDOR-->
        <br>
        <div id="alerta">
            <%

                if (request.getAttribute("acualizado") != null) { %>
            <div class="alert alert-success">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Felicidades!</strong> La acción ha culminado satisfactoriamente.
                ${acualizado}
            </div>
            <%} else if (request.getAttribute("noActualizado") != null) { %>
            <div class="alert alert-danger">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Error!</strong> No se ha podido culminar satisfactoriamente.
                <strong>!</strong>${noActualizado}
            </div>
            <% }%>
        </div>
        <!--FIN ALETARS O RESPUESTAS DE SERVIDOR-->

        <!--INICIO DE INFORMACION DE PAGINA-->
        <br>
        <div class="alert alert-info">
            <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>
            <strong>Buen dia aqui podra agregar las prendas de cada uniforme agregado</strong> <br>Esto se vera en el detalle del uniforme del catalogo.
        </div>
        <!--FIN DE INFORMACION DE PAGINA-->
    </div><!--FIN CONTAINER-->

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="panel with-nav-tabs panel-primary">
                    <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li><a href="Addinstitucion.jsp" >Paso 1</a></li>
                            <li><a href="Adduniformes.jsp">Paso 2</a></li>
                            <li class="active"><a href="Addprendas.jsp">Paso 3</a></li>

                        </ul>
                    </div>
                    <div class="panel-body"><!--CUERPO DEL TAB-->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="tab1default">
                                <!--INICIO BOTONES DE OPC-->
                                <button type="button" class="btn icon-btn btn-success nt" data-toggle="modal" data-target="#myModal"><a class="btn icon-btn btn-success"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Agergar</a></button>
                                <button type="button" class="btn icon-btn btn-info"><a class="btn icon-btn btn-info" href="catalogo.jsp"><span class="glyphicon btn-glyphicon glyphicon-link img-circle text-success"></span>Ver Catalogo</a></button>
                                <!--INICIO BOTONES DE OPC-->

                                <!-- Modal AGREGAR-->
                                <div class="modal fade" id="myModal" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal contenido-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Agregue una Prenda</h4>
                                            </div>
                                            <div class="modal-body">
                                                <!--Inicio form insertyar datos-->
                                                <form method="POST" action="Prendas" enctype="multipart/form-data" name="formInsert" id="form-AddUniforme">

                                                    <div class="form-group">
                                                        <label>Nombre de la prenda</label>
                                                        <input type="text" name="txtPrenda" id="txtPrenda" placeholder="Nombre de la prenda" value="" class="form-control"/>
                                                    </div>
                                                    <div id="respuesta4" class="  alert-danger" ></div>

                                                    <div class="form-group">
                                                        <label>Descripción</label>
                                                        <textarea  name="txaDescripcionP" id="txaDescripcionP" class="form-control input-sm" placeholder="Escriba una descripción de la prenda"></textarea>
                                                    </div>
                                                    <div id="respuesta3" class="  alert-danger" ></div>
                                                    <div class="form-group">
                                                        <label>Precio</label>
                                                        <input type="number" name="txtPrecioP" placeholder="Precio" value="" class="form-control"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label> Uniforme</label>
                                                        <select id="tipoUniforme"  name="tipoUniforme" class="form-control">
                                                            <%=controUniforme.getUniformes(beanPrenda)%>
                                                        </select>
                                                    </div>


                                                    <div class="form-group">
                                                        <label>Tallas para la prenda</label>
                                                        <select id="selectTallas" name="selectTallas" multiple="multiple">
                                                            <%= controTalla.getTallas()%>
                                                        </select>
                                                    </div>



                                                    <div class="form-group">
                                                        <label>Subir Imagen de Logo </label>
                                                        <div class="input-group">
                                                            <span class="input-group-btn">
                                                                <span class="btn btn-info btn-file ">
                                                                    Subir <input class="btn btn-default btn-file disabled btnfi" type="file" name="file" id="imgPren"  accept="image/*" >
                                                                </span>
                                                            </span>
                                                            <input type="text" class="form-control imgsubir" readonly>
                                                        </div>
                                                        <div id="respuesta1" class="  alert-danger" ></div>
                                                        <br>
                                                        <div id="contenedorimg">
                                                            <img id='img-upload'/>
                                                        </div>
                                                    </div>
                                                    <button class="btn btn-success btn-lg btnsubir" id="subir" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Guardar</button>
                                                </form>
                                                <!--Fin formulario agregar-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Fin  Modal-->

                    <!---INICIO TABLA--->

                    <!-- Tabla responsive-->
                    <%int pagina = 0; //pagina a mostrar
                        if (request.getParameter("pagina") == null) {
                            pagina = 0;
                        } else {
                            pagina = Integer.valueOf(request.getParameter("pagina"));
                        }
                    %>
                    <div class="container">
                        <div class="row">
                            <br>

                            <div class="col-md-11">
                                <h4>Prendas de uniformes</h4>
                                <div class="table-responsive">
                                    <table id="mytable" class="table table-bordred table-striped">
                                        <thead>

                                        <th>N°</th>
                                        <th>Nombre de la prenda</th>
                                        <th class="tx">Descripción</th>
                                        <th>Precio</th>
                                        <th class="tx">Diseño</th>
                                        <th>Institución</th>
                                        <th>Uniforme</th>
                                        <th class="tx">Talla</th>

                                        <th>Editar</th>
                                        <th>Eliminar</th>



                                        </thead>
                                        <tbody>

                                            <%= controPrenda.listarPrendas(pagina, 10)%>

                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                    <ul class="pagination pull-left">



                                        <%if (pagina > 1) {%> 
                                        <li class=""><a href="?pagina=<%=pagina - 1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                                <%} else {%>
                                        <li class="disabled"><a ><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                                <%}%>
                                                <%
                                                    int numeroRegistros = controPrenda.getNumerodeRegistros();
                                                    int numerPagina = numeroRegistros / 10;

                                                    for (int i = 0; i <= numerPagina; i++) {

                                                        if (i == pagina) {
                                                %>
                                        <li class="active"><a href="?pagina=<%=(i)%>"><%=i + 1%></a></li> 

                                        <%} else {
                                        %>
                                        <li class=""><a href="?pagina=<%=(i)%>"><%=i + 1%></a></li> 

                                        <%}
                                            }%>
                                        <%if (pagina < numerPagina) {%> 
                                        <li><a href="?pagina=<%=pagina + 1%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>

                                        <%} else {%>
                                        <li class="disabled" ><a><span class="glyphicon glyphicon-chevron-right"></span></a></li>

                                        <%}%>
                                    </ul>

                                </div>



                                <!--INICIO Modal para Editar-->
                                <div class="modal fade" id="editPrenda" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                                <h4 class="modal-title custom_align" id="Heading">Editar Uniforme</h4>
                                            </div>

                                            <div class="modal-body">
                                                <input type="hidden" name="txtOpc" value="3">
                                                <div class="formularioEditarPrenda"></div>
                                            </div>
                                            <div class="modal-footer ">
                                            </div>
                                        </div>
                                        <!-- /.modal-content --> 
                                    </div>
                                    <!-- /.modal-dialog --> 
                                </div>   
                                <!--FIN Modal para Editar-->









                                <!--INICIO Modal para Eliminar-->
                                <form method="POST" action="EditarPrenda" name="formEliminar" >
                                    <div class="modal fade" id="deletePrenda" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                                        <div class="modal-dialog">

                                            <div class="build-list">

                                            </div>
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <input type="hidden" class="idDeletePre" value="5" name="idDeletePre"/>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                                    <h4 class="modal-title custom_align" id="Heading">Borrar este articulo</h4>
                                                </div>
                                                <div class="modal-body">

                                                    <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>¿Esta usted seguro de eliminar esta Institución?</div>

                                                </div>
                                                <div class="modal-footer ">
                                                    <button  class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> SI</button>
                                                    <input type="hidden" name="txtOpc" value="2">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>

                                                </div>
                                            </div>
                                            <!-- /.modal-content --> 
                                        </div>
                                        <!-- /.modal-dialog --> 
                                    </div>
                                </form>
                                <!--FIN Modal para Eliminar-->


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>












    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jsPrendas.js" type="text/javascript"></script>
    <script src="js/libreriasVista/select-multiple/js/multiple-select.js" type="text/javascript"></script>
    <script>
        $(function () {
            $('#selectTallas').change(function () {
                console.log($(this).val());
            }).multipleSelect({
                width: '100%'
            });
        });
    </script>
</body>
</html>
