<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Joueur, model.Equipe, java.util.*" %>
<%@ include file="../../includes/header.jsp" %>

<%
    Joueur joueur = (Joueur) request.getAttribute("joueur");
    List<Equipe> equipes = (List<Equipe>) request.getAttribute("equipes");
    if (joueur == null) {
        response.sendRedirect(request.getContextPath() + "/joueurs");
        return;
    }
%>

<section class="form-container">
    <h2>Modifier le Joueur</h2>
    <form action="<%= request.getContextPath() %>/joueur/update" method="post">
        <input type="hidden" name="id" value="<%= joueur.getId() %>">

        <div class="form-group">
            <label>Nom du joueur</label>
            <input type="text" name="nom" value="<%= joueur.getNom() %>" required>
        </div>
        <div class="form-group">
            <label>Âge</label>
            <input type="number" name="age" value="<%= joueur.getAge() %>" min="10" max="50" required>
        </div>
        <div class="form-group">
            <label>Poste</label>
            <select name="poste" required>
                <option value="Meneur" <%= joueur.getPoste().equals("Meneur") ? "selected" : "" %>>Meneur</option>
                <option value="Ailier" <%= joueur.getPoste().equals("Ailier") ? "selected" : "" %>>Ailier</option>
                <option value="Pivot" <%= joueur.getPoste().equals("Pivot") ? "selected" : "" %>>Pivot</option>
                <option value="Arrière" <%= joueur.getPoste().equals("Arrière") ? "selected" : "" %>>Arrière</option>
                <option value="Ailier fort" <%= joueur.getPoste().equals("Ailier fort") ? "selected" : "" %>>Ailier fort</option>
            </select>
        </div>
        <div class="form-group">
            <label>Équipe</label>
            <select name="equipeId" required>
                <%
                    if (equipes != null) {
                        for (Equipe e : equipes) {
                %>
                    <option value="<%= e.getId() %>" <%= joueur.getEquipe() != null && joueur.getEquipe().getId() == e.getId() ? "selected" : "" %>><%= e.getNom() %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>
        <button type="submit" class="btn">Mettre à jour</button>
        <a href="<%= request.getContextPath() %>/joueurs" class="btn-secondary">Annuler</a>
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
