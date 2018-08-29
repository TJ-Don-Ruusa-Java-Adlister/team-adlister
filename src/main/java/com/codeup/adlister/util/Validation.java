package com.codeup.adlister.util;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

public class Validation {

    public static boolean isExistingUsername(String username) {
        User user = DaoFactory.getUsersDao().findByUsername(username);
        System.out.println("Username does not exist: " + (user == null));
        return user == null;
    }

    public static boolean isExistingEmail(String email) {
        User user = DaoFactory.getUsersDao().findByEmail(email);
        System.out.println("Email does not exist: " + (user == null));
        return user == null;
    }

    public static boolean isValidLength(String password) {
        return password.length() >= 8;
    }

    public static boolean passwordsMatching(String password, String passwordConfirmation) {
        return password.equals(passwordConfirmation);
    }

    public static boolean isValidPhoneNumber (String phoneNo) {
        return phoneNo.length() == 10 || phoneNo.length() == 11;
    }
}
