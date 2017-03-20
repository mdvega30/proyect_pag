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
<jsp:useBean id="contCatalogo" scope="page" class="controlador.ControladorCatalogo"></jsp:useBean>
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

                                                                            <div class="input-group">
                                                                                <div class="input-group-btn search-panel">
                                                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                                                                        <span id="search_concept" href="#1">Nombre Uniforme</span> <span class="caret"></span>
                                                                                    </button>
                                                                                    <ul class="dropdown-menu" role="menu">
                                                                                        <li><a href="#1">Nombre Uniforme</a></li>
                                                                                        <li><a href="#2">Institucion</a></li>
                                                                                        <li><a href="#3">Tipo de uniforme</a></li>                                                                        
                                                                                        <li class="divider"></li>
                                                                                    </ul>
                                                                                </div>
                                                                                <input type="hidden" name="search_param" value="1" id="search_param">         
                                                                                <input type="text" class="form-control" name="buscar" placeholder="Search">
                                                                                <span class="input-group-btn">
                                                                                    <button class="btn btn-default" type="submit" ><span class="glyphicon glyphicon-search"></span></button>
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
                                                                                    String busca = "";
                                                                                    int tipoBusqueda = 0;
                                                                                    String buscare;

                                                                                    if (request.getParameter("search_param") != null) {
                                                                                        buscare = request.getParameter("search_param");
                                                                                        tipoBusqueda = Integer.parseInt(buscare);

                                                                                    }
                                                                                    if (request.getParameter("buscar") != null) {

                                                                                        busca = request.getParameter("buscar");
                                                                                    }

                                                                                    DaoUniforme daoUniforme = new DaoUniforme();
                                                                                    ArrayList<BeanUniforme> listaUniforme = daoUniforme.listarUniformeCatalog(pagina * 10, 10, busca, tipoBusqueda);
                                                                                    String info = "";
                                                                                    int numeroRegistros = daoUniforme.verRegistrosTotales();
                                                                                    int cont = pagina * 10;
                                                                                    int contador2 = 0;
                                                                                    if (!listaUniforme.isEmpty()) {
                                                                                        if (!busca.equals("")) {
                                                                                            info = "Resultado de Búsqueda";
                                                                                        }
                                                                                %>   

                                                                                <h3 style="margin-left: 35%;color: gray "><%out.print(info);%></h3> 



                                                                                <%= contCatalogo.getProductos(pagina, numeroRegistros, busca.toString(), tipoBusqueda)%>






                                                                                <%

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
