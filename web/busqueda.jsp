
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.BEAN.BeanUniforme"%>
<%@page import="modelo.DAO.DaoUniforme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pagina = "hopla";
    if (request.getParameter("busqueda") != null) {
        pagina = request.getParameter("busqueda");
    }
    DaoUniforme daoUniforme = new DaoUniforme();
    ArrayList<BeanUniforme> busquedas = daoUniforme.buscarUniforme(pagina);

    for (BeanUniforme bnUnifor : busquedas) {

%>
<ul class="search-result">
    <li>
        <a href="#"><%=bnUnifor.getNombre_uniforme()%></a>
    </li> 
</ul>
<%}%>