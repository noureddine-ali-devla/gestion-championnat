<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Match" %>
<%@ page import="model.Team" %>
<%@ page import="java.util.List" %>
<%
    List<Match> matches = (List<Match>) request.getAttribute("matches");
    List<Team> teams = (List<Team>) request.getAttribute("teams");
%>
<html>
<head>
    <title>Matchs - Gestion Championnat Basket</title>
</head>
<body>
<h2>Matchs</h2>
<form action="matches" method="post">
    <label>Équipe 1:</label>
    <select name="team1Id">
        <c:forEach var="team" items="${teams}">
            <option value="${team.id}">${team.name}</option>
        </c:forEach>
    </select>
    <label>Équipe 2:</label>
    <select name="team2Id">
        <c:forEach var="team" items="${teams}">
            <option value="${team.id}">${team.name}</option>
        </c:forEach>
    </select>
    <label>Date et heure:</label>
    <input type="datetime-local" name="matchDate" required/>
    <button type="submit">Ajouter match</button>
</form>
<hr/>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Équipe 1</th>
        <th>Équipe 2</th>
        <th>Date</th>
    </tr>
    <c:forEach var="match" items="${matches}">
        <tr>
            <td>${match.id}</td>
            <td>${match.team1.name}</td>
            <td>${match.team2.name}</td>
            <td>${match.matchDate}</td>
        </tr>
    </c:forEach>
</table>
<a href="dashboard.jsp">Retour</a>
</body>
</html>
