package dao;

import model.Equipe;
import model.Match;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MatchDAO {

    // Hardcoded list of matches
    private static final List<Match> MATCHS = new ArrayList<>();

    static {
        // Exemple d'équipes
        Equipe equipe1 = new Equipe("Lions", "Casablanca", "lions@example.com");
        Equipe equipe2 = new Equipe("Tigers", "Rabat", "tigers@example.com");

        // Exemple de matchs
        Match m1 = new Match();
        m1.setId(1);
        m1.setEquipeDomicile(equipe1);
        m1.setEquipeExterieur(equipe2);
        m1.setDateMatch(new Date());
        m1.setScoreDomicile(null);
        m1.setScoreExterieur(null);
        m1.setTermine(false);

        Match m2 = new Match();
        m2.setId(2);
        m2.setEquipeDomicile(equipe2);
        m2.setEquipeExterieur(equipe1);
        m2.setDateMatch(new Date());
        m2.setScoreDomicile(75);
        m2.setScoreExterieur(68);
        m2.setTermine(true);

        MATCHS.add(m1);
        MATCHS.add(m2);
    }

    public List<Match> listMatchs() {
        return MATCHS;
    }

    // Pour mettre à jour un score
    public void updateScore(int id, Integer scoreDomicile, Integer scoreExterieur) {
        for (Match m : MATCHS) {
            if (m.getId() == id) {
                m.setScoreDomicile(scoreDomicile);
                m.setScoreExterieur(scoreExterieur);
                m.setTermine(true);
                break;
            }
        }
    }
}

