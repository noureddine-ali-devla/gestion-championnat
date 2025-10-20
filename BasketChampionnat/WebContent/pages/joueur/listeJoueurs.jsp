<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Joueur" %>
<%@ include file="../../includes/header.jsp" %>

<section class="content-container">
    <div class="page-header">
        <h2>Liste des Joueurs</h2>
        <a href="<%= request.getContextPath() %>/pages/joueur/ajouterJoueur.jsp" class="btn">Ajouter un joueur</a>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Âge</th>
                <th>Poste</th>
                <th>Équipe</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Joueur> joueurs = (List<Joueur>) request.getAttribute("joueurs");
            if (joueurs != null && !joueurs.isEmpty()) {
                for (Joueur j : joueurs) {
        %>
            <tr>
                <td><%= j.getId() %></td>
                <td><%= j.getNom() %></td>
                <td><%= j.getAge() %></td>
                <td><%= j.getPoste() %></td>
                <td><%= j.getEquipe() != null ? j.getEquipe().getNom() : "Aucune" %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/pages/joueur/modifierJoueur.jsp?id=<%= j.getId() %>" class="btn-small">Modifier</a>
                    <a href="<%= request.getContextPath() %>/joueur/delete?id=<%= j.getId() %>" class="btn-small btn-danger">Supprimer</a>
                    <a href="<%= request.getContextPath() %>/pages/joueur/detailsJoueur.jsp?id=<%= j.getId() %>" class="btn-small btn-info">Détails</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="6" class="empty-message">Aucun joueur trouvé</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</section>

<%@ include file="../../includes/footer.jsp" %>
