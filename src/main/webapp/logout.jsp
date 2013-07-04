
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/style.css">
    <title>Logout</title>
</head>
<body>
    <% request.getSession().invalidate();%>
    You are now logged out. <a href="index.jsp"> return </a>
</body>
</html>