package model;

public class Statistique {
    private Equipe equipe;
    private int matchsJoues;
    private int victoires;
    private int defaites;
    private int pointsMarques;
    private int pointsEncaisses;
    private int totalPoints; // for classement ranking

    public Statistique() {}

    public Statistique(Equipe equipe) {
        this.equipe = equipe;
        this.matchsJoues = 0;
        this.victoires = 0;
        this.defaites = 0;
        this.pointsMarques = 0;
        this.pointsEncaisses = 0;
        this.totalPoints = 0;
    }

    public Equipe getEquipe() { return equipe; }
    public void setEquipe(Equipe equipe) { this.equipe = equipe; }

    public int getMatchsJoues() { return matchsJoues; }
    public void setMatchsJoues(int matchsJoues) { this.matchsJoues = matchsJoues; }

    public int getVictoires() { return victoires; }
    public void setVictoires(int victoires) { this.victoires = victoires; }

    public int getDefaites() { return defaites; }
    public void setDefaites(int defaites) { this.defaites = defaites; }

    public int getPointsMarques() { return pointsMarques; }
    public void setPointsMarques(int pointsMarques) { this.pointsMarques = pointsMarques; }

    public int getPointsEncaisses() { return pointsEncaisses; }
    public void setPointsEncaisses(int pointsEncaisses) { this.pointsEncaisses = pointsEncaisses; }

    public int getTotalPoints() { return totalPoints; }
    public void setTotalPoints(int totalPoints) { this.totalPoints = totalPoints; }

    // Utility methods for updating stats
    public void enregistrerMatch(int pointsPour, int pointsContre) {
        matchsJoues++;
        pointsMarques += pointsPour;
        pointsEncaisses += pointsContre;

        if (pointsPour > pointsContre) {
            victoires++;
            totalPoints += 2; // 2 points for a win
        } else {
            defaites++;
            totalPoints += 1; // 1 point for a loss
        }
    }

    @Override
    public String toString() {
        return String.format(
            "Equipe: %s | MJ: %d | V: %d | D: %d | PM: %d | PE: %d | Pts: %d",
            (equipe != null ? equipe.getNom() : "Inconnue"),
            matchsJoues, victoires, defaites, pointsMarques, pointsEncaisses, totalPoints
        );
    }
}

