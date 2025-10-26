<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Equipe" %>
<%@ page import="dao.EquipeDAO" %>
<%@ include file="../header.jsp" %>

<html>
<head>
    <title>Gestion des Équipes</title>
</head>
<body>
    <h1>Liste des Équipes</h1>
    <a href="ajouterEquipe.jsp" class="btn">Ajouter une équipe</a>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Ville</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                EquipeDAO equipeDAO = new EquipeDAO();
                List<Equipe> equipes = equipeDAO.listEquipes();
                for (Equipe e : equipes) {
            %>
            <tr>
                <td><%= e.getId() %></td>
                <td><a href="detailsEquipe.jsp?id=<%= e.getId() %>"><%= e.getNom() %></a></td>
                <td><%= e.getVille() %></td>
                <td><%= e.getEmail() %></td>
                <td>
                    <a href="modifierEquipe.jsp?id=<%= e.getId() %>">Modifier</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>


