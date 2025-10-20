<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Equipe" %>
<%@ include file="../includes/header.jsp" %>

<section class="content-container">
    <div class="page-header">
        <h2>Classement du Championnat</h2>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>Position</th>
                <th>Équipe</th>
                <th>Matchs joués</th>
                <th>Victoires</th>
                <th>Défaites</th>
                <th>Points</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Equipe> classement = (List<Equipe>) request.getAttribute("classement");
            if (classement != null && !classement.isEmpty()) {
                int position = 1;
                for (Equipe e : classement) {
        %>
            <tr>
                <td><%= position++ %></td>
                <td><%= e.getNom() %></td>
                <td><%= e.getStatistique() != null ? e.getStatistique().getMatchsJoues() : 0 %></td>
                <td><%= e.getStatistique() != null ? e.getStatistique().getVictoires() : 0 %></td>
                <td><%= e.getStatistique() != null ? e.getStatistique().getDefaites() : 0 %></td>
                <td><%= e.getStatistique() != null ? e.getStatistique().getPoints() : 0 %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="6" class="empty-message">Aucune donnée de classement disponible</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</section>

<%@ include file="../includes/footer.jsp" %>

