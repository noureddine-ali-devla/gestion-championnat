<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>
<h2>Modifier l'équipe</h2>
<form action="EquipeServlet" method="post">
    <input type="hidden" name="id" value="${equipe.id}">
    <label>Nom:</label>
    <input type="text" name="nom" value="${equipe.nom}" required>
    <label>Ville:</label>
    <input type="text" name="ville" value="${equipe.ville}" required>
    <label>Entraîneur:</label>
    <input type="text" name="entraineur" value="${equipe.entraineur}" required>
    <button type="submit">Modifier</button>
</form>
<%@ include file="../includes/footer.jsp" %>

