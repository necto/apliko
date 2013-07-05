<%@ page import="base.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> Accepted claim </stripes:layout-component>
<stripes:layout-component name="content">
    <p> Accepted claim: <b> <%=request.getParameter("name") %></b></p> <br/>
    <%
            DataBase.addClaim(request.getParameterMap(), request.getUserPrincipal().getName());
    %>
</stripes:layout-component>
</stripes:layout-render>