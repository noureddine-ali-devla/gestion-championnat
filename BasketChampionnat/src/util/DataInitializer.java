package util;

import model.Equipe;
import model.Joueur;
import model.Match;
import model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

public class DataInitializer {

    public static void initialize() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        Equipe e1 = new Equipe("Lions Casablanca", "Casablanca", "Coach A");
        Equipe e2 = new Equipe("Tigers Rabat", "Rabat", "Coach B");
        Equipe e3 = new Equipe("Eagles Marrakech", "Marrakech", "Coach C");

        List<Equipe> equipes = Arrays.asList(e1, e2, e3);
        equipes.forEach(session::save);

        Joueur j1 = new Joueur("Youssef", "Bennani", "Arrière", e1);
        Joueur j2 = new Joueur("Omar", "El Idrissi", "Ailier", e1);
        Joueur j3 = new Joueur("Adam", "Bouzekri", "Pivot", e2);
        Joueur j4 = new Joueur("Karim", "Moutaouakil", "Meneur", e2);
        Joueur j5 = new Joueur("Walid", "Tazi", "Arrière", e3);

        List<Joueur> joueurs = Arrays.asList(j1, j2, j3, j4, j5);
        joueurs.forEach(session::save);

        Match m1 = new Match(e1, e2, LocalDate.now().minusDays(3), 80, 75);
        Match m2 = new Match(e2, e3, LocalDate.now().minusDays(2), 68, 70);
        Match m3 = new Match(e3, e1, LocalDate.now().minusDays(1), 82, 78);

        List<Match> matchs = Arrays.asList(m1, m2, m3);
        matchs.forEach(session::save);

        User admin = new User("admin", "admin123", "ADMIN");
        User user = new User("user", "user123", "USER");

        session.save(admin);
        session.save(user);

        tx.commit();
        session.close();
    }
}


