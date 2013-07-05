<div id="menu">
    <ul>
        <li><a href="<%=request.getContextPath()%>/accs/manage.jsp"> manage users</a></li>
        <li><a href="<%=request.getContextPath()%>/claims/add-claim.jsp"> add a claim</a></li>
        <li><a href="<%=request.getContextPath()%>/claims/list-claims.jsp"> list all claims</a></li>
        <li><%@include file="login-widget.jsp"%></li>
    </ul>
</div>