<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>
<h2>Statistiques des joueurs</h2>
<table>
    <tr>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Position</th>
        <th>Équipe</th>
        <th>Points Marqués</th>
        <th>Matches Joués</th>
    </tr>
    <c:forEach var="j" items="${statistiques}">
        <tr>
            <td>${j.nom}</td>
            <td>${j.prenom}</td>
            <td>${j.position}</td>
            <td>${j.equipe.nom}</td>
            <td>${j.pointsMarques}</td>
            <td>${j.matchesJoues}</td>
        </tr>
    </c:forEach>
</table>
<%@ include file="includes/footer.jsp" %>

