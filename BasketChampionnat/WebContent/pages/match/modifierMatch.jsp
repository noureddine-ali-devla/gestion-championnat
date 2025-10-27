<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../includes/header.jsp" %>
<h2>Modifier un match</h2>
<form action="MatchServlet" method="post">
    <input type="hidden" name="id" value="${match.id}">
    
    <label>Équipe Domicile</label>
    <select name="equipeDomicile">
        <c:forEach var="e" items="${equipes}">
            <option value="${e.id}" ${e.id == match.equipeDomicile.id ? 'selected' : ''}>${e.nom}</option>
        </c:forEach>
    </select>

    <label>Équipe Extérieure</label>
    <select name="equipeExterieure">
        <c:forEach var="e" items="${equipes}">
            <option value="${e.id}" ${e.id == match.equipeExterieure.id ? 'selected' : ''}>${e.nom}</option>
        </c:forEach>
    </select>

    <label>Date</label>
    <input type="date" name="date" value="${match.date}" required>

    <label>Score Domicile</label>
    <input type="number" name="scoreDomicile" min="0" value="${match.scoreDomicile}" required>

    <label>Score Extérieur</label>
    <input type="number" name="scoreExterieur" min="0" value="${match.scoreExterieur}" required>

    <input type="submit" value="Modifier">
</form>
<%@ include file="../../includes/footer.jsp" %>

