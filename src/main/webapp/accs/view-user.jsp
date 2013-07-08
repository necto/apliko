<%@ page import="base.entities.UsersEntity" %>
<%@ page import="base.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> Просмотр данных пользователя: </stripes:layout-component>
    <stripes:layout-component name="content">
        <%
            UsersEntity user = DataBase.getUser(request.getParameter("user_name"));
        %>
        <h3>Просмотр пользователя.</h3>
        <table border="1">
            <tbody>
                <tr>
                    <td>Ник:</td>
                    <td><%=user.getUserName()%></td>
                </tr>
                <tr>
                    <td>Пароль:</td>
                    <td><%=user.getUserPass()%></td>
                </tr>
                <tr>
                    <td>Имя:</td>
                    <td><%=user.getName()%></td>
                </tr>
                <tr>
                    <td>Фамилия:</td>
                    <td><%=user.getSurname()%></td>
                </tr>
                <tr>
                    <td>Роли:</td>
                    <td><%=user.getRoles()%></td>
                </tr>
                <tr>
                    <td>Корпус:</td>
                    <td><%=user.getBuilding()%></td>
                </tr>
                <tr>
                    <td>Подразделение:</td>
                    <td><%=user.getUnit()%></td>
                </tr>
                <tr>
                    <td>Телефон:</td>
                    <td><%=user.getTelephone()%></td>
                </tr>
            </tbody>
        </table>

        
    </stripes:layout-component>
</stripes:layout-render>
