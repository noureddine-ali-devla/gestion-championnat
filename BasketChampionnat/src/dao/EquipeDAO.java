package dao;

import model.Equipe;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;
import java.util.List;

public class EquipeDAO {

    public void save(Equipe equipe) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(equipe);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    public void update(Equipe equipe) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.merge(equipe);
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
            Equipe equipe = session.get(Equipe.class, id);
            if (equipe != null) session.remove(equipe);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    public Equipe findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Equipe.class, id);
        }
    }

    public List<Equipe> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Equipe> query = session.createQuery("from Equipe", Equipe.class);
            return query.list();
        }
    }

    public Equipe findByName(String nom) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Equipe> query = session.createQuery("from Equipe where nom = :nom", Equipe.class);
            query.setParameter("nom", nom);
            return query.uniqueResult();
        }
    }
}

