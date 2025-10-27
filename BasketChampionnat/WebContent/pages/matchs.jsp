<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>
<h2>Liste des matchs</h2>
<a href="pages/match/ajouterMatch.jsp">Ajouter un match</a>
<table>
    <tr>
        <th>Équipe Domicile</th>
        <th>Équipe Extérieure</th>
        <th>Date</th>
        <th>Score Domicile</th>
        <th>Score Extérieur</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="m" items="${matchs}">
        <tr>
            <td>${m.equipeDomicile.nom}</td>
            <td>${m.equipeExterieure.nom}</td>
            <td>${m.date}</td>
            <td>${m.scoreDomicile}</td>
            <td>${m.scoreExterieur}</td>
            <td>
                <a href="MatchServlet?action=details&id=${m.id}">Détails</a>
                <a href="MatchServlet?action=modifier&id=${m.id}">Modifier</a>
                <a href="MatchServlet?action=supprimer&id=${m.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
<%@ include file="includes/footer.jsp" %>


