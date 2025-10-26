<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Joueur" %>
<%@ page import="dao.JoueurDAO" %>
<%@ include file="../header.jsp" %>

<html>
<head>
    <title>Gestion des Joueurs</title>
</head>
<body>
    <h1>Liste des Joueurs</h1>
    <a href="ajouterJoueur.jsp" class="btn">Ajouter un joueur</a>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Équipe</th>
                <th>Poste</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                JoueurDAO joueurDAO = new JoueurDAO();
                List<Joueur> joueurs = joueurDAO.listJoueurs();
                for (Joueur j : joueurs) {
            %>
            <tr>
                <td><%= j.getId() %></td>
                <td><a href="detailsJoueur.jsp?id=<%= j.getId() %>"><%= j.getNom() %></a></td>
                <td><%= j.getPrenom() %></td>
                <td><%= j.getEquipe() != null ? j.getEquipe().getNom() : "-" %></td>
                <td><%= j.getPoste() %></td>
                <td>
                    <a href="modifierJoueur.jsp?id=<%= j.getId() %>">Modifier</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>



