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
    <!--link redes sociales-->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/css.redessociales.css" rel="stylesheet" type="text/css"/>
    <!--fin redes sociales-->
    <title>Menu Inicio</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/_js.js" type="text/javascript"></script>
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
            <a class="navbar-brand" href="http://localhost:8080/ProyectoSenaTuniforme/menuAdmin.jsp"><img src="imagenes/icono.png" alt=""/></a>

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

              <!--Menu-redes sociales-->

              <li class="dropdown ">
                <div class="col-md-12">

                  <ul class="social-network social-circle">                   
                    <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>                    
                  </ul>				
                </div>
              </li>
              <!--Menu fin desplegable-->
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a href="#" data-toggle="dropdown"><img src="imagenes/avatar4.png" alt=""/><b> <%= beanUs.getNombre1()%></b> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="listarMensajes.jsp"><i class="icon-envelope"></i> Mensajes <span class="badge badge-info">4</span></a></li>
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
      </div>
    </div>

    <!--presentacion administrador-->
    <br>
    <div class="container">
      <div class="row">
        <div class="text-center ">
          <div class="user-image">
            <!--hay que poner funcion para que cambie a la foto de administrador como tal-->
            <img src="http://www.gravatar.com/avatar/2ab7b2009d27ec37bffee791819a090c?s=100&d=mm&r=g" alt="Karan Singh Sisodia" title="Karan Singh Sisodia" class="img-circle">
          </div>
          <div class="user-info-block">
            <div class="user-heading">
              <h3>David</h3> 
              <span class="help-block">Administrador</span>
            </div>


          </div>
        </div>
      </div>
    </div>

    <!--inicio contenido-->
    <div class="container">
      <div class="row">
        <div class="btn-group btn-group-justified">
          <div class="btn-group">
            <button type="button" class="btn btn-nav">
              <span class="glyphicon glyphicon-folder-close"></span>
              <p>Pedidos</p>
            </button>
          </div>

          <!--prueba calendario-->
          <div class="btn-group">
            <button type="button" class="btn btn-nav" data-toggle="modal"data-target="#myMod">
              <span class="glyphicon glyphicon-calendar"></span>
              <p>Calendario</p>
            </button>
            <div class="modal fade" id="myMod" role="dialog">
              <div class="modal-dialog">
              </div>
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <!--calendario-->
                  <div style="overflow:hidden;">
                    <div class="form-group">
                      <div class="row">
                        <div class="col-md-8">
                          <div id="datetimepicker12"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>
          <!--fin calendario-->


          <div class="btn-group">
            <button type="button" class="btn btn-nav">
              <span class="glyphicon glyphicon-globe"></span>
              <p>Noticias</p>
            </button>
          </div>
          <div class="btn-group">
            <button type="button" class="btn btn-nav">
              <span class="glyphicon glyphicon-bell"></span>
              <p>Pendientes</p>
            </button>
          </div>
        </div>
      </div>
    </div>


    <!-- /Main -->

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>


    <footer class="container-fluid text-center">
      <p>Footer ® David Daza</p>
    </footer>

    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/_js.js" type="text/javascript"></script>
  </body>
</html>
