package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.setAttribute("loggedOut", request.getSession().getAttribute("loggedOut"));
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        request.getSession().removeAttribute("loggedOut");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);
        request.getSession().invalidate();

        if (user == null) {
            request.getSession().setAttribute("error", "That username does not exist. Please try again.");
            response.sendRedirect("/login");
            return;
        }

        String hash = user.getTempPassword();
        boolean validAttempt = Password.check(password, hash);

        if (validAttempt) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        } else {
            request.getSession().setAttribute("error", "Invalid password. Please try again.");
            request.getSession().setAttribute("tempUsername", user.getUsername());
            response.sendRedirect("/login");
        }
    }
}
