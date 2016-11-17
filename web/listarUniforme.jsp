<%@page import="modelo.BEAN.BeanUniforme"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanUniform" scope="page" class="modelo.BEAN.BeanUniforme"></jsp:useBean>
<jsp:useBean id="daoUnifor" scope="page" class="modelo.DAO.DaoUniforme"></jsp:useBean>

<div class="container">
            <div class="row">
                <br>

                <div class="col-md-12">
                    <h4>Uniformes en catalogo para la venta</h4>
                    <div class="table-responsive">
                       
                        <%int pagina = 0; //pagina a mostrar
                            if (request.getParameter("pagina") == null) {
                                pagina=0;
                            } else {
                                pagina = Integer.valueOf(request.getParameter("pagina"));
                            }
                        %>
                        <table id="mytable" class="table table-bordred table-striped">

                            <thead>

                            <th><input type="checkbox" id="checkall" /></th>
                            <th>N°</th>
                            <th>Nombre Uniforme</th>
                            <th>Tipo uniforme</th>
                            <th>Imagen</th>
                            <th>Descripcion</th>
                            <th>Estado</th>
                            <th>Editar</th>

                            <th>Eliminar</th>
                            </thead>
                            <tbody>
                                <%
                                    
                                    ArrayList<BeanUniforme> listaUniforme = daoUnifor.listarUniforme(pagina * 10, 10);
                                    int cont = pagina * 10;
                                    for (BeanUniforme bnUnifor : listaUniforme) {%>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td><%=cont + 1%></td>
                                    <td><%=bnUnifor.getNombre_uniforme()%></td>
                                    <td><%=bnUnifor.getId_tipoUniforme()%></td>
                                    <td><%=bnUnifor.getUrl_diseño_Uniforme()%></td>
                                    <td><%=bnUnifor.getDescripcion_uniforme()%></td>
                                    <td><%=bnUnifor.getId_estadoUniforme()%></td>                                 
                                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                </tr>
                                <%cont++; }%>









                            </tbody>

                        </table>

                        <div class="clearfix"></div>
                        <ul class="pagination pull-left">



                    <%if (pagina > 1) {%> 
                    <li class=""><a href="?pagina=<%=pagina - 1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                            <%} else {%>
                    <li class="disabled"><a ><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                            <%}%>
                            <%
                                int numeroRegistros = daoUnifor.verRegistrosTotales();
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
            </div>
        </div>