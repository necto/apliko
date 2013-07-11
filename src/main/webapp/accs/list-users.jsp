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
    <stripes:layout-component name="title"> Список пользователей </stripes:layout-component>
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

                    out.print("<div class=\"infobox\">");
                    if ( names.length == 1)
                        out.print("Пользователь ");
                    else
                        out.print("Пользователи: ");
                    Boolean first = true;
                    for ( String name: names)
                    {
                        if (!first)
                            out.print(", ");
                        out.print(name);
                        first = false;
                    }
                    if ( names.length == 1)
                        out.println(" был удален.</div>");
                    else
                        out.println(" были удалены.</div>");
                }
            }

            List<UserinfoEntity> users = DataBase.listUserinfos(request.getParameterMap());
            SortingGenerator srt = new SortingGenerator(request.getParameterMap());
        %>
        <div class="infobox">
            <a href="<%=request.getContextPath()%>/accs/add-user.jsp"> Добавить пользователя</a>
        </div>

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
                    <label for="fltr-telephone">Телефон</label>
                    <input type="text" name="fltr-telephone" id="fltr-telephone"/><br/>
                    <input type="submit" value="Фильтровать"/>
                </form>
            </div>
        </div>
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
                    <th>Статус</th>
                    <th>Удалить</th>
                </tr>
                <%
                    for (UserinfoEntity user : users) {
                        UsersEntity login =DataBase.getUserAcc(user.getUserName());
                        if ( login != null)
                        {
                %>
                <tr class="tickets_table">
                    <td><b> <a href="view-user.jsp?user_name=<%=login.getUserName()%>">
                        <%=login.getUserName()%>
                    </a></b></td>
                    <td>
                        <%= user.fullName()%>
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
        </div>
    </stripes:layout-component>
</stripes:layout-render>
