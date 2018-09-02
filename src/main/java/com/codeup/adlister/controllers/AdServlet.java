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

@WebServlet(name = "AdServlet", urlPatterns = "/ads/ad")
public class AdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adId = request.getParameter("adId");
        System.out.println(adId);
        Ad ad = DaoFactory.getAdsDao().getAdById(adId);

        String userId = Long.toString(ad.getUserId());
        User user = DaoFactory.getUsersDao().findById(userId);

        request.setAttribute("ad", ad);
        request.setAttribute("user", user);
        request.getRequestDispatcher("../WEB-INF/ads/ad.jsp").forward(request, response);
        request.getSession().removeAttribute("created");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
