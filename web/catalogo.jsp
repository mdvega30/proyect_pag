<%-- 
    Document   : catalogo
    Created on : 06-nov-2016, 3:42:25
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="shortcut icon" href="imagenes/icono.png">   
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>

        <title>Catálogo</title>
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
                        <li ><a href="index.jsp">Inicio</a></li>
                        <li class="active"><a href="catalogo.jsp">Catálogo</a></li>
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
                            <!--Fin menu superior-->
                            <br>
                            <br>
                            <br>


                            <div class="container">

                                <!-- Jumbotron Header -->
                                <header class="jumbotron hero-spacer">
                                    <h1>A Warm Welcome!</h1>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
                                    <p></p>
                                    <!--Inicio Barra Buscar -->
                                    <div class="container">


                                        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1" >

                                            <div class="input-group buscador-principal">    					
                                                <input name="search_param" value="all" id="search_param" type="hidden">         
                                                <input class="form-control" name="x" placeholder="¿Qué quieres buscar?" type="text">
                                                <div class="input-group-btn search-panel">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="btnbuscar">
                                                        <span id="search_concept">¿Dónde?</span> <span class="caret" ></span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="http://placesforlove.com">Placesforlove</a></li>
                                                        <li><a href="http://placesforlove.com">It's Placesforlove</a></li>
                                                        <li><a href="http://placesforlove.com">Greather than Placesforlove</a></li>
                                                        <li><a href="http://placesforlove.com">Placesforlove </a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="http://trovacamporella.com">trovacamporella</a></li>
                                                    </ul>
                                                </div>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-primary" type="button"><span class="glyphicon glyphicon-search"></span> BUSCAR</button>
                                                </span>
                                            </div>
                                            </divs>
                                        </div>
                                    </div>

                                    <!--Fin Barra Buscar -->
                                </header>

                                <hr>





                                <!-- Page Features -->
                                <div class="row text-center">

                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3 col-sm-6 hero-feature">
                                        <div class="thumbnail">
                                            <img src="http://placehold.it/800x500" alt="">
                                            <div class="caption">
                                                <h3>Feature Label</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                                <p>
                                                    <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.row -->




                                <!-- Pagination -->
                                <div class="row text-center">
                                    <div class="col-lg-12">
                                        <ul class="pagination">
                                            <li>
                                                <a href="#">&laquo;</a>
                                            </li>
                                            <li class="active">
                                                <a href="#">1</a>
                                            </li>
                                            <li>
                                                <a href="#">2</a>
                                            </li>
                                            <li>
                                                <a href="#">3</a>
                                            </li>
                                            <li>
                                                <a href="#">4</a>
                                            </li>
                                            <li>
                                                <a href="#">5</a>
                                            </li>
                                            <li>
                                                <a href="#">&raquo;</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /.row -->
                            </div>
                            </div>

                            <!-- /.Container -->

                            <!--Footer-->

                        <footer class="container-fluid text-center" >
                            <p>Footer ® David Daza</p>
                        </footer>
                        <script src="js/jquery.js" type="text/javascript"></script>
                        <script src="js/bootstrap.min.js" type="text/javascript"></script>
                        </body>
                        </html>
