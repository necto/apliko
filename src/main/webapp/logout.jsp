<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/basic.jsp">
<stripes:layout-component name="title"> Выход </stripes:layout-component>
<stripes:layout-component name="content">
    <% request.getSession().invalidate();%>
    Вы вышли из системы. <a href="index.jsp"> Вернуться на главную </a>
</stripes:layout-component>
</stripes:layout-render>