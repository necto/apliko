<div id="menu">
    <% if ( request.getUserPrincipal() != null ) { %>
    <div>
        You are logged in as:
        <%= request.getUserPrincipal().getName() %>
        <a href="logout.jsp">logout</a>
    </div>
    <% } else { %>
    <div> You are not logged in.</div>
    <% } %>

    <ul>
        <li><a href="<%=request.getContextPath()%>/accs/manage.jsp"> manage users</a></li>
        <li><a href="<%=request.getContextPath()%>/claims/add-claim.jsp"> add a claim</a></li>
        <li><a href="<%=request.getContextPath()%>/claims/list-claims.jsp"> list all claims</a></li>
    </ul>
</div>