<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="base.UsersEntity" %>
<%@ page import="base.UserRolesEntity" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/style.css">
    <title></title>
</head>
<body>
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
</body>
</html>