<%@ page import="base.DataBase" %>
<%@ page import="base.entities.ClaimsEntity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> List of all claims </stripes:layout-component>
<stripes:layout-component name="content">
    <p> All stored names:
    <ul>
        <%
            List<ClaimsEntity> claims = DataBase.listClaims(request.getParameterMap());
        %>
        <%
            for (ClaimsEntity claim : claims) {
                out.print("<li><a href=\"view-claim.jsp?id=");
                out.print(claim.getId());
                out.print("\">");
                out.print(claim.getName());
                out.println("</a></li>");
            }
        %>
    </ul>
    </p>
</stripes:layout-component>
</stripes:layout-render>
