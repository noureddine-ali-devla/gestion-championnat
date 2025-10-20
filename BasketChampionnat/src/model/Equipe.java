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

    @OneToMany(mappedBy = "equipe", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Joueur> joueurs;

    @OneToMany(mappedBy = "equipeDomicile", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Match> matchsDomicile;

    @OneToMany(mappedBy = "equipeExterieur", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Match> matchsExterieur;

    @OneToOne(mappedBy = "equipe", cascade = CascadeType.ALL)
    private Statistique statistique;

    public Equipe() {}

    public Equipe(String nom, String ville) {
        this.nom = nom;
        this.ville = ville;
    }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public List<Joueur> getJoueurs() {
        return joueurs;
    }

    public void setJoueurs(List<Joueur> joueurs) {
        this.joueurs = joueurs;
    }

    public List<Match> getMatchsDomicile() {
        return matchsDomicile;
    }

    public void setMatchsDomicile(List<Match> matchsDomicile) {
        this.matchsDomicile = matchsDomicile;
    }

    public List<Match> getMatchsExterieur() {
        return matchsExterieur;
    }

    public void setMatchsExterieur(List<Match> matchsExterieur) {
        this.matchsExterieur = matchsExterieur;
    }

    public Statistique getStatistique() {
        return statistique;
    }

    public void setStatistique(Statistique statistique) {
        this.statistique = statistique;
    }
}
