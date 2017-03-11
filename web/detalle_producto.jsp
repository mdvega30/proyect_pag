<%-- 
    Document   : detalle_producto
    Created on : 24-feb-2017, 18:57:30
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

        <title>Dedalle Producto</title>
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
                            <!--Detalle producto-->
                            <br>
                            <br>
                            <br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-xs-4 item-photo">
                                        <img class="imgl2" style="max-width:50%;" src="images/1.jpg" />
                                    
                                    </div>
                                    <div class="col-xs-5" style="border:0px solid gray">
                                        <!-- Datos del vendedor y titulo del producto -->
                                        <h3>Samsung Galaxy S4 I337 16GB 4G LTE Unlocked GSM Android Cell Phone</h3>    
                                        <h5 style="color:#337ab7">vendido por <a href="#">Samsung</a> · <small style="color:#337ab7">(5054 ventas)</small></h5>

                                        <!-- Precios -->
                                        <h6 class="title-price"><small>PRECIO OFERTA</small></h6>
                                        <h3 style="margin-top:0px;">U$S 399</h3>

                                        <!-- Detalles especificos del producto -->
                                        <div class="section">
                                            <h6 class="title-attr" style="margin-top:15px;" ><small>COLOR</small></h6>                    
                                            <div>
                                                <div class="attr" style="width:25px;background:#5a5a5a;"></div>
                                                <div class="attr" style="width:25px;background:white;"></div>
                                            </div>
                                        </div>
                                        <div class="section" style="padding-bottom:5px;">
                                            <h6 class="title-attr"><small>CAPACIDAD</small></h6>                    
                                            <div>
                                                <div class="attr2">16 GB</div>
                                                <div class="attr2">32 GB</div>
                                            </div>
                                        </div>   
                                        <div class="section" style="padding-bottom:20px;">
                                            <h6 class="title-attr"><small>CANTIDAD</small></h6>                    
                                            <div>
                                                <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                                                <input value="1" />
                                                <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                                            </div>
                                        </div>                

                                        <!-- Botones de compra -->
                                        <div class="section" style="padding-bottom:20px;">
                                            <button class="btn btn-success"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Agregar al carro</button>
                                            <h6><a href="#"><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer;"></span> Agregar a lista de deseos</a></h6>
                                        </div>                                        
                                    </div>   

                                    <script src="js/jquery.js" type="text/javascript"></script>
                                    <script src="js/bootstrap.min.js" type="text/javascript"></script>
                                    <script src="js/_js.js" type="text/javascript"></script>
                                    </body>
                                    </html>
