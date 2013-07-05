<%@ page isELIgnored ="false" %>
<%@ page import="base.entities.UsersEntity" %>
<%@ page import="base.DataBase" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> User management page </stripes:layout-component>
    <stripes:layout-component name="content">
        <h3> Users in the system: </h3>

        <form action="delete-user.jsp">
            <ul>
                <%
                for (UsersEntity user : DataBase.listUsers(request.getParameterMap())) {
                    out.print("<li>");

                    out.println("<input type=\"checkbox\"" +
                                " name=\"user\" value=\"" +
                                user.getUserName() + "\"");
                    if ( user.getUserName().equals(request.getUserPrincipal().getName()))
                        out.println(" disabled ");
                    out.println("/>");
                    out.println(user.getUserName());
                    out.println(" <b>roles</b>: ");

                    out.println(user.getRoles());
                    out.print("</li>");
                }
            %>
            </ul>
            <button type="submit" >delete </button>
        </form>
        <h3> Добавить нового пользователя.</h3>

        <form action="add-user.jsp" method="post">
            <table border="1">
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
                        <td>Role: <input type="radio" name="user-role" value="manager"/> Manager
                         <input type="radio" name="user-role" value="customer" checked/> Customer
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
                        <select name="buildings_list">
                            <option>Учебный корпус №1</option>
                            <option>Учебный корпус №2</option>
                            <option>Учебный корпус №3</option>
                            <option>Учебный корпус №4</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Unit:</td>
                    <td><input type="text" name="unit"/></td>
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
