package dao;

import model.Joueur;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;
import java.util.List;

public class JoueurDAO implements IDAO<Joueur> {

    @Override
    public void save(Joueur joueur) {
        Database.save(joueur);
    }

    @Override
    public void update(Joueur joueur) {
        Database.update(joueur);
    }

    @Override
    public void delete(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Joueur joueur = session.get(Joueur.class, id);
            if (joueur != null) Database.delete(joueur);
        }
    }

    @Override
    public Joueur findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Joueur.class, id);
        }
    }

    @Override
    public List<Joueur> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Joueur> query = session.createQuery("from Joueur", Joueur.class);
            return query.list();
        }
    }
}



