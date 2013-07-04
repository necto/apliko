<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/style.css">
    <title>Login</title>
</head>

<% if (request.getParameter("auth-error") == "true") { %>
<div style="margin-bottom:1em;margin-top:1em;color:red;">
    Invalid User Name or Password, please try again.<br/>
    Please ensure Caps Lock is off.
</div>
<% } %>

<form method="POST" action="j_security_check" name="form">
    <table border="0" style="margin-left:0.25em;">
        <tr>
            <td><label>User Name</label><b>*</b></td>
            <td><input type="text" name="j_username" maxlength="20" style="width:150px;"/></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label>User Password</label><b>*</b></td>
            <td><input type="password" name="j_password" maxlength="20" style="width:150px;"/></td>
            <td><button type="submit" > login </button></td>
        </tr>
    </table>
</form>

<script type="text/javascript">
    document.form.j_username.focus();
</script>

</html>