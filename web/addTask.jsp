<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10.02.2019
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task Add</title>
</head>
<body>
    <% List<User> users = (List<User>) request.getAttribute("users");%>
    <form action="/addTask" method="post">
        name: <input type="text" name="name"></br>
        description: <input type="text" name="description"></br>
        user: <select name="userId">
            <% for (User user : users) { %>
                    <option value="<%=user.getId()%>">
                                    <%=user.getName()%>
                    </option>
                <% } %>
        </select></br>
        status: New <input type="radio" value="NEW" name="status"></br>
                &nbsp In Progress <input type="radio" value="INPROGRESS" name="status"></br>
                &nbsp Finished <input type="radio" value="FINISHED" name="status"></br>

        <input type="submit" value="ADD">
    </form>
</body>
</html>
