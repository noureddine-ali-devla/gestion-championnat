<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>
<h2>Ajouter une équipe</h2>
<form action="EquipeServlet" method="post">
    <label>Nom:</label>
    <input type="text" name="nom" required>
    <label>Ville:</label>
    <input type="text" name="ville" required>
    <label>Entraîneur:</label>
    <input type="text" name="entraineur" required>
    <button type="submit">Ajouter</button>
</form>
<%@ include file="../includes/footer.jsp" %>

