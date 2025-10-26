package model;

import java.time.LocalDate;

public class Match {
    private int id;
    private Equipe equipeA;
    private Equipe equipeB;
    private LocalDate date;
    private int scoreA;
    private int scoreB;
    private boolean termine;

    public Match() {}

    public Match(Equipe equipeA, Equipe equipeB, LocalDate date, int scoreA, int scoreB, boolean termine) {
        this.equipeA = equipeA;
        this.equipeB = equipeB;
        this.date = date;
        this.scoreA = scoreA;
        this.scoreB = scoreB;
        this.termine = termine;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Equipe getEquipeA() { return equipeA; }
    public void setEquipeA(Equipe equipeA) { this.equipeA = equipeA; }

    public Equipe getEquipeB() { return equipeB; }
    public void setEquipeB(Equipe equipeB) { this.equipeB = equipeB; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public int getScoreA() { return scoreA; }
    public void setScoreA(int scoreA) { this.scoreA = scoreA; }

    public int getScoreB() { return scoreB; }
    public void setScoreB(int scoreB) { this.scoreB = scoreB; }

    public boolean isTermine() { return termine; }
    public void setTermine(boolean termine) { this.termine = termine; }
}


