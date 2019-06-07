<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 08.02.2019
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Login</title>
  </head>
  <body>
  <% if(request.getAttribute("message") != null) {%>
  <p style="color: red"><%= request.getAttribute("message") %></p>
  <% } %>
  <form action="/index" method="post">
    Email: <input type="text" name="email"></br></br>
    Password: <input type="password" name="password"></br></br>
    <input type="submit" value="Login"><br><br><br>

    <a href="registration.jsp">Registration</a>
  </form>
  </body>
</html>
