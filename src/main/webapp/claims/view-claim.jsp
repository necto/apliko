<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="base.ClaimsEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/default.jsp">
    <stripes:layout-component name="title"> Просмотр заявки: </stripes:layout-component>
    <stripes:layout-component name="content">
        <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
            EntityManager em = emf.createEntityManager();
                Integer id = 1;
                ClaimsEntity claim = em.find(ClaimsEntity.class, id);
                
        %>
        <h3>Просмотр заявки.</h3>
        <table border="1">
            <tbody>
                <tr>
                    <td>
                        ФИО подавшего заявку:
                    </td>
                    <td><%
                        out.print(claim.getName());
                        %></td>
                </tr>
                <tr>
                    <td>
                        Контактный телефон
                    </td>
                    <td>
                        <%
                        out.print(claim.getTelephone());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Корпус
                    </td>
                    <td>
                        <%
                        out.print(claim.getBuildings_list());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Кабинет
                    </td>
                    <td>
                        <%
                        out.print(claim.getRoom());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Тип и модель оборудования
                    </td>
                    <td>
                        <%
                        out.print(claim.getDevice_type());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Сервисный номер оборудования
                    </td>
                    <td>
                        <%
                        out.print(claim.getDevice_number());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Описание проблемы
                    </td>
                    <td>
                        <%
                        out.print(claim.getProblem_description());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Приоритет
                    </td>
                    <td>
                        <%
                        out.print(claim.getPriority());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Дополнительный комментарий
                    </td>
                    <td>
                        <%
                        out.print(claim.getComment());
                        %>
                    </td>
                </tr>
            </tbody>
        </table>
        <td><button type="submit" > Назад </button></td>

    </stripes:layout-component>
</stripes:layout-render>
