<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>

<stripes:layout-definition>
    <stripes:layout-render name="/layout/basic.jsp">
        <stripes:layout-component name="title">
            <stripes:layout-component name="title"/>
        </stripes:layout-component>
        <stripes:layout-component name="content">

            <%@include file="/parts/menu.jsp"%>

            <stripes:layout-component name="content"/>
        </stripes:layout-component>
    </stripes:layout-render>
</stripes:layout-definition>