<%@ page import="base.DataBase" %>
<%@ page import="base.entities.ClaimsEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="util.SortingGenerator" %>
<%@ page import="util.HtmlGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> List of all claims </stripes:layout-component>
<stripes:layout-component name="content">
    <%
        SortingGenerator srt = new SortingGenerator(request.getParameterMap());
    %>
    <p> Отфильтровать заявки:
    <form>
        <label for="fltr-user_name">Логин пользователя</label>
        <input type="text" name="fltr-user_name" id="fltr-user_name"/>
        <label for="fltr-surname">Фамилия</label>
        <input type="text" name="fltr-surname" id="fltr-surname"/>
        <label for="fltr-name">Имя</label>
        <input type="text" name="fltr-name" id="fltr-name" />
        <label for="fltr-middle_name">Отчество</label>
        <input type="text" name="fltr-middle_name" id="fltr-middle_name"/>
        <label for="fltr-building">Корпус</label>
        <select name="fltr-building" id="fltr-building">
            <option value="0" selected>--</option>
            <%=
            HtmlGenerator.generateBuildingSelectList(null)
            %>
        </select>
        <label for="fltr-unit">Подразделение</label>
        <select name="fltr-unit" id="fltr-unit">
            <option value="0" selected>--</option>
            <%=
            HtmlGenerator.generateUnitSelectList(null)
            %>
        </select>
        <label for="fltr-room">Кабинет</label>
        <input type="text" name="fltr-room" id="fltr-room"/>
        <label for="fltr-device_type">Тип оборудования</label>
        <input type="text" name="fltr-device_type" id="fltr-device_type"/>
        <label for="fltr-device_number">Сервисный номер оборудования</label>
        <input type="text" name="fltr-device_number" id="fltr-device_number"/>
        <label for="fltr-problem_description">Описание проблемы</label>
        <input type="text" name="fltr-problem_description" id="fltr-problem_description"/>
        <label for="fltr-priority">Приоритет</label>
        <select name="fltr-priority" id="fltr-priority">
            <option value="0" selected>--</option>
            <%=HtmlGenerator.generatePrioritySelectList()%>
        </select>
        <label for="fltr-comment">Дополнительный комментарий</label>
        <input type="text" name="fltr-comment" id="fltr-comment"/>
        <label for="fltr-telephone">Телефон</label>
        <input type="text" name="fltr-telephone" id="fltr-telephone"/>
        <label for="fltr-status">Статус</label>
        <select name="fltr-status" id="fltr-status">
            <option value="0" selected>--</option>
            <%=HtmlGenerator.generatePrioritySelectList()%>
        </select>
        <label for="fltr-service_number">Сервисный номер</label>
        <input type="text" name="fltr-service_number" id="fltr-service_number"/>
        <input type="submit"/>
    </form>
    <h2>Найденные заявки: </h2>
    <%
        List<ClaimsEntity> claims = DataBase.listClaims(request.getParameterMap());
    %>
    <table>
        <tr>
            <th><%=srt.makeColumnHeader("Имя", "name")%></th>
            <th><%=srt.makeColumnHeader("Телефон", "telephone")%></th>
            <th><%=srt.makeColumnHeader("Статус", "status")%></th>
        </tr>
        <%
            for (ClaimsEntity claim : claims) {
                String link = "<a href=\"view-claim.jsp?id=" + claim.getId() + "\">";
                out.print("<tr>");
                out.print("<td>" + link);
                out.print(claim.getName());
                out.print("</a></td>");
                out.print("<td>" + link);
                out.print(claim.getTelephone());
                out.print("</a></td><td>" + link);
                out.print(claim.getStatus().getName());
                out.println("</a>");
                out.println("</td></tr>");
            }
        %>
    </table>
    </p>
</stripes:layout-component>
</stripes:layout-render>
