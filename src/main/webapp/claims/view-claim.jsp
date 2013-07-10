<%@ page import="base.entities.ClaimsEntity" %>
<%@ page import="base.DataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> Просмотр заявки: </stripes:layout-component>
    <stripes:layout-component name="content">
        <%
            ClaimsEntity claim = DataBase.getClaim(Integer.parseInt(request.getParameter("id")));
        %>
        <div class="infobox">
            <h3>Просмотр заявки.</h3>
            <table border="1">
                <tbody>
                    <tr>
                        <td>
                            Порядковый номер заявки:
                        </td>
                        <td><%=claim.getId()%></td>
                    </tr>
                    <tr>
                        <td>
                            ФИО подавшего заявку:
                        </td>
                        <td><%=claim.getName() + " " +
                               claim.getMiddleName() + " " +
                               claim.getSurname()%></td>
                    </tr>
                    <tr>
                        <td>
                            Контактный телефон:
                        </td>
                        <td>
                            <%=claim.getTelephone()%>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            Городок:
                        </td>
                        <td>
                            <%=claim.townName()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Корпус:
                        </td>
                        <td>
                            <%=claim.buildingName()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Подразделение:
                        </td>
                        <td>
                            <%=claim.unitName()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Кабинет:
                        </td>
                        <td>
                            <%=claim.getRoom()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Тип и модель оборудования:
                        </td>
                        <td>
                            <%=claim.getDeviceType()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Сервисный номер оборудования:
                        </td>
                        <td>
                            <%=claim.getDeviceNumber()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Тип проблемы:
                        </td>
                        <td>
                            <%=claim.typeName()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Описание проблемы:
                        </td>
                        <td>
                            <%=claim.getProblemDescription()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Приоритет:
                        </td>
                        <td>
                            <%=claim.priorityName()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Дополнительный комментарий:
                        </td>
                        <td>
                            <%=claim.getComment()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Сервисный номер:
                        </td>
                        <td>
                            <%=claim.getServiceNumber()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Дата добавления:
                        </td>
                        <td>
                            <%=claim.getDate()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Статус:
                        </td>
                        <td>
                            <%=claim.statusName()%>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </stripes:layout-component>
</stripes:layout-render>
