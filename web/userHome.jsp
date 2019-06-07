<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Task" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 08.02.2019
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% User user = (User) session.getAttribute("user");
        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
        List<User> users = (List<User>) request.getAttribute("users");
        if(user != null){ %>
    Welcome dear <%=user.getName()%> <%=user.getSurname()%>
        <% } %>

    </br></br>All tasks:
    <table border="1">
        <tr>
            <td>id</td>
            <td>Name</td>
            <td>Description</td>
            <td>User Name</td>
            <td>Status</td>
            <td>Deadline</td>
        </tr>
        <% for (Task task : tasks) { %>
        <tr>
            <td><%=task.getId()%></td>
            <td><%=task.getName()%></td>
            <td><%=task.getDescription()%></td>
            <td><%=task.getUser().getName()%></td>
            <td><%=task.getStatus()%></td>
            <td><%=task.getDeadline()%></td>
        </tr>
        <% } %>
    </table></br></br>

    All Users:
    <table border="1">
        <tr>
            <td>id</td>
            <td>Name</td>
            <td>Surname</td>
            <td>Email</td>
            <td>User Type</td>
        </tr>
        <% for (User user1 : users) { %>
        <tr>
            <td><%=user1.getId()%></td>
            <td><%=user1.getName()%></td>
            <td><%=user1.getSurname()%></td>
            <td><%=user1.getEmail()%></td>
            <td><%=user1.getUserType()%></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
