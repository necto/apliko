<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="base.ClaimsEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/basic.jsp">
<stripes:layout-component name="title"> Accepted claim </stripes:layout-component>
<stripes:layout-component name="content">
    <p> Accepted claim: <b> <%=request.getParameter("claim-name") %></b></p> <br/>
    <%
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        ClaimsEntity clm = new ClaimsEntity( request.getParameter("claim-name"));
        em.persist( clm);
        em.getTransaction().commit();
    %>
</stripes:layout-component>
</stripes:layout-render>