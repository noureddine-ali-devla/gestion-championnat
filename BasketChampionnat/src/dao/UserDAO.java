package dao;

import model.User;

public class UserDAO {

    // Hardcodage d'un utilisateur admin
    private static final String HARDCODED_USERNAME = "admin";
    private static final String HARDCODED_PASSWORD = "admin123";

    public User authenticate(String username, String password) {
        if (HARDCODED_USERNAME.equals(username) && HARDCODED_PASSWORD.equals(password)) {
            User user = new User();
            user.setUsername(HARDCODED_USERNAME);
            return user;
        }
        return null;
    }
}

