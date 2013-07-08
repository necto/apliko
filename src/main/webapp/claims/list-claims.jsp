<%@ page import="base.DataBase" %>
<%@ page import="base.entities.ClaimsEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="util.FilterGenerator" %>
<%@ page import="util.SortingGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> List of all claims </stripes:layout-component>
<stripes:layout-component name="content">
    <%
        SortingGenerator srt = new SortingGenerator(request.getParameterMap());
    %>
    <p> Filter by:
    <ul>
    <li>user_name
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="userName"/>
            <input type="submit"/>
        </form></li>
    <li>name
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
        value="name"/>
            <input type="submit"/>
        </form></li>
    <li>buildings_list
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="buildingsList"/>
            <input type="submit"/>
        </form></li>
    <li>room
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="room"/>
            <input type="submit"/>
        </form></li>
    <li>device_type
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="deviceType"/>
            <input type="submit"/>
        </form></li>
    <li>device_number
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="deviceNumber"/>
            <input type="submit"/>
        </form></li>
    <li>problem_description
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="problemDescription"/>
            <input type="submit"/>
        </form></li>
    <li>priority
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="priority"/>
            <input type="submit"/>
        </form></li>
    <li>comment
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="comment"/>
            <input type="submit"/>
        </form></li>
    <li>telephone
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="telephone"/>
            <input type="submit"/>
        </form></li>
    <li>status
        <form>
            <input type="text" name="filter-val"/>
            <input type=hidden name="filter-field"
       value="status"/>
            <input type="submit"/>
        </form></li>
    </ul>
    <h2>Found claims: </h2>
    <%
        List<ClaimsEntity> claims = DataBase.listClaims(request.getParameterMap());
    %>
    <table>
        <tr>
            <th><%=srt.makeColumnHeader("Name", "name")%></th>
            <th><%=srt.makeColumnHeader("Phone", "telephone")%></th>
            <th><%=srt.makeColumnHeader("Status", "status")%></th>
        </tr>
        <%
            for (ClaimsEntity claim : claims) {
                String link = "<a href=\"view-claim.jsp?id=" + claim.getId() + "\">";
                out.print("<tr>");
                out.print("<th>" + link);
                out.print(claim.getName());
                out.print("</a></th><th>" + link);
                out.print(claim.getTelephone());
                out.print("</a></th><th>" + link);
                out.print(claim.getStatus());
                out.println("</a></th></tr>");
            }
        %>
    </table>
    </p>
</stripes:layout-component>
</stripes:layout-render>
