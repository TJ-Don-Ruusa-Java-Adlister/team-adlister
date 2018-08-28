package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // get a list of all ads related to category & title search
    List<Ad> search(String category, String searchTerm);
    // get a list of all ads related to searchByTitle term
    List<Ad> searchByTitle(String searchTerm);
    // get a list of all ads related to category
    List<Ad> searchbyCategory(String category);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
}
