package dao;

import model.Equipe;
import java.util.ArrayList;
import java.util.List;

public class EquipeDAO implements IDAO<Equipe> {
    private static List<Equipe> equipes = new ArrayList<>();

    public void ajouter(Equipe e) {
        equipes.add(e);
    }

    public void modifier(Equipe e) {
        for (int i = 0; i < equipes.size(); i++) {
            if (equipes.get(i).getId() == e.getId()) {
                equipes.set(i, e);
                break;
            }
        }
    }

    public void supprimer(int id) {
        equipes.removeIf(e -> e.getId() == id);
    }

    public Equipe getById(int id) {
        for (Equipe e : equipes) {
            if (e.getId() == id) return e;
        }
        return null;
    }

    public List<Equipe> getAll() {
        return equipes;
    }
}
