<%@ page import="base.DataBase" %>
<%@ page import="base.entities.TownsEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="base.entities.BuildingsEntity" %>
<%@ page import="base.entities.UnitsEntity" %>
<%@ page import="util.HtmlGenerator" %>
<%@ page import="base.entities.ClaimTypeEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> Accepted claim </stripes:layout-component>
    <stripes:layout-component name="content">
        <%
            if ( request.getParameter("new_town") != null)
                DataBase.addTown(request.getParameter("new_town"));

            if ( request.getParameter("delete_town") != null)
                DataBase.deleteTown(Integer.parseInt(request.getParameter("delete_town")));

            if ( request.getParameter("new_building") != null)
                DataBase.addBuildings( request.getParameterValues("new_building"),
                                       request.getParameter("town"));

            if ( request.getParameter("delete_building") != null)
                DataBase.deleteBuilding(Integer.parseInt(request.getParameter("delete_building")));

            if ( request.getParameter("new_unit") != null)
                DataBase.addUnit(request.getParameter("new_unit"));

            if ( request.getParameter("delete_unit") != null)
                DataBase.deleteUnit(Integer.parseInt(request.getParameter("delete_unit")));

            if ( request.getParameter("new_problem_type") != null)
                DataBase.addClaimType(request.getParameter("new_problem_type"));

            if ( request.getParameter("delete_problem_type") != null)
                DataBase.deleteClaimType(Integer.parseInt(request.getParameter("delete_problem_type")));
        %>
        <div class="infobox">
        <h3>Городки</h3>
        <ul class="tree">
            <li>
                <form>
                    <input type="text" name="new_town"/>
                    <input type="submit" class="addBtn">
                </form>
            </li>
            <%
                List<TownsEntity> towns = DataBase.listTowns();
                for (TownsEntity town: towns )
                {
                    String delT = HtmlGenerator.generateDelBtn("delete_town", town.getId());
                    out.print("<li>" + delT + town.getName() + "</li>");
                    out.print("<ul>");
            %>
            <li>
                <form>
                    <input type="text" name="new_building"/>
                    <input type="hidden" name="town" value="<%=town.getName()%>"/>
                    <input type="submit" class="addImg"/>
                </form>
            </li>
            <%
                    for (BuildingsEntity building: town.getBuildings())
                    {
                        String delB = HtmlGenerator.generateDelBtn("delete_building", building.getId());
                        out.print("<li>" + delB + building.getName() + "</li>");
                    }
                    out.print("</ul>");
                }
            %>
        </ul>
        </div>
        <div class="infobox">
        <h3>Подразделения</h3>
        <ul>
            <li>
                <form>
                    <input type="text" name="new_unit"/>
                    <input type="submit" class="addImg">
                </form>
            </li>
            <%
                for (UnitsEntity unit : DataBase.listUnits())
                {
                    String del = HtmlGenerator.generateDelBtn("delete_unit", unit.getId());%>
                    <li><%=del + unit.getName()%></li>
              <%}
            %>
        </ul>
        </div>
        <div class="infobox">
        <h3>Варианты проблем</h3>
        <ul>
            <li>
                <form>
                    <input type="text" name="new_problem_type"/>
                    <input type="submit" class="addImg"/>
                </form>
            </li>
            <%
                for (ClaimTypeEntity type: DataBase.listClaimTypes())
                {
                    String del = HtmlGenerator.generateDelBtn("delete_problem_type", type.getId());%>
                    <li><%=del + type.getName()%></li>
              <%}
            %>
        </ul>
        </div>
    </stripes:layout-component>
</stripes:layout-render>