<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<h2>Gestion des Équipes</h2>

<section class="container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Ville</th>
                <th>Entraîneur</th>
                <th>Points</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                java.util.List<model.Equipe> equipes = (java.util.List<model.Equipe>) request.getAttribute("equipes");
                if (equipes != null && !equipes.isEmpty()) {
                    for (model.Equipe e : equipes) {
            %>
            <tr>
                <td><%= e.getId() %></td>
                <td><%= e.getNom() %></td>
                <td><%= e.getVille() %></td>
                <td><%= e.getEntraineur() %></td>
                <td><%= e.getPoints() %></td>
                <td>
                    <a class="btn" href="equipes?action=details&id=<%= e.getId() %>">Détails</a>
                    <a class="btn" href="equipes?action=supprimer&id=<%= e.getId() %>">Supprimer</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">Aucune équipe enregistrée.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <h3>Ajouter une Équipe</h3>
    <form action="equipes" method="post">
        <input type="text" name="nom" placeholder="Nom de l'équipe" required>
        <input type="text" name="ville" placeholder="Ville" required>
        <input type="text" name="entraineur" placeholder="Entraîneur" required>
        <input type="submit" value="Ajouter">
    </form>
</section>

<%@ include file="../includes/footer.jsp" %>
