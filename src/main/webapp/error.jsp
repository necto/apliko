<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/basic.jsp">
<stripes:layout-component name="title"> Login failed </stripes:layout-component>
<stripes:layout-component name="content">
    <h2> Your username or password is incorrect. Please try again, or contact administrator.</h2>
    <form>
        <input type="button" value="Try again."
               onClick="javascript: history.go(-1)">
    </form>
</stripes:layout-component>
</stripes:layout-render>