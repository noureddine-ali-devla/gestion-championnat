package dao;

import model.Match;
import java.util.ArrayList;
import java.util.List;

public class MatchDAO implements IDAO<Match> {
    private static List<Match> matchs = new ArrayList<>();

    public void ajouter(Match m) {
        matchs.add(m);
    }

    public void modifier(Match m) {
        for (int i = 0; i < matchs.size(); i++) {
            if (matchs.get(i).getId() == m.getId()) {
                matchs.set(i, m);
                break;
            }
        }
    }

    public void supprimer(int id) {
        matchs.removeIf(m -> m.getId() == id);
    }

    public Match getById(int id) {
        for (Match m : matchs) {
            if (m.getId() == id) return m;
        }
        return null;
    }

    public List<Match> getAll() {
        return matchs;
    }

    public List<Match> getMatchsNonTermines() {
        List<Match> resultat = new ArrayList<>();
        for (Match m : matchs) {
            if (!m.isTermine()) resultat.add(m);
        }
        return resultat;
    }
}
