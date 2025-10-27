package dao;

import model.Match;
import java.util.ArrayList;
import java.util.List;

public class MatchDAO {
    private List<Match> matchs = new ArrayList<>();
    private int nextId = 1;

    public MatchDAO() {
        // Initialisation des matchs si nécessaire
    }

    public void save(Match match) {
        match.setId(nextId++);
        matchs.add(match);
    }

    public void update(Match match) {
        for (int i = 0; i < matchs.size(); i++) {
            if (matchs.get(i).getId() == match.getId()) {
                matchs.set(i, match);
                return;
            }
        }
    }

    public void delete(int id) {
        matchs.removeIf(m -> m.getId() == id);
    }

    public List<Match> findAll() {
        return new ArrayList<>(matchs);
    }

    public Match findById(int id) {
        return matchs.stream().filter(m -> m.getId() == id).findFirst().orElse(null);
    }
}


