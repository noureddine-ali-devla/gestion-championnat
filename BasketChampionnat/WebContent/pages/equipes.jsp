<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.EquipeDAO" %>
<%@ page import="model.Equipe" %>

<jsp:include page="/includes/header.jsp" />

<h2>Liste des Équipes</h2>

<%
    // Récupérer la liste des équipes
    EquipeDAO equipeDAO = new EquipeDAO();
    List<Equipe> equipes = equipeDAO.findAll();
%>

<table border="1" cellpadding="10" style="border-collapse: collapse; width: 80%; margin: 20px auto; text-align: center;">
    <thead style="background-color: #f2f2f2;">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Ville</th>
            <th>Email</th>
            <th>Entraîneur</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (Equipe e : equipes) {
        %>
        <tr>
            <td><%= e.getId() %></td>
            <td><%= e.getNom() %></td>
            <td><%= e.getVille() %></td>
            <td><%= e.getEmail() %></td>
            <td><%= e.getEntraineur() %></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>




