package model;

import java.time.LocalDate;

public class Match {
    private int id;
    private Equipe equipeDomicile;
    private Equipe equipeExterieur;
    private LocalDate date;
    private int scoreDomicile;
    private int scoreExterieur;
    private boolean joue;

    public Match() {}

    public Match(Equipe equipeDomicile, Equipe equipeExterieur, LocalDate date, int scoreDomicile, int scoreExterieur, boolean joue) {
        this.equipeDomicile = equipeDomicile;
        this.equipeExterieur = equipeExterieur;
        this.date = date;
        this.scoreDomicile = scoreDomicile;
        this.scoreExterieur = scoreExterieur;
        this.joue = joue;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Equipe getEquipeDomicile() { return equipeDomicile; }
    public void setEquipeDomicile(Equipe equipeDomicile) { this.equipeDomicile = equipeDomicile; }

    public Equipe getEquipeExterieur() { return equipeExterieur; }
    public void setEquipeExterieur(Equipe equipeExterieur) { this.equipeExterieur = equipeExterieur; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public int getScoreDomicile() { return scoreDomicile; }
    public void setScoreDomicile(int scoreDomicile) { this.scoreDomicile = scoreDomicile; }

    public int getScoreExterieur() { return scoreExterieur; }
    public void setScoreExterieur(int scoreExterieur) { this.scoreExterieur = scoreExterieur; }

    public boolean isJoue() { return joue; }
    public void setJoue(boolean joue) { this.joue = joue; }
}

