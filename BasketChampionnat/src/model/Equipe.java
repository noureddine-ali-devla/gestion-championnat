package model;

public class Equipe {
    private int id;
    private String nom;
    private String ville;
    private String email;
    private String entraineur;
    private Statistique statistique;

    public Equipe() {}

    // Nouveau constructeur à 4 paramètres
    public Equipe(String nom, String ville, String email, String entraineur) {
        this.nom = nom;
        this.ville = ville;
        this.email = email;
        this.entraineur = entraineur;
        this.statistique = new Statistique(this);
    }

    // Ancien constructeur à 3 paramètres (pour compatibilité)
    public Equipe(String nom, String ville, String email) {
        this(nom, ville, email, "Inconnu");
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getVille() { return ville; }
    public void setVille(String ville) { this.ville = ville; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getEntraineur() { return entraineur; }
    public void setEntraineur(String entraineur) { this.entraineur = entraineur; }

    public Statistique getStatistique() { return statistique; }
    public void setStatistique(Statistique statistique) { this.statistique = statistique; }
}



