<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Equipe" %>
<%@ include file="../../includes/header.jsp" %>

<section class="content-container">
    <div class="page-header">
        <h2>Liste des Équipes</h2>
        <a href="<%= request.getContextPath() %>/pages/equipe/ajouterEquipe.jsp" class="btn">Ajouter une équipe</a>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Ville</th>
                <th>Entraîneur</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Equipe> equipes = (List<Equipe>) request.getAttribute("equipes");
            if (equipes != null && !equipes.isEmpty()) {
                for (Equipe e : equipes) {
        %>
            <tr>
                <td><%= e.getId() %></td>
                <td><%= e.getNom() %></td>
                <td><%= e.getVille() %></td>
                <td><%= e.getEntraineur() %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/pages/equipe/modifierEquipe.jsp?id=<%= e.getId() %>" class="btn-small">Modifier</a>
                    <a href="<%= request.getContextPath() %>/equipe/delete?id=<%= e.getId() %>" class="btn-small btn-danger">Supprimer</a>
                    <a href="<%= request.getContextPath() %>/pages/equipe/detailsEquipe.jsp?id=<%= e.getId() %>" class="btn-small btn-info">Détails</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" class="empty-message">Aucune équipe trouvée</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</section>

<%@ include file="../../includes/footer.jsp" %>
