package dao;

import model.Joueur;
import model.Equipe;
import java.util.ArrayList;
import java.util.List;

public class JoueurDAO {
    private static final List<Joueur> joueurs = new ArrayList<>();

    static {
        new Equipe("Lions", "Casablanca", "lions@example.com", "Coach A");
        new Equipe("Tigers", "Rabat", "tigers@example.com", "Coach B");
        new Equipe("Eagles", "Marrakech", "eagles@example.com", "Coach C");

        joueurs.add(new Joueur("Youssef", "Bennani", "Arrière", 1, 0, e1));
        joueurs.add(new Joueur("Omar", "El Idrissi", "Ailier", 2, 0, e1));
        joueurs.add(new Joueur("Adam", "Bouzekri", "Pivot", 3, 0, e2));
    }

    public List<Joueur> findAll() { return joueurs; }

    public Joueur findById(int id) {
        for (Joueur j : joueurs) {
            if (j.getId() == id) return j;
        }
        return null;
    }

    public void save(Joueur joueur) { joueurs.add(joueur); }

    public void update(Joueur joueur) {
        for (int i = 0; i < joueurs.size(); i++) {
            if (joueurs.get(i).getId() == joueur.getId()) {
                joueurs.set(i, joueur);
                break;
            }
        }
    }

    public void delete(int id) {
        joueurs.removeIf(j -> j.getId() == id);
    }
}


