<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>

<stripes:layout-definition>
    <html>
    <head>
        <link rel="stylesheet" type="text/css"
              href="<%=request.getContextPath()%>/static/style.css"/>
        <script type="text/javascript"
                src="<%=request.getContextPath()%>/static/common.js">
        </script>
        <title><stripes:layout-component name="title"/></title>
    </head>
    <body>

    <div align="center" class="wrapper">
        <div id="hidden_descr" class="hidden" style="display:none;">
            <div class="closebar" onclick="hide();">Щелкните, чтобы закрыть [X]</div>
            <div id="hidden_text" style="margin:15px;">
                &nbsp;
            </div>
        </div>
    </div>

    <div id="top"><stripes:layout-component name="top"/></div>

    <div class="page-wrap" id="body">
        <stripes:layout-component name="content"/>
    </div>

    <%@include file="/parts/footer.jsp"%>
    </body>
    </html>
</stripes:layout-definition>