<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Joueur" %>
<%@ include file="../../includes/header.jsp" %>

<%
    Joueur joueur = (Joueur) request.getAttribute("joueur");
    if (joueur == null) {
        response.sendRedirect(request.getContextPath() + "/joueurs");
        return;
    }
%>

<section class="details-container">
    <h2>Détails du Joueur</h2>
    <div class="details-card">
        <p><strong>ID :</strong> <%= joueur.getId() %></p>
        <p><strong>Nom :</strong> <%= joueur.getNom() %></p>
        <p><strong>Âge :</strong> <%= joueur.getAge() %></p>
        <p><strong>Poste :</strong> <%= joueur.getPoste() %></p>
        <p><strong>Équipe :</strong> <%= joueur.getEquipe() != null ? joueur.getEquipe().getNom() : "Aucune" %></p>
    </div>

    <div class="details-actions">
        <a href="<%= request.getContextPath() %>/pages/joueur/modifierJoueur.jsp?id=<%= joueur.getId() %>" class="btn">Modifier</a>
        <a href="<%= request.getContextPath() %>/joueur/delete?id=<%= joueur.getId() %>" class="btn btn-danger">Supprimer</a>
        <a href="<%= request.getContextPath() %>/joueurs" class="btn-secondary">Retour à la liste</a>
    </div>
</section>

<%@ include file="../../includes/footer.jsp" %>
