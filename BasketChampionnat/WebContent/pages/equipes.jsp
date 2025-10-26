<%@ page import="java.util.List" %>
<%@ page import="model.Equipe" %>
<%@ page import="dao.EquipeDAO" %>

<%
    EquipeDAO equipeDAO = new EquipeDAO();
    List<Equipe> equipes = equipeDAO.listEquipes();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Équipes</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        .btn { text-decoration: none; padding: 5px 10px; background-color: #4CAF50; color: white; border-radius: 4px; }
    </style>
</head>
<body>
    <h1>Liste des Équipes</h1>
    <table>
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
                for (Equipe e : equipes) {
            %>
            <tr>
                <td><%= e.getId() %></td>
                <td><%= e.getNom() %></td>
                <td><%= e.getVille() %></td>
                <td><%= e.getEmail() %></td>
                <td>
                    <a class="btn" href="edit.jsp?id=<%= e.getId() %>">Modifier</a>
                    <a class="btn" href="delete.jsp?id=<%= e.getId() %>">Supprimer</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <br/>
    <a class="btn" href="add.jsp">Ajouter une nouvelle équipe</a>
</body>
</html>


