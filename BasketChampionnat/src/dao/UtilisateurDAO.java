package dao;

import model.Utilisateur;
import java.util.ArrayList;
import java.util.List;

public class UtilisateurDAO {
    private static List<Utilisateur> utilisateurs = new ArrayList<>();

    static {
        utilisateurs.add(new Utilisateur("admin", "admin123", "ADMIN"));
    }

    public Utilisateur authentifier(String username, String password) {
        for (Utilisateur u : utilisateurs) {
            if (u.getUsername().equals(username) && u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }
}
