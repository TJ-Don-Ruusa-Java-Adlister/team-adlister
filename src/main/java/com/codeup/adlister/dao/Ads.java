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
    // get an ad using the ID
    Ad getAdById(String id);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // assigns categories to a particular ad
    void setAdCategories(long adId, String[] cats);
    // get a list of categories for a particular ad
    List<String> getAdCategories(String adId);
    // retrieves all ads created by specific user
    List<Ad> userAds(long id);
    // deletes a specific ad using ad id
    void deleteAd(String id);
    // edit a specific ad from the ads list.
    void editAd(Ad ad, String id);
    // get a category using category ID
    List<String> getCategoryById(String id);
}
