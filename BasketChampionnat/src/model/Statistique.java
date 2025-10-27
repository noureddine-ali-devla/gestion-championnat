package model;

public class Statistique {
    private int id;
    private Equipe equipe;
    private int matchsJoues;
    private int victoires;
    private int defaites;
    private int points;
    private int butsMarques;
    private int butsEncaisses;

    public Statistique() {}

    public Statistique(Equipe equipe) {
        this.equipe = equipe;
        this.matchsJoues = 0;
        this.victoires = 0;
        this.defaites = 0;
        this.points = 0;
        this.butsMarques = 0;
        this.butsEncaisses = 0;
    }

    // Getters / Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Equipe getEquipe() { return equipe; }
    public void setEquipe(Equipe equipe) { this.equipe = equipe; }

    public int getMatchsJoues() { return matchsJoues; }
    public void setMatchsJoues(int matchsJoues) { this.matchsJoues = matchsJoues; }

    public int getVictoires() { return victoires; }
    public void setVictoires(int victoires) { this.victoires = victoires; }

    public int getDefaites() { return defaites; }
    public void setDefaites(int defaites) { this.defaites = defaites; }

    public int getPoints() { return points; }
    public void setPoints(int points) { this.points = points; }

    public int getButsMarques() { return butsMarques; }
    public void setButsMarques(int butsMarques) { this.butsMarques = butsMarques; }

    public int getButsEncaisses() { return butsEncaisses; }
    public void setButsEncaisses(int butsEncaisses) { this.butsEncaisses = butsEncaisses; }

    public int getDifferenceButs() {
        return butsMarques - butsEncaisses;
    }

    public void enregistrerResultat(boolean victoire, int butsPour, int butsContre) {
        matchsJoues++;
        butsMarques += butsPour;
        butsEncaisses += butsContre;

        if (victoire) {
            victoires++;
            points += 2;
        } else {
            defaites++;
            points += 1;
        }
    }
}

