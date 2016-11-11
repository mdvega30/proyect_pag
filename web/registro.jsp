<%-- 
    Document   : registro
    Created on : 11-ago-2016, 10:34:26
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
    <head>
        <title>Registro</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imagenes/icono.png">  
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>


    </head>
    <body id="bd">


        <nav class="navbar navbar-inverse" >
            <div class="container-fluid">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>
                        <a class="navbar-brand" href="index.jsp"><img src="imagenes/icono.png" alt=""/></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li ><a href="index.jsp">Inicio</a></li>
                            <li><a href="catalogo.jsp">Catálogo</a></li>
                            <li><a href="QuienesSomos.jsp">¿Quienes somos?</a></li>
                            <li><a href="#">Contactenos</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="registro.jsp"><span class="glyphicon glyphicon-list-alt"></span> Regístrate</a></li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="glyphicon glyphicon-log-in"></span></a>
                                <ul id="login-dp" class="dropdown-menu">

                                    <div class="row" >
                                        <div class="col-md-12">
                                            <label>Login </label>                
                                            <form class="form" role="form" method="post" action="iniciar" accept-charset="UTF-8" id="login-nav">
                                                <div class="form-group">
                                                    <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                                    <input type="email" class="form-control" name="correo" placeholder="Email address" required>
                                                </div>
                                                <div class="form-group">
                                                    <label class="sr-only" for="exampleInputPassword2">Password</label>
                                                    <input type="password" class="form-control" name="pass" placeholder="Password" required>
                                                    <div class="help-block text-right"><a href="">¿Olvido su contraseña?</a></div>
                                                </div>
                                                <div class="form-group">
                                                    <input type="submit" class="btn btn-primary btn-block" value="Ingresar">
                                                    <input type="hidden" name="textOpcion" value="1">
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox"> Recordar esta cuenta
                                                    </label>
                                                </div>

                                            </form>

                                        </div>
                                    </div>

                                </ul>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>


        <div class="container-fluid text-center"  >    
            <div class="row content">
                <div class="col-sm-12"  style="height: 5%;">

                </div>
                <div class="col-sm-3 ">

                </div>
                <div class="col-sm-5 text-left"> 
                    <div class="well">
                        <h2>Registro</h2>

                        <form role="form"  method="post" action="iniciar" id="form-register">         
                            <div class="form-group">

                                <label for="primer_nombre">Primer Nombre:</label>
                                <a name="nombre1"></a>
                                <input type="text" id="nom1" class="form-control" name="nombre1" placeholder="Primer Nombre"  autofocus >
                                <div class="message alert-danger" id="resultado1"></div>

                                <a name="nombre2"></a>
                                <label for="segundo_nombre">Segundo Nombre:</label>
                                <input type="text" id="nom2" class="form-control"  name="nombre2" placeholder="Segundo Nombre">
                                <div class="message alert-danger" id="resultado2"></div>

                                <a name="apellido1"></a>
                                <label for="primer_apellido">Primer Apellido:</label>
                                <input type="text" id="ape1" class="form-control"  name="apellido1" placeholder="Primer Apellido">
                                <div class="message alert-danger" id="resultado3"></div>

                                <a name="apellido2"></a>
                                <label for="segundo_apellido">Segundo Apellido:</label>
                                <input type="text" id="ape2" class="form-control" name="apellido2" placeholder="Segundo Apellido">
                                <div class="message alert-danger" id="resultado4"></div>

                                <a name="correo"></a>
                                <label for="correo">Correo:</label>
                                <input type="text" id="email" class="form-control input-email" name="correo" placeholder="Ingrese Email" >
                                <div class="message alert-danger" id="resultado5"></div>

                                <a name="direccion"></a>
                                <label for="direccion">Dirección:</label>
                                <input type="text" id="direccion" class="form-control" name="direccion" placeholder="Dirección">
                                <div class="message alert-danger" id="resultado6"></div>


                                <label for="tipoDoc" >Tipo de documento:</label>
                                <select class="form-control" id="tipoDoc" name="tipoDoc">
                                    <option value="1">Cedula de Ciudadanía</option>
                                    <option value="2">Cédula de Extranjería</option>
                                    <option value="3">NIT personas jurídicas</option>

                                </select>
                                <a name="documento"></a>
                                <label for="documento">Documento:</label>
                                <input type="text" id="documento" class="form-control" name="doc" placeholder="Docuemento">
                                <div class="message alert-danger" id="resultado7"></div>

                                <a name="contra1"></a>
                                <label for="contraseña">Contraseña:</label>
                                <input type="password" id="contra1" class="form-control" name="pass" placeholder="Ingrese Contraseña">
                                <div class="message " id="resultado8"></div>

                                <a name="contra2"></a>
                                <label for="confirmar_contraseña">Confirmar Contraseña:</label>
                                <input type="password" id="contra2" class="form-control" name="pass2" placeholder="Confirmar Contraseña">
                                <div class="message alert-danger" id="resultado9"></div>
                            </div>

                            <div class="checkbox">
                                <label><input type="checkbox"> Aceptar Terminos y Condiciones</label>
                            </div>

                            <input type="submit" class="btn btn-default btn-submit-form" value="Registrar">
                            <input type="hidden" name="textOpcion" value="2">

                        </form>
                        <div id="pie">
                            <% if (request.getAttribute("error") != null) { %>
                            ${error}
                            <div class="alert alert-danger">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Error!</strong> No se ha podido registras.
                            </div>
                            <%} else { %>
                            ${exito}

                            <% }%>
                        </div>

                    </div>
                </div>
                <div class="col-sm-3" >

                </div>

                <div class="col-sm-5"  style="height: 5%;">

                </div>


            </div>



        </div>

        <footer class="container-fluid text-center">
            <p>Footer ® David Daza</p>
        </footer>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/_js.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>




    </body>
</html>
