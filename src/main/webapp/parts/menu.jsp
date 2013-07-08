<div id="menu">
    <ul>
        <li><a href="<%=request.getContextPath()%>/accs/list-users.jsp"> list users</a></li>
        <li><a href="<%=request.getContextPath()%>/accs/add-user.jsp"> add user</a></li>
        <li><a href="<%=request.getContextPath()%>/claims/add-claim.jsp"> add claim</a></li>
        <li><a href="<%=request.getContextPath()%>/claims/list-claims.jsp"> list claims</a></li>
        <li><%@include file="login-widget.jsp"%></li>
    </ul>
</div>