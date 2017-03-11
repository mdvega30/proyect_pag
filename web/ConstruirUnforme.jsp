<%-- 
    Document   : ConstruirUnforme
    Created on : 14-nov-2016, 21:16:45
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imagenes/icono.png">   
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
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
                                <li><a href=""><i class="glyphicon glyphicon-tasks"></i> Uniformes Catalogo </a></li>
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
                            <a href="#" class="glyphicon glyphicon-user"   data-toggle="dropdown"><b> <%= dao.getNombre1()%></b> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="icon-envelope"></i> Mensajes <span class="badge badge-info">4</span></a></li>
                                <li><a href="iniciar?textOpcion=3">Salir<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>  
                                <li class="divider"></li>

                            </ul>
                        </li>
                    </ul>
                </div>



            </div>
        </div>
    </nav>
    <!--Fin nav var -->

    <br>
    <br>

    <div class="container">
        <div class="row">
            <!--Informacion-->
            <!--Informacion-->
            <!--Informacion-->
            <div class="alert alert-info">
                <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>
                <strong>Buen dia aqui podra agregar los uniformes</strong> <br>Esto se vera en el catalogo de inicio para la posterior compra.
            </div>

            <button type="button" class="btn icon-btn btn-success" data-toggle="modal" data-target="#myModal"><a class="btn icon-btn btn-success" href="#"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Agergar</a></button>
        </div>
    </div>
    <!-- Modal-->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal contenido-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Agregue un Uniforme</h4>
                </div>
                <div class="modal-body">

                    <form method="POST">

                        <div class="form-group">
                            <label>Tipo de uniforme</label>
                            <select id="optcTipouniforme" name="optcTipouniforme" class="form-control">
                                <option value="1">Empresarial</option>
                                <option value="2">Option two</option>
                            </select>
                        </div>



                        <div class="form-group">
                            <label>Institución</label>
                            <select id="optcInstitucion" name="optcInstitucion" class="form-control">
                                <option value="1">Colegio falso</option>
                                <option value="2">Option two</option>
                            </select>
                        </div>


                        <div class="form-group">
                            <label>Prenda</label>
                            <select id="optcPrenda" name="optcPrenda" class="form-control">
                                <option value="1">Camisa</option>
                                <option value="2">Option two</option>
                            </select>
                        </div>


                        <div class="form-group">
                            <label>Talla</label>
                            <select id="optcTalla" name="optcTalla" class="form-control">
                                <option value="1">M</option>
                                <option value="2">Option two</option>
                            </select>
                        </div>





                        <div class="form-group">
                            <label>Descripción</label>
                            <textarea  name="textareaDescrip" id="textareaDescrip" class="form-control input-sm" placeholder="Escriba una descripción"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Activo/Incativo</label><br>
                            <input type="checkbox" class="activo-inactivo"/>
                        </div>


                        <div class="form-group">
                            <label>Subir Imagen</label>

                            <div class="input-group">
                                <span class="input-group-btn">
                                    <span class="btn btn-info btn-file ">
                                        Subir <input class="btn btn-default btn-file disabled" type="file" id="imgInp">
                                    </span>
                                </span>
                                <input type="text" class="form-control" readonly>
                            </div>
                            <br>
                            <div id="contenedorimg">
                                <img id='img-upload'/>

                            </div>

                        </div>
                        <button type="button" class="btn btn-success btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Guardar</button>
                        <input type="hidden" name="textOpcio" value="">

                    </form>
                    <!--Fin formulario agregar-->

                </div>
            </div>
        </div>
    </div>

    <!--Fin  Modal-->







    <!-- Tabla responsive-->

    <div class="container">
        <div class="row">
            <br>

            <div class="col-md-12">
                <h4>Uniformes en catalogo para la venta</h4>
                <div class="table-responsive">


                    <table id="mytable" class="table table-bordred table-striped">

                        <thead>

                        <th><input type="checkbox" id="checkall" /></th>
                        <th>Tipo Uniforme</th>
                        <th>Institucion</th>
                        <th>Prenda</th>
                        <th>Talla</th>
                        <th>Imagen</th>
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
                                <td>imagen/imagen.png</td>
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
                                <td>imagen/imagen.png</td>
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
                                <td>imagen/imagen.png</td>
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
                                <td>imagen/imagen.png</td>
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
                                <td>imagen/imagen.png</td>
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
                                <td>imagen/imagen.png</td>
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
                                <td>imagen/imagen.png</td>
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
