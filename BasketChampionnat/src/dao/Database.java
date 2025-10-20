package dao;

import model.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Database {
    private static List<Equipe> equipes = new ArrayList<>();
    private static List<Joueur> joueurs = new ArrayList<>();
    private static List<Match> matchs = new ArrayList<>();

    static {
        Equipe e1 = new Equipe(1, "Tigers", "Casablanca", "Alaoui");
        Equipe e2 = new Equipe(2, "Lions", "Rabat", "Bennani");
        Equipe e3 = new Equipe(3, "Eagles", "Marrakech", "Fassi");
        Equipe e4 = new Equipe(4, "Sharks", "Agadir", "El Idrissi");

        equipes.add(e1);
        equipes.add(e2);
        equipes.add(e3);
        equipes.add(e4);

        joueurs.add(new Joueur(1, "Amine", "El Fadili", "Ailier", 7, e1));
        joueurs.add(new Joueur(2, "Karim", "Rami", "Pivot", 10, e1));
        joueurs.add(new Joueur(3, "Youssef", "Azzouzi", "Meneur", 5, e2));
        joueurs.add(new Joueur(4, "Omar", "Bourhim", "Arrière", 8, e2));
        joueurs.add(new Joueur(5, "Hamza", "Saidi", "Ailier fort", 11, e3));
        joueurs.add(new Joueur(6, "Nabil", "Cherkaoui", "Pivot", 9, e4));

        matchs.add(new Match(1, e1, e2, LocalDate.of(2025, 1, 10)));
        matchs.add(new Match(2, e3, e4, LocalDate.of(2025, 1, 11)));
        matchs.add(new Match(3, e1, e3, LocalDate.of(2025, 1, 15)));
    }

    public static List<Equipe> getEquipes() {
        return equipes;
    }

    public static List<Joueur> getJoueurs() {
        return joueurs;
    }

    public static List<Match> getMatchs() {
        return matchs;
    }

    public static Equipe getEquipeById(int id) {
        for (Equipe e : equipes) {
            if (e.getId() == id) return e;
        }
        return null;
    }

    public static Joueur getJoueurById(int id) {
        for (Joueur j : joueurs) {
            if (j.getId() == id) return j;
        }
        return null;
    }

    public static Match getMatchById(int id) {
        for (Match m : matchs) {
            if (m.getId() == id) return m;
        }
        return null;
    }
}
