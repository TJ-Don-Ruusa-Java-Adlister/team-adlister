package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//checking to see whether user is logged in, before displaying ad creation form

        HttpSession session = request.getSession();
             if(session.getAttribute("user") != null){
            session = request.getSession();

                Long userId = Long.parseLong(request.getParameter("user_id"));
                request.setAttribute("editAd", DaoFactory.getAdsDao().getAdsByUser(userId));
                request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);

            }
            else {
            response.sendRedirect("/login");
            return;
        }

        request.setAttribute("editAdId", request.getParameter("edit"));
        Long adId = Long.parseLong(request.getParameter("edit"));
        request.setAttribute("updateAd", DaoFactory.getAdsDao().getAdById(adId));
        request.getRequestDispatcher("/WEB-INF/ads/profile.jsp").forward(request, response);


    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

//When a new ad is created, assign the user id of the logged in user to the ad.
            User user = (User)(request.getSession().getAttribute("user"));

//Create ne Ad object that is connected to user.
            Ad ad = new Ad(
                    user.getId(),
                    request.getParameter("title"),
                    request.getParameter("description"),
                    request.getParameter("date_posted")

            );

        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");
    }
}
