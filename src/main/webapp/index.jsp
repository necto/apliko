<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>sample apliko page</title>
  </head>
  <body>
  <div> You are logged in as: <%= request.getUserPrincipal().getName() %> <a href="logout.jsp">logout</a> </div>

  <a href="manage.jsp"> manage users</a>
    <h2>Enter some text in order to add it to our DB</h2>
    <form action="accept.jsp">
      <input type="text" name="claim-name"/>
      <input type="submit" />
    </form>
  </body>
</html>
