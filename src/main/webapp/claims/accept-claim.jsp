<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="base.ClaimsEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
</head>
<body>
  <p> Accepted claim: <b> <%=request.getParameter("claim-name") %></b></p> <br/>
  <%
      EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
      EntityManager em = emf.createEntityManager();
      em.getTransaction().begin();
      ClaimsEntity clm = new ClaimsEntity( request.getParameter("claim-name"));
      em.persist( clm);
      em.getTransaction().commit();
  %>
  <a href="list-claims.jsp"> list all claims</a>


</body>
</html>
