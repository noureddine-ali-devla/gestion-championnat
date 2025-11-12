<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
<html>
<head><title>Ajouter joueur</title></head>
<body>
<h2>Ajouter un joueur</h2>
<form action="${pageContext.request.contextPath}/players" method="post">
    <input type="hidden" name="action" value="add">
    <label>Nom:</label><input type="text" name="name" required><br>
    <label>Position:</label><input type="text" name="position" required><br>
    <label>Équipe:</label>
    <select name="teamId">
        <c:forEach var="team" items="${teams}">
            <option value="${team.id}">${team.name}</option>
        </c:forEach>
    </select><br>
    <button type="submit">Ajouter</button> <br>


</form>
<a href="${pageContext.request.contextPath}/players">Retour</a>
</body>
</html>

