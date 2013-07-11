<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="menu" class="userinfo">
    <%@include file="login-widget.jsp"%>
        <a href="<%=request.getContextPath()%>/accs/list-users.jsp"> управление пользователями</a>|
        <a href="<%=request.getContextPath()%>/claims/list-claims.jsp"> список заявок</a>|
        <a href="<%=request.getContextPath()%>/claims/add-claim.jsp"> добавить заявку</a>|
        <a href="<%=request.getContextPath()%>/org/manage.jsp"> администрирование</a>|
</div>