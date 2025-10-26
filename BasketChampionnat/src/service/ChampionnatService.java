package service;

import dao.EquipeDAO;
import dao.JoueurDAO;
import dao.MatchDAO;
import model.Equipe;
import model.Joueur;
import model.Match;
import java.util.List;

public class ChampionnatService {
    private final EquipeDAO equipeDAO = new EquipeDAO();
    private final JoueurDAO joueurDAO = new JoueurDAO();
    private final MatchDAO matchDAO = new MatchDAO();

    public void ajouterEquipe(Equipe equipe) {
        equipeDAO.save(equipe);
    }

    public void modifierEquipe(Equipe equipe) {
        equipeDAO.update(equipe);
    }

    public void supprimerEquipe(int id) {
        equipeDAO.delete(id);
    }

    public List<Equipe> getEquipes() {
        return equipeDAO.findAll();
    }

    public Equipe getEquipeById(int id) {
        return equipeDAO.findById(id);
    }

    public void ajouterJoueur(Joueur joueur) {
        joueurDAO.save(joueur);
    }

    public void modifierJoueur(Joueur joueur) {
        joueurDAO.update(joueur);
    }

    public void supprimerJoueur(int id) {
        joueurDAO.delete(id);
    }

    public List<Joueur> getJoueurs() {
        return joueurDAO.findAll();
    }

    public Joueur getJoueurById(int id) {
        return joueurDAO.findById(id);
    }

    public void ajouterMatch(Match match) {
        matchDAO.save(match);
    }

    public void modifierMatch(Match match) {
        matchDAO.update(match);
    }

    public void supprimerMatch(int id) {
        matchDAO.delete(id);
    }

    public List<Match> getMatchs() {
        return matchDAO.findAll();
    }

    public Match getMatchById(int id) {
        return matchDAO.findById(id);
    }

    public void enregistrerScore(int idMatch, int scoreA, int scoreB) {
        matchDAO.updateScore(idMatch, scoreA, scoreB);
    }
}


