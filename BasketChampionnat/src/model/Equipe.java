package model;

import java.util.ArrayList;
import java.util.List;

public class Equipe {
    private int id;
    private String nom;
    private String ville;
    private String entraineur;
    private List<Joueur> joueurs;
    private int points;
    private int matchsJoues;
    private int victoires;
    private int defaites;
    private int egalites;
    private int butsMarques;
    private int butsEncaisses;

    public Equipe(int id, String nom, String ville, String entraineur) {
        this.id = id;
        this.nom = nom;
        this.ville = ville;
        this.entraineur = entraineur;
        this.joueurs = new ArrayList<>();
        this.points = 0;
        this.matchsJoues = 0;
        this.victoires = 0;
        this.defaites = 0;
        this.egalites = 0;
        this.butsMarques = 0;
        this.butsEncaisses = 0;
    }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public String getVille() {
        return ville;
    }

    public String getEntraineur() {
        return entraineur;
    }

    public List<Joueur> getJoueurs() {
        return joueurs;
    }

    public int getPoints() {
        return points;
    }

    public int getMatchsJoues() {
        return matchsJoues;
    }

    public int getVictoires() {
        return victoires;
    }

    public int getDefaites() {
        return defaites;
    }

    public int getEgalites() {
        return egalites;
    }

    public int getButsMarques() {
        return butsMarques;
    }

    public int getButsEncaisses() {
        return butsEncaisses;
    }

    public void ajouterJoueur(Joueur j) {
        joueurs.add(j);
    }

    public void enregistrerResultat(int butsPour, int butsContre) {
        matchsJoues++;
        butsMarques += butsPour;
        butsEncaisses += butsContre;
        if (butsPour > butsContre) {
            victoires++;
            points += 3;
        } else if (butsPour < butsContre) {
            defaites++;
        } else {
            egalites++;
            points += 1;
        }
    }

    public int getDifferenceButs() {
        return butsMarques - butsEncaisses;
    }
}
