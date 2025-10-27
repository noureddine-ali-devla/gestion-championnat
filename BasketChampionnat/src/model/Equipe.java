package model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "equipes")
public class Equipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true)
    private String nom;

    @Column(nullable = false)
    private String ville;

    @Column(nullable = false)
    private String entraineur;

    @OneToMany(mappedBy = "equipe", cascade = CascadeType.ALL)
    private List<Joueur> joueurs;

    public Equipe() {}

    public Equipe(String nom, String ville, String entraineur) {
        this.nom = nom;
        this.ville = ville;
        this.entraineur = entraineur;
    }

    public int getId() { return id; }
    public String getNom() { return nom; }
    public String getVille() { return ville; }
    public String getEntraineur() { return entraineur; }
    public List<Joueur> getJoueurs() { return joueurs; }

    public void setNom(String nom) { this.nom = nom; }
    public void setVille(String ville) { this.ville = ville; }
    public void setEntraineur(String entraineur) { this.entraineur = entraineur; }
    public void setJoueurs(List<Joueur> joueurs) { this.joueurs = joueurs; }
}


