<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>
<h2>Liste des équipes</h2>
<a href="pages/equipe/ajouterEquipe.jsp">Ajouter une équipe</a>
<table>
    <tr>
        <th>Nom</th>
        <th>Ville</th>
        <th>Entraîneur</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="e" items="${equipes}">
        <tr>
            <td>${e.nom}</td>
            <td>${e.ville}</td>
            <td>${e.entraineur}</td>
            <td>
                <a href="EquipeServlet?action=details&id=${e.id}">Détails</a>
                <a href="EquipeServlet?action=modifier&id=${e.id}">Modifier</a>
                <a href="EquipeServlet?action=supprimer&id=${e.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
<%@ include file="includes/footer.jsp" %>




