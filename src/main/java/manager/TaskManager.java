package manager;

import db.DBConnectionProvider;
import model.Task;
import model.Status;
import model.User;
import util.DateUtil;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class TaskManager {

    private Connection connection;

    public TaskManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    public void addTask(Task task) {
        try {

            String query = "INSERT INTO task(`name`,`description`,`user_id`,`status`,`deadline`)" +
                    "VALUES(?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            statement.setString(1,task.getName());
            statement.setString(2,task.getDescription());
            statement.setInt(3,task.getUser().getId());
            statement.setString(4,task.getStatus().name());
            statement.setString(5,DateUtil.convertDateToString(task.getDeadline()));

            statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int id = generatedKeys.getInt(1);
                task.setId(id);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public Task getTaskById(int id) {

        UserManager userManager = new UserManager();

        String query = "SELECT * FROM task WHERE id = " + id;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                Task task = new Task();
                task.setId(resultSet.getInt(1));
                task.setName(resultSet.getString(2));
                task.setDescription(resultSet.getString(3));
                task.setUser(userManager.getUserById(resultSet.getInt(4)));
                task.setStatus(Status.valueOf(resultSet.getString(5)));
                task.setDeadline(resultSet.getDate(6));
                return (task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Task> getAllTasks() {

        UserManager userManager = new UserManager();

        String query = "SELECT * FROM task";

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<Task> tasks = new LinkedList<Task>();

            while (resultSet.next()) {
                Task task = new Task();
                task.setId(resultSet.getInt(1));
                task.setName(resultSet.getString(2));
                task.setDescription(resultSet.getString(3));
                task.setUser(userManager.getUserById(resultSet.getInt(4)));
                task.setStatus(Status.valueOf(resultSet.getString(5)));
                task.setDeadline(resultSet.getDate(6));
                tasks.add(task);            }
            return tasks;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public void removeTaskById(int id) {
        String query = "DELETE FROM task WHERE id = " + id;

        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
