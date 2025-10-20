package model;

public class Statistique {
    private Equipe equipe;
    private int matchsJoues;
    private int victoires;
    private int defaites;
    private int egalites;
    private int butsMarques;
    private int butsEncaisses;
    private int points;

    public Statistique(Equipe equipe) {
        this.equipe = equipe;
        this.matchsJoues = equipe.getMatchsJoues();
        this.victoires = equipe.getVictoires();
        this.defaites = equipe.getDefaites();
        this.egalites = equipe.getEgalites();
        this.butsMarques = equipe.getButsMarques();
        this.butsEncaisses = equipe.getButsEncaisses();
        this.points = equipe.getPoints();
    }

    public Equipe getEquipe() {
        return equipe;
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

    public int getPoints() {
        return points;
    }

    public int getDifferenceButs() {
        return butsMarques - butsEncaisses;
    }
}
