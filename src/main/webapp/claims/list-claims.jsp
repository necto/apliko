<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<p> All stored names:
<ul>
    <%
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
        EntityManager em = emf.createEntityManager();
        for (Object entity : em.createQuery("select m from ClaimsEntity m").getResultList()) {
            out.println("<li>");
            out.println(entity);
            out.print("</li>");
        }
    %>
</ul>
</p>
</body>
</html>