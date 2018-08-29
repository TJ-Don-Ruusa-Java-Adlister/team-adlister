package com.codeup.adlister.dao;

import com.codeup.adlister.controllers.Config;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

// Constructor
    public MySQLUsersDao(Config config) {
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


// Retrieves an existing user from the `users` table using the username
    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

// Retrieves an existing user from the `users` table using the email
    @Override
    public User findByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding user by email", e);
        }
    }

// Inserts a new user into the `users` table
    @Override
    public Long insert(User newUser) {
        String query = "INSERT INTO users(username, first_name, last_name, email, password, phone_no) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            String newPhoneNo;
            if (newUser.getPhoneNo().length() == 10) {
                newPhoneNo = newUser.getPhoneNo().substring(0, 3) + "-" + newUser.getPhoneNo().substring(4, 7) + "-" + newUser.getPhoneNo().substring(8);
            } else {
                newPhoneNo = newUser.getPhoneNo().substring(0, 1) + "-" + newUser.getPhoneNo().substring(2, 5) + "-" + newUser.getPhoneNo().substring(6, 9) + "-" + newUser.getPhoneNo().substring(10);
            }

            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, newUser.getUsername());
            stmt.setString(2, newUser.getFirstName());
            stmt.setString(3, newUser.getLastName());
            stmt.setString(4, newUser.getEmail());
            stmt.setString(5, newUser.getPassword());
            stmt.setString(6, newPhoneNo);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

// Used by findByUsername & findByEmail methods -- creates new User object with the user that was retrieved from database (ResultSet rs).
    private User extractUser(ResultSet rs) throws SQLException {
        if (! rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password"),
            rs.getString("first_name"),
            rs.getString("last_name"),
            rs.getString("phone_no")
        );
    }

}
