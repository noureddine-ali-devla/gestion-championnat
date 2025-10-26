<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Joueur" %>
<%@ page import="dao.UserDAO" %>
<%
    HttpSession session = request.getSession();
    String username = (String) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    // Récupérer la liste des joueurs via Hibernate ou DAO si nécessaire
    List<Joueur> joueurs = (List<Joueur>) request.getAttribute("joueurs");
%>
<html>
<head>
    <title>Gestion des Joueurs - BasketChampionnat</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style.css">
</head>
<body>
<header>
    <h1>Gestion des Joueurs</h1>
    <p>Bienvenue, <%= username %></p>
    <a href="<%= request.getContextPath() %>/dashboard.jsp">Retour au Dashboard</a>
    <a href="<%= request.getContextPath() %>/logout">Déconnexion</a>
</header>

<main>
    <h2>Liste des Joueurs</h2>
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Équipe</th>
            <th>Actions</th>
        </tr>
        <%
            if (joueurs != null) {
                for (Joueur j : joueurs) {
        %>
        <tr>
            <td><%= j.getId() %></td>
            <td><%= j.getNom() %></td>
            <td><%= j.getPrenom() %></td>
            <td><%= j.getEquipe().getNom() %></td>
            <td>
                <a href="joueurs?action=edit&id=<%= j.getId() %>">Modifier</a>
                <a href="joueurs?action=delete&id=<%= j.getId() %>">Supprimer</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5">Aucun joueur disponible</td>
        </tr>
        <%
            }
        %>
    </table>
</main>
</body>
</html>

