<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>
<h2>Classement des équipes</h2>
<table>
    <tr>
        <th>Équipe</th>
        <th>Victoires</th>
        <th>Défaites</th>
        <th>Buts Marqués</th>
        <th>Buts Encaissés</th>
        <th>Différence</th>
    </tr>
    <c:forEach var="s" items="${classements}">
        <tr>
            <td>${s.equipe.nom}</td>
            <td>${s.victoires}</td>
            <td>${s.defaites}</td>
            <td>${s.butsMarques}</td>
            <td>${s.butsEncaisses}</td>
            <td>${s.differenceButs}</td>
        </tr>
    </c:forEach>
</table>
<%@ include file="includes/footer.jsp" %>

