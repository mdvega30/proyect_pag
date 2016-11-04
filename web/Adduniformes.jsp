<%-- 
    Document   : Adduniformes
    Created on : 31-oct-2016, 22:21:57
    Author     : David
--%>

<%@page import="modelo.DAO.DaoUsuario"%>
<%@page import="modelo.BEAN.BeanUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesion = request.getSession(false);
    String usuario1 = (String) sesion.getAttribute("admin");
    String usuario2 = (String) sesion.getAttribute("usuario");

    if (sesion.getAttribute("usuario") != null) {
        response.sendRedirect("menu.jsp");
    } else if (sesion.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%  BeanUsuario dao = new BeanUsuario();
            DaoUsuario daous = new DaoUsuario();
            dao.setCorreo(usuario1);
            daous.contruirObjetoUsuario(dao);
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
                            <li class="active"><a href="menuAdmin.jsp">Inicio</a></li>
                            <li><a href="#">Crear Uniforme</a></li>
                            <li><a href="#">¿Quienes somos?</a></li>
                            <li><a href="#">Contactenos</a></li>
                        </ul>



                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="glyphicon glyphicon-user"   data-toggle="dropdown"><b> <%= dao.getNombre1()%></b> <span class="caret"></span></a>
                                <ul class="dropdown-menu">

                                    <li><a href="iniciar?textOpcion=3">Salir<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>  
                                    <li class="divider"></li>

                                </ul>
                            </li>
                        </ul>
                    </div>


                </div>
            </div>
        </nav>
        <!-- Tabla responsive-->
        <div class="container">
            <div class="row">
                <br>
                <div class="alert alert-info">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>
                    <strong>Buen dia aqui podra agregar los uniformes</strong> <br>Esto se vera en el catalogo de inicio para la posterior compra.
                </div>
                <div class="col-md-12">
                    <h4>Uniformes en catalogo para la venta</h4>
                    <div class="table-responsive">


                        <table id="mytable" class="table table-bordred table-striped">

                            <thead>

                            <th><input type="checkbox" id="checkall" /></th>
                            <th>Tipo Uniforme</th>
                            <th>Institucion</th>
                            <th>Prenda</th>
                            <th>Tallas</th>
                            <th>Descripcion</th>
                            <th>Activo</th>
                            <th>Editar</th>

                            <th>Eliminar</th>
                            </thead>
                            <tbody>

                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td>Colegial</td>
                                    <td>Hogwarts de Magia y Hechicería</td>
                                    <td>Camisa</td>
                                    <td>M</td>
                                    <td>Contra Hechizos</td>
                                    <td><input type="checkbox" class="activo-inactivo"/></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td>Colegial</td>
                                    <td>Hogwarts de Magia y Hechicería</td>
                                    <td>Camisa</td>
                                    <td>M</td>
                                    <td>Contra Hechizos</td>
                                    <td><input type="checkbox" class="activo-inactivo"/></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td>Colegial</td>
                                    <td>Hogwarts de Magia y Hechicería</td>
                                    <td>Camisa</td>
                                    <td>M</td>
                                    <td>Contra Hechizos</td>
                                    <td><input type="checkbox" class="activo-inactivo"/></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td>Colegial</td>
                                    <td>Hogwarts de Magia y Hechicería</td>
                                    <td>Camisa</td>
                                    <td>M</td>
                                    <td>Contra Hechizos</td>
                                    <td><input type="checkbox" class="activo-inactivo"/></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td>Colegial</td>
                                    <td>Hogwarts de Magia y Hechicería</td>
                                    <td>Camisa</td>
                                    <td>M</td>
                                    <td>Contra Hechizos</td>
                                    <td><input type="checkbox" class="activo-inactivo"/></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td>Colegial</td>
                                    <td>Hogwarts de Magia y Hechicería</td>
                                    <td>Camisa</td>
                                    <td>M</td>
                                    <td>Contra Hechizos</td>
                                    <td><input type="checkbox" class="activo-inactivo"/></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td>Colegial</td>
                                    <td>Hogwarts de Magia y Hechicería</td>
                                    <td>Camisa</td>
                                    <td>M</td>
                                    <td>Contra Hechizos</td>
                                    <td><input type="checkbox" class="activo-inactivo"/></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td>Colegial</td>
                                    <td>Hogwarts de Magia y Hechicería</td>
                                    <td>Camisa</td>
                                    <td>M</td>
                                    <td>Contra Hechizos</td>
                                    <td><input type="checkbox" class="activo-inactivo"/></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td>Colegial</td>
                                    <td>Hogwarts de Magia y Hechicería</td>
                                    <td>Camisa</td>
                                    <td>M</td>
                                    <td>Contra Hechizos</td>
                                    <td><input type="checkbox" class="activo-inactivo"/></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>






                            </tbody>

                        </table>

                        <div class="clearfix"></div>
                        <ul class="pagination pull-right">
                            <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
                        </ul>

                    </div>

                </div>
            </div>
        </div>


        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                        <h4 class="modal-title custom_align" id="Heading">Editar Uniforme</h4>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tipo Uniforme</label>
                            <input class="form-control " type="text" placeholder="Tipo Uniforme">
                        </div>
                        <div class="form-group">
                            <label>Institucion</label>
                            <input class="form-control " type="text" placeholder="Institucion">
                        </div>
                        <div class="form-group">
                            <label>Prenda</label>
                            <input class="form-control " type="text" placeholder="Prenda">
                        </div>
                        <div class="form-group">
                            <label>Tallas</label>
                            <input class="form-control " type="text" placeholder="Tallas">
                        </div>
                        <label>Descripción</label>
                        <div class="form-group">
                            <textarea rows="2" class="form-control" placeholder="Descripción"></textarea>
                        </div>

                    </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Actualizar</button>
                    </div>
                </div>
                <!-- /.modal-content --> 
            </div>
            <!-- /.modal-dialog --> 
        </div>



        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                        <h4 class="modal-title custom_align" id="Heading">Borrar este articulo</h4>
                    </div>
                    <div class="modal-body">

                        <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Esta usted seguro de eliminar este articulo?</div>

                    </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> SI</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
                    </div>
                </div>
                <!-- /.modal-content --> 
            </div>
            <!-- /.modal-dialog --> 
        </div>

        <footer class="container-fluid text-center">
            <p>Footer ® David Daza</p>
        </footer>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/_js.js" type="text/javascript"></script>
    </body>
</html>
