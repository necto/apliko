<%@ page import="base.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> List of all claims </stripes:layout-component>
<stripes:layout-component name="content">
    <p> All stored names:
    <ul>
        <%
            for (Object entity : DataBase.listClaims()) {
                out.println("<li>");
                out.println(entity);
                out.print("</li>");
            }
        %>
    </ul>
    </p>
</stripes:layout-component>
</stripes:layout-render>
