package model;

import jdk.net.SocketFlow;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.servlet.http.HttpServlet;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Task {

    private int id;
    private String name;
    private String description;
    private Date deadline;
    private Status status;
    private User user;
}

