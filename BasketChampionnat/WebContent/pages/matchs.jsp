<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Match" %>
<%@ page import="dao.MatchDAO" %>

<%
    MatchDAO matchDAO = new MatchDAO();
    List<Match> matchs = matchDAO.getAllMatchs(); // correction ici
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Matchs</title>
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <%@ include file="/pages/includes/header.jsp" %>

    <div class="container">
        <h2>Liste des Matchs</h2>

        <table border="1" cellpadding="10" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Équipe Domicile</th>
                    <th>Équipe Extérieure</th>
                    <th>Date</th>
                    <th>Score</th>
                    <th>Terminé</th>
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
                    <td><%= m.getDateMatch() != null ? m.getDateMatch() : "-" %></td>
                    <td>
                        <%= (m.getScoreDomicile() >= 0 && m.getScoreExterieur() >= 0)
                                ? m.getScoreDomicile() + " - " + m.getScoreExterieur()
                                : "-" %>
                    </td>
                    <td><%= m.isTermine() ? "Oui" : "Non" %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6" style="text-align:center;">Aucun match trouvé.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>



