package model;

import jakarta.persistence.*;

@Entity
@Table(name = "joueurs")
public class Joueur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String prenom;

    @Column(nullable = false)
    private String nom;

    @Column(nullable = false)
    private String poste;

    @Column(nullable = false)
    private int numero;

    @ManyToOne
    @JoinColumn(name = "equipe_id", nullable = false)
    private Equipe equipe;

    public Joueur() {}

    public Joueur(String prenom, String nom, String poste, int numero, Equipe equipe) {
        this.prenom = prenom;
        this.nom = nom;
        this.poste = poste;
        this.numero = numero;
        this.equipe = equipe;
    }

    public int getId() { return id; }
    public String getPrenom() { return prenom; }
    public String getNom() { return nom; }
    public String getPoste() { return poste; }
    public int getNumero() { return numero; }
    public Equipe getEquipe() { return equipe; }

    public void setPrenom(String prenom) { this.prenom = prenom; }
    public void setNom(String nom) { this.nom = nom; }
    public void setPoste(String poste) { this.poste = poste; }
    public void setNumero(int numero) { this.numero = numero; }
    public void setEquipe(Equipe equipe) { this.equipe = equipe; }
}

