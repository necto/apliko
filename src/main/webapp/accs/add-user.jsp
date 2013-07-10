<%@ page import="util.HtmlGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> Add a new user </stripes:layout-component>
    <stripes:layout-component name="content">

        <h3> Добавить нового пользователя.</h3>

        <form action="accept-user.jsp" method="post">
            <table class="form" border="1">
                <tbody>
                <tr>
                    <td>Ник пользователя:</td>
                    <td><input type="text" name="user_name" value=""/></td>
                </tr>
                <tr>
                    <td>Пароль:</td>
                    <td><input type="password" name="user_pass" value=""/></td>
                </tr>
                <tr>
                    <td>
                        Роль:
                    </td>
                    <td>
                        <input type="radio" name="user-role" value="manager"/> Администратор<br/>
                        <input type="radio" name="user-role" value="customer" checked/> Пользователь<br/>
                        <input type="radio" name="user-role" value="performer"/> Сотрудник тех. поддержки
                    </td>
                </tr>
                <tr>
                    <td>Имя:</td>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <td>Фамилия:</td>
                    <td><input type="text" name="surname"/></td>
                </tr>
                <tr>
                    <td>Отчество:</td>
                    <td><input type="text" name="middle_name"/></td>
                </tr>
                <tr>
                    <td>Корпус:</td>
                    <td>
                        <%=
                            HtmlGenerator.generateBuildingSelectList(null)
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Подразделение:</td>
                    <td><%= HtmlGenerator.generateUnitSelectList(null)%></td>
                </tr>
                <tr>
                    <td>Телефон:</td>
                    <td><input type="text" name="telephone"/></td>
                </tr>
                </tbody>
            </table>

            <input type="submit"/>
        </form>
    </stripes:layout-component>
</stripes:layout-render>



