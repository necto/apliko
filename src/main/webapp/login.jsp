<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/basic.jsp">
<stripes:layout-component name="title"> Вход в систему </stripes:layout-component>
<stripes:layout-component name="content">
    <form method="POST" action="j_security_check" name="form">
        <table class="outertable" border="0" align="center" cellpadding="4" width="75%" cellspacing="0" border="0">
            <tr>
                <td><label>Логин</label></td>
                <td><input type="text" name="j_username" maxlength="20" style="width:150px;"/></td>
            </tr>
            <tr>
                <td><label>Пароль</label></td>
                <td><input type="password" name="j_password" maxlength="20" style="width:150px;"/></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <button type="submit" > Войти </button>
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
        document.form.j_username.focus();
    </script>
</stripes:layout-component>
</stripes:layout-render>
