<%-- 
    Document   : prueba
    Created on : 23/11/2016, 06:35:49 PM
    Author     : Andrés
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imagenes/icono.png">  
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>

        <title>Contactenos</title>
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
                            <li><a href="QuienesSomos.jsp">¿Quienes somos?</a></li>
                            <li class="active"><a href="contactenos.jsp">Contactenos</a></li>
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
                                                    <input type="hidden" name="textMensaje" value="1">
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
                                <br>
                                <br>

                                <!--Fin menu head-->
                                <div id="cuerpo">

                                    <div id="divCuerpo">
                                        <script src="https://www.google.com/recaptcha/api.js?hl=es"></script><script type="text/javascript" src="/javax.faces.resource/jquery.scrollTo.js.xhtml?ln=js/scrollTo"></script>
                                        <script type="text/javascript" src="/javax.faces.resource/email.js.xhtml?ln=js/enviarEmail"></script>

                                        <input type="hidden" id="hiddenIdioma" value="es" />

                                        <div class="col-lg-12 text-center">
                                            <h1>Contáctenos</h1>                   
                                        </div>
                                        <br>
                                        <br>
                                        <div class="col-sm-5 text-left"> 
                                            <div class="container-fluid divContactenos-catalogos">
                                                <div class="row">
                                                    <label class="col-xs-12">Los campos marcados con <span class="asterisco">* </span>son obligatorios
                                                    </label>
                                                </div>


                                                <div class="form-group">

                                                    <form role="form"  method="POST" action="enviarMensaje" id="form-register"  id="formcontactenosExternoBean" name="formcontactenosExternoBean" method="post" action="/popUpsEmail/contactenosCatalogos.xhtml" class="form-horizontal" enctype="application/x-www-form-urlencoded">         
                                                        <div class="form-group">

                                                            <label for="primer_nombre">Nombre:<span class="asterisco">*</span></label>
                                                            <a name="nombre1"></a>
                                                            <input type="text" id="nom1" class="form-control" name="nombre" placeholder="Primer Nombre"  autofocus >
                                                            <div class="message alert-danger" id="resultado1"></div>

                                                            <a name="apellido1"></a>
                                                            <label for="segundo_nombre">Apellido:<span class="asterisco">*</span></label>
                                                            <input type="text" id="nom2" class="form-control"  name="apellido" placeholder="Segundo Nombre">
                                                            <div class="message alert-danger" id="resultado2"></div>

                                                            <a name="correo"></a>
                                                            <label for="correo">Correo:</label>
                                                            <input type="text" id="correo" class="form-control input-email" name="correo" placeholder="Ingrese Email" >
                                                            <div class="message alert-danger" id="resultado5"></div>


                                                            <a name="Empresa"></a>
                                                            <label for="segundo_nombre">Empresa:</label>
                                                            <input type="text" id="nom2" class="form-control"  name="empresa" placeholder="Empresa">
                                                            <div class="message alert-danger" id="resultado2"></div>

                                                            <a name="fecha"></a>
                                                            <label for="segundo_nombre">Fecha:</label>
                                                            <input type="text" id="nom2" class="form-control"  name="fecha" placeholder="Segundo Nombre">
                                                            <div class="message alert-danger" id="resultado2"></div>

                                                            <a name="Asunto"></a>
                                                            <label for="segundo_nombre">Asunto:<span class="asterisco">*</span></label>
                                                            <input type="text" id="nom2" class="form-control"  name="asunto" placeholder="Asunto">
                                                            <div class="message alert-danger" id="resultado2"></div>

                                                            <a name="Mensaje"></a>
                                                            <label for="segundo_nombre">Mensaje:<span class="asterisco">*</span></label>


                                                            <div class="message alert-danger" id="resultado2"></div>
                                                            <textarea class="form-control" name="mensaje" rows="5"></textarea>



                                                            <label class="col-sm-5 text-left"></label>
                                                            <div class="g-recaptcha col-sm-9" data-sitekey="6LdZjygTAAAAAEdeYV1NfHG9jdi8cLo7zhi7QWf_"></div>



                                                            <label class="col-sm-5 text-left"></label>
                                                            <div class="col-sm-9">
                                                                <input type="submit" value="Enviar" class="bottones" style="margin:0;">
                                                                <input type="hidden" name="textMensaje" value="1">
                                                            </div>
                                                            <div id="pie">
                                                                <% if (request.getAttribute("error") != null) { %>
                                                                ${error}
                                                                <div class="alert alert-danger">
                                                                    <a href="#" class="close" data-dismiss="" aria-label="close">&times;</a>
                                                                    <strong>Error!</strong> No se ha podido enviar el mensaje
                                                                </div>
                                                                <%} else { %>
                                                                ${exito}

                                                                <% }%>
                                                            </div>
                                                        </div>

                                                    </form>
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
                                <br>
                                <br>
                                <br>
                                <br>
                                <div>

                                    <p><strong>Tuniforme</strong><br>
                                        <span>Cra 59 # 14 - 79<br> 
                                            <abbr title="Pbx">Pbx:</abbr> (571) 414 0410<br>
                                            <abbr title="Teléfonos">Tels:</abbr> (571) 260 0628 - 414 6256<br>
                                            <abbr title="Celulares">Cels:</abbr> (571) 311 688 1054 - 313 210 9785<br>
                                            <a href="mailto:Tuniforme@Tuniforme.com">Tuniforme@Tuniforme.com</a></span><br>
                                        <strong>Bogotá, Colombia</strong></p>
                                </div>






                                <script src="js/jquery.js" type="text/javascript"></script>
                                <script src="js/bootstrap.min.js" type="text/javascript"></script>


                                </body>
                                </html>
