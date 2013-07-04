<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="base.UsersEntity" %>
<%@ page import="base.UserRolesEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User management page</title>
</head>
<body>
<h3> Users in the system: </h3>

<form action="delete-user.jsp">
<ul>
    <%
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("authPU");
        EntityManager em = emf.createEntityManager();
        for (Object entity : em.createQuery("select u from UsersEntity u").getResultList()) {
            UsersEntity user = (UsersEntity)entity;
            out.println("<li><input type=\"checkbox\" name=\"user\" value=\"" + user.getUserName() + "\"/>");
            out.println(user.getUserName());
            out.println(" <b>roles</b>: ");
            for (Object role: em.createQuery("select r.roleName from UserRolesEntity r " +
                    "where r.userName = '" + user.getUserName() + "'")
                    .getResultList())
                out.println(role + ", ");
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

</body>
</html>