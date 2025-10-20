package util;

import dao.EquipeDAO;
import dao.JoueurDAO;
import dao.MatchDAO;
import model.Equipe;
import model.Joueur;
import model.Match;
import java.time.LocalDate;

public class DataInitializer {
    private EquipeDAO equipeDAO;
    private JoueurDAO joueurDAO;
    private MatchDAO matchDAO;

    public DataInitializer(EquipeDAO equipeDAO, JoueurDAO joueurDAO, MatchDAO matchDAO) {
        this.equipeDAO = equipeDAO;
        this.joueurDAO = joueurDAO;
        this.matchDAO = matchDAO;
    }

    public void initialiser() {
        Equipe e1 = new Equipe(1, "Tigers", "Casablanca", "Alaoui");
        Equipe e2 = new Equipe(2, "Lions", "Rabat", "Bennani");
        Equipe e3 = new Equipe(3, "Eagles", "Marrakech", "Fassi");
        Equipe e4 = new Equipe(4, "Sharks", "Agadir", "El Idrissi");

        equipeDAO.ajouter(e1);
        equipeDAO.ajouter(e2);
        equipeDAO.ajouter(e3);
        equipeDAO.ajouter(e4);

        joueurDAO.ajouter(new Joueur(1, "Amine", "El Fadili", "Ailier", 7, e1));
        joueurDAO.ajouter(new Joueur(2, "Karim", "Rami", "Pivot", 10, e1));
        joueurDAO.ajouter(new Joueur(3, "Youssef", "Azzouzi", "Meneur", 5, e2));
        joueurDAO.ajouter(new Joueur(4, "Omar", "Bourhim", "Arrière", 8, e2));
        joueurDAO.ajouter(new Joueur(5, "Hamza", "Saidi", "Ailier fort", 11, e3));
        joueurDAO.ajouter(new Joueur(6, "Nabil", "Cherkaoui", "Pivot", 9, e4));

        matchDAO.ajouter(new Match(1, e1, e2, LocalDate.of(2025, 1, 10)));
        matchDAO.ajouter(new Match(2, e3, e4, LocalDate.of(2025, 1, 11)));
        matchDAO.ajouter(new Match(3, e1, e3, LocalDate.of(2025, 1, 15)));
        matchDAO.ajouter(new Match(4, e2, e4, LocalDate.of(2025, 1, 17)));
    }
}
