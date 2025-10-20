package model;

import jakarta.persistence.*;

@Entity
@Table(name = "statistiques")
public class Statistique {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    @JoinColumn(name = "equipe_id", nullable = false, unique = true)
    private Equipe equipe;

    @Column(nullable = false)
    private int matchsJoues;

    @Column(nullable = false)
    private int victoires;

    @Column(nullable = false)
    private int defaites;

    @Column(nullable = false)
    private int butsMarques;

    @Column(nullable = false)
    private int butsEncaisses;

    public Statistique() {}

    public Statistique(Equipe equipe) {
        this.equipe = equipe;
        this.matchsJoues = 0;
        this.victoires = 0;
        this.defaites = 0;
        this.butsMarques = 0;
        this.butsEncaisses = 0;
    }

    public int getId() {
        return id;
    }

    public Equipe getEquipe() {
        return equipe;
    }

    public void setEquipe(Equipe equipe) {
        this.equipe = equipe;
    }

    public int getMatchsJoues() {
        return matchsJoues;
    }

    public void setMatchsJoues(int matchsJoues) {
        this.matchsJoues = matchsJoues;
    }

    public int getVictoires() {
        return victoires;
    }

    public void setVictoires(int victoires) {
        this.victoires = victoires;
    }

    public int getDefaites() {
        return defaites;
    }

    public void setDefaites(int defaites) {
        this.defaites = defaites;
    }

    public int getButsMarques() {
        return butsMarques;
    }

    public void setButsMarques(int butsMarques) {
        this.butsMarques = butsMarques;
    }

    public int getButsEncaisses() {
        return butsEncaisses;
    }

    public void setButsEncaisses(int butsEncaisses) {
        this.butsEncaisses = butsEncaisses;
    }

    public int getDifferenceButs() {
        return butsMarques - butsEncaisses;
    }

    public int getPoints() {
        return victoires * 3;
    }
}
