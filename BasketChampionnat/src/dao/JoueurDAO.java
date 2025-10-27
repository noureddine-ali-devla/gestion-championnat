package dao;

import model.Joueur;
import java.util.ArrayList;
import java.util.List;

public class JoueurDAO {
    private List<Joueur> joueurs = new ArrayList<>();
    private int nextId = 1;

    public JoueurDAO() {
        // Initialisation des joueurs si nécessaire
    }

    public void save(Joueur joueur) {
        joueur.setId(nextId++);
        joueurs.add(joueur);
    }

    public void update(Joueur joueur) {
        for (int i = 0; i < joueurs.size(); i++) {
            if (joueurs.get(i).getId() == joueur.getId()) {
                joueurs.set(i, joueur);
                return;
            }
        }
    }

    public void delete(int id) {
        joueurs.removeIf(j -> j.getId() == id);
    }

    public List<Joueur> findAll() {
        return new ArrayList<>(joueurs);
    }

    public Joueur findById(int id) {
        return joueurs.stream().filter(j -> j.getId() == id).findFirst().orElse(null);
    }
}



