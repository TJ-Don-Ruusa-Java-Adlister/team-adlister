package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String search = request.getParameter("search");
        String category = request.getParameter("category");
        List<String> catName = DaoFactory.getAdsDao().getCategoryById(category);
        List<Ad> results;

        // if only searching with search term...
        if (category.equals("all") && !search.equals("")) {
            results = DaoFactory.getAdsDao().searchByTitle(search);
            request.setAttribute("search", search);
            request.setAttribute("ads", results);
            request.setAttribute("noOfResults", results.size());
            // if only searching with category...
        } else if (!category.equals("all") && search.equals("")) {
            results = DaoFactory.getAdsDao().searchbyCategory(category);
            request.setAttribute("category", catName.get(0));
            request.setAttribute("ads", results);
            request.setAttribute("noOfResults", results.size());
            // if searching with both category and search term...
        } else if (!category.equals("all") && !search.equals("")) {
            results = DaoFactory.getAdsDao().search(category, search);
            request.setAttribute("search", search);
            request.setAttribute("category", catName.get(0));
            request.setAttribute("ads", results);
            request.setAttribute("noOfResults", results.size());
            // if user clicks 'Search' without using search term or specifying category...
        } else {
            results = DaoFactory.getAdsDao().all();
            request.setAttribute("ads", results);
            request.setAttribute("noOfResults", results.size());
        }

        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);

    }
}