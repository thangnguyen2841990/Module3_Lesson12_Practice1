package com.codegym.controller;

import com.codegym.dao.UserDAO;
import com.codegym.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = this.userDAO.selectAllUser();
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/index.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create": {
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
                dispatcher.forward(request, response);
                break;
            }
            case "edit": {
                int id = Integer.parseInt(request.getParameter("id"));
                User existingUser = this.userDAO.selectUser(id);
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
                request.setAttribute("user", existingUser);
                dispatcher.forward(request, response);
                break;
            }
            case "delete": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    User user = this.userDAO.selectUser(id);
                try {
                    this.userDAO.deleteUser(id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                List<User> users = this.userDAO.selectAllUser();
                request.setAttribute("users",users);
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/index.jsp");
                dispatcher.forward(request,response);
                break;
            }
            default:
                listUser(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                String name = request.getParameter("username");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                User newUser = new User(name, email, country);
                this.userDAO.insertUser(newUser);
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
                dispatcher.forward(request, response);
                break;
            }
            case "edit": {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("username");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                User user = this.userDAO.selectUser(id);
                user.setName(name);
                user.setEmail(email);
                user.setCountry(country);
                try {
                    this.userDAO.updateUser(user);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
                dispatcher.forward(request,response);
                break;
            }
        }
    }
}
