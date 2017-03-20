<%-- 
    Document   : detalleProducto
    Created on : 20-mar-2017, 16:27:47
    Author     : David
--%>
<%@page import="modelo.BEAN.BeanPrenda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.BEAN.BeanUniforme"%>
<jsp:useBean id="contTallas" scope="page" class="controlador.ControladorTalla"></jsp:useBean>
<%

    int id = Integer.parseInt(request.getParameter("product"));
    BeanUniforme ben = new BeanUniforme();

    ben.setId_uniforme(id);
    BeanUniforme benUniforme = new controlador.ControladorCatalogo().getArticulo(ben);
    ArrayList<BeanPrenda> listaPrendas = new controlador.ControladorCatalogo().getPrendasPorUniforme(ben);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imagenes/icono.png">   
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
        <title>Detalle Producto</title>


    </head>
    <body background="">
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
                        <li><a href="contactenos.jsp">Contactenos</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">

                                <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-shopping-cart"> <span class="badge">1</span> <span >Articulos</span><span class="caret"></a>
                                                    <ul class="dropdown-menu dropdown-cart" role="menu">
                                                        <li>
                                                            <span class="item">
                                                                <span class="item-left">
                                                                    <img src="http://lorempixel.com/50/50/" alt="" />
                                                                    <span class="item-info">
                                                                        <span class="text-muted"><small>UNIFORME COLEGIO MAYOR DE CUNDINAMARCA </small></span>
                                                                        <span><small>23000000$</small></span>
                                                                        <span><small> Cantidad: 9</small></span>
                                                                    </span>

                                                                </span>
                                                                <span class="item-right">
                                                                    <button class="btn btn-xs btn-danger pull-right">x</button>
                                                                </span>
                                                            </span>
                                                        </li>
                                                        <li>
                                                            <span class="item">
                                                                <span class="item-left">
                                                                    <img src="http://lorempixel.com/50/50/" alt="" />
                                                                    <span class="item-info">
                                                                        <span class="text-muted"><small>UNIFORME COLEGIO MAYOR DE CUNDINAMARCA </small></span>
                                                                        <span><small>23000000$</small></span>
                                                                        <span><small> Cantidad: 9</small></span>
                                                                    </span>

                                                                </span>
                                                                <span class="item-right">
                                                                    <button class="btn btn-xs btn-danger pull-right">x</button>
                                                                </span>
                                                            </span>
                                                        </li>
                                                        <li>
                                                            <span class="item">
                                                                <span class="item-left">
                                                                    <img src="http://lorempixel.com/50/50/" alt="" />
                                                                    <span class="item-info">
                                                                        <span class="text-muted"><small>UNIFORME COLEGIO MAYOR DE CUNDINAMARCA </small></span>
                                                                        <span><small>23000000$</small></span>
                                                                        <span><small> Cantidad: 9</small></span>
                                                                    </span>

                                                                </span>
                                                                <span class="item-right">
                                                                    <button class="btn btn-xs btn-danger pull-right">x</button>
                                                                </span>
                                                            </span>
                                                        </li>

                                                        <li>
                                                            <span class="item">
                                                                <span class="item-left">
                                                                    <img src="http://lorempixel.com/50/50/" alt="" />
                                                                    <span class="item-info">
                                                                        <span class="text-muted"><small>UNIFORME COLEGIO MAYOR DE CUNDINAMARCA </small></span>
                                                                        <span><small>23000000$</small></span>
                                                                        <span><small> Cantidad: 9</small></span>
                                                                    </span>

                                                                </span>
                                                                <span class="item-right">
                                                                    <button class="btn btn-xs btn-danger pull-right">x</button>
                                                                </span>
                                                            </span>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li><a class="text-center" href="">Ver Carro</a></li>
                                                    </ul>
                                                    </li>

                                                    </ul>

                                                    <!--fIN LISTA CARRITO DE COMPRAS-->

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
                                                        <!--fin menu superior -->
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <div id="contenedor">
                                                            <br>
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-xs-4 item-photo">
                                                                        <img style="max-width:60%;" src="images/<%=benUniforme.getUrl_diseño_Uniforme()%>" />
                                                                    </div>
                                                                    <div class="col-xs-5" style="border:0px solid gray">
                                                                        <!-- Datos del vendedor y titulo del producto -->

                                                                        <h3><%= benUniforme.getNombre_tipo_institucion()%></h3> 
                                                                        <h6 class="title"><small><h5><%=benUniforme.getNombre_uniforme()%></h5></small></h6>
                                                                        <!-- Precios -->

                                                                        <h6 class="title-price"><small><h5>PRECIO UNIF. COMPLETO</h5></small></h6>
                                                                        <h3 style="margin-top:0px;">$ <%= String.format("%1$,.0f", benUniforme.getPrecio())%></h3>

                                                                        <h6 class="title-price"><small><h5>DETALLE DE UNIFORME</h5></small></h6>
                                                                        <p><%= benUniforme.getDescripcion_uniforme()%></p>


                                                                        <!-- Detalles especificos del producto -->

                                                                        <div class="section" style="padding-bottom:20px;">
                                                                            <br>
                                                                            <h3 class="title-attr"><small>CANTIDAD</small></h3><br>                    
                                                                            <div>
                                                                                <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                                                                                <input value="1" />
                                                                                <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                                                                            </div>
                                                                        </div>                

                                                                        <!-- Botones de compra -->
                                                                        <div class="section" style="padding-bottom:20px;">
                                                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Prendas</button>
                                                                            <button class="btn btn-primary"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Agregar al carro</button>
                                                                            <button class="btn btn-primary"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Comprar</button>

                                                                        </div>
                                                                    </div>                              
                                                                </div>
                                                            </div>

                                                            <!-- Modal -->
                                                            <div class="container">
                                                                <div class="modal fade" id="myModal" role="dialog">
                                                                    <div class="modal-dialog">

                                                                        <!-- Modal content-->
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                <center><h4 class="modal-title">PRENDAS</h4></center>
                                                                            </div>
                                                                            <div  class="modal-body">
                                                                                <!--contenido modal-->
                                                                                <%  for (BeanPrenda listaPrendasBean : listaPrendas) {
                                                                                %>
                                                                                <div  class="container">
                                                                                    <div class="row">
                                                                                        <div class="col-xs-8">

                                                                                            <div  class="panel-body">

                                                                                                <div class="row">
                                                                                                    <div class="col-xs-4"><img class="img-responsive" src="Prendas/<%=listaPrendasBean.getUrl_Diseño()%>">
                                                                                                    </div>                        
                                                                                                    <h3 class="product-name"><strong><%=listaPrendasBean.getNombre_Prenda()%></strong></h3>
                                                                                                    <h5 class="product-name"><strong>PRECIO</strong></h5>
                                                                                                    <h6 style="margin-top:0px;">$<%=String.format("%1$,.0f", listaPrendasBean.getPrecioPrenda())%></h6>
                                                                                                    <h5 class="product-name"><strong>TALLA</strong></h5>

                                                                                                    <!--contenido-->
                                                                                                    <%= contTallas.getTallasPorPrendaDetalleProdcuto(listaPrendasBean)%>
                                                                                                   
                                                   
                                                                                                    

                                                                                                    <button class="btn btn-primary"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Agregar al carro</button>
                                                                                                    <button class="btn btn-primary"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Comprar</button>


                                                                                                </div>
                                                                                                <br>

                                                                                            </div>
                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                                <%}%>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button"  class="btn btn-primary" data-dismiss="modal">Close</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!--fin primer uniforme-->

                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
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