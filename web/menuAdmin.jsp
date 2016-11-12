<%-- 
    Document   : menuAdmin
    Created on : 14-ago-2016, 1:17:38
    Author     : David
--%>

<%@page import="modelo.DAO.DaoUsuario"%>
<%@page import="modelo.BEAN.BeanUsuario"%>
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
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <link rel="shortcut icon" href="imagenes/icono.png">  
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>

        <title>Menu Inicio</title>
    </head>
    <body class="bd">

        <%             BeanUsuario beanUs = new BeanUsuario();
            DaoUsuario daoUs = new DaoUsuario();
            beanUs.setCorreo(usuario1);
            daoUs.contruirObjetoUsuario(beanUs);
        %>

        <nav class="navbar navbar-inverse" >
            <div class="container">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>
                        <a class="navbar-brand" href="menu.jsp"><img src="imagenes/icono.png" alt=""/></a>

                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">

                            <li class="active"><a href="menuAdmin.jsp">Inicio</a></li>

                            <!--Menu desplegable-->
                            <li class="dropdown ">

                                <a href="#" class="glyphicon glyphicon-wrench " data-toggle="dropdown" > Opciones  <span class="caret "></span> </a>

                                <ul class="dropdown-menu ">

                                    <li class="col-sm-3">
                                    <li><a href="menuA_listar.jsp?pagina=0"><i class="glyphicon glyphicon-list"></i> Listar de Usuarios </a></li>



                                </ul>
                            </li>
                            <!--Menu fin desplegable-->
                            <!--Menu desplegable-->
                           
                                
                            <li class="dropdown ">
                                <a href="#" class="glyphicon glyphicon-option-vertical " data-toggle="dropdown"> Agregar/Editar  <span class="caret "></span> </a>

                                <ul class="dropdown-menu ">

                                    <li class="col-sm-3">
                                    <li><a href="Adduniformes.jsp"><i class="glyphicon glyphicon-tasks"></i> Uniformes Catalogo </a></li>
                                    <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Prendas </a></li>
                                    <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Instituciones </a></li>



                                </ul>
                            </li>
                           
                            <!--Menu fin desplegable-->
                            <!--Menu desplegable-->
                            <li class="dropdown ">

                                <a href="#" class="glyphicon glyphicon-globe " data-toggle="dropdown" > Redes Sociales  <span class="caret "></span> </a>

                                <ul class="dropdown-menu ">

                                    <li class="col-sm-3">
                                    <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> FaceBook </a></li>
                                    <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Twitter </a></li>




                                </ul>
                            </li>
                            <!--Menu fin desplegable-->




                        </ul>



                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="glyphicon glyphicon-user"   data-toggle="dropdown"><b> <%= beanUs.getNombre1()%></b> <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#"><i class="icon-envelope"></i> Mensajes <span class="badge badge-info">4</span></a></li>
                                    <li><a href="iniciar?textOpcion=3">Salir<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>  
                                    <li class="divider"></li>

                                </ul>
                            </li>
                        </ul>
                    </div>



                </div>
            </div>
        </nav>

        <!--Fin menu superior-->
        <div class="container">
            <div class="row">
                <br>
                <br>



                <div id="pie">
                    <% if (request.getAttribute("exito") != null) { %>
                    ${exito}
                    <%java.util.Date hora = new java.util.Date();%>
                    <%if (hora.getTime() > 13) {%>
                    <div class="alert alert-info">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Buenas Tardes apreciado Administrador!</strong>¿Como se encuentra?
                    </div>
                    <%} else if (hora.getTime() > 12) {%>
                    <div class="alert alert-info">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Buenas Tardes apreciado Administrador!</strong>¿Como se encuentra?
                    </div>
                    <% } else {%>
                    <div class="alert alert-info">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Buenas Tardes apreciado Administrador!</strong> ¿Como se encuentra?
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
        <script src="js/_js.js" type="text/javascript"></script>s
    </body>
</html>
