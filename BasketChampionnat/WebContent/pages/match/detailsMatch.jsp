<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../includes/header.jsp" %>
<h2>Détails du match</h2>
<p>Équipe Domicile : ${match.equipeDomicile.nom}</p>
<p>Équipe Extérieure : ${match.equipeExterieure.nom}</p>
<p>Date : ${match.date}</p>
<p>Score Domicile : ${match.scoreDomicile}</p>
<p>Score Extérieur : ${match.scoreExterieur}</p>
<a href="listeMatchs.jsp">Retour à la liste</a>
<%@ include file="../../includes/footer.jsp" %>

