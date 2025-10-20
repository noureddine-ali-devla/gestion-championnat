<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Match" %>
<%@ include file="../../includes/header.jsp" %>

<section class="content-container">
    <div class="page-header">
        <h2>Liste des Matchs</h2>
        <a href="<%= request.getContextPath() %>/pages/match/ajouterMatch.jsp" class="btn">Programmer un match</a>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Équipe Domicile</th>
                <th>Équipe Extérieure</th>
                <th>Date</th>
                <th>Score</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Match> matchs = (List<Match>) request.getAttribute("matchs");
            if (matchs != null && !matchs.isEmpty()) {
                for (Match m : matchs) {
        %>
            <tr>
                <td><%= m.getId() %></td>
                <td><%= m.getEquipeDomicile() != null ? m.getEquipeDomicile().getNom() : "N/A" %></td>
                <td><%= m.getEquipeExterieure() != null ? m.getEquipeExterieure().getNom() : "N/A" %></td>
                <td><%= m.getDateMatch() != null ? m.getDateMatch() : "Non définie" %></td>
                <td>
                    <%= (m.getScoreDomicile() != null && m.getScoreExterieure() != null)
                        ? m.getScoreDomicile() + " - " + m.getScoreExterieure()
                        : "Non joué" %>
                </td>
                <td>
                    <a href="<%= request.getContextPath() %>/pages/match/modifierMatch.jsp?id=<%= m.getId() %>" class="btn-small">Modifier</a>
                    <a href="<%= request.getContextPath() %>/match/delete?id=<%= m.getId() %>" class="btn-small btn-danger">Supprimer</a>
                    <a href="<%= request.getContextPath() %>/pages/match/detailsMatch.jsp?id=<%= m.getId() %>" class="btn-small btn-info">Détails</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="6" class="empty-message">Aucun match trouvé</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</section>

<%@ include file="../../includes/footer.jsp" %>
