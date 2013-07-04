<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="base.UsersEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> Users deleted </stripes:layout-component>
<stripes:layout-component name="content">
    <%
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("authPU");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        for ( String name : request.getParameterValues("user"))
        {
            for (Object role: em.createQuery("select r from UserRolesEntity r " +
                    "where r.userName = '" + name + "'")
                    .getResultList())
                em.remove( role);
            UsersEntity user = em.find(UsersEntity.class, name);
            em.remove(user);
        }
        em.getTransaction().commit();
    %>
    <a href="manage.jsp"> back</a>
</stripes:layout-component>
</stripes:layout-render>
