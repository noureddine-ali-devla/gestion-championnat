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

        List<Joueur> joueurs = Arrays.asList(j1, j2, j3, j4, j5);
        joueurs.forEach(session::save);

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


