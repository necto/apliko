<%@ page import="base.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> User is added </stripes:layout-component>
<stripes:layout-component name="content">
    <%
        DataBase.addUser( request.getParameterMap());
    %>
    <a href="list-users.jsp"> back</a>
</stripes:layout-component>
</stripes:layout-render>