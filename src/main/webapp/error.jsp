<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="/layout/basic.jsp">
<stripes:layout-component name="title"> Login failed </stripes:layout-component>
<stripes:layout-component name="content">
    <div class="infobox_error">
        Введенная пара логин-пароль не действительна. Пожалуйста, попробуйте еще раз, или обратитесь к администратору.</h2>
    </div>
    <div class="infobox">
    <form>
        <input type="button" value="Попробывать снова."
               onClick="javascript: history.go(-1)">
    </form>
    </div>
</stripes:layout-component>
</stripes:layout-render>