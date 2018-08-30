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
    // get all the ads with a specific userID
    List<Ad> getAdsByUser(String userId);
    // delete a specific ad with ad ID
    Long deleteAd(String id);
    // edit a specific ad with ad ID
    Long editAd(Ad ad, String id);
    // assigns categories to a particular ad
    void setAdCategories(String adId, List<Long> catIds);
    // get a list of categories for a particular ad
    List<String> getAdCategories(String adId);
    List<Ad> userAds(long id);
}
