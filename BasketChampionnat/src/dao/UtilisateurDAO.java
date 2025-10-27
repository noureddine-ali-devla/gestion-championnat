package dao;

import model.Utilisateur;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class UtilisateurDAO implements IDAO<Utilisateur> {

    public void save(Utilisateur u) {
        em.getTransaction().begin();
        em.persist(u);
        em.getTransaction().commit();
    }

    public void update(Utilisateur u) {
        em.getTransaction().begin();
        em.merge(u);
        em.getTransaction().commit();
    }

    public void delete(int id) {
        Utilisateur u = em.find(Utilisateur.class, id);
        if (u != null) {
            em.getTransaction().begin();
            em.remove(u);
            em.getTransaction().commit();
        }
    }

    public List<Utilisateur> findAll() {
        TypedQuery<Utilisateur> query = em.createQuery("SELECT u FROM Utilisateur u", Utilisateur.class);
        return query.getResultList();
    }

    public Utilisateur findById(int id) {
        return em.find(Utilisateur.class, id);
    }

    public Utilisateur findByUsername(String username) {
        TypedQuery<Utilisateur> query = em.createQuery("SELECT u FROM Utilisateur u WHERE u.username = :username", Utilisateur.class);
        query.setParameter("username", username);
        List<Utilisateur> result = query.getResultList();
        return result.isEmpty() ? null : result.get(0);
    }
}

