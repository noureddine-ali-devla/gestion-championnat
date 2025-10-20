package dao;

import model.Joueur;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;
import java.util.List;

public class JoueurDAO {

    public void save(Joueur joueur) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(joueur);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    public void update(Joueur joueur) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.merge(joueur);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    public void delete(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Joueur joueur = session.get(Joueur.class, id);
            if (joueur != null) session.remove(joueur);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    public Joueur findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Joueur.class, id);
        }
    }

    public List<Joueur> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Joueur> query = session.createQuery("from Joueur", Joueur.class);
            return query.list();
        }
    }

    public List<Joueur> findByEquipeId(int equipeId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Joueur> query = session.createQuery("from Joueur where equipe.id = :equipeId", Joueur.class);
            query.setParameter("equipeId", equipeId);
            return query.list();
        }
    }
}
