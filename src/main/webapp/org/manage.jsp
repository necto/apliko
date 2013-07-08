<%@ page import="base.DataBase" %>
<%@ page import="base.entities.TownsEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="base.entities.BuildingsEntity" %>
<%@ page import="base.entities.UnitsEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> Accepted claim </stripes:layout-component>
    <stripes:layout-component name="content">
        <%
            if ( request.getParameter("new_town") != null)
                DataBase.addTown(request.getParameter("new_town"));

            if ( request.getParameter("new_building") != null)
            {
                DataBase.addBuildings( request.getParameterValues("new_building"),
                                       request.getParameter("town"));
            }

            if ( request.getParameter("new_unit") != null)
                DataBase.addUnit(request.getParameter("new_unit"));
        %>
        <h3>Новый городок</h3>
        <form>
            <input type="text" name="new_town"/>
            <input type="submit">
        </form>
        <h3>Городки</h3>
        <ul>
            <%
                List<TownsEntity> towns = DataBase.listTowns();
                for (TownsEntity town: towns )
                {
                    out.print("<li>" + town.getName() + "</li>");
                    out.print("<ul>");
                    for (BuildingsEntity building: town.getBuildings())
                    {
                        out.print("<li>" + building.getName() + "</li>");
                    }
                    out.print("</ul>");
            %>
                    <form>
                        <input type="text" name="new_building"/>
                        <input type="hidden" name="town" value="<%=town.getName()%>"/>
                        <input type="submit"/>
                    </form>
            <%
                }
            %>
        </ul>
        <h3>Новое подразделение</h3>
        <form>
            <input type="text" name="new_unit"/>
            <input type="submit">
        </form>
        <h3>Подразделения</h3>
        <ul>
            <%
                for (UnitsEntity unit : DataBase.listUnits())
                {%>
                    <li><%=unit.getName()%></li>
              <%}
            %>
        </ul>
    </stripes:layout-component>
</stripes:layout-render>