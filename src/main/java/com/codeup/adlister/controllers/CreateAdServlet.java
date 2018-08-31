package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String categories[] = request.getParameterValues("category");
        System.out.println(categories);
        boolean invalidAttempt = title.isEmpty()
                || categories == null;

        if (invalidAttempt) {
            if (title.isEmpty()) {
                request.setAttribute("error1", "Title is required.");
            } else if (categories == null) {
                request.setAttribute("error1", "Must select at least 1 category.");
            }
            request.setAttribute("oldTitle", title);
            request.setAttribute("oldDescription", description);
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
        } else {
            Ad ad = new Ad(
                    user.getId(),
                    title,
                    description,
                    "date"
            );
            long id = DaoFactory.getAdsDao().insert(ad);
            DaoFactory.getAdsDao().setAdCategories(id, categories);
            request.setAttribute("postSuccess", "Ad creation successful.");
            response.sendRedirect("/profile");
        }
    }
}
