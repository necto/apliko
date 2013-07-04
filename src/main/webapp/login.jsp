<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/basic.jsp">
<stripes:layout-component name="title"> Login </stripes:layout-component>
<stripes:layout-component name="content">
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
</stripes:layout-component>
</stripes:layout-render>
