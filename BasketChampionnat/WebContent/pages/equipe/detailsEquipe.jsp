<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>
<h2>Détails de l'équipe</h2>
<p>Nom: ${equipe.nom}</p>
<p>Ville: ${equipe.ville}</p>
<p>Entraîneur: ${equipe.entraineur}</p>
<a href="pages/equipe/listeEquipes.jsp">Retour à la liste</a>
<%@ include file="../includes/footer.jsp" %>

