<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<h2>Ajouter un joueur</h2>
<form action="JoueurServlet" method="post">
    <label>Prénom:</label>
    <input type="text" name="prenom" required>
    <label>Nom:</label>
    <input type="text" name="nom" required>
    <label>Position:</label>
    <input type="text" name="position" required>
    <label>Équipe:</label>
    <select name="equipeId" required>
        <c:forEach var="e" items="${equipes}">
            <option value="${e.id}">${e.nom}</option>
        </c:forEach>
    </select>
    <button type="submit">Ajouter</button>
</form>
<%@ include file="../includes/footer.jsp" %>

