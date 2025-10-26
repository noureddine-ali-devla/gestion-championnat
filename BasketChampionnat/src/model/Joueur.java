package model;

public class Joueur {
    private int id;
    private String nom;
    private String prenom;
    private String position;
    private int numero;
    private int points;
    private Equipe equipe;

    public Joueur() {}

    public Joueur(String nom, String prenom, String position, int numero, int points, Equipe equipe) {
        this.nom = nom;
        this.prenom = prenom;
        this.position = position;
        this.numero = numero;
        this.points = points;
        this.equipe = equipe;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }

    public int getNumero() { return numero; }
    public void setNumero(int numero) { this.numero = numero; }

    public int getPoints() { return points; }
    public void setPoints(int points) { this.points = points; }

    public Equipe getEquipe() { return equipe; }
    public void setEquipe(Equipe equipe) { this.equipe = equipe; }
}

