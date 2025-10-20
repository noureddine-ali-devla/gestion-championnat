package dao;

import java.util.List;

public interface IDAO<T> {
    void ajouter(T objet);
    void modifier(T objet);
    void supprimer(int id);
    T getById(int id);
    List<T> getAll();
}
