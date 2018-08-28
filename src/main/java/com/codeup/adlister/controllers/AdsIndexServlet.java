package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String search = request.getParameter("search");
        String category = request.getParameter("category");

        if (category.equals("all") && !search.equals("")) {
            request.setAttribute("ads", DaoFactory.getAdsDao().searchByTitle(search));
        } else if (!category.equals("all") && search.equals("")) {
            request.setAttribute("ads", DaoFactory.getAdsDao().search(category, search));
        } else {
            request.setAttribute("ads", DaoFactory.getAdsDao().searchbyCategory(category));
        }


//        request.setAttribute("search", search);
//        request.setAttribute("category", category);
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);

    }
}
