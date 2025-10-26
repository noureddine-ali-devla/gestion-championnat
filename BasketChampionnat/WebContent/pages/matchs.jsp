<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Match" %>
<%@ page import="dao.MatchDAO" %>

<%
    // Vérifie la session utilisateur
    String username = (String) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    MatchDAO matchDAO = new MatchDAO();
    List<Match> matchs = matchDAO.getAllMatchs();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Matchs</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
</head>
<body>
<jsp:include page="/includes/header.jsp" />

<div class="container">
    <h2>Liste des Matchs</h2>

    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Équipe Domicile</th>
            <th>Équipe Extérieure</th>
            <th>Date</th>
            <th>Score</th>
            <th>Statut</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (matchs != null && !matchs.isEmpty()) {
                for (Match m : matchs) {
        %>
        <tr>
            <td><%= m.getId() %></td>
            <td><%= m.getEquipeDomicile() != null ? m.getEquipeDomicile().getNom() : "-" %></td>
            <td><%= m.getEquipeExterieur() != null ? m.getEquipeExterieur().getNom() : "-" %></td>
            <td><%= m.getDateMatch() != null ? m.getDateMatch().toString() : "-" %></td>
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
            } else {
        %>
        <tr>
            <td colspan="7" style="text-align:center;">Aucun match enregistré.</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <a class="btn" href="ajouterMatch.jsp">Ajouter un match</a>
</div>

</body>
</html>
