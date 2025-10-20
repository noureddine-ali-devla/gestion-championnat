<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Equipe" %>
<%@ include file="../../includes/header.jsp" %>

<%
    Equipe equipe = (Equipe) request.getAttribute("equipe");
    if (equipe == null) {
        response.sendRedirect(request.getContextPath() + "/equipes");
        return;
    }
%>

<section class="form-container">
    <h2>Modifier l'Équipe</h2>
    <form action="<%= request.getContextPath() %>/equipe/update" method="post">
        <input type="hidden" name="id" value="<%= equipe.getId() %>">

        <div class="form-group">
            <label>Nom de l'équipe</label>
            <input type="text" name="nom" value="<%= equipe.getNom() %>" required>
        </div>
        <div class="form-group">
            <label>Ville</label>
            <input type="text" name="ville" value="<%= equipe.getVille() %>" required>
        </div>
        <div class="form-group">
            <label>Nom de l'entraîneur</label>
            <input type="text" name="entraineur" value="<%= equipe.getEntraineur() %>" required>
        </div>
        <button type="submit" class="btn">Mettre à jour</button>
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
