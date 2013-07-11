<%@ page import="base.DataBase" %>
<%@ page import="base.entities.UserinfoEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="login">
    <% if ( request.getUserPrincipal() != null ) { %>
    Добро пожаловать,
    <div id="username">
        <%
            UserinfoEntity uinfo = DataBase.getUserInfo(request.getUserPrincipal().getName());
        %>
        <%=uinfo == null ? "??" : uinfo.fullName()%>
    </div>
    <a href="<%=request.getContextPath()%>/logout.jsp">выход</a>
    <% } else { %>
    Вы не вошли в систему.
    <% } %>
</div>