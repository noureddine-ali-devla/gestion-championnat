package model;

public class Equipe {
    private int id;
    private String nom;
    private String ville;
    private String email;

    public Equipe() {}

    public Equipe(String nom, String ville, String email) {
        this.nom = nom;
        this.ville = ville;
        this.email = email;
    }

    // Getters et Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getVille() { return ville; }
    public void setVille(String ville) { this.ville = ville; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}


