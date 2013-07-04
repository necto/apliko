
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h2>Enter some text in order to add it to our DB</h2>
<form action="accept-claim.jsp">
    Claim name: <input type="text" name="claim-name"/> <br/>
    <input type="submit" />
</form>
<%@include file="/parts/menu.jsp"%>
</body>
</html>