package dao;

import model.Score;
import org.hibernate.Session;
import org.hibernate.Transaction;
import config.HibernateUtil;
import java.util.List;

public class ScoreDAO {

    public void save(Score score) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.persist(score);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

    public Score findById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Score.class, id);
        }
    }

    public List<Score> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Score", Score.class).list();
        }
    }
}

