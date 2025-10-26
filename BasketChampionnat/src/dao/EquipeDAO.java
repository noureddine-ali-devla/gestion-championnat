package dao;

import model.Equipe;
import java.util.ArrayList;
import java.util.List;

public class EquipeDAO {

    private static final List<Equipe> EQUIPES = new ArrayList<>();

    static {
        Equipe e1 = new Equipe("Lions", "Casablanca", "lions@example.com");
        e1.setId(1);
        Equipe e2 = new Equipe("Tigers", "Rabat", "tigers@example.com");
        e2.setId(2);
        Equipe e3 = new Equipe("Bulls", "Marrakech", "bulls@example.com");
        e3.setId(3);

        EQUIPES.add(e1);
        EQUIPES.add(e2);
        EQUIPES.add(e3);
    }

    public List<Equipe> listEquipes() {
        return EQUIPES;
    }

    public Equipe findById(int id) {
        for (Equipe e : EQUIPES) {
            if (e.getId() == id) return e;
        }
        return null;
    }

    public void save(Equipe equipe) {
        int newId = EQUIPES.size() + 1;
        equipe.setId(newId);
        EQUIPES.add(equipe);
    }

    public void update(Equipe equipe) {
        Equipe existing = findById(equipe.getId());
        if (existing != null) {
            existing.setNom(equipe.getNom());
            existing.setVille(equipe.getVille());
            existing.setEmail(equipe.getEmail());
        }
    }

    public void delete(int id) {
        EQUIPES.removeIf(e -> e.getId() == id);
    }
}

