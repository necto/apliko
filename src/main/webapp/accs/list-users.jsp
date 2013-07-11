<%@ page isELIgnored ="false" %>
<%@ page import="base.entities.UsersEntity" %>
<%@ page import="base.DataBase" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="base.entities.UserinfoEntity" %>
<%@ page import="util.SortingGenerator" %>
<%@ page import="util.HtmlGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> List all users </stripes:layout-component>
    <stripes:layout-component name="content">

        <%
            if ( request.getParameter("add-user") != null)
            {
                DataBase.addUser( request.getParameterMap());
        %>
        <div class="infobox">
            <%=request.getParameter("name") + " " + request.getParameter("middle_name") + " " +
               request.getParameter("surname")%> добавлен в систему
        </div>
        <%
            }
        %>

        <%
            if ( request.getParameter("delete-users") != null)
            {
                String [] names = request.getParameterValues("user");
                if (names == null || names[0] == null)
                {
                    out.print("<div class=\"infobox\"> Ни один пользователь не выбран для уделения" +
                            " </div>");

                }
                else
                {
                    if (Arrays.asList(names).contains(request.getUserPrincipal().getName()) )
                        throw new RuntimeException( "User can't delete himself!");
                    DataBase.deleteUsers(names);

                    out.print("<div class=\"infobox\"> Пользователи: ");
                    Boolean first = true;
                    for ( String name: names)
                    {
                        if (!first)
                            out.print(", ");
                        out.print(name);
                        first = false;
                    }
                    out.print(" были удалены.</div>");
                }
            }

            List<UsersEntity> logins = DataBase.listUsers(request.getParameterMap());
            List<UserinfoEntity> users = DataBase.listUserinfos(request.getParameterMap());
            SortingGenerator srt = new SortingGenerator(request.getParameterMap());
        %>
        <div class="infobox">
            <h3> Пользователи </h3>

            <form action="list-users.jsp">
            <table class="tickets_table">
                <tr>
                    <th><%=srt.makeColumnHeader("Логин", "userName")%></th>
                    <th><%=srt.makeColumnHeader("ФИО", "surname")%></th>
                    <th><%=srt.makeColumnHeader("Телефон", "telephone")%></th>
                    <th><%=srt.makeColumnHeader("Городок", "building")%></th>
                    <th><%=srt.makeColumnHeader("Корпус", "building")%></th>
                    <th><%=srt.makeColumnHeader("Подразделение", "unit")%></th>
                    <th>Роли</th>
                    <th>Удалить</th>
                </tr>
                <%
                    for (UsersEntity login : logins) {
                        UserinfoEntity user = null;
                        for (UserinfoEntity u : users)
                            if (u.getUserName().equals(login.getUserName()))
                                user = u;
                        if ( user != null)
                        {
                %>
                <tr class="tickets_table">
                    <td><b> <a href="view-user.jsp?user_name=<%=login.getUserName()%>">
                        <%=login.getUserName()%>
                    </a></b></td>
                    <td>
                        <%= user.getName() + " " + user.getMiddleName() + " " +
                                user.getSurname()%>
                    </td>
                    <td>
                        <%= user.getTelephone()%>
                    </td>
                    <td>
                        <%
                            if (user.getBuilding() != null &&
                                    user.getBuilding().getTown() != null)
                                out.print (user.getBuilding().getTown().getName());
                            else
                                out.print("не указан");
                        %>
                    </td>
                    <td>
                        <%
                            if (user.getBuilding() != null)
                                out.print(user.getBuilding().getName());
                            else
                                out.print("не указан");
                        %>
                    </td>
                    <td>
                        <%
                            if (user.getUnit() != null)
                                out.print (user.getUnit().getName());
                            else
                                out.print("не указан");
                        %>
                    </td>
                    <td>
                        <%=HtmlGenerator.generateRolesList(login)%>
                    </td>
                    <td>
                        <input type="checkbox" name="user" value="<%=login.getUserName()%>"
                                <% if ( login.getUserName().equals(request.getUserPrincipal().getName()))
                                    out.println(" disabled ");
                                %>
                                />
                    </td>
                </tr>
                <%      }
                    }
                %>
            </table>
                <div style="text-align: center"><button type="submit"  name="delete-users">Удалить </button></div>
            </form>

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
        </div>
    </stripes:layout-component>
</stripes:layout-render>
