<%-- 
    Document   : login
    Created on : 13-ago-2016, 17:59:42
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
        <title>Login</title>
    </head>
    <body>
    </div>
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
                        <li><a href="contactenos.jsp">Contactenos</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li ><a href="registro.jsp"><span class="glyphicon glyphicon-list-alt"></span> Regístrate</a></li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="glyphicon glyphicon-log-in"></span></a>
                            <ul id="login-dp" class="dropdown-menu">

                                <div class="row">
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
                                            

                                        </form>

                                    </div>
                                </div>

                            </ul>
                    </ul>
                </div>
            </div>
        </div>
    </nav>


    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <h1 class="text-center login-title">Login </h1>
                <div class="account-wall">

                    <img class="profile-img" src="imagenes/LogoTuniforme_1.png" alt=""/>

                    <form class="form-signin" action="iniciar" method="post">
                        <input type="text" class="form-control" placeholder="Email" name="correo" required autofocus>
                        <input type="password" class="form-control" placeholder="Password" name="pass" required>
                        <input class="btn btn-lg btn-primary btn-block" type="submit" value="Ingresar">
                        <input type="hidden" name="textOpcion" value="1">

                        <label class="checkbox pull-left">
                            <input type="checkbox" value="remember-me">
                            Remember me
                        </label>
                        <br>
                        <br>
                        <div id="pie">
                            <% if (request.getAttribute("error") != null) { %>
                            ${error}
                            <div class="alert alert-danger">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Error!</strong> Correo o contraseña incorrectos.
                            </div>
                            <%} else { %>
                            ${exito}
                            <% }%>
                        </div>
                        <div id="pie">
                            <% if (request.getAttribute("registro") != null) { %>
                            ${registro}
                            <div class="alert alert-success">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Gracias!</strong> Su cuenta se ha verificado correctamente.
                            </div>
                            <%}%>

                        </div>
                    </form>
                </div>
                <a href="registro.jsp" class="text-center new-account">Crear Una Cuenta </a>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <footer class="container-fluid text-center">
        <p>Footer ®David Daza</p>
    </footer>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>
