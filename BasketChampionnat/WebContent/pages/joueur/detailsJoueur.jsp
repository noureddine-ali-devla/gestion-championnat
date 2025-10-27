<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>
<h2>Détails du joueur</h2>
<p>Prénom: ${joueur.prenom}</p>
<p>Nom: ${joueur.nom}</p>
<p>Position: ${joueur.position}</p>
<p>Équipe: ${joueur.equipe.nom}</p>
<a href="pages/joueur/listeJoueurs.jsp">Retour à la liste</a>
<%@ include file="../includes/footer.jsp" %>

