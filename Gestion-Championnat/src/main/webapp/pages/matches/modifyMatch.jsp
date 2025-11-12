<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Match,model.Team,java.util.List" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">

<%
    Match match = (Match) request.getAttribute("match");
    List<Team> teams = (List<Team>) request.getAttribute("teams");
%>

<html>
<head><title>Modifier Match</title></head>
<body>
<h2>Modifier un Match</h2>
<form action="${pageContext.request.contextPath}/matches" method="post">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="id" value="<%= match.getId() %>"/>

    <label>Équipe 1:</label>
    <select name="team1Id" required>
        <% for (Team t : teams) { %>
        <option value="<%= t.getId() %>" <%= t.getId().equals(match.getTeam1().getId()) ? "selected" : "" %>>
            <%= t.getName() %>
        </option>
        <% } %>
    </select>

    <label>Équipe 2:</label>
    <select name="team2Id" required>
        <% for (Team t : teams) { %>
        <option value="<%= t.getId() %>" <%= t.getId().equals(match.getTeam2().getId()) ? "selected" : "" %>>
            <%= t.getName() %>
        </option>
        <% } %>
    </select>

    <label>Date et heure:</label>
    <%
        // Format LocalDateTime to match datetime-local input
        String dateStr = match.getMatchDate().toString().replace(" ", "T");
    %>
    <input type="datetime-local" name="matchDate" value="<%= dateStr %>" required/>

    <button type="submit">Mettre à jour</button>
</form>
<a href="${pageContext.request.contextPath}/matches?action=list">Retour</a>
</body>
</html>
