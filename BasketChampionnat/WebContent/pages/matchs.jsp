<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<h2>Gestion des Matchs</h2>

<section class="container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Équipe A</th>
                <th>Équipe B</th>
                <th>Date</th>
                <th>Score</th>
                <th>Statut</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                java.util.List<model.Match> matchs = (java.util.List<model.Match>) request.getAttribute("matchs");
                if (matchs != null && !matchs.isEmpty()) {
                    for (model.Match m : matchs) {
            %>
            <tr>
                <td><%= m.getId() %></td>
                <td><%= m.getEquipeA().getNom() %></td>
                <td><%= m.getEquipeB().getNom() %></td>
                <td><%= m.getDate().toString() %></td>
                <td><%= m.isTermine() ? m.getScoreA() + " - " + m.getScoreB() : "-" %></td>
                <td><%= m.isTermine() ? "Terminé" : "En attente" %></td>
                <td>
                    <%
                        if (!m.isTermine()) {
                    %>
                    <a class="btn" href="matchs?action=score&id=<%= m.getId() %>">Enregistrer score</a>
                    <%
                        } else {
                    %>
                    <span>Match terminé</span>
                    <%
                        }
                    %>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7">Aucun match planifié.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <h3>Planifier un Match</h3>
    <form action="matchs" method="post">
        <input type="hidden" name="action" value="ajouter">
        <select name="idEquipeA" required>
            <option value="">-- Équipe A --</option>
            <%
                java.util.List<model.Equipe> equipes = (java.util.List<model.Equipe>) request.getAttribute("equipes");
                if (equipes != null) {
                    for (model.Equipe e : equipes) {
            %>
            <option value="<%= e.getId() %>"><%= e.getNom() %></option>
            <%
                    }
                }
            %>
        </select>

        <select name="idEquipeB" required>
            <option value="">-- Équipe B --</option>
            <%
                if (equipes != null) {
                    for (model.Equipe e : equipes) {
            %>
            <option value="<%= e.getId() %>"><%= e.getNom() %></option>
            <%
                    }
                }
            %>
        </select>

        <input type="date" name="date" required>
        <input type="submit" value="Planifier">
    </form>
</section>

<%@ include file="../includes/footer.jsp" %>
