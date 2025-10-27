<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<main>
    <h1>Tableau de bord</h1>
    <p>Bienvenue, ${sessionScope.user.username}</p>
    <div>
        <a href="equipes">Équipes</a> |
        <a href="joueurs">Joueurs</a> |
        <a href="matchs">Matchs</a> |
        <a href="classement">Classement</a> |
        <a href="statistiques">Statistiques</a>
    </div>
</main>
<%@ include file="includes/footer.jsp" %>

