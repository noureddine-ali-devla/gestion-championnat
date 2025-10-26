package model;

import java.time.LocalDate;

public class Match {
    private int id;
    private Equipe equipeDomicile;
    private Equipe equipeExterieur;
    private LocalDate dateMatch;
    private int scoreDomicile;
    private int scoreExterieur;
    private boolean termine;

    public Match() {
    }

    public Match(Equipe equipeDomicile, Equipe equipeExterieur, LocalDate dateMatch,
                 int scoreDomicile, int scoreExterieur, boolean termine) {
        this.equipeDomicile = equipeDomicile;
        this.equipeExterieur = equipeExterieur;
        this.dateMatch = dateMatch;
        this.scoreDomicile = scoreDomicile;
        this.scoreExterieur = scoreExterieur;
        this.termine = termine;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Equipe getEquipeDomicile() {
        return equipeDomicile;
    }

    public void setEquipeDomicile(Equipe equipeDomicile) {
        this.equipeDomicile = equipeDomicile;
    }

    public Equipe getEquipeExterieur() {
        return equipeExterieur;
    }

    public void setEquipeExterieur(Equipe equipeExterieur) {
        this.equipeExterieur = equipeExterieur;
    }

    public LocalDate getDateMatch() {
        return dateMatch;
    }

    public void setDateMatch(LocalDate dateMatch) {
        this.dateMatch = dateMatch;
    }

    public int getScoreDomicile() {
        return scoreDomicile;
    }

    public void setScoreDomicile(int scoreDomicile) {
        this.scoreDomicile = scoreDomicile;
    }

    public int getScoreExterieur() {
        return scoreExterieur;
    }

    public void setScoreExterieur(int scoreExterieur) {
        this.scoreExterieur = scoreExterieur;
    }

    public boolean isTermine() {
        return termine;
    }

    public void setTermine(boolean termine) {
        this.termine = termine;
    }
}


