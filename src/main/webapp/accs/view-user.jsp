<%@ page import="base.DataBase" %>
<%@ page import="base.entities.UserinfoEntity" %>
<%@ page import="base.entities.UsersEntity" %>
<%@ page import="util.HtmlGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> Просмотр данных пользователя: </stripes:layout-component>
    <stripes:layout-component name="content">
        <%
            UserinfoEntity user = DataBase.getUserInfo(request.getParameter("user_name"));
            UsersEntity acc = DataBase.getUserAcc(request.getParameter("user_name"));
        %>
        <div class="infobox">
        <h3>Просмотр пользователя.</h3>
            <table border="1">
                <tbody>
                    <tr>
                        <td>Ник:</td>
                        <td><%=user.getUserName()%></td>
                    </tr>
                    <tr>
                        <td>Имя:</td>
                        <td><%=user.getName()%></td>
                    </tr>
                    <tr>
                        <td>Отчество:</td>
                        <td><%=user.getMiddleName()%></td>
                    </tr>
                    <tr>
                        <td>Фамилия:</td>
                        <td><%=user.getSurname()%></td>
                    </tr>
                    <tr>
                        <td>Роли:</td>
                        <td><%=HtmlGenerator.generateRolesList(acc)%></td>
                    </tr>
                    <tr>
                        <td>Городок:</td>
                        <td><%=user.getBuilding().getTown().getName()%></td>
                    </tr>
                    <tr>
                        <td>Корпус:</td>
                        <td><%=user.getBuilding().getName()%></td>
                    </tr>
                    <tr>
                        <td>Подразделение:</td>
                        <td><%=user.getUnit().getName()%></td>
                    </tr>
                    <tr>
                        <td>Телефон:</td>
                        <td><%=user.getTelephone()%></td>
                    </tr>
                </tbody>
            </table>
        </div>


    </stripes:layout-component>
</stripes:layout-render>
