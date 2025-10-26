<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.MatchDAO" %>
<%@ page import="model.Match" %>

<jsp:include page="/includes/header.jsp" />

<h2>Liste des matchs</h2>

<%
    // Récupérer la liste des matchs
    MatchDAO matchDAO = new MatchDAO();
    List<Match> matchs = matchDAO.findAll();
%>

<table border="1" cellpadding="10">
    <thead>
        <tr>
            <th>Équipe domicile</th>
            <th>Équipe extérieur</th>
            <th>Date du match</th>
            <th>Score</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (Match m : matchs) {
        %>
        <tr>
            <td><%= m.getEquipeDomicile() != null ? m.getEquipeDomicile().getNom() : "-" %></td>
            <td><%= m.getEquipeExterieur() != null ? m.getEquipeExterieur().getNom() : "-" %></td>
            <td><%= m.getDateMatch() != null ? m.getDateMatch() : "-" %></td>
            <td>
                <%
                    int scoreDom = m.getScoreDomicile();
                    int scoreExt = m.getScoreExterieur();
                    out.print(scoreDom + " - " + scoreExt);
                %>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>



