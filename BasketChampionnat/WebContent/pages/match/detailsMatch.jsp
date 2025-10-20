<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Match" %>
<%@ include file="../../includes/header.jsp" %>

<%
    Match match = (Match) request.getAttribute("match");
    if (match == null) {
        response.sendRedirect(request.getContextPath() + "/matchs");
        return;
    }
%>

<section class="details-container">
    <h2>Détails du Match</h2>
    <div class="details-card">
        <p><strong>ID :</strong> <%= match.getId() %></p>
        <p><strong>Équipe à domicile :</strong> <%= match.getEquipeDomicile() != null ? match.getEquipeDomicile().getNom() : "N/A" %></p>
        <p><strong>Équipe extérieure :</strong> <%= match.getEquipeExterieure() != null ? match.getEquipeExterieure().getNom() : "N/A" %></p>
        <p><strong>Date :</strong> <%= match.getDateMatch() != null ? match.getDateMatch() : "Non définie" %></p>
        <p><strong>Score :</strong>
            <%= (match.getScoreDomicile() != null && match.getScoreExterieure() != null)
                ? match.getScoreDomicile() + " - " + match.getScoreExterieure()
                : "Non joué" %>
        </p>
    </div>

    <div class="details-actions">
        <a href="<%= request.getContextPath() %>/pages/match/modifierMatch.jsp?id=<%= match.getId() %>" class="btn">Modifier</a>
        <a href="<%= request.getContextPath() %>/match/delete?id=<%= match.getId() %>" class="btn btn-danger">Supprimer</a>
        <a href="<%= request.getContextPath() %>/matchs" class="btn-secondary">Retour à la liste</a>
    </div>
</section>

<%@ include file="../../includes/footer.jsp" %>
