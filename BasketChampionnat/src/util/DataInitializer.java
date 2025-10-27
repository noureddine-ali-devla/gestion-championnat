package util;

import model.Equipe;
import model.Joueur;
import model.Match;
import model.Statistique;
import java.time.LocalDate;
import java.util.*;

public class DataInitializer {

    public static List<Equipe> initEquipes() {
        // Création des équipes
        Equipe e1 = new Equipe("Raptors Agadir", "Agadir", "coach.raptors@gmail.com", "Coach R");
        Equipe e2 = new Equipe("Lions Casablanca", "Casablanca", "coach.lions@gmail.com", "Coach L");
        Equipe e3 = new Equipe("Eagles Marrakech", "Marrakech", "coach.eagles@gmail.com", "Coach E");

        // Liste des équipes
        List<Equipe> equipes = Arrays.asList(e1, e2, e3);
        return equipes;
    }

    public static List<Joueur> initJoueurs(List<Equipe> equipes) {
        Equipe e1 = equipes.get(0);
        Equipe e2 = equipes.get(1);
        Equipe e3 = equipes.get(2);

        List<Joueur> joueurs = new ArrayList<>();
        joueurs.add(new Joueur("Youssef", "Bennani", "Arrière", 1, 0, e1));
        joueurs.add(new Joueur("Omar", "El Idrissi", "Ailier", 2, 0, e1));
        joueurs.add(new Joueur("Adam", "Bouzekri", "Pivot", 3, 0, e2));
        joueurs.add(new Joueur("Karim", "Moutaouakil", "Meneur", 4, 0, e2));
        joueurs.add(new Joueur("Walid", "Tazi", "Arrière", 5, 0, e3));

        return joueurs;
    }

    public static List<Match> initMatchs(List<Equipe> equipes) {
        Equipe e1 = equipes.get(0);
        Equipe e2 = equipes.get(1);
        Equipe e3 = equipes.get(2);

        List<Match> matchs = new ArrayList<>();
        matchs.add(new Match(e1, e2, LocalDate.now().minusDays(3), 80, 75, true));
        matchs.add(new Match(e2, e3, LocalDate.now().minusDays(2), 68, 70, true));
        matchs.add(new Match(e3, e1, LocalDate.now().minusDays(1), 82, 78, false));

        return matchs;
    }

    public static List<Statistique> initStatistiques(List<Equipe> equipes) {
        List<Statistique> statsList = new ArrayList<>();
        for (Equipe e : equipes) {
            Statistique s = new Statistique();
            s.setEquipe(e);
            s.setVictoires(e.equals(equipes.get(2)) ? 2 : e.equals(equipes.get(0)) ? 1 : 0);
            s.setDefaites(e.equals(equipes.get(2)) ? 0 : e.equals(equipes.get(0)) ? 1 : 2);
            s.setButsMarques((int) (Math.random() * 150 + 100));
            s.setButsEncaisses((int) (Math.random() * 150 + 100));
            statsList.add(s);
        }
        return statsList;
    }
}

