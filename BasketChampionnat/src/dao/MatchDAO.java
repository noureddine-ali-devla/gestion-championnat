package dao;

import model.Equipe;
import model.Match;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MatchDAO {

    private static final List<Match> MATCHS = new ArrayList<>();

    static {
        Equipe equipe1 = new Equipe("Lions", "Casablanca", "lions@example.com");
        Equipe equipe2 = new Equipe("Tigers", "Rabat", "tigers@example.com");

        Match m1 = new Match();
        m1.setId(1);
        m1.setEquipeDomicile(equipe1);
        m1.setEquipeExterieur(equipe2);
        m1.setDateMatch(LocalDate.now());
        m1.setScoreDomicile(-1); // -1 signifie pas encore joué
        m1.setScoreExterieur(-1);
        m1.setTermine(false);

        Match m2 = new Match();
        m2.setId(2);
        m2.setEquipeDomicile(equipe2);
        m2.setEquipeExterieur(equipe1);
        m2.setDateMatch(LocalDate.now());
        m2.setScoreDomicile(75);
        m2.setScoreExterieur(68);
        m2.setTermine(true);

        MATCHS.add(m1);
        MATCHS.add(m2);
    }

    public List<Match> findAll() {
        return MATCHS;
    }

    public Match findById(int id) {
        return MATCHS.stream().filter(m -> m.getId() == id).findFirst().orElse(null);
    }

    public void save(Match match) {
        MATCHS.add(match);
    }

    public void update(Match match) {
        for (int i = 0; i < MATCHS.size(); i++) {
            if (MATCHS.get(i).getId() == match.getId()) {
                MATCHS.set(i, match);
                break;
            }
        }
    }

    public void delete(int id) {
        MATCHS.removeIf(m -> m.getId() == id);
    }

    public void updateScore(int id, int scoreDomicile, int scoreExterieur) {
        Match m = findById(id);
        if (m != null) {
            m.setScoreDomicile(scoreDomicile);
            m.setScoreExterieur(scoreExterieur);
            m.setTermine(true);
        }
    }
}

