package dao;

import model.Player;
import org.hibernate.Session;
import org.hibernate.Transaction;
import config.HibernateUtil;
import java.util.List;

public class PlayerDAO {

    public void save(Player player) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.persist(player);
            tx.commit();
        }
    }

    public void update(Player player) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.merge(player);
            tx.commit();
        }
    }

    public void delete(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            Player p = session.get(Player.class, id);
            if (p != null) session.remove(p);
            tx.commit();
        }
    }

    public Player findById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Player.class, id);
        }
    }

    public List<Player> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Player", Player.class).list();
        }
    }
}
