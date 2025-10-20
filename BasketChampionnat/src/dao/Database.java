package dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import model.Equipe;
import model.Joueur;
import model.Match;
import model.Statistique;

public class Database {
    private static final SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
        try {
            return new Configuration()
                    .configure("hibernate.cfg.xml")
                    .addAnnotatedClass(Equipe.class)
                    .addAnnotatedClass(Joueur.class)
                    .addAnnotatedClass(Match.class)
                    .addAnnotatedClass(Statistique.class)
                    .buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError("Erreur de configuration Hibernate : " + ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        getSessionFactory().close();
    }
}
