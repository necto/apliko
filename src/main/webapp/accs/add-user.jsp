<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="base.UsersEntity" %>
<%@ page import="base.UserRolesEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/basic.jsp">
<stripes:layout-component name="title"> User is added </stripes:layout-component>
<stripes:layout-component name="content">
    <%
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("authPU");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        UsersEntity user = new UsersEntity();
        user.setUserName(request.getParameter("user-name"));
        user.setUserPass(request.getParameter("user-password"));
        em.persist(user);
        UserRolesEntity role = new UserRolesEntity();
        role.setUserName(request.getParameter("user-name"));
        role.setRoleName(request.getParameter("user-role"));
        em.persist(role);
        em.getTransaction().commit();
    %>
    <a href="manage.jsp"> back</a>
</stripes:layout-component>
</stripes:layout-render>