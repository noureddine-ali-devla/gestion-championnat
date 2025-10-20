<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<h2>Gestion des Joueurs</h2>

<section class="container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Position</th>
                <th>Numéro</th>
                <th>Équipe</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                java.util.List<model.Joueur> joueurs = (java.util.List<model.Joueur>) request.getAttribute("joueurs");
                if (joueurs != null && !joueurs.isEmpty()) {
                    for (model.Joueur j : joueurs) {
            %>
            <tr>
                <td><%= j.getId() %></td>
                <td><%= j.getNom() %></td>
                <td><%= j.getPrenom() %></td>
                <td><%= j.getPosition() %></td>
                <td><%= j.getNumero() %></td>
                <td><%= j.getEquipe() != null ? j.getEquipe().getNom() : "-" %></td>
                <td>
                    <a class="btn" href="joueurs?action=details&id=<%= j.getId() %>">Détails</a>
                    <a class="btn" href="joueurs?action=supprimer&id=<%= j.getId() %>">Supprimer</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7">Aucun joueur enregistré.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <h3>Ajouter un Joueur</h3>
    <form action="joueurs" method="post">
        <input type="text" name="nom" placeholder="Nom" required>
        <input type="text" name="prenom" placeholder="Prénom" required>
        <input type="text" name="position" placeholder="Position" required>
        <input type="number" name="numero" placeholder="Numéro" required>
        <select name="idEquipe" required>
            <option value="">-- Sélectionner une équipe --</option>
            <%
                java.util.List<model.Equipe> equipes = (java.util.List<model.Equipe>) request.getAttribute("equipes");
                if (equipes != null) {
                    for (model.Equipe e : equipes) {
            %>
            <option value="<%= e.getId() %>"><%= e.getNom() %></option>
            <%
                    }
                }
            %>
        </select>
        <input type="submit" value="Ajouter">
    </form>
</section>

<%@ include file="../includes/footer.jsp" %>
