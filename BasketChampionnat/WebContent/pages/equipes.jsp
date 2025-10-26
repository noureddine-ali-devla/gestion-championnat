<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page import="model.Equipe" %>
<html>
<head>
    <title>Équipes</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/style.css">
</head>
<body>
<%@ include file="/includes/header.jsp" %>

<h2>Liste des équipes</h2>

<%
    // Hardcoded list of teams
    List<Equipe> equipes = new ArrayList<>();
    Equipe e1 = new Equipe("Tigers", "Paris", "tigers@example.com");
    Equipe e2 = new Equipe("Lions", "Lyon", "lions@example.com");
    
    // Hardcoded coach and points
    e1.setEmail("tigers@example.com"); // conservé
    e2.setEmail("lions@example.com");

    // Transient fields for JSP display
    // On peut ajouter méthodes getEntraineur et getPoints directement si tu veux
    equipes.add(e1);
    equipes.add(e2);
%>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Ville</th>
        <th>Entraîneur</th>
        <th>Points</th>
        <th>Actions</th>
    </tr>
<%
    for (Equipe e : equipes) {
        String entraineur = "Coach Hardcoded";
        int points = 0;
%>
    <tr>
        <td><%= e.getId() %></td>
        <td><%= e.getNom() %></td>
        <td><%= e.getVille() %></td>
        <td><%= entraineur %></td>
        <td><%= points %></td>
        <td>
            <a class="btn" href="#">Détails</a>
            <a class="btn" href="#">Supprimer</a>
        </td>
    </tr>
<%
    }
%>
</table>

<%@ include file="/includes/footer.jsp" %>
</body>
</html>

