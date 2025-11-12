<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Match,model.Team,java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">

<%
    List<Match> matches = (List<Match>) request.getAttribute("matches");
%>
<html>
<head><title>Liste des Matchs</title></head>
<body>
<h2>Liste des Matchs</h2>
<a href="${pageContext.request.contextPath}/matches?action=new">Ajouter un match</a>
<hr>
<table border="1">
    <tr><th>ID</th><th>Équipe 1</th><th>Équipe 2</th><th>Date</th><th>Actions</th></tr>
    <%
        if (matches != null) {
            for (Match m : matches) {
    %>
    <tr>
        <td><%= m.getId() %></td>
        <td><%= m.getTeam1().getName() %></td>
        <td><%= m.getTeam2().getName() %></td>
        <td><%= m.getMatchDate() %></td>
        <td>
            <a href="${pageContext.request.contextPath}/matches?action=edit&id=<%= m.getId() %>">Modifier</a> |
            <a href="${pageContext.request.contextPath}/matches?action=delete&id=<%= m.getId() %>" onclick="return confirm('Supprimer ce match ?')">Supprimer</a>
        </td>
    </tr>
    <% } } %>
</table>
<a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Retour</a>
</body>
</html>
