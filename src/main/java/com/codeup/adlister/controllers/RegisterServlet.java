package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Validation;

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
        HttpSession session = request.getSession();

    // validate inputs
        boolean invalidAttempt = firstName.isEmpty()
                || lastName.isEmpty()
                || username.isEmpty()
                || phoneNo.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || !Validation.isExistingUsername(username)
                || !Validation.isValidPhoneNumber(phoneNo)
                || !Validation.isExistingEmail(email)
                || !Validation.isValidLength(password)
                || !Validation.passwordsMatching(password, passwordConfirmation);

        /** * * * * * * * * * * * * * * * * *
         * * REGISTRATION ERROR HANDLING * *
         * * * * * * * * * * * * * * * * * **/
        if (invalidAttempt) {

        // if any field was left blank...
            if (firstName.isEmpty()
                    || lastName.isEmpty()
                    || username.isEmpty()
                    || email.isEmpty()
                    || phoneNo.isEmpty()
                    || password.isEmpty()) {
                request.setAttribute("error", "All fields are required.");
        // if a username already exists...
            } else if (!Validation.isExistingUsername(username)) {
                request.setAttribute("error", "There is already a user with that username. Please login or choose another username.");
        // if the phone number is not valid...
            } else if (!Validation.isValidPhoneNumber(phoneNo)) {
                request.setAttribute("error", "Phone number must be numbers only & must include area code. Please try again.");
        // if an email already exists...
            } else if (!Validation.isExistingEmail(email)) {
                request.setAttribute("error", "There is already a user with that email. Please login or use another email.");
        // if a password is too short...
            } else if (Validation.isValidLength(password)) {
                request.setAttribute("error", "Password is not long enough. (8 or more characters)");
        // if the passwords do not match...
            } else if (!Validation.passwordsMatching(password, passwordConfirmation)) {
                request.setAttribute("error", "Passwords do not match.");
        // if any field is empty...
            } else {
                request.setAttribute("error", "Please check your information and try again.");
            }

        // Setting session attributes so registration form is still pre-filled if error occurs
            session.setAttribute("firstName", firstName);
            session.setAttribute("lastName", lastName);
            session.setAttribute("username", username);
            session.setAttribute("phoneNo", phoneNo);
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        } else {

        // create a new User object
            User user = new User(username, firstName, lastName, email, password, phoneNo);
        // Insert User object into `users` table
            DaoFactory.getUsersDao().insert(user);
        // Clear any session attributes from registration
            request.getSession().invalidate();
        // Set a session attribute indicating a successful registration that will be passed to /login
            request.getSession().setAttribute("registered", "Registration successful. Please log in.");
            response.sendRedirect("/login");
        }
    }
}
