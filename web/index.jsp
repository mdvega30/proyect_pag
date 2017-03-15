
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="shortcut icon" href="imagenes/icono.png">  
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
        
        <title>TUniforme</title>
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
                            <li><a href="contactenos.jsp">Contactenos</a></li>
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
                                                
                                            </form>
                                        </div>
                                    </div>

                                </ul>
                                </div>
                                </div>
                                </div>
                                </nav>
                                <!-- carousel--->
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-11 text-center">

                                            <h2>Tuniforme</h2>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- The carousel -->
                                        <div id="transition-timer-carousel" class="carousel slide transition-timer-carousel" data-ride="carousel">
                                            <!-- Indicators -->
                                            <ol class="carousel-indicators">
                                                <li data-target="#transition-timer-carousel" data-slide-to="0" class="active"></li>
                                                <li data-target="#transition-timer-carousel" data-slide-to="1"></li>
                                                <li data-target="#transition-timer-carousel" data-slide-to="2"></li>
                                            </ol>

                                            <!-- Wrapper for slides -->
                                            <div class="carousel-inner">
                                                <div class="item active">


                                                    <img src="imagenes/pai.jpg" alt=""/>
                                                    <div class="carousel-caption">
                                                        <h1 class="carousel-caption-header">Slide 1</h1>
                                                        <p class="carousel-caption-text hidden-sm hidden-xs">
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse dignissim aliquet rutrum. Praesent vitae ante in nisi condimentum egestas. Aliquam.
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="item">
                                                    <img src="imagenes/pai.jpg" alt=""/>
                                                    <div class="carousel-caption">
                                                        <h1 class="carousel-caption-header">Slide 2</h1>
                                                        <p class="carousel-caption-text hidden-sm hidden-xs">
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse dignissim aliquet rutrum. Praesent vitae ante in nisi condimentum egestas. Aliquam.
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="item">
                                                    <img src="imagenes/pai.jpg" alt=""/>
                                                    <div class="carousel-caption">
                                                        <h1 class="carousel-caption-header">Slide 3</h1>
                                                        <p class="carousel-caption-text hidden-sm hidden-xs">
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse dignissim aliquet rutrum. Praesent vitae ante in nisi condimentum egestas. Aliquam.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Controls -->
                                            <a class="left carousel-control" href="#transition-timer-carousel" data-slide="prev">
                                                <span class="glyphicon glyphicon-chevron-left"></span>
                                            </a>
                                            <a class="right carousel-control" href="#transition-timer-carousel" data-slide="next">
                                                <span class="glyphicon glyphicon-chevron-right"></span>
                                            </a>

                                            <!-- Timer "progress bar" -->
                                            <hr class="transition-timer-carousel-progress-bar animate" />
                                        </div>
                                    </div>
                                </div>




                                <!-- contenido--->

                                <div class="container-fluid text-center"  >    
                                    <div class="container">    
                                        <div class="row content">




                                            <div class="col-sm-1"></div>
                                            <div class="col-sm-9 text-left"> 
                                                <h1>Welcome to Tuniforme</h1>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                <hr>
                                                <h3>Test</h3>
                                                <p>Lorem ipsum...</p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <footer class="container-fluid text-center">
                                    <p>Footer ® David Daza</p>
                                </footer>
                                <script src="js/jquery.js" type="text/javascript"></script>
                                <script src="js/bootstrap.min.js" type="text/javascript"></script>
                                <script src="js/_js.js" type="text/javascript"></script>
                                </body>
                                </html>
