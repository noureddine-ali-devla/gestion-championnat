package util;

import model.Equipe;
import model.Joueur;
import model.Match;
import model.Statistique;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

public class DataInitializer {

    public static void initialize() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();

            Long countEquipes = (Long) session.createQuery("SELECT COUNT(e) FROM Equipe e").uniqueResult();
            if (countEquipes != null && countEquipes > 0) {
                tx.rollback();
                return;
            }

            Equipe e1 = new Equipe("Raptors Agadir", "Agadir", "coach.raptors@gmail.com");
            Equipe e2 = new Equipe("Lions Casablanca", "Casablanca", "coach.lions@gmail.com");
            Equipe e3 = new Equipe("Eagles Marrakech", "Marrakech", "coach.eagles@gmail.com");

            Joueur j1 = new Joueur("Youssef", "Bennani", "Arrière", 1, e1);
            Joueur j2 = new Joueur("Omar", "El Idrissi", "Ailier", 2, e1);
            Joueur j3 = new Joueur("Adam", "Bouzekri", "Pivot", 3, e2);
            Joueur j4 = new Joueur("Karim", "Moutaouakil", "Meneur", 4, e2);
            Joueur j5 = new Joueur("Walid", "Tazi", "Arrière", 5, e3);

            List<Equipe> equipes = Arrays.asList(e1, e2, e3);
            List<Joueur> joueurs = Arrays.asList(j1, j2, j3, j4, j5);

            for (Equipe e : equipes) session.persist(e);
            for (Joueur j : joueurs) session.persist(j);

            Match m1 = new Match(e1, e2, LocalDate.now().minusDays(3), 80, 75, "Gymnase Agadir");
            Match m2 = new Match(e2, e3, LocalDate.now().minusDays(2), 68, 70, "Gymnase Casablanca");
            Match m3 = new Match(e3, e1, LocalDate.now().minusDays(1), 82, 78, "Gymnase Marrakech");

            List<Match> matchs = Arrays.asList(m1, m2, m3);
            for (Match m : matchs) session.persist(m);

            for (Equipe e : equipes) {
                Statistique s = new Statistique(e);
                s.setMatchsJoues(2);
                s.setVictoires(e.equals(e3) ? 2 : e.equals(e1) ? 1 : 0);
                s.setDefaites(e.equals(e3) ? 0 : e.equals(e1) ? 1 : 2);
                s.setButsMarques((int) (Math.random() * 150 + 100));
                s.setButsEncaisses((int) (Math.random() * 150 + 100));
                session.persist(s);
            }

            tx.commit();
            System.out.println("Base de données initialisée avec succès !");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
