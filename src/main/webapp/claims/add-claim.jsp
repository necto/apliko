<%@ page import="base.DataBase" %>
<%@ page import="base.entities.*" %>
<%@ page import="util.HtmlGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> Add a new claim </stripes:layout-component>
<stripes:layout-component name="content">
    <div class="infobox">
        <form action="list-claims.jsp" method="post">
        <%
            ClaimsEntity sample = DataBase.generateClaimByUser(request.getUserPrincipal().getName());
        %>
            <h3>Сведения для заявки:</h3>
            <table class="form" border="1" width="6">
                <tbody>
                <tr>
                    <td>Ваша фамилия</td>
                    <td>
                        <input type="text" name="surname" value="<%=sample.getSurname()%>" />
                    </td>
                </tr>
                <tr>
                    <td>Ваше имя</td>
                    <td>
                        <input type="text" name="name" value="<%=sample.getName()%>" />
                    </td>
                </tr>
                <tr>
                    <td>Ваше отчество</td>
                    <td>
                        <input type="text" name="middle_name" value="<%=sample.getMiddleName()%>" />
                    </td>
                </tr>
                <tr>
                    <td>Контактный телефон</td>
                    <td>
                        <input type="text" name="telephone" value="<%=sample.getTelephone()%>" />
                    </td>
                </tr>
                <!-- TODO: other fields, see Database.generateclaimbyuser -->
                <tr>
                    <td>Корпус (связан с городком)</td>
                    <td>
                        <select name="building">
                        <%=
                            HtmlGenerator.generateBuildingSelectList(sample.getBuilding())
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Подразделение
                    </td>
                    <td>
                        <select name=unit>
                            <%= HtmlGenerator.generateUnitSelectList(sample.getUnit())%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Кабинет</td>
                    <td>
                        <input type="text" name="room" />
                    </td>
                </tr>
                <tr>
                    <td>Тип и модель оборудования</td>
                    <td>
                        <input type="text" name="device_type" />
                    </td>
                </tr>
                <tr>
                    <td>Сервисный номер оборудования</td>
                    <td>
                        <input type="text" name="device_number" />
                    </td>
                </tr>
                <tr>
                    <td>Описание проблемы</td>
                    <td>
                        <textarea name="problem_description" rows="4" cols="30"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Приоритет</td>
                    <td>
                        <select name="priority">
                            <%=HtmlGenerator.generatePrioritySelectList()%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Дополнительный комментарий</td>
                    <td>
                        <textarea name="comment" rows="4" cols="30"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        Сервисный номер
                    </td>
                    <td>
                        <input type="text" name="service_number" />
                    </td>
                </tr>

                </tbody>
            </table>

            <input type="submit" name="add-claim" value="Подтвердить" />
        </form>
    </div>
</stripes:layout-component>
</stripes:layout-render>
