<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>

<section class="hero">
    <div class="hero-content">
        <h1>Championnat de Basketball</h1>
        <p>Gérez efficacement vos équipes, joueurs, matchs et classements dans une interface fluide et moderne.</p>
        <a href="pages/dashboard.jsp" class="btn hero-btn">Accéder au tableau de bord</a>
    </div>
</section>

<section class="container">
    <h2>Fonctionnalités principales</h2>
    <div class="grid-features">
        <div class="card">
            <h3>Gestion des Équipes</h3>
            <a href="pages/equipes.jsp" class="btn">Gérer les Équipes</a>
        </div>
        <div class="card">
            <h3>Gestion des Joueurs</h3>
            <a href="pages/joueurs.jsp" class="btn">Gérer les Joueurs</a>
        </div>
        <div class="card">
            <h3>Planification des Matchs</h3>
            <a href="pages/matchs.jsp" class="btn">Gérer les Matchs</a>
        </div>
        <div class="card">
            <h3>Classement et Statistiques</h3>
            <a href="pages/classement.jsp" class="btn">Voir le Classement</a>
        </div>
    </div>
</section>

<section class="cta-section">
    <h2>Prêt à commencer ?</h2>
    <a href="pages/register.jsp" class="btn">Créer un compte</a>
</section>

<%@ include file="includes/footer.jsp" %>




