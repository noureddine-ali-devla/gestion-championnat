<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.EquipeDAO" %>
<%@ page import="model.Equipe" %>

<jsp:include page="/includes/header.jsp" />

<h2>Liste des équipes</h2>

<%
    // Récupérer la liste des équipes
    EquipeDAO equipeDAO = new EquipeDAO();
    List<Equipe> equipes = equipeDAO.findAll(); // utiliser findAll() correspondant au DAO
%>

<table border="1" cellpadding="10">
    <thead>
        <tr>
            <th>Nom</th>
            <th>Ville</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (Equipe e : equipes) {
        %>
        <tr>
            <td><%= e.getNom() %></td>
            <td><%= e.getVille() %></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>



