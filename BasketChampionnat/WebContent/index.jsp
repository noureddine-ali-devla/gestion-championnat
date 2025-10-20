<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>

<section class="hero">
    <div class="hero-content">
        <h1>Championnat de Basketball</h1>
        <p>Gérez efficacement vos équipes, joueurs, matchs et classements dans une interface fluide et moderne.</p>
        <a href="dashboard.jsp" class="btn hero-btn">Accéder au tableau de bord</a>
    </div>
</section>

<section class="container">
    <h2>Fonctionnalités principales</h2>
    <div class="grid-features">
        <div class="card">
            <h3>Gestion des Équipes</h3>
            <p>Ajoutez, modifiez ou supprimez des équipes, visualisez leurs détails et leurs performances.</p>
            <a href="equipes" class="btn">Gérer les Équipes</a>
        </div>
        <div class="card">
            <h3>Gestion des Joueurs</h3>
            <p>Administrez les joueurs, leurs informations personnelles et leur appartenance aux équipes.</p>
            <a href="joueurs" class="btn">Gérer les Joueurs</a>
        </div>
        <div class="card">
            <h3>Planification des Matchs</h3>
            <p>Organisez les rencontres, saisissez les scores et suivez l’évolution des résultats.</p>
            <a href="matchs" class="btn">Gérer les Matchs</a>
        </div>
        <div class="card">
            <h3>Classement et Statistiques</h3>
            <p>Consultez le classement actualisé, les statistiques par équipe et les performances globales.</p>
            <a href="classement" class="btn">Voir le Classement</a>
        </div>
    </div>
</section>

<section class="cta-section">
    <h2>Prêt à commencer ?</h2>
    <p>Connectez-vous pour accéder à toutes les fonctionnalités de gestion du championnat.</p>
    <a href="register.jsp" class="btn">Créer un compte</a>
</section>

<%@ include file="includes/footer.jsp" %>

