<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Equipe" %>
<%@ include file="../../includes/header.jsp" %>

<section class="form-container">
    <h2>Ajouter un Joueur</h2>
    <form action="<%= request.getContextPath() %>/joueur/add" method="post">
        <div class="form-group">
            <label>Nom du joueur</label>
            <input type="text" name="nom" required>
        </div>
        <div class="form-group">
            <label>Âge</label>
            <input type="number" name="age" min="10" max="50" required>
        </div>
        <div class="form-group">
            <label>Poste</label>
            <select name="poste" required>
                <option value="">-- Sélectionner --</option>
                <option value="Meneur">Meneur</option>
                <option value="Ailier">Ailier</option>
                <option value="Pivot">Pivot</option>
                <option value="Arrière">Arrière</option>
                <option value="Ailier fort">Ailier fort</option>
            </select>
        </div>
        <div class="form-group">
            <label>Équipe</label>
            <select name="equipeId" required>
                <option value="">-- Sélectionner une équipe --</option>
                <%
                    List<Equipe> equipes = (List<Equipe>) request.getAttribute("equipes");
                    if (equipes != null) {
                        for (Equipe e : equipes) {
                %>
                    <option value="<%= e.getId() %>"><%= e.getNom() %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>
        <button type="submit" class="btn">Ajouter</button>
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
