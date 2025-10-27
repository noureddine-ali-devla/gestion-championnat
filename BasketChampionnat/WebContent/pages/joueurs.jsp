<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>
<h2>Liste des joueurs</h2>
<a href="pages/joueur/ajouterJoueur.jsp">Ajouter un joueur</a>
<table>
    <tr>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Position</th>
        <th>Équipe</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="j" items="${joueurs}">
        <tr>
            <td>${j.nom}</td>
            <td>${j.prenom}</td>
            <td>${j.position}</td>
            <td>${j.equipe.nom}</td>
            <td>
                <a href="JoueurServlet?action=details&id=${j.id}">Détails</a>
                <a href="JoueurServlet?action=modifier&id=${j.id}">Modifier</a>
                <a href="JoueurServlet?action=supprimer&id=${j.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
<%@ include file="includes/footer.jsp" %>



