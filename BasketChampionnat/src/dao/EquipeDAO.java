package dao;

import model.Equipe;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;
import java.util.List;

public class EquipeDAO implements IDAO<Equipe> {

    @Override
    public void save(Equipe equipe) {
        Database.save(equipe);
    }

    @Override
    public void update(Equipe equipe) {
        Database.update(equipe);
    }

    @Override
    public void delete(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Equipe equipe = session.get(Equipe.class, id);
            if (equipe != null) Database.delete(equipe);
        }
    }

    @Override
    public Equipe findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Equipe.class, id);
        }
    }

    @Override
    public List<Equipe> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Equipe> query = session.createQuery("from Equipe", Equipe.class);
            return query.list();
        }
    }
}


