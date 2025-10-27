package model;

public class Statistique {
    private int id;
    private Equipe equipe;
    private int matchsJoues;
    private int victoires;
    private int defaites;
    private int points;

    // Constructeur par défaut
    public Statistique() {}

    // Constructeur avec équipe
    public Statistique(Equipe equipe) {
        this.equipe = equipe;
        this.matchsJoues = 0;
        this.victoires = 0;
        this.defaites = 0;
        this.points = 0;
    }

    // Getters et Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Equipe getEquipe() {
        return equipe;
    }

    public void setEquipe(Equipe equipe) {
        this.equipe = equipe;
    }

    public int getMatchsJoues() {
        return matchsJoues;
    }

    public void setMatchsJoues(int matchsJoues) {
        this.matchsJoues = matchsJoues;
    }

    public int getVictoires() {
        return victoires;
    }

    public void setVictoires(int victoires) {
        this.victoires = victoires;
    }

    public int getDefaites() {
        return defaites;
    }

    public void setDefaites(int defaites) {
        this.defaites = defaites;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    // Méthode utilitaire : mise à jour automatique des statistiques
    public void enregistrerResultat(boolean victoire) {
        matchsJoues++;
        if (victoire) {
            victoires++;
            points += 2;
        } else {
            defaites++;
            points += 1;
        }
    }
}
