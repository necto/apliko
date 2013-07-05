<div id="login">
    <% if ( request.getUserPrincipal() != null ) { %>
    You are logged in as:
    <div id="username">
        <%= request.getUserPrincipal().getName() %>
    </div>
    <a href="<%=request.getContextPath()%>/logout.jsp">logout</a>
    <% } else { %>
    You are not logged in.
    <% } %>
</div>