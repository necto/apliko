<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/basic.jsp">
<stripes:layout-component name="title"> Logout </stripes:layout-component>
<stripes:layout-component name="content">
    <% request.getSession().invalidate();%>
    You are now logged out. <a href="index.jsp"> return </a>
</stripes:layout-component>
</stripes:layout-render>