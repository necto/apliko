<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="base.ClaimsEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> Accepted claim </stripes:layout-component>
<stripes:layout-component name="content">
    <p> Accepted claim: <b> <%=request.getParameter("name") %></b></p> <br/>
    <%
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        ClaimsEntity clm = new ClaimsEntity( request.getParameter("name"));
        clm.setTelephone(request.getParameter("telephone"));
        clm.setBuildings_list(request.getParameter("buildings_list"));
        clm.setRoom(request.getParameter("room"));
        clm.setDevice_type(request.getParameter("device_type"));
        clm.setDevice_number(request.getParameter("device_number"));
        clm.setProblem_description(request.getParameter("problem_description"));
        clm.setPriority(request.getParameter("priority"));
        em.persist( clm);
        em.getTransaction().commit();
    %>
</stripes:layout-component>
</stripes:layout-render>