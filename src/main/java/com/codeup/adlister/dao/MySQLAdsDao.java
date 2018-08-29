package com.codeup.adlister.dao;

import com.codeup.adlister.controllers.Config;
import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    // Method used when user selects specific category AND uses a search term
    @Override
    public List<Ad> search(String category, String searchTerm) {
        PreparedStatement stmt = null;
        String formattedSearch = "%" + searchTerm.toLowerCase() + "%";
        String formattedCat = "%" + category + "%";
        System.out.println("search() method used");
        try {
            stmt = connection.prepareStatement("(SELECT * FROM ads as a " +
                    "JOIN ads_topics as ats on ats.ads_id = a.id " +
                    "JOIN category as c on c.id = ats.category_id " +
                    "WHERE c.id = ? AND (LOWER(a.title) LIKE ? OR LOWER(a.description) LIKE ?))");
            stmt.setString(1, formattedCat);
            stmt.setString(2, formattedSearch);
            stmt.setString(3, formattedSearch);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ads...", e);
        }
    }

    // Method used when user leaves category set to 'all' and submits a search term
    @Override
    public List<Ad> searchByTitle(String searchTerm) {
        PreparedStatement stmt = null;
        String formattedSearch = "%" + searchTerm.toLowerCase() + "%";
        System.out.println("searchByTitle() used");
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE LOWER(title) LIKE ? OR LOWER(description) LIKE ?");
            stmt.setString(1, formattedSearch);
            stmt.setString(2, formattedSearch);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    // Method used when user selects a category and submits without entering a search term
    @Override
    public List<Ad> searchbyCategory(String category) {
        PreparedStatement stmt = null;
        String formattedCat = "%" + category + "%";
        System.out.println("searchByCategory() used");
        try {
            stmt = connection.prepareStatement("(SELECT * FROM ads as a " +
                    "JOIN ads_topics as ats on ats.ads_id = a.id " +
                    "JOIN category as c on c.id = ats.category_id " +
                    "WHERE c.id = ?)");
            stmt.setString(1, category);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ads...", e);
        }
    }

    @Override
    public Ad getAdById(String id) {
        PreparedStatement stmt = null;
        String query = "SELECT * FROM ads as a WHERE a.id = ?";
        try {
            stmt = connection.prepareStatement(query);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Ad could not be retrieved with ID", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getString("date_posted")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
