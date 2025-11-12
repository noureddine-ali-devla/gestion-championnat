<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
<html>
<head><title>Liste des joueurs</title></head>
<body>
<h2>Liste des joueurs</h2>
<a href="${pageContext.request.contextPath}/players?action=addForm">Ajouter un joueur</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Position</th>
        <th>Équipe</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="player" items="${players}">
        <tr>
            <td>${player.id}</td>
            <td>${player.name}</td>
            <td>${player.position}</td>
            <td>${player.team.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/players?action=edit&id=${player.id}">Modifier</a>
                <a href="${pageContext.request.contextPath}/players?action=delete&id=${player.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Retour</a>
</body>
</html>
