<%-- 
    Document   : menu_listar
    Created on : 15-ago-2016, 0:00:16
    Author     : David
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DAO.DaoUsuario"%>
<%@page import="modelo.BEAN.BeanUsuario"%>



<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="Error404.jsp"%>
<% HttpSession sesion = request.getSession(false);
    String admin = (String) sesion.getAttribute("admin");
    String usuario = (String) sesion.getAttribute("usuario");
    String nombre = (String) sesion.getAttribute("nombre");

    if (sesion.getAttribute("usuario") != null) {
        response.sendRedirect("menu.jsp");
    } else if (sesion.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    }


%>
<!DOCTYPE html>
<html class="ht">
    <head>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
        <title>Menu</title>
    </head>
    <body class="bd">

        <nav class="navbar navbar-inverse" >
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#">Logo</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <!--Menu usuario-->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="glyphicon glyphicon-user"  data-toggle="dropdown"><b> <%out.print(nombre);%></b> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Editar mi cuenta <span class="glyphicon glyphicon-cog pull-right"></span></a></li>
                                <li class="divider"></li>
                                <li><a href="iniciar?textOpcion=3">Salir<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>  
                                <li class="divider"></li>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--FIN Menu usuario-->


        <!--Menu PANEL DE CONTROL-->
        <br>
        <br>

        <!-- Main -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3">
                    <!-- Left column -->
                    <a href="#"><strong><i class="glyphicon glyphicon-wrench"></i> Herramientas</strong></a>

                    <hr>

                    <ul class="nav nav-stacked">
                        <li class="nav-header"> <a href="#" data-toggle="collapse" data-target="#userMenu">Ajustes<i class="glyphicon glyphicon-chevron-right"></i></a>
                            <ul class="nav nav-stacked collapse colapse in" id="userMenu"><!---colapse in para abrirla por defecto--->
                                <li><a href="menuAdmin.jsp"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                                <li><a href="#"><i class="glyphicon glyphicon-envelope"></i> Mensajes <span class="badge badge-info">0</span></a></li>
                                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Opciones</a></li>

                                <li class="active"><a href="menuA_listar.jsp?pagina=0"><i class="glyphicon glyphicon-user"></i> Lista usuarios</a></li>
                                <li><a href="#"><i class="glyphicon glyphicon-flag"></i> Pedidods</a></li>


                            </ul>
                        </li>
                        <li class="nav-header"> <a href="#" data-toggle="collapse" data-target="#menu2"> Agregar/Editar <i class="glyphicon glyphicon-chevron-right"></i></a>

                            <ul class="nav nav-stacked collapse" id="menu2">
                                <li><a href="#">Tela &amp; Cosas</a>
                                </li>
                                <li><a href="#">Botones</a>
                                </li>
                                <li><a href="#">Cremalleras</a>
                                </li>
                                <li><a href="#">Cambiar Uniforme</a>
                                </li>
                                <li><a href="#">Cambiar Precios</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-header">
                            <a href="#" data-toggle="collapse" data-target="#menu3"> Redes Sociales <i class="glyphicon glyphicon-chevron-right"></i></a>
                            <ul class="nav nav-stacked collapse" id="menu3">
                                <li><a href=""><i class="glyphicon glyphicon-circle"></i> Facebook</a></li>
                                <li><a href=""><i class="glyphicon glyphicon-circle"></i> Twitter</a></li>
                            </ul>
                        </li>
                    </ul>

                    <hr>



                    <hr>


                </div>
                <div class="col-sm-9">


                    <h2>Usuarios</h2>
                    <p class="lead">
                        Usuarios en la base de datos
                    </p>

                    <div class="alert alert-info">
                        <h4>Lista de Usuarios</h4>
                        <p>Aqui podra ver la informacion basica de los usuarios registrados en su sistema </p>

                    </div>


                    <%int pagina = 0; //pagina a mostrar
                        if (request.getParameter("pagina") == null) {
                            pagina = 1;
                        } else {
                            pagina = Integer.parseInt(request.getParameter("pagina"));
                        }
                        


                    %>

                    <table class="table table-list-search">

                        <tr>
                            <th>Nº</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Correo</th>
                            <th>Direccion</th>
                            <th>Documento</th>

                        </tr>

                        <%                            BeanUsuario beanUs = new BeanUsuario();
                            DaoUsuario daoUs = new DaoUsuario();
                            ArrayList<BeanUsuario> listaUsuarios = daoUs.listarUsuarios(pagina * 10, 10);

                            int cont = pagina * 10;

                            for (BeanUsuario listaUsuario : listaUsuarios) {%>
                        <tr>
                            <td><%=cont + 1%></td>
                            <td><%= listaUsuario.getNombre1()%> </td>
                            <td><%= listaUsuario.getApellido1()%> </td>
                            <td><%= listaUsuario.getCorreo()%> </td>
                            <td><%= listaUsuario.getDireccion()%> </td>
                            <td><%= listaUsuario.getDocumento()%> </td>

                        </tr>
                        <% cont++;
                            }%>

                    </table>   



                    <ul class="pagination pull-left">



                        <%if (pagina > 0) {%> 
                        <li class=""><a href="?pagina=<%=pagina - 1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                <%} else {%>
                        <li class="disabled"><a ><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                <%}%>
                                <%
                                    int numeroRegistros = daoUs.verRegistrosTotales();
                                    int numerPagina = numeroRegistros / 10;

                                    for (int i = 0; i <= numerPagina; i++) {

                                        if (i == Integer.valueOf(request.getParameter("pagina"))) {
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
        </div>
        <!-- /Main -->

        <footer class="container-fluid text-center">
            <p>Footer ® David Daza</p>
        </footer>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>