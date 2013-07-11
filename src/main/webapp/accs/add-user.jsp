<%@ page import="util.HtmlGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> Добавление нового пользователя </stripes:layout-component>
    <stripes:layout-component name="content">

        <form action="list-users.jsp" method="post">
            <table class="outertable" align="center">
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
                        Статус:
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
                        <select name="building">
                        <%=
                            HtmlGenerator.generateBuildingSelectList(null)
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Подразделение:</td>
                    <td>
                        <select name=unit>
                        <%= HtmlGenerator.generateUnitSelectList(null)%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Телефон:</td>
                    <td><input type="text" name="telephone"/></td>
                </tr>
                </tbody>
            </table>

            <input type="submit" name="add-user" value="Добавить"/>
        </form>
    </stripes:layout-component>
</stripes:layout-render>



