<%-- 
    Document   : folleto
    Created on : 22/10/2016, 07:14:23 PM
    Author     : yhrincon
--%>

<%@page import="Negocio.Correo"%>
<%@page import="modelo.DAO.DaoUsuario"%>
<%@page import="modelo.BEAN.BeanUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.BEAN.BeanUsuario"%>
<%@page import="modelo.DAO.DaoUsuario"%>

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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/_css.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="imagenes/icono.png"> 

    <!---->
    <title>Diseña</title>


  </head>

  <!--inicio menu-->


  <body background="imagenesDiseño/fondolz.png">
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
              <li><a href="menu.jsp">Inicio</a></li>
              <li class="active"><a href="Disena1.jsp">Crear Uniforme</a></li>
              <li><a href="#">¿Quiénes somos?</a></li>
              <li><a href="#">Contactenos</a></li>
            </ul>


            <%BeanUsuario dao = new BeanUsuario();
                DaoUsuario daous = new DaoUsuario();
                dao.setCorreo(correo);
                daous.contruirObjetoUsuario(dao);
            %>


            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a href="#"  data-toggle="dropdown"><img src="imagenes/avatar3.png" alt=""/><b> <%= dao.getNombre1()%></b> <span class="caret"></span></a>
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
                    <strong>¡Felicidades!</strong> Se ha actualizado correctamente.
                  </div>
                  <%} else if (request.getAttribute("noActualizado") != null) { %>
                  ${noActualizado}
                  <div class="alert alert-danger">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Error!</strong> No se ha podido actualizar.
                  </div>
                  <% }%>
                </div>
                <!--fin menu -->



                <div id='fondoeditar' >
                  <h1>Camisas</h1>
                  <div class="container-fluid">
                    <br>
                    <div class="row">
                      <div class="col-sm-3">
                       
                        <img src="imagenes/imagenesdiseñocamisas/Diariomujer-falda.png" id="lamp"right="10" width="40" height="32"><br>
                        <h5>Camisas manga larga</h5>
                        <button  onclick="draw('no-repeat')">select</button>
                        <br>
                        <br>
                        <img src="imagenes/imagenesdiseñocamisas/camisa-diario-unisex.png" id="lam" right="10" width="40" height="32"><br>
                        <h5>Camisetas</h5>
                        <button  onclick="draw2('no-repeat')">select</button>
                        <br>
                        <br>
                        <img src="imagenes/imagenesdiseñocamisas/chaleco.png"   id="lampa" right="10" width="40" height="32"><br>
                        <h5>Sudaderas</h5>
                        <button  onclick="draw3('no-repeat')">select</button>

                      </div>

                      <!--pliego canvas -->
                      <div class="col-sm-4">
                        <canvas id="myCanvas" width="255" height="300" style="border:6px solid #d3d3d3;">
                        </canvas>            
                      </div>



                      <!--Formulario-->

                      <div class="row">
                        <div class="col-sm-5">   
                          <form class="form-horizontal">
                            <fieldset>


                              <!-- Select Basic -->


                              <!-- Multiple Radios (inline) -->
                              <div class="form-group">
                                <label class="col-md-2 control-label" for="radios">Talla</label>
                                <br>
                                <br>
                                <div class="col-md-7"> 
                                  <label class="radio-inline" for="radios-0">
                                    <input type="radio" name="radios" id="radios-0" value="1" checked="checked">
                                    S
                                  </label> 
                                  <label class="radio-inline" for="radios-1">
                                    <input type="radio" name="radios" id="radios-1" value="2">
                                    M
                                  </label> 
                                  <label class="radio-inline" for="radios-2">
                                    <input type="radio" name="radios" id="radios-2" value="3">
                                    L
                                  </label> 
                                  <label class="radio-inline" for="radios-3">
                                    <input type="radio" name="radios" id="radios-3" value="4">
                                    XL
                                  </label>
                                </div>
                              </div>

                              <!-- Select Basic -->
                              <div class="form-group">
                                <label class="col-md-2 control-label" for="selectbasic">Color</label>
                                <br>
                                <br>
                                <div class="col-md-6">
                                  <select id="selectbasic" name="selectbasic" class="form-control">
                                    <option value="1">Amarillo</option>
                                    <option value="2">Azul</option>
                                    <option value="3">Rojo</option>
                                    <option value="4">Verde</option>
                                    <option value="5">Cafe</option>
                                  </select>
                                </div>
                              </div>



                              <!-- Textarea -->
                              <div class="form-group">
                                <label class="col-md-2 control-label" for="textarea">Sugerencias</label>
                                <br>
                                <br>
                                <div class="col-md-8">                     
                                  <textarea class="form-control" id="textarea" name="textarea"></textarea>
                                </div>
                              </div>

                              <!-- Button -->
                              <div class="form-group">
                                <label class="col-md-4 control-label" ></label>
                                <div class="col-md-4">                              
                                  <input type="button" onclick=" location.href = 'Disena2.jsp'" value="Siguiente" name="boton" class="btn btn-primary"/>
                                </div>
                              </div>

                            </fieldset>
                          </form>



                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="container">

                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModales">Averigua Tu talla</button>

                    <!-- Modal -->
                    <div class="modal fade" id="myModales" role="dialog">
                      <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                          <div class="modal-header">
                            <img src="imagenesDiseño/muestra1.png" alt=""/>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Tallas Hombre</h4>
                          </div>
                          <table class="table table-bordered table-hover">
                            <thead>
                            <th></th>
                            <th class="text-center">A</th>
                            <th class="text-center">B</th>                                    
                            </thead>
                            <thead>
                            <th class="text-center">S</th>
                            <td>710 mm</td>
                            <td>455 mm</td>                                    
                            </thead>
                            <thead>
                            <th class="text-center">M</th>
                            <td>735 mm</td>
                            <td>510 mm</td>                                    
                            </thead>
                            <thead>
                            <th class="text-center">L</th>
                            <td>760 mm</td>
                            <td>560 mm</td>                                    
                            </thead>
                            <thead>
                            <th class="text-center">XL</th>
                            <td>785 mm</td>
                            <td>610 mm</td>                                    
                            </thead>


                          </table>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>

                <footer class="container-fluid text-center">
                  <p>Footer ® jefer rincon</p>
                </footer>
              </div>
              <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
              <script src="js/_js.js" type="text/javascript"></script>
              </body>
              </html>