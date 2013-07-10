<%@ page isELIgnored ="false" %>
<%@ page import="base.entities.UsersEntity" %>
<%@ page import="base.DataBase" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
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
            <%=request.getParameter("name") + " " + request.getParameter("middle_name") + " " +
               request.getParameter("surname")%> добавлен в систему
        <%
            }
        %>

        <%
            if ( request.getParameter("delete-users") != null)
            {
                String [] names = request.getParameterValues("user");
                if (Arrays.asList(names).contains(request.getUserPrincipal().getName()) )
                    throw new RuntimeException( "User can't delete himself!");
                DataBase.deleteUsers(names);

                out.print("Пользователи: ");
                Boolean first = true;
                for ( String name: names)
                {
                    if (!first)
                        out.print(", ");
                    out.print(name);
                    first = false;
                }
                out.print(" были удалены.");
            }
        %>
        <h3> Пользователи </h3>

        <form action="list-users.jsp">
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
            <button type="submit"  name="delete-users">delete </button>
        </form>
    </stripes:layout-component>
</stripes:layout-render>
