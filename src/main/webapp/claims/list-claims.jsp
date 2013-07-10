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
        if (request.getParameter("add-claim") != null)
        {
            Integer id = 0;
            id = DataBase.addClaim(request.getParameterMap(), request.getUserPrincipal().getName());
    %>
    <div class="infobox"> Заявка №: <a href="view-claim.jsp?id=<%=id%>"<b> <%=id%></b></a> зарегистрирована</div> <br/>
    <%
        }
    %>
    <div class="infobox">
        <button onclick="toggle('filters')">Фильтры</button>
        <div id="filters" style="display:none;">
        <form>
            <label for="fltr-user_name">Логин пользователя</label>
            <input type="text" name="fltr-user_name" id="fltr-user_name"/><br/>
            <label for="fltr-surname">Фамилия</label>
            <input type="text" name="fltr-surname" id="fltr-surname"/><br/>
            <label for="fltr-name">Имя</label>
            <input type="text" name="fltr-name" id="fltr-name" /><br/>
            <label for="fltr-middle_name">Отчество</label>
            <input type="text" name="fltr-middle_name" id="fltr-middle_name"/><br/>
            <label for="fltr-building">Корпус</label>
            <select name="fltr-building" id="fltr-building">
                <option value="0" selected>--</option>
                <%=
                HtmlGenerator.generateBuildingSelectList(null)
                %>
            </select><br/>
            <label for="fltr-unit">Подразделение</label>
            <select name="fltr-unit" id="fltr-unit">
                <option value="0" selected>--</option>
                <%=
                HtmlGenerator.generateUnitSelectList(null)
                %>
            </select><br/>
            <label for="fltr-room">Кабинет</label>
            <input type="text" name="fltr-room" id="fltr-room"/><br/>
            <label for="fltr-device_type">Тип оборудования</label>
            <input type="text" name="fltr-device_type" id="fltr-device_type"/><br/>
            <label for="fltr-device_number">Сервисный номер оборудования</label>
            <input type="text" name="fltr-device_number" id="fltr-device_number"/><br/>
            <label for="fltr-type">Тип проблемы</label>
            <select name="fltr-type" id="fltr-type">
                <option value="0" selected>--</option>
                <%=HtmlGenerator.generateClaimTypeSelectList()%>
            </select><br/>
            <label for="fltr-problem_description">Описание проблемы</label>
            <input type="text" name="fltr-problem_description" id="fltr-problem_description"/><br/>
            <label for="fltr-priority">Приоритет</label>
            <select name="fltr-priority" id="fltr-priority">
                <option value="0" selected>--</option>
                <%=HtmlGenerator.generatePrioritySelectList()%>
            </select><br/>
            <label for="fltr-comment">Дополнительный комментарий</label>
            <input type="text" name="fltr-comment" id="fltr-comment"/><br/>
            <label for="fltr-telephone">Телефон</label>
            <input type="text" name="fltr-telephone" id="fltr-telephone"/><br/>
            <label for="fltr-status">Статус</label>
            <select name="fltr-status" id="fltr-status">
                <option value="0" selected>--</option>
                <%=HtmlGenerator.generatePrioritySelectList()%>
            </select><br/>
            <label for="fltr-service_number">Сервисный номер</label>
            <input type="text" name="fltr-service_number" id="fltr-service_number"/><br/>
            <input type="submit"/>
        </form>
        </div></div>
    <div class="infobox">
        <h2>Найденные заявки: </h2>
        <%
            List<ClaimsEntity> claims = DataBase.listClaims(request.getParameterMap());
        %>
        <table>
            <tr>
                <th><%=srt.makeColumnHeader("№", "id")%></th>
                <th><%=srt.makeColumnHeader("Имя", "name")%></th>
                <th><%=srt.makeColumnHeader("Телефон", "telephone")%></th>
                <th><%=srt.makeColumnHeader("Статус", "status")%></th>
            </tr>
            <%
                for (ClaimsEntity claim : claims) {
                    String link = "<a href=\"view-claim.jsp?id=" + claim.getId() + "\">";
                    out.print("<tr>");
                    out.print("<td><b>" + link);
                    out.print(claim.getId());
                    out.print("</a></b></td>");
                    out.print("<td>");
                    out.print(claim.getName());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(claim.getTelephone());
                    out.print("</td><td>");
                    out.print(claim.getStatus().getName());
                    out.println("");
                    out.println("</td></tr>");
                }
            %>
        </table>
    </div>
</stripes:layout-component>
</stripes:layout-render>
