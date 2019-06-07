<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10.02.2019
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
    <form action="/registration" method="post">
        name: <input type="text" name="name"></br><br>
        surname: <input type="text" name="surname"></br></br>
        email: <input type="text" name="email"></br></br>
        password: <input type="password" name="password"></br></br>
        UserType: <select name="userType"><br>
            <option>USER</option>
            <option>MANAGER</option>
        </select></br>
        <input type="submit" value="Registration">
    </form>
</body>
</html>
