<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>sample apliko page</title>
  </head>
  <body>
  <% if ( request.getUserPrincipal() != null ) { %>
  <div> You are logged in as: <%= request.getUserPrincipal().getName() %> <a href="logout.jsp">logout</a> </div>
  <% } else { %>
  <div> You are not logged in.</div>
  <% } %>

  <h3> Menu: </h3>
  <%@include file="/parts/menu.jsp"%>
  </body>
</html>
