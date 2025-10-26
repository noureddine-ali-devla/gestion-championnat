package model;

public class Joueur {
    private int id;
    private String nom;
    private String prenom;
    private String poste;
    private Equipe equipe;

    public Joueur() {}

    public Joueur(int id, String nom, String prenom, String poste, Equipe equipe) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.poste = poste;
        this.equipe = equipe;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }

    public String getPoste() { return poste; }
    public void setPoste(String poste) { this.poste = poste; }

    public Equipe getEquipe() { return equipe; }
    public void setEquipe(Equipe equipe) { this.equipe = equipe; }
}

