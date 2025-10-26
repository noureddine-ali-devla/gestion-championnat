<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.MatchDAO" %>
<%@ page import="model.Match" %>
<%@ page import="model.Equipe" %>
<jsp:include page="header.jsp" />

<%
    MatchDAO matchDAO = new MatchDAO();
    List<Match> matchs = matchDAO.listMatchs();
%>

<h2>Liste des Matchs</h2>
<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Équipe Domicile</th>
        <th>Équipe Extérieur</th>
        <th>Date</th>
        <th>Score</th>
        <th>Statut</th>
        <th>Actions</th>
    </tr>
<%
    for (Match m : matchs) {
%>
    <tr>
        <td><%= m.getId() %></td>
        <td><%= m.getEquipeDomicile() != null ? m.getEquipeDomicile().getNom() : "-" %></td>
        <td><%= m.getEquipeExterieur() != null ? m.getEquipeExterieur().getNom() : "-" %></td>
        <td><%= m.getDateMatch() != null ? m.getDateMatch() : "-" %></td>
        <td><%= (m.getScoreDomicile() != null && m.getScoreExterieur() != null)
                ? m.getScoreDomicile() + " - " + m.getScoreExterieur()
                : "-" %></td>
        <td><%= m.isTermine() ? "Terminé" : "En attente" %></td>
        <td>
            <% if (!m.isTermine()) { %>
                <a class="btn" href="matchs?action=score&id=<%= m.getId() %>">Enregistrer score</a>
            <% } else { %>
                <span>Aucun</span>
            <% } %>
        </td>
    </tr>
<%
    }
%>
</table>
<jsp:include page="footer.jsp" />

