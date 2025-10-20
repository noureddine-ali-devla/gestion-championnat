<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../includes/header.jsp" %>

<section class="form-container">
    <h2>Ajouter une Équipe</h2>
    <form action="<%= request.getContextPath() %>/equipe/add" method="post">
        <div class="form-group">
            <label>Nom de l'équipe</label>
            <input type="text" name="nom" required>
        </div>
        <div class="form-group">
            <label>Ville</label>
            <input type="text" name="ville" required>
        </div>
        <div class="form-group">
            <label>Nom de l'entraîneur</label>
            <input type="text" name="entraineur" required>
        </div>
        <button type="submit" class="btn">Ajouter</button>
        <a href="<%= request.getContextPath() %>/equipes" class="btn-secondary">Annuler</a>
    </form>

    <%
        String error = (String) request.getAttribute("error");
        String success = (String) request.getAttribute("success");
        if (error != null) {
    %>
        <div class="alert alert-error"><%= error %></div>
    <%
        } else if (success != null) {
    %>
        <div class="alert alert-success"><%= success %></div>
    <%
        }
    %>
</section>

<%@ include file="../../includes/footer.jsp" %>
