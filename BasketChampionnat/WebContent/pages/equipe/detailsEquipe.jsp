<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Equipe, java.util.*" %>
<%@ include file="../../includes/header.jsp" %>

<%
    Equipe equipe = (Equipe) request.getAttribute("equipe");
    if (equipe == null) {
        response.sendRedirect(request.getContextPath() + "/equipes");
        return;
    }
%>

<section class="details-container">
    <h2>Détails de l'Équipe</h2>
    <div class="details-card">
        <p><strong>ID :</strong> <%= equipe.getId() %></p>
        <p><strong>Nom :</strong> <%= equipe.getNom() %></p>
        <p><strong>Ville :</strong> <%= equipe.getVille() %></p>
        <p><strong>Entraîneur :</strong> <%= equipe.getEntraineur() %></p>
        <p><strong>Nombre de joueurs :</strong> <%= equipe.getJoueurs() != null ? equipe.getJoueurs().size() : 0 %></p>
    </div>

    <%
        if (equipe.getJoueurs() != null && !equipe.getJoueurs().isEmpty()) {
    %>
    <h3>Joueurs de l'équipe</h3>
    <table class="data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Âge</th>
                <th>Poste</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (var joueur : equipe.getJoueurs()) {
        %>
            <tr>
                <td><%= joueur.getId() %></td>
                <td><%= joueur.getNom() %></td>
                <td><%= joueur.getAge() %></td>
                <td><%= joueur.getPoste() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
        } else {
    %>
        <p class="empty-message">Aucun joueur inscrit dans cette équipe.</p>
    <%
        }
    %>

    <div class="details-actions">
        <a href="<%= request.getContextPath() %>/pages/equipe/modifierEquipe.jsp?id=<%= equipe.getId() %>" class="btn">Modifier</a>
        <a href="<%= request.getContextPath() %>/equipe/delete?id=<%= equipe.getId() %>" class="btn btn-danger">Supprimer</a>
        <a href="<%= request.getContextPath() %>/equipes" class="btn-secondary">Retour à la liste</a>
    </div>
</section>

<%@ include file="../../includes/footer.jsp" %>
