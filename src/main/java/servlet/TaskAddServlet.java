package servlet;

import javafx.scene.chart.PieChart;
import manager.TaskManager;
import manager.UserManager;
import model.Status;
import model.Task;
import util.DateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(urlPatterns = "/addTask")
public class TaskAddServlet extends HttpServlet {

    TaskManager taskManager = new TaskManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String userId = req.getParameter("userId");
        String status = req.getParameter("status");

        UserManager userManager = new UserManager();
        Task task = new Task();

        task.setName(name);
        task.setDescription(description);
        task.setUser(userManager.getUserById(Integer.parseInt(userId)));
        task.setStatus(Status.valueOf(status));
        task.setDeadline(new Date());

        taskManager.addTask(task);

        req.setAttribute("message", "Congrats!!! You added new task successfully!");
        req.setAttribute("users",userManager.getAllUsers());
        req.getRequestDispatcher("/toTask").forward(req, resp);
    }
}
