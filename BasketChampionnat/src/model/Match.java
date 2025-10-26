package model;

import java.time.LocalDate;

public class Match {
    private int id;
    private Equipe equipeDomicile;
    private Equipe equipeExterieur;
    private LocalDate dateMatch;
    private Integer scoreDomicile;
    private Integer scoreExterieur;
    private boolean termine;

    public Match() {} // constructeur vide

    public Match(Equipe domicile, Equipe exterieur, LocalDate dateMatch,
                 Integer scoreDomicile, Integer scoreExterieur, boolean termine) {
        this.equipeDomicile = domicile;
        this.equipeExterieur = exterieur;
        this.dateMatch = dateMatch;
        this.scoreDomicile = scoreDomicile;
        this.scoreExterieur = scoreExterieur;
        this.termine = termine;
    }

    // Getters et setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Equipe getEquipeDomicile() { return equipeDomicile; }
    public void setEquipeDomicile(Equipe e) { this.equipeDomicile = e; }

    public Equipe getEquipeExterieur() { return equipeExterieur; }
    public void setEquipeExterieur(Equipe e) { this.equipeExterieur = e; }

    public LocalDate getDateMatch() { return dateMatch; }
    public void setDateMatch(LocalDate date) { this.dateMatch = date; }

    public Integer getScoreDomicile() { return scoreDomicile; }
    public void setScoreDomicile(Integer score) { this.scoreDomicile = score; }

    public Integer getScoreExterieur() { return scoreExterieur; }
    public void setScoreExterieur(Integer score) { this.scoreExterieur = score; }

    public boolean isTermine() { return termine; }
    public void setTermine(boolean termine) { this.termine = termine; }
}



