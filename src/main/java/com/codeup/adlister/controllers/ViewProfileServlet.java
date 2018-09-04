package com.codeup.adlister.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;


@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        User user = (User)request.getSession().getAttribute("user");
        long id = user.getId();
        List<Ad> usersAds = DaoFactory.getAdsDao().userAds(id);
        request.setAttribute("noOfAds", usersAds.size());
        request.setAttribute("user_ads", usersAds);
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        request.getSession().removeAttribute("profileEdited");
        request.getSession().removeAttribute("edited");
        request.getSession().removeAttribute("deleted");
    }
}
