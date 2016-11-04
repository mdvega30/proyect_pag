<%-- 
    Document   : menu
    Created on : 12-ago-2016, 10:13:04
    Author     : David
--%>

<%@page import="modelo.BEAN.BeanUsuario"%>
<%@page import="modelo.DAO.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesion = request.getSession(false);
    String usuario = (String) sesion.getAttribute("usuario");
    String admin = (String) sesion.getAttribute("admin");

    String correo = (String) sesion.getAttribute("correo");

    if (sesion.getAttribute("usuario") == null && sesion.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>

        <title>Menu</title>
    </head>

    <body>
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
                            <li class="active"><a href="menu.jsp">Inicio</a></li>
                            <li><a href="#">Crear Uniforme</a></li>
                            <li><a href="#">¿Quienes somos?</a></li>
                            <li><a href="#">Contactenos</a></li>
                        </ul>


                        <%                            BeanUsuario dao = new BeanUsuario();
                            DaoUsuario daous = new DaoUsuario();
                            dao.setCorreo(correo);
                            daous.contruirObjetoUsuario(dao);
                        %>


                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="glyphicon glyphicon-user" class="dropdown-toggle"  data-toggle="dropdown"><b> <%= dao.getNombre1()%></b> <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" data-target="#myModal" data-toggle="modal">Editar mi cuenta <span class="glyphicon glyphicon-cog pull-right"></span></a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Mensajes <span class="badge pull-right"> 0 </span></a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Mis Pedidos <span class="glyphicon glyphicon-heart pull-right"></span></a></li>
                                    <li class="divider"></li>
                                    <li><a href="iniciar?textOpcion=3">Salir<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>  
                                    <li class="divider"></li>

                                </ul>
                            </li>
                        </ul>

                        <!--Editar cuenta--->
                        <div id="myModal" class="modal fade" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <div class="modal-body"> 

                                            <form role="form" id="edit-menu" name="editar" method="post" action="iniciar">         
                                                <div class="form-group">

                                                    <label for="primer_nombre">Primer Nombre:</label>
                                                    <a name="nombre1"></a>
                                                    <input type="text" id="nom1" class="form-control" name="nombre1" value="<%= dao.getNombre1()%>"  autofocus >
                                                    <div class="message alert-danger" id="resultado1"></div>

                                                    <a name="nombre2"></a>
                                                    <label for="segundo_nombre">Segundo Nombre:</label>
                                                    <input type="text" id="nom2" class="form-control"  name="nombre2" value="<%= dao.getNombre2()%>">
                                                    <div class="message alert-danger" id="resultado2"></div>

                                                    <a name="apellido1"></a>
                                                    <label for="primer_apellido">Primer Apellido:</label>
                                                    <input type="text" id="ape1" class="form-control"  name="apellido1" value="<%= dao.getApellido1()%>">
                                                    <div class="message alert-danger" id="resultado3"></div>

                                                    <a name="apellido2"></a>
                                                    <label for="segundo_apellido">Segundo Apellido:</label>
                                                    <input type="text" id="ape2" class="form-control" name="apellido2" value="<%= dao.getApellido2()%>">
                                                    <div class="message alert-danger" id="resultado4"></div>

                                                    <a name="direccion"></a>
                                                    <label for="direccion">Dirección:</label>
                                                    <input type="text" id="direccion" class="form-control" name="direccion" value="<%= dao.getDireccion()%>">
                                                    <div class="message alert-danger" id="resultado6"></div>

                                                    <a name="contra1"></a>
                                                    <label for="contraseña">Contraseña:</label>
                                                    <input type="password" id="contra1" class="form-control" name="pass" placeholder="Ingrese Contraseña">
                                                    <div class="message alert-danger" id="resultado8"></div>

                                                    <a name="contra2"></a>
                                                    <label for="confirmar_contraseña">Confirmar Contraseña:</label>
                                                    <input type="password" id="contra2" class="form-control" name="pass2" placeholder="Confirmar Contraseña">
                                                    <div class="message alert-danger" id="resultado9"></div>
                                                </div>


                                                <br>
                                                <button  class="btn btn-primary" >Guardar</button>
                                                <input type="hidden" name="textOpcion" value="5">
                                                <input class="btn btn-default" data-dismiss="modal" type="button" value="Cerrar">
                                            </form>


                                        </div>
                                        <div class="modal-footer">
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                    </nav>
                    <div class="container-fluid text-center"  >    
                        <div class="container">
                            <div class="row content">
                                <div id="alerta">
                                    <%

                                        if (request.getAttribute("acualizado") != null) { %>
                                    ${acualizado}
                                    <div class="alert alert-success">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>Felicidades!</strong> Se ha actualizado correctamente.
                                    </div>
                                    <%} else if (request.getAttribute("noActualizado") != null) { %>
                                    ${noActualizado}
                                    <div class="alert alert-danger">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>Error!</strong> No se ha podido actualizar.
                                    </div>
                                    <% }%>
                                </div>

                                <div class="col-sm-12 text-left"> 
                                    <div class="jumbotron">

                                        <h1>Lorem ipsum</h1>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing.</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing.</p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row"> 
                            <div class="col-lg-4">
                                <div class="well">
                                    <h4>ipsum</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                                </div> 
                            </div> 
                            <div class="col-lg-4">
                                <div class="well">
                                    <h4>ipsum</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                                </div> 
                            </div> 
                            <div class="col-lg-4">
                                <div class="well">
                                    <h4>ipsum</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.</p>
                                </div> 
                            </div> 
                        </div> 
                    </div> 
                    <footer class="container-fluid text-center">
                        <p>Footer ® David Daza</p>
                    </footer>
                    <script src="js/jquery.js" type="text/javascript"></script>
                    <script src="js/_jss.js" type="text/javascript"></script>
                    <script src="js/bootstrap.min.js" type="text/javascript"></script>
                    </body>
                    </html>
