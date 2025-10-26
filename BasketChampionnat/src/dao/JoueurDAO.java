package dao;

import model.Equipe;
import model.Joueur;
import java.util.ArrayList;
import java.util.List;

public class JoueurDAO {

    // Hardcoded list of players
    private static final List<Joueur> JOUEURS = new ArrayList<>();

    static {
        Equipe e1 = new Equipe("Lions", "Casablanca", "lions@example.com");
        Equipe e2 = new Equipe("Tigers", "Rabat", "tigers@example.com");

        JOUEURS.add(new Joueur(1, "Amine", "Bennani", "Pivot", e1));
        JOUEURS.add(new Joueur(2, "Youssef", "Karim", "Arrière", e2));
        JOUEURS.add(new Joueur(3, "Rachid", "Ziani", "Ailier", e1));
    }

    public List<Joueur> listJoueurs() {
        return JOUEURS;
    }

    public Joueur getById(int id) {
        for (Joueur j : JOUEURS) {
            if (j.getId() == id) return j;
        }
        return null;
    }

    public void addJoueur(Joueur joueur) {
        JOUEURS.add(joueur);
    }

    public void updateJoueur(Joueur joueur) {
        for (int i = 0; i < JOUEURS.size(); i++) {
            if (JOUEURS.get(i).getId() == joueur.getId()) {
                JOUEURS.set(i, joueur);
                break;
            }
        }
    }

    public void deleteJoueur(int id) {
        JOUEURS.removeIf(j -> j.getId() == id);
    }
}

