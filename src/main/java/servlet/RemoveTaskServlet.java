package servlet;

import manager.TaskManager;
import model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/removeTask")
public class RemoveTaskServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskId = req.getParameter("id");
        TaskManager taskManager = new TaskManager();
        taskManager.removeTaskById(Integer.parseInt(taskId));
        List<Task> tasks = taskManager.getAllTasks();
        req.setAttribute("tasks", tasks);
        req.getRequestDispatcher("managerHome.jsp");
    }
}
