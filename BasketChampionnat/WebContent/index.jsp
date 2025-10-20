<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>

<section class="container">
    <h2>Bienvenue dans le système de gestion du Championnat de Basketball</h2>
    <p>
        Cette plateforme permet de gérer l’ensemble des aspects d’un championnat de basketball :
        la création des équipes, l’enregistrement des joueurs, la planification des matchs,
        la saisie des scores et la génération du classement général.
    </p>

    <div style="margin-top: 40px; display: flex; justify-content: center; gap: 25px; flex-wrap: wrap;">
        <a href="equipes" class="btn">Gérer les Équipes</a>
        <a href="joueurs" class="btn">Gérer les Joueurs</a>
        <a href="matchs" class="btn">Gérer les Matchs</a>
        <a href="classement" class="btn">Voir le Classement</a>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>
