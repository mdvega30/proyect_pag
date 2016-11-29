<%-- 
    Document   : verificarCorreo
    Created on : 28-nov-2016, 23:16:49
    Author     : David
--%>

<%@page import="modelo.DAO.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imagenes/icono.png">  
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
        <title>VerificarCorreo</title>
    </head>
    <body>
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
                        <li class="active"><a href="index.jsp">Inicio</a></li>
                        <li><a href="catalogo.jsp">Catálogo</a></li>
                        <li><a href="QuienesSomos.jsp">¿Quienes somos?</a></li>
                        <li><a href="#">Contactenos</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="registro.jsp"><span class="glyphicon glyphicon-list-alt"></span> Regístrate</a></li>


                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="glyphicon glyphicon-log-in"></span></a>
                            <ul id="login-dp" class="dropdown-menu">

                                <div class="row">
                                    <div class="col-md-12">

                                        <label>Login </label>              


                                        <form class="form" role="form" method="post" action="iniciar" accept-charset="UTF-8" id="login-nav">
                                            <div class="form-group">

                                                <label class="sr-only  " for="correo">Correo Electronico</label>
                                                <input type="email" class="form-control" name="correo" placeholder="Email address" required>
                                            </div>
                                            <div class="form-group">

                                                <label class="sr-only" for="pass">Contraseña</label>
                                                <input type="password" class="form-control" name="pass" placeholder="Password" required>
                                                <div class="help-block text-right"><a href="">¿Olvido su contraseña?</a></div>
                                                <div class="help-block text-right"><a href="registro.jsp">¿Registrarse?</a></div>
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
                            </div>
                            </div>
                            </div>
                            </nav>


                            <!--Contenido-->




                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-6 col-md-4 col-md-offset-4">

                                        <div class="account-wall">
                                            <img class="profile-img" src="imagenes/LogoTuniforme_1.png" alt=""/>

                                            <h1 style="text-align: center" >Hola David </h1>
                                            <div style="margin: 20px;text-align: justify">

                                                <p>Gracias por registrarse en nuestro sitio.
                                                    Para poder ingresar y usar nuestros servicios, <strong>debe verificar su correo</strong>
                                                    dando clic en el enlace que se le ha enviado a su correo CORREO.
                                                </p>
                                            </div>
                                            <h3 style="text-align: center">El equipo de Tuniforme le agradece</h3>

                                        </div>
                                    </div>

                                </div>
                            </div>
                            </div>
                            <%if (request.getParameter("token") != null) {
                                    String tok = request.getParameter("token");
                                    DaoUsuario usu = new DaoUsuario();

                                    if (usu.revisarToken(tok)) {

                                        if (usu.actualizarToken(tok)) {

                                            request.setAttribute("registro", "");
                                            request.getRequestDispatcher("login.jsp").forward(request, response);
                                        }

                                    } else {
                                        response.sendRedirect("Error404.jsp");
                                    }

                                }

                            %>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                        <footer class="container-fluid text-center">
                            <p>Footer ® David Daza</p>
                        </footer>

                        <script src="js/jquery.js" type="text/javascript"></script>
                        <script src="js/bootstrap.min.js" type="text/javascript"></script>

                        </body>
                        </html>
