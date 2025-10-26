package model;

public class Statistique {
    private Equipe equipe;
    private int matchsJoues;
    private int victoires;
    private int defaites;
    private int butsMarques;
    private int butsEncaisses;
    private int points;

    public Statistique() {}

    public Statistique(Equipe equipe) {
        this.equipe = equipe;
    }

    public Equipe getEquipe() { return equipe; }
    public void setEquipe(Equipe equipe) { this.equipe = equipe; }

    public int getMatchsJoues() { return matchsJoues; }
    public void setMatchsJoues(int matchsJoues) { this.matchsJoues = matchsJoues; }

    public int getVictoires() { return victoires; }
    public void setVictoires(int victoires) { this.victoires = victoires; }

    public int getDefaites() { return defaites; }
    public void setDefaites(int defaites) { this.defaites = defaites; }

    public int getButsMarques() { return butsMarques; }
    public void setButsMarques(int butsMarques) { this.butsMarques = butsMarques; }

    public int getButsEncaisses() { return butsEncaisses; }
    public void setButsEncaisses(int butsEncaisses) { this.butsEncaisses = butsEncaisses; }

    public int getPoints() { return points; }
    public void setPoints(int points) { this.points = points; }

    public int getDifferenceButs() {
        return butsMarques - butsEncaisses;
    }

    public void enregistrerMatch(int marque, int encaisse, boolean victoire) {
        matchsJoues++;
        butsMarques += marque;
        butsEncaisses += encaisse;
        if (victoire) {
            victoires++;
            points += 2;
        } else {
            defaites++;
            points += 1;
        }
    }
}
