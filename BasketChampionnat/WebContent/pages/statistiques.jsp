<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Equipe, model.Statistique" %>
<%@ include file="../includes/header.jsp" %>

<section class="content-container">
    <div class="page-header">
        <h2>Statistiques du Championnat</h2>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>Équipe</th>
                <th>Matchs joués</th>
                <th>Victoires</th>
                <th>Défaites</th>
                <th>Buts marqués</th>
                <th>Buts encaissés</th>
                <th>Différence</th>
                <th>Points</th>
                <th>Ratio de victoire (%)</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Statistique> stats = (List<Statistique>) request.getAttribute("statistiques");
            if (stats != null && !stats.isEmpty()) {
                for (Statistique s : stats) {
                    double ratio = s.getMatchsJoues() > 0
                        ? ((double) s.getVictoires() / s.getMatchsJoues()) * 100
                        : 0;
        %>
            <tr>
                <td><%= s.getEquipe() != null ? s.getEquipe().getNom() : "N/A" %></td>
                <td><%= s.getMatchsJoues() %></td>
                <td><%= s.getVictoires() %></td>
                <td><%= s.getDefaites() %></td>
                <td><%= s.getButsMarques() %></td>
                <td><%= s.getButsEncaisses() %></td>
                <td><%= s.getDifferenceButs() %></td>
                <td><%= s.getPoints() %></td>
                <td><%= String.format("%.1f", ratio) %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="9" class="empty-message">Aucune donnée statistique disponible</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</section>

<%@ include file="../includes/footer.jsp" %>
