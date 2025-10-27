package service;

import dao.*;
import model.*;

import java.util.List;

public class ChampionnatService {
    private EquipeDAO equipeDAO = new EquipeDAO();
    private JoueurDAO joueurDAO = new JoueurDAO();
    private MatchDAO matchDAO = new MatchDAO();
    private UserDAO userDAO = new UserDAO();

    public void ajouterEquipe(Equipe e) { equipeDAO.save(e); }
    public void modifierEquipe(Equipe e) { equipeDAO.update(e); }
    public void supprimerEquipe(int id) { equipeDAO.delete(id); }
    public Equipe getEquipeById(int id) { return equipeDAO.findById(id); }
    public List<Equipe> getEquipes() { return equipeDAO.findAll(); }

    public void ajouterJoueur(Joueur j) { joueurDAO.save(j); }
    public void modifierJoueur(Joueur j) { joueurDAO.update(j); }
    public void supprimerJoueur(int id) { joueurDAO.delete(id); }
    public Joueur getJoueurById(int id) { return joueurDAO.findById(id); }
    public List<Joueur> getJoueurs() { return joueurDAO.findAll(); }

    public void ajouterMatch(Match m) { matchDAO.save(m); }
    public void modifierMatch(Match m) { matchDAO.update(m); }
    public void supprimerMatch(int id) { matchDAO.delete(id); }
    public Match getMatchById(int id) { return matchDAO.findById(id); }
    public List<Match> getMatchs() { return matchDAO.findAll(); }

    public void ajouterUser(User u) { userDAO.save(u); }
    public void modifierUser(User u) { userDAO.update(u); }
    public void supprimerUser(int id) { userDAO.delete(id); }
    public User getUserById(int id) { return userDAO.findById(id); }
    public List<User> getUsers() { return userDAO.findAll(); }
}


