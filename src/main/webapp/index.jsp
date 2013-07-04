<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> APLIKO </stripes:layout-component>
<stripes:layout-component name="content">
    <% if ( request.getUserPrincipal() != null ) { %>
        <div>
            You are logged in as:
            <%= request.getUserPrincipal().getName() %>
            <a href="logout.jsp">logout</a>
        </div>
    <% } else { %>
        <div> You are not logged in.</div>
    <% } %>
</stripes:layout-component>
</stripes:layout-render>
