<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Team,java.util.List" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">

<%
    List<Team> teams = (List<Team>) request.getAttribute("teams");
%>

<html>
<head><title>Ajouter Match</title></head>
<body>
<h2>Ajouter un Match</h2>
<form action="${pageContext.request.contextPath}/matches" method="post">
    <input type="hidden" name="action" value="create"/>

    <label>Équipe 1:</label>
    <select name="team1Id" required>
        <% for (Team t : teams) { %>
        <option value="<%= t.getId() %>"><%= t.getName() %></option>
        <% } %>
    </select>

    <label>Équipe 2:</label>
    <select name="team2Id" required>
        <% for (Team t : teams) { %>
        <option value="<%= t.getId() %>"><%= t.getName() %></option>
        <% } %>
    </select>

    <label>Date et heure:</label>
    <input type="datetime-local" name="matchDate" required/>

    <button type="submit">Ajouter</button>
</form>
<a href="${pageContext.request.contextPath}/matches?action=list">Retour</a>
</body>
</html>

