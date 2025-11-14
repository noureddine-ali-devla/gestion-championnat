package dao;

import model.Match;
import model.Team;
import org.hibernate.Session;
import org.hibernate.Transaction;
import config.HibernateUtil;
import java.util.List;

public class MatchDAO {

    public void save(Match match) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            
            Team team1 = session.get(Team.class, match.getTeam1().getId());
            Team team2 = session.get(Team.class, match.getTeam2().getId());
            match.setTeam1(team1);
            match.setTeam2(team2);

            session.persist(match);
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            throw e;
        }
    }

    public void update(Match match) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            // Re-attach teams to current session
            Team team1 = session.get(Team.class, match.getTeam1().getId());
            Team team2 = session.get(Team.class, match.getTeam2().getId());
            match.setTeam1(team1);
            match.setTeam2(team2);

            session.merge(match);
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            throw e;
        }
    }

    public void delete(Long id) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            Match match = session.get(Match.class, id);
            if (match != null) {
                session.remove(match);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) tx.rollback();
            throw e;
        }
    }

    public Match findById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Match.class, id);
        }
    }

    public List<Match> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Match", Match.class).list();
        }
    }
}

