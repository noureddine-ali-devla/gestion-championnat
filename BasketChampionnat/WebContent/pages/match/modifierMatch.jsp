<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Match, model.Equipe, java.util.*" %>
<%@ include file="../../includes/header.jsp" %>

<%
    Match match = (Match) request.getAttribute("match");
    List<Equipe> equipes = (List<Equipe>) request.getAttribute("equipes");
    if (match == null) {
        response.sendRedirect(request.getContextPath() + "/matchs");
        return;
    }
%>

<section class="form-container">
    <h2>Modifier un Match</h2>
    <form action="<%= request.getContextPath() %>/match/update" method="post">
        <input type="hidden" name="id" value="<%= match.getId() %>">

        <div class="form-group">
            <label>Équipe à domicile</label>
            <select name="equipeDomicileId" required>
                <%
                    if (equipes != null) {
                        for (Equipe e : equipes) {
                %>
                    <option value="<%= e.getId() %>" <%= match.getEquipeDomicile() != null && match.getEquipeDomicile().getId() == e.getId() ? "selected" : "" %>>
                        <%= e.getNom() %>
                    </option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label>Équipe extérieure</label>
            <select name="equipeExterieureId" required>
                <%
                    if (equipes != null) {
                        for (Equipe e : equipes) {
                %>
                    <option value="<%= e.getId() %>" <%= match.getEquipeExterieure() != null && match.getEquipeExterieure().getId() == e.getId() ? "selected" : "" %>>
                        <%= e.getNom() %>
                    </option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label>Date du match</label>
            <input type="date" name="dateMatch" value="<%= match.getDateMatch() != null ? match.getDateMatch() : "" %>" required>
        </div>

        <div class="form-group">
            <label>Score domicile</label>
            <input type="number" name="scoreDomicile" value="<%= match.getScoreDomicile() != null ? match.getScoreDomicile() : "" %>" min="0">
        </div>

        <div class="form-group">
            <label>Score extérieure</label>
            <input type="number" name="scoreExterieure" value="<%= match.getScoreExterieure() != null ? match.getScoreExterieure() : "" %>" min="0">
        </div>

        <button type="submit" class="btn">Mettre à jour</button>
        <a href="<%= request.getContextPath() %>/matchs" class="btn-secondary">Annuler</a>
    </form>

    <%
        String error = (String) request.getAttribute("error");
        String success = (String) request.getAttribute("success");
        if (error != null) {
    %>
        <div class="alert alert-error"><%= error %></div>
    <%
        } else if (success != null) {
    %>
        <div class="alert alert-success"><%= success %></div>
    <%
        }
    %>
</section>

<%@ include file="../../includes/footer.jsp" %>
