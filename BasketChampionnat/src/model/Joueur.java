package model;

public class Joueur {
    private int id;
    private String nom;
    private String prenom;
    private String position;
    private int numero;
    private Equipe equipe;
    private int pointsMarques;
    private int passesDecisives;
    private int rebonds;
    private int fautes;

    public Joueur(int id, String nom, String prenom, String position, int numero, Equipe equipe) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.position = position;
        this.numero = numero;
        this.equipe = equipe;
        this.pointsMarques = 0;
        this.passesDecisives = 0;
        this.rebonds = 0;
        this.fautes = 0;
    }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getPosition() {
        return position;
    }

    public int getNumero() {
        return numero;
    }

    public Equipe getEquipe() {
        return equipe;
    }

    public int getPointsMarques() {
        return pointsMarques;
    }

    public int getPassesDecisives() {
        return passesDecisives;
    }

    public int getRebonds() {
        return rebonds;
    }

    public int getFautes() {
        return fautes;
    }

    public void ajouterStats(int points, int passes, int rebonds, int fautes) {
        this.pointsMarques += points;
        this.passesDecisives += passes;
        this.rebonds += rebonds;
        this.fautes += fautes;
    }
}
