<%-- 
    Document   : menuAdmin
    Created on : 14-ago-2016, 1:17:38
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesion = request.getSession(false);
    String usuario1 = (String) sesion.getAttribute("admin");
    String usuario2 = (String) sesion.getAttribute("usuario");
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
                    <ul class="nav navbar-nav">

                    </ul>
                    <!--Menu usuario-->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="glyphicon glyphicon-user dropdown-toggle"  data-toggle="dropdown"><b> <%out.print(nombre);%></b> <span class="caret"></span></a>
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
                            <ul class="nav nav-stacked collapse in" id="userMenu"><!---colapse in para abrirla por defecto--->
                                <li class="active"> <a href="#"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                                <li><a href="#"><i class="glyphicon glyphicon-envelope"></i> Mensajes <span class="badge badge-info">0</span></a></li>
                                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Opciones</a></li>

                                <li><a href="menuA_listar.jsp?pagina=0"><i class="glyphicon glyphicon-user"></i> Lista usuarios</a></li>
                                <li><a href="#"><i class="glyphicon glyphicon-flag"></i> Pedidods</a></li>


                            </ul>
                        </li>
                        <li class="nav-header"> <a href="#" data-toggle="collapse" data-target="#menu2"> Agregar/Editar <i class="glyphicon glyphicon-chevron-right"></i></a>

                            <ul class="nav nav-stacked collapse" id="menu2">
                                    
                                <li><a href="Adduniformes.jsp">Agregar Uniformes</a>
                                </li>
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





                </div>
                <div class="col-sm-9">
                    <div id="pie">
                        <% if (request.getAttribute("exito") != null) { %>
                        ${exito}
                        <%java.util.Date hora = new java.util.Date();%>
                        <%if (hora.getTime() > 13) {%>
                        <div class="alert alert-info">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Buenos Dias apreciado Administrador!</strong>¿Como se encuentra?
                        </div>
                        <%} else if (hora.getTime() > 12) {%>
                        <div class="alert alert-info">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Buenas Tardes apreciado Administrador!</strong>¿Como se encuentra?
                        </div>
                        <% } else {%>
                        <div class="alert alert-info">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Buenas Noches apreciado Administrador!</strong> ¿Como se encuentra?
                        </div>     
                        <%}%>
                        <%}%>
                    </div>
                    <div class="well">
                        <h4>Lorem ipsum dolor sit amet</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed consectetur urna. Nullam in dictum velit, tincidunt tempor urna. Nulla facilisi. Phasellus a nibh nec risus lobortis feugiat quis quis felis. Sed vitae ante tortor. Fusce tincidunt accumsan risus ut mollis. Donec hendrerit sit amet erat et scelerisque. Sed efficitur interdum diam, sit amet tempus purus vehicula sed. Sed tincidunt, odio vitae suscipit luctus, lectus leo rutrum magna, nec sodales nulla erat sit amet turpis. In sollicitudin sed libero aliquet auctor. Proin cursus elit odio, a sollicitudin augue gravida ac. Cras commodo mollis posuere. Pellentesque sed condimentum erat, sit amet egestas ipsum. Praesent tincidunt turpis vel magna semper, sed iaculis magna aliquam. Ut ornare augue at mollis maximus. </p>
                        <p>Nullam non enim erat. Donec eu sapien velit. Sed sed sem quis ipsum vehicula tempor id in velit. Etiam molestie tempus feugiat. Nunc aliquet suscipit odio, vel eleifend diam sodales at. Phasellus blandit nunc sapien, non venenatis nisl tincidunt vitae. Pellentesque luctus neque velit, gravida malesuada odio pellentesque vel. </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed consectetur urna. Nullam in dictum velit, tincidunt tempor urna. Nulla facilisi. Phasellus a nibh nec risus lobortis feugiat quis quis felis. Sed vitae ante tortor. Fusce tincidunt accumsan risus ut mollis. Donec hendrerit sit amet erat et scelerisque. Sed efficitur interdum diam, sit amet tempus purus vehicula sed. Sed tincidunt, odio vitae suscipit luctus, lectus leo rutrum magna, nec sodales nulla erat sit amet turpis. In sollicitudin sed libero aliquet auctor. Proin cursus elit odio, a sollicitudin augue gravida ac. Cras commodo mollis posuere. Pellentesque sed condimentum erat, sit amet egestas ipsum. Praesent tincidunt turpis vel magna semper, sed iaculis magna aliquam. Ut ornare augue at mollis maximus. </p>
                        <p>Nullam non enim erat. Donec eu sapien velit. Sed sed sem quis ipsum vehicula tempor id in velit. Etiam molestie tempus feugiat. Nunc aliquet suscipit odio, vel eleifend diam sodales at. Phasellus blandit nunc sapien, non venenatis nisl tincidunt vitae. Pellentesque luctus neque velit, gravida malesuada odio pellentesque vel. </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed consectetur urna. Nullam in dictum velit, tincidunt tempor urna. Nulla facilisi. Phasellus a nibh nec risus lobortis feugiat quis quis felis. Sed vitae ante tortor. Fusce tincidunt accumsan risus ut mollis. Donec hendrerit sit amet erat et scelerisque. Sed efficitur interdum diam, sit amet tempus purus vehicula sed. Sed tincidunt, odio vitae suscipit luctus, lectus leo rutrum magna, nec sodales nulla erat sit amet turpis. In sollicitudin sed libero aliquet auctor. Proin cursus elit odio, a sollicitudin augue gravida ac. Cras commodo mollis posuere. Pellentesque sed condimentum erat, sit amet egestas ipsum. Praesent tincidunt turpis vel magna semper, sed iaculis magna aliquam. Ut ornare augue at mollis maximus. </p>
                        <p>Nullam non enim erat. Donec eu sapien velit. Sed sed sem quis ipsum vehicula tempor id in velit. Etiam molestie tempus feugiat. Nunc aliquet suscipit odio, vel eleifend diam sodales at. Phasellus blandit nunc sapien, non venenatis nisl tincidunt vitae. Pellentesque luctus neque velit, gravida malesuada odio pellentesque vel. </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed consectetur urna. Nullam in dictum velit, tincidunt tempor urna. Nulla facilisi. Phasellus a nibh nec risus lobortis feugiat quis quis felis. Sed vitae ante tortor. Fusce tincidunt accumsan risus ut mollis. Donec hendrerit sit amet erat et scelerisque. Sed efficitur interdum diam, sit amet tempus purus vehicula sed. Sed tincidunt, odio vitae suscipit luctus, lectus leo rutrum magna, nec sodales nulla erat sit amet turpis. In sollicitudin sed libero aliquet auctor. Proin cursus elit odio, a sollicitudin augue gravida ac. Cras commodo mollis posuere. Pellentesque sed condimentum erat, sit amet egestas ipsum. Praesent tincidunt turpis vel magna semper, sed iaculis magna aliquam. Ut ornare augue at mollis maximus. </p>
                        <p>Nullam non enim erat. Donec eu sapien velit. Sed sed sem quis ipsum vehicula tempor id in velit. Etiam molestie tempus feugiat. Nunc aliquet suscipit odio, vel eleifend diam sodales at. Phasellus blandit nunc sapien, non venenatis nisl tincidunt vitae. Pellentesque luctus neque velit, gravida malesuada odio pellentesque vel. </p>
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
