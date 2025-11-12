<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Team" %>
<%@ page import="java.util.List" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">

<%
    List<Team> teams = (List<Team>) request.getAttribute("teams");
%>
<html>
<head><title>Liste des Équipes</title></head>
<body>
<h2>Liste des Équipes</h2>
<a href="${pageContext.request.contextPath}/teams?action=new">Ajouter une équipe</a>
<hr>
<table border="1">
    <tr><th>ID</th><th>Nom</th><th>Manager</th><th>Actions</th></tr>
    <%
        if (teams != null) {
            for (Team t : teams) {
    %>
    <tr>
        <td><%= t.getId() %></td>
        <td><%= t.getName() %></td>
        <td><%= t.getManager() != null ? t.getManager().getUsername() : "-" %></td>
        <td>
            <a href="${pageContext.request.contextPath}/teams?action=edit&id=<%= t.getId() %>">Modifier</a> |
            <a href="${pageContext.request.contextPath}/teams?action=delete&id=<%= t.getId() %>" onclick="return confirm('Supprimer cette équipe ?')">Supprimer</a>
        </td>
    </tr>
    <% } } %>
</table>
<a href="${pageContext.request.contextPath}/pages/dashboard.jsp">Retour</a>
</body>
</html>
