package by.itclass.controllers.admin;

import by.itclass.controllers.AbstractController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static by.itclass.constants.Constants.*;

@WebServlet(ALL_USERS_CONTROLLER)
public class AllUsersController extends AbstractController {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var users = userService.getAllUsers();
        req.setAttribute(USERS_ATTR, users);
        forward(req, resp, USERS_JSP);
    }
}
