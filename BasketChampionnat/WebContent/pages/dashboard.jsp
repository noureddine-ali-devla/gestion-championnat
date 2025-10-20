<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Equipe, model.Joueur, model.Match, java.util.*" %>
<%@ include file="../includes/header.jsp" %>

<%
    List<Equipe> equipes = (List<Equipe>) request.getAttribute("equipes");
    List<Joueur> joueurs = (List<Joueur>) request.getAttribute("joueurs");
    List<Match> matchs = (List<Match>) request.getAttribute("matchs");
    int nbEquipes = (equipes != null) ? equipes.size() : 0;
    int nbJoueurs = (joueurs != null) ? joueurs.size() : 0;
    int nbMatchs = (matchs != null) ? matchs.size() : 0;
%>

<section class="dashboard-container">
    <h2>Tableau de bord du Championnat</h2>

    <div class="dashboard-grid">
        <div class="card">
            <h3>Équipes</h3>
            <p><strong><%= nbEquipes %></strong> enregistrées</p>
            <a href="<%= request.getContextPath() %>/equipes" class="btn-small">Gérer</a>
        </div>

        <div class="card">
            <h3>Joueurs</h3>
            <p><strong><%= nbJoueurs %></strong> inscrits</p>
            <a href="<%= request.getContextPath() %>/joueurs" class="btn-small">Gérer</a>
        </div>

        <div class="card">
            <h3>Matchs</h3>
            <p><strong><%= nbMatchs %></strong> programmés</p>
            <a href="<%= request.getContextPath() %>/matchs" class="btn-small">Gérer</a>
        </div>

        <div class="card">
            <h3>Classement</h3>
            <p>Consulter les performances</p>
            <a href="<%= request.getContextPath() %>/pages/classement.jsp" class="btn-small">Voir</a>
        </div>

        <div class="card">
            <h3>Statistiques</h3>
            <p>Analyse complète du championnat</p>
            <a href="<%= request.getContextPath() %>/pages/statistiques.jsp" class="btn-small">Consulter</a>
        </div>
    </div>
</section>

<%@ include file="../includes/footer.jsp" %>
