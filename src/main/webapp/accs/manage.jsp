<%@ page isELIgnored ="false" %>
<%@ page import="base.entities.UsersEntity" %>
<%@ page import="base.DataBase" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> User management page </stripes:layout-component>
<stripes:layout-component name="content">
    <h3> Users in the system: </h3>

    <form action="delete-user.jsp">
        <ul>
            <%
                for (UsersEntity user : DataBase.listUsers(request.getParametersMap())) {
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
        <button type="submit" >delete </button>
    </form>
    <h3> Add a new user</h3>

    <form action="add-user.jsp" method="post">
        User name: <input type="text" name="user-name"/> <br/>
        Password: <input type="password" name="user-password"/> <br/>
        Role: <input type="radio" name="user-role" value="manager"/> Manager
        <input type="radio" name="user-role" value="customer" checked/> Customer
        <input type="submit"/>
    </form>
</stripes:layout-component>
</stripes:layout-render>
