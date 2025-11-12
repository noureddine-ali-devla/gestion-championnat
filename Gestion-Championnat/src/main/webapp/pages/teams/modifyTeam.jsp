<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Team" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">

<%
    Team team = (Team) request.getAttribute("team");
%>
<html>
<head><title>Modifier Équipe</title></head>
<body>
<h2>Modifier Équipe</h2>
<form action="teams" method="post">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="id" value="<%= team.getId() %>"/>
    <label>Nom:</label>
    <input type="text" name="name" value="<%= team.getName() %>" required/>
    <button type="submit">Mettre à jour</button>
</form>
<a href="teams?action=list">Retour</a>
</body>
</html>
