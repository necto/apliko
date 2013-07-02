<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="base.ClaimsEntity" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    private int mnum = 35;
%>
<html>
<head>
    <title></title>
</head>
<body>
  <p> Received parameter: <b> <%=request.getParameter("claim-name") %></b></p>
  
  <p> All stored names: 
    <ul>    
<%
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        ClaimsEntity clm = new ClaimsEntity( mnum++, request.getParameter("claim-name"));
        em.persist( clm);
        em.getTransaction().commit();
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
