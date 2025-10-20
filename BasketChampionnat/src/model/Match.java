package model;

import java.time.LocalDate;

public class Match {
    private int id;
    private Equipe equipeA;
    private Equipe equipeB;
    private int scoreA;
    private int scoreB;
    private LocalDate dateMatch;
    private boolean termine;

    public Match(int id, Equipe equipeA, Equipe equipeB, LocalDate dateMatch) {
        this.id = id;
        this.equipeA = equipeA;
        this.equipeB = equipeB;
        this.dateMatch = dateMatch;
        this.scoreA = 0;
        this.scoreB = 0;
        this.termine = false;
    }

    public int getId() {
        return id;
    }

    public Equipe getEquipeA() {
        return equipeA;
    }

    public Equipe getEquipeB() {
        return equipeB;
    }

    public int getScoreA() {
        return scoreA;
    }

    public int getScoreB() {
        return scoreB;
    }

    public LocalDate getDateMatch() {
        return dateMatch;
    }

    public boolean isTermine() {
        return termine;
    }

    public void enregistrerScore(int scoreA, int scoreB) {
        if (!termine) {
            this.scoreA = scoreA;
            this.scoreB = scoreB;
            equipeA.enregistrerResultat(scoreA, scoreB);
            equipeB.enregistrerResultat(scoreB, scoreA);
            this.termine = true;
        }
    }
}
