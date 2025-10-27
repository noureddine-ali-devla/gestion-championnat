package dao;

import model.Equipe;
import java.util.ArrayList;
import java.util.List;

public class EquipeDAO {
    private static final List<Equipe> equipes = new ArrayList<>();

    static {
        equipes.add(new Equipe("Lions", "Casablanca", "lions@example.com", "Karim El Fassi"));
        equipes.add(new Equipe("Tigers", "Rabat", "tigers@example.com", "Youssef Amrani"));
        equipes.add(new Equipe("Eagles", "Marrakech", "eagles@example.com", "Hassan Idrissi"));
    }

    public List<Equipe> findAll() {
        return equipes;
    }

    public Equipe findById(int id) {
        for (Equipe e : equipes) {
            if (e.getId() == id) return e;
        }
        return null;
    }

    public void save(Equipe equipe) {
        // Simule un auto-incrément d'ID
        equipe.setId(equipes.size() + 1);
        equipes.add(equipe);
    }

    public void update(Equipe equipe) {
        for (int i = 0; i < equipes.size(); i++) {
            if (equipes.get(i).getId() == equipe.getId()) {
                equipes.set(i, equipe);
                break;
            }
        }
    }

    public void delete(int id) {
        equipes.removeIf(e -> e.getId() == id);
    }
}


