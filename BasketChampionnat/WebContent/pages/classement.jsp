<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<h2>Classement du Championnat</h2>

<section class="container">
    <table>
        <thead>
            <tr>
                <th>Position</th>
                <th>Équipe</th>
                <th>Matchs joués</th>
                <th>Victoires</th>
                <th>Défaites</th>
                <th>Buts marqués</th>
                <th>Buts encaissés</th>
                <th>Différence</th>
                <th>Points</th>
            </tr>
        </thead>
        <tbody>
            <%
                java.util.List<model.Statistique> classement = (java.util.List<model.Statistique>) request.getAttribute("classement");
                if (classement != null && !classement.isEmpty()) {
                    int pos = 1;
                    for (model.Statistique s : classement) {
            %>
            <tr>
                <td><%= pos++ %></td>
                <td><%= s.getEquipe().getNom() %></td>
                <td><%= s.getMatchsJoues() %></td>
                <td><%= s.getVictoires() %></td>
                <td><%= s.getDefaites() %></td>
                <td><%= s.getButsMarques() %></td>
                <td><%= s.getButsEncaisses() %></td>
                <td><%= s.getDifferenceButs() %></td>
                <td><%= s.getPoints() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="9">Aucun classement disponible.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</section>

<%@ include file="../includes/footer.jsp" %>
