<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Joueur" %>
<%@ page import="dao.JoueurDAO" %>

<%
    JoueurDAO joueurDAO = new JoueurDAO();
    List<Joueur> joueurs = joueurDAO.getAllJoueurs(); // méthode correcte du DAO
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Joueurs</title>
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <%@ include file="/includes/header.jsp" %>

    <div class="container">
        <h2>Liste des Joueurs</h2>

        <table border="1" cellpadding="10" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Position</th>
                    <th>Numéro</th>
                    <th>Équipe</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (joueurs != null && !joueurs.isEmpty()) {
                        for (Joueur j : joueurs) {
                %>
                <tr>
                    <td><%= j.getId() %></td>
                    <td><%= j.getNom() %></td>
                    <td><%= j.getPrenom() %></td>
                    <td><%= j.getPosition() %></td>
                    <td><%= j.getNumero() %></td>
                    <td><%= j.getEquipe() != null ? j.getEquipe().getNom() : "-" %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6" style="text-align:center;">Aucun joueur trouvé.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>



