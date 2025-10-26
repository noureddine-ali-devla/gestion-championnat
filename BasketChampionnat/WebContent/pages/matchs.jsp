<%@ page import="java.util.List" %>
<%@ page import="model.Match" %>
<%@ page import="dao.MatchDAO" %>

<%
    // Récupérer la liste des matchs
    MatchDAO matchDAO = new MatchDAO();
    List<Match> matchs = matchDAO.listMatchs();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Matchs</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        .btn { text-decoration: none; padding: 5px 10px; background-color: #4CAF50; color: white; border-radius: 4px; }
    </style>
</head>
<body>
    <h1>Liste des Matchs</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Équipe Domicile</th>
                <th>Équipe Extérieur</th>
                <th>Date</th>
                <th>Score</th>
                <th>Statut</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Match m : matchs) {
            %>
            <tr>
                <td><%= m.getId() %></td>
                <td><%= m.getEquipeDomicile() != null ? m.getEquipeDomicile().getNom() : "-" %></td>
                <td><%= m.getEquipeExterieur() != null ? m.getEquipeExterieur().getNom() : "-" %></td>
                <td><%= m.getDateMatch() != null ? m.getDateMatch() : "-" %></td>
                <td>
                    <%= (m.getScoreDomicile() != null && m.getScoreExterieur() != null)
                        ? m.getScoreDomicile() + " - " + m.getScoreExterieur()
                        : "-" %>
                </td>
                <td><%= m.isTermine() ? "Terminé" : "En attente" %></td>
                <td>
                    <% if (!m.isTermine()) { %>
                        <a class="btn" href="score.jsp?id=<%= m.getId() %>">Enregistrer score</a>
                    <% } else { %>
                        <a class="btn" href="detail.jsp?id=<%= m.getId() %>">Détails</a>
                    <% } %>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>


