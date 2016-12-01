<%-- 
    Document   : QuienesSomos
    Created on : 06-nov-2016, 19:33:44
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
        <title>¿Quienes Somos?</title>
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
                        <li><a href="catalogo.jsp">Catálogo</a></li>
                        <li class="active"><a href="QuienesSomos.jsp">¿Quienes somos?</a></li>
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
                                           
                                        </form>
                                    </div>
                                </div>

                            </ul>
                            </div>
                            </div>
                            </div>
                            </nav>
                            <!--Fin menu head-->

                            <!--Inicio carousel  -->
                        <section class="jk-slider">
                            <div id="carousel-example" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example" data-slide-to="1"></li>
                                    <li data-target="#carousel-example" data-slide-to="2"></li>
                                </ol>

                                <div class="carousel-inner">
                                    <div class="item active">
                                        <a href="#"><img src="imagenes/uniformes_carousel/4.jpg" /></a>
                                        <div class="hero">
                                            <hgroup>
                                                <h1>Mision</h1>        
                                                <h3>the books you need and save ! </h3>
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p>
                                            </hgroup>

                                        </div>
                                    </div>
                                    <div class="item">

                                        <a href="#"><img src="imagenes/uniformes_carousel/5.jpg" /></a>
                                        <div class="hero">
                                            <hgroup >
                                                <h1>Vision</h1>        
                                                <h3>the books you need and save ! </h3>
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p>
                                            </hgroup>

                                        </div>
                                    </div>
                                    <div class="item">
                                        <a href="#"><img src="imagenes/uniformes_carousel/6.jpg" /></a>
                                        <div class="hero">
                                            <hgroup>
                                                <h1>Objetivos</h1>        
                                                <h3>the books you need and save ! </h3>
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p>
                                            </hgroup>

                                        </div>
                                    </div>
                                </div>

                                <a class="left carousel-control" href="#carousel-example" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>

                        </section>

                        <!--Fin carousel--->

                        <!--Contenido -->    
                        <div class="container">
                            <div class="container">

                                <div class="row">
                                    <div class="col-lg-12">
                                        <h1 class="page-header">Quiénes somos
                                        </h1>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p>Aliquam iaculis nulla vitae massa porttitor aliquet. Mauris venenatis cursus felis. Aenean tristique elit vitae est ultrices tincidunt. Phasellus in ultricies nibh. Nunc porttitor libero volutpat accumsan vestibulum. Suspendisse rutrum urna quam. Curabitur eu justo felis. Etiam et dui a tortor sagittis aliquet. Mauris lectus neque, rhoncus et dictum sed, semper eget est. Proin interdum nisl magna, eu consequat quam scelerisque sit amet. Phasellus eget faucibus nisi, sit amet volutpat erat. </p>
                                        <p>Aliquam iaculis nulla vitae massa porttitor aliquet. Mauris venenatis cursus felis. Aenean tristique elit vitae est ultrices tincidunt. Phasellus in ultricies nibh. Nunc porttitor libero volutpat accumsan vestibulum. Suspendisse rutrum urna quam. Curabitur eu justo felis. Etiam et dui a tortor sagittis aliquet. Mauris lectus neque, rhoncus et dictum sed, semper eget est. Proin interdum nisl magna, eu consequat quam scelerisque sit amet. Phasellus eget faucibus nisi, sit amet volutpat erat. </p>
                                    </div>


                                    <div class="col-lg-12">
                                        <h2>Estamos Ubicados</h2>
                                        <strong><small>Cra falsa N 105-81</small></strong><br><br>
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d44990.37818743804!2d-74.10456088063302!3d4.660738908374109!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2sco!4v1478479925080" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!--Fin contenido--->
                        <br>
                        <br>

                        <footer class="container-fluid text-center" >
                            <p>Footer ® David Daza</p>
                        </footer>
                        <script src="js/jquery.js" type="text/javascript"></script>
                        <script src="js/bootstrap.min.js" type="text/javascript"></script>
                        <script src="js/_js.js" type="text/javascript"></script>
                        </body>
                        </html>
