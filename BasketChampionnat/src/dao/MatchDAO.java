package dao;

import model.Match;
import model.Equipe;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MatchDAO {
    private static final List<Match> MATCHS = new ArrayList<>();

    static {
        Equipe e1 = new Equipe("Lions", "Casablanca", "lions@example.com");
        Equipe e2 = new Equipe("Tigers", "Rabat", "tigers@example.com");

        MATCHS.add(new Match(e1, e2, LocalDate.now().minusDays(2), null, null, false));
        MATCHS.add(new Match(e2, e1, LocalDate.now().minusDays(1), 75, 68, true));

        MATCHS.get(0).setId(1);
        MATCHS.get(1).setId(2);
    }

    public List<Match> listMatchs() {
        return MATCHS;
    }

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

