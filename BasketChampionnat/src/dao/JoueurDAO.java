package dao;

import model.Joueur;
import java.util.ArrayList;
import java.util.List;

public class JoueurDAO implements IDAO<Joueur> {
    private static List<Joueur> joueurs = new ArrayList<>();

    public void ajouter(Joueur j) {
        joueurs.add(j);
    }

    public void modifier(Joueur j) {
        for (int i = 0; i < joueurs.size(); i++) {
            if (joueurs.get(i).getId() == j.getId()) {
                joueurs.set(i, j);
                break;
            }
        }
    }

    public void supprimer(int id) {
        joueurs.removeIf(j -> j.getId() == id);
    }

    public Joueur getById(int id) {
        for (Joueur j : joueurs) {
            if (j.getId() == id) return j;
        }
        return null;
    }

    public List<Joueur> getAll() {
        return joueurs;
    }

    public List<Joueur> getByEquipeId(int idEquipe) {
        List<Joueur> resultat = new ArrayList<>();
        for (Joueur j : joueurs) {
            if (j.getEquipe() != null && j.getEquipe().getId() == idEquipe) {
                resultat.add(j);
            }
        }
        return resultat;
    }
}
