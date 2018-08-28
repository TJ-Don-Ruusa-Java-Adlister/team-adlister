package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNo = request.getParameter("phoneNo");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        User existingUsername = DaoFactory.getUsersDao().findByUsername(username);
        User existingEmail = DaoFactory.getUsersDao().findByEmail(email);
        HttpSession session = request.getSession();

        // validate input
        boolean invalidAttempt = firstName.isEmpty()
                || lastName.isEmpty()
                || username.isEmpty()
                || existingUsername != null
                || phoneNo.isEmpty()
                || email.isEmpty()
                || existingEmail != null
                || password.isEmpty()
                || password.length() < 8
                || !password.equals(passwordConfirmation);

        /** * * * * * * * * * *
         * * ERROR HANDLING * *
         * * * * * * * * * * */
        if (invalidAttempt) {
            if (firstName.isEmpty()
                    || lastName.isEmpty()
                    || username.isEmpty()
                    || email.isEmpty()
                    || phoneNo.isEmpty()
                    || password.isEmpty()) {
                request.setAttribute("error", "All fields are required.");
            } else if (existingUsername != null) {
                // if a username already exists...
                request.setAttribute("error", "There is already a user with that username. Please login or choose another username.");
            } else if (existingEmail != null) {                     // if an email already exists...
                request.setAttribute("error", "There is already a user with that email. Please login or use another email.");
            } else if (password.length() < 8) {                     // if a password is too short...
                request.setAttribute("error", "Password is not long enough. (8 or more characters)");
            } else if (!password.equals(passwordConfirmation)) {    // if the passwords do not match...
                request.setAttribute("error", "Passwords do not match.");
            } else {                                                // if any field is empty...
                request.setAttribute("error", "Please check your information and try again.");
            }
            session.setAttribute("firstName", firstName);
            session.setAttribute("lastName", lastName);
            session.setAttribute("username", username);
            session.setAttribute("phoneNo", phoneNo);
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        } else {
            // create and save a new user
            User user = new User(username, firstName, lastName, email, password, phoneNo);
            DaoFactory.getUsersDao().insert(user);
            request.getSession().invalidate();
            request.getSession().setAttribute("registered", "Registration successful. Please log in.");
            response.sendRedirect("/login");
        }
    }
}
