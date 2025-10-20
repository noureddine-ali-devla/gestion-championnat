<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Equipe" %>
<%@ include file="../../includes/header.jsp" %>

<section class="form-container">
    <h2>Programmer un Match</h2>
    <form action="<%= request.getContextPath() %>/match/add" method="post">
        <div class="form-group">
            <label>Équipe à domicile</label>
            <select name="equipeDomicileId" required>
                <option value="">-- Sélectionner --</option>
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
        <div class="form-group">
            <label>Équipe extérieure</label>
            <select name="equipeExterieureId" required>
                <option value="">-- Sélectionner --</option>
                <%
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
        <div class="form-group">
            <label>Date du match</label>
            <input type="date" name="dateMatch" required>
        </div>
        <button type="submit" class="btn">Enregistrer</button>
        <a href="<%= request.getContextPath() %>/matchs" class="btn-secondary">Annuler</a>
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
