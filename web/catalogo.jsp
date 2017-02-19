<%-- 
    Document   : catalogo
    Created on : 06-nov-2016, 3:42:25
    Author     : David
--%>

<%@page import="modelo.DAO.DaoUniforme"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.BEAN.BeanUniforme"%>
<%@page import="modelo.BEAN.BeanUniforme"%>
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
                                                        <!--Fin menu superior-->

                                                        <%int pagina = 0; //pagina a mostrar
                                                            if (request.getParameter("pagina") == null) {
                                                                pagina = 0;
                                                            } else {
                                                                pagina = Integer.valueOf(request.getParameter("pagina"));
                                                            }
                                                        %>

                                                        <div class="container">
                                                            <header class="jumbotron hero-spacer">
                                                                <h1>A Warm Welcome!</h1>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
                                                                <p></p>
                                                                <!--Inicio Barra Buscar -->
                                                                <div class="container">


                                                                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1" >

                                                                        <form action="Catalogo" method="GET">

                                                                            <div class="input-group buscador-principal">                        
                                                                                <input name="search_param" value="all" id="search_param" type="hidden">         

                                                                                <input class="form-control buscar" name="buscar" id="buscar" placeholder="¿Qué quieres buscar?" type="text">
                                                                                <div class="input-group-btn search-panel">
                                                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="bt">
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
                                                                                    <button class="btn btn-primary" id="btnbuscar" type="submit"><span class="glyphicon glyphicon-search"></span> BUSCAR</button>
                                                                                </span>

                                                                            </div>
                                                                        </form>





                                                                        <!--Fin Barra Buscar -->
                                                                        </header>
                                                                    </div>





                                                                    <!-- Page Features -->
                                                                    <div class="container">
                                                                        <div class="row">
                                                                            <div class="col-md-1"></div>
                                                                            <div class="col-md-11">
                                                                                <%
                                                                                    Object busca = "";
                                                                                    if (request.getAttribute("buqueda") != null) {
                                                                                        busca = request.getAttribute("buqueda");

                                                                                    }

                                                                                    DaoUniforme daoUniforme = new DaoUniforme();
                                                                                    ArrayList<BeanUniforme> listaUniforme = daoUniforme.listarUniformeCatalog(pagina * 10, 10, busca.toString());
                                                                                    String info = "";
                                                                                    int cont = pagina * 10;
                                                                                    int contador2 = 0;
                                                                                    if (!listaUniforme.isEmpty()) {
                                                                                        if (!busca.equals("")) {
                                                                                            info = "Resultado de Búsqueda";
                                                                                        }
                                                                                        for (BeanUniforme bnUnifor : listaUniforme) {%>
                                                                                <h3 style="margin-left: 35%;color: gray "><%out.print(info);%></h3> 
                                                                                <div class="product">
                                                                                    <div class="info-large">


                                                                                        <h3>COLORS</h3>
                                                                                        <div class="colors-large">
                                                                                            <ul>
                                                                                                <li><a href="" style="background:#222"><span></span></a></li>
                                                                                                <li><a href="" style="background:#6e8cd5"><span></span></a></li>
                                                                                                <li><a href="" style="background:#f56060"><span></span></a></li>
                                                                                                <li><a href="" style="background:#44c28d"><span></span></a></li>
                                                                                            </ul> 
                                                                                        </div>

                                                                                        <h3>SIZE</h3>
                                                                                        <div class="sizes-large">
                                                                                            <span>XS</span>
                                                                                            <span>S</span>
                                                                                            <span>M</span>
                                                                                            <span>L</span>
                                                                                            <span>XL</span>
                                                                                            <span>XXL</span>
                                                                                        </div>

                                                                                        <button class="add-cart-large">Add To Cart</button>                          

                                                                                    </div>
                                                                                    <div class="make3D">
                                                                                        <div class="product-front">
                                                                                            <div class="shadow"></div>
                                                                                            <img src="images/uniformes/<%=bnUnifor.getUrl_diseño_Uniforme()%>" alt="" />
                                                                                            <div class="image_overlay"></div>
                                                                                            <a href="google.com" target="_blank"><div class="add_to_cart" >VER DETALLES</div></a>
                                                                                            <div class="view_gallery">View gallery</div>                
                                                                                            <div class="stats">         
                                                                                                <div class="stats-container">
                                                                                                    <span class="product_price">$<%=bnUnifor.getPrecio()%></span>
                                                                                                    <span class="product_name"> <%=bnUnifor.getNombre_uniforme()%></span>    
                                                                                                    <p>Tuniforme.com</p>                                            

                                                                                                    <div class="product-options">
                                                                                                        <strong>Descripcion</strong>
                                                                                                        <span><%=bnUnifor.getDescripcion_uniforme()%></span>


                                                                                                    </div>                       
                                                                                                </div>                         
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="product-back">
                                                                                            <div class="shadow"></div>
                                                                                            <div class="carousel">
                                                                                                <ul class="carousel-container">
                                                                                                    <li><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1.jpg" alt="" /></li>
                                                                                                    <li><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/2.jpg" alt="" /></li>
                                                                                                    <li><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/3.jpg" alt="" /></li>
                                                                                                </ul>
                                                                                                <div class="arrows-perspective">
                                                                                                    <div class="carouselPrev">
                                                                                                        <div class="y"></div>
                                                                                                        <div class="x"></div>
                                                                                                    </div>
                                                                                                    <div class="carouselNext">
                                                                                                        <div class="y"></div>
                                                                                                        <div class="x"></div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="flip-back">
                                                                                                <div class="cy"></div>
                                                                                                <div class="cx"></div>
                                                                                            </div>
                                                                                        </div>    
                                                                                    </div>  
                                                                                </div>










                                                                                <%cont++;

                                                                                    }
                                                                                } else {%>
                                                                                <img  style="width: 100px; height: 100px; margin-left: 41% "src="imagenes/advertencia-triangulo_318-28807.jpg" alt=""/>
                                                                                <h1 style="margin-left: 27% ">Resultado de Búsqueda</h1> 
                                                                                <h2 style="margin-left: 29%; color: gray">0 resultados encontrados</h2> 
                                                                                <%}%>
                                                                                <!-- /.row -->
                                                                            </div>
                                                                        </div>
                                                                    </div>



                                                                    <!-- Pagination -->
                                                                    <br>
                                                                    <div class="container">
                                                                        <div class="row text-center">
                                                                            <div class="col-lg-12">
                                                                                <ul class="pagination pull-center">



                                                                                    <%if (pagina > 1) {%> 
                                                                                    <li class=""><a href="?pagina=<%=pagina - 1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                                                                            <%} else {%>
                                                                                    <li class="disabled"><a ><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                                                                            <%}%>
                                                                                            <%
                                                                                                int numeroRegistros = daoUniforme.verRegistrosTotales();
                                                                                                int numerPagina = numeroRegistros / 10;

                                                                                                for (int i = 0; i <= numerPagina; i++) {

                                                                                                    if (i == pagina) {
                                                                                            %>
                                                                                    <li class="active"><a href="?pagina=<%=(i)%>"><%=i + 1%></a></li> 

                                                                                    <%} else {
                                                                                    %>
                                                                                    <li class=""><a href="?pagina=<%=(i)%>"><%=i + 1%></a></li> 

                                                                                    <%}
                                                                                        }%>
                                                                                    <%if (pagina < numerPagina) {%> 
                                                                                    <li><a href="?pagina=<%=pagina + 1%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>

                                                                                    <%} else {%>
                                                                                    <li class="disabled" ><a><span class="glyphicon glyphicon-chevron-right"></span></a></li>

                                                                                    <%}%>
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
                                                                <script src="js/_js.js" type="text/javascript"></script>
                                                                </body>
                                                                </html>
