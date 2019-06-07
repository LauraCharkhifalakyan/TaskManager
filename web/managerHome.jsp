<%@ page import="model.User" %>
<%@ page import="model.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="manager.TaskManager" %>
<%@ page import="manager.UserManager" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 08.02.2019
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manager Home</title>
</head>
<body>
    <% if(request.getAttribute("message") != null) {%>
    <p style="color: red"><%= request.getAttribute("message") %></p>
    <% } %>

    <% User user = (User) session.getAttribute("user");
        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
        List<User> users = (List<User>) request.getAttribute("users");
        TaskManager taskManager = new TaskManager();
        UserManager userManager = new UserManager();
        if(user != null){
    %>

    Welcome dear Admin - <%= user.getName() %> <%= user.getSurname() %> <br>
    <% } %>

    For add new user, please click to <a href="/registration.jsp">ADD USER</a></br>
    For add new task, please click to <a href="/toTask">ADD TASK</a></br>

    </br></br>All tasks:
    <table border="1">
        <tr>
            <td>id</td>
            <td>Name</td>
            <td>Description</td>
            <td>User Name</td>
            <td>Status</td>
            <td>Deadline</td>
            <td>For Delete task</td>
        </tr>
        <% for (Task task : tasks) { %>
        <tr>
            <td><%=task.getId()%></td>
            <td><%=task.getName()%></td>
            <td><%=task.getDescription()%></td>
            <td><%=task.getUser().getName()%></td>
            <td><%=task.getStatus()%></td>
            <td><%=task.getDeadline()%></td>
            <td><a href="/removeTask?id=<%=task.getId()%>">DELETE</a></td>
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
            <td>For Delete User</td>
        </tr>
        <% for (User user1 : users) { %>
        <tr>
            <td><%=user1.getId()%></td>
            <td><%=user1.getName()%></td>
            <td><%=user1.getSurname()%></td>
            <td><%=user1.getEmail()%></td>
            <td><%=user1.getUserType()%></td>
            <td><a href="/removeUser?id=<%=user1.getId()%>">DELETE</a></td>
        </tr>
        <% } %>
    </table>
</body>
</html>