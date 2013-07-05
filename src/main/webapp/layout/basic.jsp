<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>

<stripes:layout-definition>
    <html>
    <head>
        <link rel="stylesheet" type="text/css"
              href="<%=request.getContextPath()%>/static/style.css"/>
        <title><stripes:layout-component name="title"/></title>
    </head>
    <body>

    <div id="top"><stripes:layout-component name="top"/></div>

    <div class="page-wrap" id="body">
        <stripes:layout-component name="content"/>
    </div>

    <%@include file="/parts/footer.jsp"%>
    </body>
    </html>
</stripes:layout-definition>