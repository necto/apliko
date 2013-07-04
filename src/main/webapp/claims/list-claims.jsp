<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
<stripes:layout-component name="title"> List of all claims </stripes:layout-component>
<stripes:layout-component name="content">
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
</stripes:layout-component>
</stripes:layout-render>
