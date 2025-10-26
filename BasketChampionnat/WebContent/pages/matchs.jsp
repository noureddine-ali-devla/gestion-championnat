<%@ page import="java.util.List" %>
<%@ page import="model.Match" %>
<%@ page import="dao.MatchDAO" %>

<%
    MatchDAO matchDAO = new MatchDAO();
    List<Match> matchs = matchDAO.listMatchs();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Liste des matchs</title>
</head>
<body>
    <h1>Liste des matchs</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Équipe Domicile</th>
            <th>Équipe Extérieur</th>
            <th>Date</th>
            <th>Score</th>
            <th>Statut</th>
        </tr>
        <%
            for(Match m : matchs) {
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
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>


