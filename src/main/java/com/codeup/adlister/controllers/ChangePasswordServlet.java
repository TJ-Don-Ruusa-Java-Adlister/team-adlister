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

@WebServlet (name = "controllers.ChangePasswordServlet", urlPatterns = "/profile/password")
public class ChangePasswordServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        User user = DaoFactory.getUsersDao().findById(id);
        request.setAttribute("user", user);


        request.getRequestDispatcher("/WEB-INF/update_password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();


        User user = new User();

            // create a new User object
        String id = request.getParameter("id");
            user = DaoFactory.getUsersDao().findById(id);
            // Insert User object into `users` table


        user.setUsername(request.getParameter("username"));
        user.setFirstName (request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setEmail(request.getParameter("email"));
        user.setPhoneNo(request.getParameter("phoneNo"));
        user.setPassword(request.getParameter("password"));
        user.setTempPassword(request.getParameter("tempPassword"));user.setPassword(request.getParameter("password"));
        user.setTempPassword(request.getParameter("tempPassword"));

        DaoFactory.getUsersDao().updatePassword(user);
        request.getSession().invalidate();


        User userNew = DaoFactory.getUsersDao().findByUsername(request.getParameter("username"));


        request.getSession().setAttribute("user", userNew);

        response.sendRedirect("/profile");


        }
    }






