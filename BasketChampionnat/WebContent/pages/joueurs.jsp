<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.JoueurDAO" %>
<%@ page import="model.Joueur" %>

<jsp:include page="/includes/header.jsp" />

<h2>Liste des joueurs</h2>

<%
    // Récupérer la liste des joueurs
    JoueurDAO joueurDAO = new JoueurDAO();
    List<Joueur> joueurs = joueurDAO.findAll(); // utiliser findAll() correspondant au DAO
%>

<table border="1" cellpadding="10">
    <thead>
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Numéro</th>
            <th>Position</th>
            <th>Équipe</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (Joueur j : joueurs) {
        %>
        <tr>
            <td><%= j.getNom() %></td>
            <td><%= j.getPrenom() %></td>
            <td><%= j.getNumero() %></td>
            <td><%= j.getPosition() %></td>
            <td><%= j.getEquipe() != null ? j.getEquipe().getNom() : "-" %></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>


