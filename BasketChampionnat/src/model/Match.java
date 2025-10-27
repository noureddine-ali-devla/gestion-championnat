package model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "matchs")
public class Match {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "equipe_domicile_id", nullable = false)
    private Equipe equipeDomicile;

    @ManyToOne
    @JoinColumn(name = "equipe_exterieur_id", nullable = false)
    private Equipe equipeExterieur;

    @Column(nullable = false)
    private LocalDate dateMatch;

    @Column(nullable = false)
    private int scoreDomicile;

    @Column(nullable = false)
    private int scoreExterieur;

    @Column(nullable = false)
    private boolean played;

    public Match() {}

    public Match(Equipe equipeDomicile, Equipe equipeExterieur, LocalDate dateMatch, int scoreDomicile, int scoreExterieur, boolean played) {
        this.equipeDomicile = equipeDomicile;
        this.equipeExterieur = equipeExterieur;
        this.dateMatch = dateMatch;
        this.scoreDomicile = scoreDomicile;
        this.scoreExterieur = scoreExterieur;
        this.played = played;
    }

    public int getId() { return id; }
    public Equipe getEquipeDomicile() { return equipeDomicile; }
    public Equipe getEquipeExterieur() { return equipeExterieur; }
    public LocalDate getDateMatch() { return dateMatch; }
    public int getScoreDomicile() { return scoreDomicile; }
    public int getScoreExterieur() { return scoreExterieur; }
    public boolean isPlayed() { return played; }

    public void setEquipeDomicile(Equipe equipeDomicile) { this.equipeDomicile = equipeDomicile; }
    public void setEquipeExterieur(Equipe equipeExterieur) { this.equipeExterieur = equipeExterieur; }
    public void setDateMatch(LocalDate dateMatch) { this.dateMatch = dateMatch; }
    public void setScoreDomicile(int scoreDomicile) { this.scoreDomicile = scoreDomicile; }
    public void setScoreExterieur(int scoreExterieur) { this.scoreExterieur = scoreExterieur; }
    public void setPlayed(boolean played) { this.played = played; }
}



