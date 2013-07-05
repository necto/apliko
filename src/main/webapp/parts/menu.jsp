<div id="menu">
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

    <ul>
        <li><a href="<%=request.getContextPath()%>/accs/manage.jsp"> manage users</a></li>
        <li><a href="<%=request.getContextPath()%>/claims/add-claim.jsp"> add a claim</a></li>
        <li><a href="<%=request.getContextPath()%>/claims/list-claims.jsp"> list all claims</a></li>
    </ul>
</div>