<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
<html>
<head><title>Modifier joueur</title></head>
<body>
<h2>Modifier le joueur</h2>
<form action="${pageContext.request.contextPath}/players" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${player.id}">
    <label>Nom:</label><input type="text" name="name" value="${player.name}" required><br>
    <label>Position:</label><input type="text" name="position" value="${player.position}" required><br>
    <label>Équipe:</label>
    <select name="teamId">
        <c:forEach var="team" items="${teams}">
            <option value="${team.id}" <c:if test="${team.id == player.team.id}">selected</c:if>>${team.name}</option>
        </c:forEach>
    </select><br>
    <button type="submit">Mettre à jour</button>
</form>
<a href="${pageContext.request.contextPath}/players">Retour</a>
</body>
</html>
