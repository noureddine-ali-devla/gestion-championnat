package dao;

import model.Match;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;
import java.util.List;

public class MatchDAO implements IDAO<Match> {

    @Override
    public void save(Match match) {
        Database.save(match);
    }

    @Override
    public void update(Match match) {
        Database.update(match);
    }

    @Override
    public void delete(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Match match = session.get(Match.class, id);
            if (match != null) Database.delete(match);
        }
    }

    @Override
    public Match findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Match.class, id);
        }
    }

    @Override
    public List<Match> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Match> query = session.createQuery("from Match", Match.class);
            return query.list();
        }
    }
}


