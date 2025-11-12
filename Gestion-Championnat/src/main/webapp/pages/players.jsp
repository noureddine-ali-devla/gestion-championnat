<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Player" %>
<%@ page import="model.Team" %>
<%@ page import="java.util.List" %>
<%
    List<Player> players = (List<Player>) request.getAttribute("players");
    List<Team> teams = (List<Team>) request.getAttribute("teams");
%>
<html>
<head>
    <title>Joueurs - Gestion Championnat Basket</title>
</head>
<body>
<h2>Joueurs</h2>
<form action="players" method="post">
    <label>Nom du joueur:</label>
    <input type="text" name="name" required/>
    <label>Position:</label>
    <input type="text" name="position" required/>
    <label>Équipe:</label>
    <select name="teamId">
        <c:forEach var="team" items="${teams}">
            <option value="${team.id}">${team.name}</option>
        </c:forEach>
    </select>
    <button type="submit">Ajouter joueur</button>
</form>
<hr/>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Position</th>
        <th>Équipe</th>
    </tr>
    <c:forEach var="player" items="${players}">
        <tr>
            <td>${player.id}</td>
            <td>${player.name}</td>
            <td>${player.position}</td>
            <td>${player.team.name}</td>
        </tr>
    </c:forEach>
</table>
<a href="dashboard.jsp">Retour</a>
</body>
</html>
