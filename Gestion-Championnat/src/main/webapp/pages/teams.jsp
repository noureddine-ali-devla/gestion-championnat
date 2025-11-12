<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Team" %>
<%@ page import="java.util.List" %>
<%
    List<Team> teams = (List<Team>) request.getAttribute("teams");
%>
<html>
<head>
    <title>Équipes - Gestion Championnat Basket</title>
</head>
<body>
<h2>Équipes</h2>
<form action="teams" method="post">
    <label>Nom de l'équipe:</label>
    <input type="text" name="name" required/>
    <button type="submit">Ajouter équipe</button>
</form>
<hr/>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Manager</th>
    </tr>
    <c:forEach var="team" items="${teams}">
        <tr>
            <td>${team.id}</td>
            <td>${team.name}</td>
            <td>${team.manager.username}</td>
        </tr>
    </c:forEach>
</table>
<a href="dashboard.jsp">Retour</a>
</body>
</html>
