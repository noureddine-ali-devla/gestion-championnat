package dao;

import model.Match;
import model.Equipe;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MatchDAO {
    private static final List<Match> matchs = new ArrayList<>();

    static {
        Equipe e1 = new Equipe("Lions", "Casablanca", "lions@example.com");
        Equipe e2 = new Equipe("Tigers", "Rabat", "tigers@example.com");
        Equipe e3 = new Equipe("Eagles", "Marrakech", "eagles@example.com");

        matchs.add(new Match(e1, e2, LocalDate.now().minusDays(3), 80, 75, true));
        matchs.add(new Match(e2, e3, LocalDate.now().minusDays(2), 68, 70, true));
        matchs.add(new Match(e3, e1, LocalDate.now().minusDays(1), 82, 78, false));
    }

    public List<Match> findAll() { return matchs; }

    public Match findById(int id) {
        for (Match m : matchs) {
            if (m.getId() == id) return m;
        }
        return null;
    }

    public void save(Match match) { matchs.add(match); }

    public void update(Match match) {
        for (int i = 0; i < matchs.size(); i++) {
            if (matchs.get(i).getId() == match.getId()) {
                matchs.set(i, match);
                break;
            }
        }
    }

    public void delete(int id) {
        matchs.removeIf(m -> m.getId() == id);
    }
}


