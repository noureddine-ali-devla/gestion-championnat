package service;

import dao.*;
import model.*;
import java.util.List;

public class ChampionnatService {
    private EquipeDAO equipeDAO = new EquipeDAO();
    private JoueurDAO joueurDAO = new JoueurDAO();
    private MatchDAO matchDAO = new MatchDAO();

    public ChampionnatService() {
        initialiserDonnees();
    }

    private void initialiserDonnees() {
        for (Equipe e : Database.getEquipes()) {
            equipeDAO.ajouter(e);
        }
        for (Joueur j : Database.getJoueurs()) {
            joueurDAO.ajouter(j);
        }
        for (Match m : Database.getMatchs()) {
            matchDAO.ajouter(m);
        }
    }

    public List<Equipe> getEquipes() {
        return equipeDAO.getAll();
    }

    public List<Joueur> getJoueurs() {
        return joueurDAO.getAll();
    }

    public List<Match> getMatchs() {
        return matchDAO.getAll();
    }

    public Equipe getEquipeById(int id) {
        return equipeDAO.getById(id);
    }

    public Joueur getJoueurById(int id) {
        return joueurDAO.getById(id);
    }

    public Match getMatchById(int id) {
        return matchDAO.getById(id);
    }

    public void ajouterEquipe(Equipe e) {
        equipeDAO.ajouter(e);
    }

    public void ajouterJoueur(Joueur j) {
        joueurDAO.ajouter(j);
    }

    public void ajouterMatch(Match m) {
        matchDAO.ajouter(m);
    }

    public void enregistrerScore(int idMatch, int scoreA, int scoreB) {
        Match m = matchDAO.getById(idMatch);
        if (m != null && !m.isTermine()) {
            m.enregistrerScore(scoreA, scoreB);
        }
    }
}
