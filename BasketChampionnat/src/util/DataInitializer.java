package util;

import model.Equipe;
import model.Joueur;
import model.Match;
import model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.time.LocalDate;
import java.util.List;

public class DataInitializer {
    public static void initialize() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();

            List<Equipe> equipes = session.createQuery("from Equipe", Equipe.class).list();
            if (equipes.isEmpty()) {
                Equipe e1 = new Equipe("Lions", "Casablanca", "Coach1");
                Equipe e2 = new Equipe("Tigers", "Rabat", "Coach2");
                Equipe e3 = new Equipe("Eagles", "Marrakech", "Coach3");

                session.persist(e1);
                session.persist(e2);
                session.persist(e3);

                Joueur j1 = new Joueur("Youssef", "Bennani", "Arrière", e1);
                Joueur j2 = new Joueur("Omar", "El Idrissi", "Ailier", e1);
                Joueur j3 = new Joueur("Adam", "Bouzekri", "Pivot", e2);
                Joueur j4 = new Joueur("Karim", "Moutaouakil", "Meneur", e2);
                Joueur j5 = new Joueur("Walid", "Tazi", "Arrière", e3);

                session.persist(j1);
                session.persist(j2);
                session.persist(j3);
                session.persist(j4);
                session.persist(j5);

                Match m1 = new Match(e1, e2, LocalDate.now().minusDays(3), 80, 75);
                Match m2 = new Match(e2, e3, LocalDate.now().minusDays(2), 68, 70);
                Match m3 = new Match(e3, e1, LocalDate.now().minusDays(1), 82, 78);

                session.persist(m1);
                session.persist(m2);
                session.persist(m3);

                User admin = new User("admin", PasswordUtils.hashPassword("admin123"), "ADMIN");
                session.persist(admin);
            }

            tx.commit();
        }
    }
}

