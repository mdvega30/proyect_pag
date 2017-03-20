<%-- 
    Document   : Addinstitucion
    Created on : 10-mar-2017, 13:15:47
    Author     : David
--%>

<%@page import="modelo.DAO.DaoInstitucion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.BEAN.BeanInstitucion"%>
<%@page import="modelo.BEAN.BeanUniforme"%>
<%@page import="modelo.DAO.DaoUsuario"%>
<%@page import="modelo.BEAN.BeanUsuario"%>
<jsp:useBean id="contTipoInstitucion" scope="page" class="controlador.ControladorTipoInstitucion"></jsp:useBean>
<jsp:useBean id="beanInstitucion" scope="page" class="modelo.BEAN.BeanInstitucion"></jsp:useBean>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <link rel="shortcut icon" href="imagenes/icono.png">  
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Institucion</title>
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
            <strong>Buen dia aqui podra agregar las instituciónes</strong> <br> Posteriormente en el Paso 2 podrá agregar un uniforme que pertenecerá a una institución<br>
        </div>
        <!--FIN DE INFORMACION DE PAGINA-->
    </div><!--FIN CONTAINER-->

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="panel with-nav-tabs panel-primary">
                    <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active" ><a href="Addinstitucion.jsp" >Paso 1</a></li>
                            <li><a href="Adduniformes.jsp">Paso 2</a></li>
                            <li><a href="Addprendas.jsp" >Paso 3</a></li>

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
                                                <h4 class="modal-title">Agregue una Institución</h4>
                                            </div>
                                            <div class="modal-body">
                                                <!--Inicio form insertyar datos-->
                                                <form method="POST" action="Institucion" enctype="multipart/form-data" name="formInsert" id="form-AddUniforme">

                                                    <div class="form-group">
                                                        <label>Nombre de la Institución</label>
                                                        <input type="text" name="txtInstitucion" id="txtInstitucion" placeholder="ej. Nuevo Colombo " value="" class="form-control"/>
                                                    </div>
                                                    <div id="respuesta4" class="  alert-danger" ></div>

                                                    <div class="form-group">
                                                        <label>Descripción</label>
                                                        <textarea  name="txaDescripcion" id="txaDescripcion" class="form-control input-sm" placeholder="Escriba una descripción de la institucion"></textarea>
                                                    </div>
                                                    <div id="respuesta3" class="  alert-danger" ></div>

                                                    <div class="form-group">
                                                        <label>Tipo de Institución</label>
                                                        <select id="tipoInstitucion" name="tipoInstitucion" class="form-control">
                                                            <%= contTipoInstitucion.getTipoIntitucion(beanInstitucion)%>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Subir Imagen de Logo </label>
                                                        <div class="input-group">
                                                            <span class="input-group-btn">
                                                                <span class="btn btn-info btn-file ">
                                                                    Subir <input class="btn btn-default btn-file disabled btnfi" type="file" name="file" id="imgInt"  accept="image/*" >
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

                    <div class="container">
                        <div class="row">
                            <br>

                            <div class="col-md-11">
                                <h4>Instituciones disponibles</h4>
                                <div class="table-responsive">

                                    <%int pagina = 0; //pagina a mostrar
                                        if (request.getParameter("pagina") == null) {
                                            pagina = 0;
                                        } else {
                                            pagina = Integer.valueOf(request.getParameter("pagina"));
                                        }
                                    %>
                                    <table id="mytable" class="table table-bordred table-striped "  >

                                        <thead>


                                        <th>N°</th>
                                        <th>Nombre institución</th>
                                        <th class="tx">Descripción</th>
                                        <th class="tx">Logo</th>
                                        <th>Tipo de institución</th>
                                   

                                        <th>Editar</th>
                                        <th>Eliminar</th>



                                        </thead>
                                        <tbody>
                                            <%
                                                DaoInstitucion daoInstitucion = new DaoInstitucion();
                                                ArrayList<BeanInstitucion> listaUniforme = daoInstitucion.listarInstitucion(pagina * 10, 10);
                                                int cont = pagina * 10;
                                                int contador2 = 0;

                                                for (BeanInstitucion bnInstitucion : listaUniforme) {%>
                                            <tr>

                                                <td><%=cont + 1%></td>
                                                <td><%=bnInstitucion.getNombre_intitucion()%></td>
                                                <td class="tx"><textarea disabled="" class="txtareal"><%=bnInstitucion.getDescripcion_institucion()%></textarea> </td>
                                                <td><img class="imgl" src="institucion/<%=bnInstitucion.getUrl_logo_institucion()%>" alt=""/></td>
                                                <td class="imgt" ><%=bnInstitucion.getNombre_tipo_institucion()%></td>

                                                <td><a data-placement="top" data-toggle="tooltip" title="Edit"  ><button class="btn btn-primary btn-xs btnInstitu editarI" data-title="Edit" value="<%= bnInstitucion.getId_institucion()%>" data-toggle="modal" data-target="#editIntitucion" ><span class="glyphicon glyphicon-pencil"></span></button></a></td>
                                                <td><a data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs btnInstitu eliminaI"  value="<%= bnInstitucion.getId_institucion()%>" data-title="Delete" data-toggle="modal" data-target="#deleteInstitucion" ><span class="glyphicon glyphicon-trash"></span></button></a></td>

                                            </tr>

                                            <%cont++;
                                                }%>

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
                                                    int numeroRegistros = daoInstitucion.verRegistrosTotales();
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
                                <div class="modal fade" id="editIntitucion" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                                <h4 class="modal-title custom_align" id="Heading">Editar Uniforme</h4>
                                            </div>

                                            <div class="modal-body">
                                                <input type="hidden" name="txtOpc" value="3">
                                                <div class="formularioEditar"></div>
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
                                <form method="POST" action="Institucion" name="formEliminar" >
                                    <div class="modal fade" id="deleteInstitucion" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                                        <div class="modal-dialog">

                                            <div class="build-list">

                                            </div>
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <input type="hidden" class="idDeleteIns" value="5" name="idEliminarIns"/>
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
    <script src="js/jsInstitucion.js" type="text/javascript"></script>
</body>
</html>
