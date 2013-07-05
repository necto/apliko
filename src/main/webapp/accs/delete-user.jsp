<%@ page import="java.util.Arrays" %>
<%@ page import="base.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> Users deleted </stripes:layout-component>
<stripes:layout-component name="content">
    <%
        String [] names = request.getParameterValues("user");
        if (Arrays.asList(names).contains(request.getUserPrincipal().getName()) )
            throw new RuntimeException( "User can't delete himself!");
        DataBase.deleteUser(names);
    %>
    <a href="manage.jsp"> back</a>
</stripes:layout-component>
</stripes:layout-render>
