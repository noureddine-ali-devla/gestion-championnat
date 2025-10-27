<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<h2>Modifier le joueur</h2>
<form action="JoueurServlet" method="post">
    <input type="hidden" name="id" value="${joueur.id}">
    <label>Prénom:</label>
    <input type="text" name="prenom" value="${joueur.prenom}" required>
    <label>Nom:</label>
    <input type="text" name="nom" value="${joueur.nom}" required>
    <label>Position:</label>
    <input type="text" name="position" value="${joueur.position}" required>
    <label>Équipe:</label>
    <select name="equipeId" required>
        <c:forEach var="e" items="${equipes}">
            <option value="${e.id}" ${e.id == joueur.equipe.id ? 'selected' : ''}>${e.nom}</option>
        </c:forEach>
    </select>
    <button type="submit">Modifier</button>
</form>
<%@ include file="../includes/footer.jsp" %>

