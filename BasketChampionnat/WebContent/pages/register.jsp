<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>
<%
    if (session.getAttribute("utilisateur") != null) {
        response.sendRedirect(request.getContextPath() + "/");
        return;
    }
%>
<section class="login-container">
    <h2>Créer un compte</h2>
    <form action="<%= request.getContextPath() %>/register" method="post">
        <input type="text" name="username" placeholder="Nom d'utilisateur" required>
        <input type="text" name="fullname" placeholder="Nom complet" required>
        <input type="password" name="password" placeholder="Mot de passe" required>
        <input type="password" name="confirm" placeholder="Confirmer le mot de passe" required>
        <select name="role" required>
            <option value="">-- Rôle --</option>
            <option value="USER">Utilisateur</option>
            <option value="ADMIN">Administrateur</option>
        </select>
        <button type="submit">S'inscrire</button>
        <a class="btn-link" href="<%= request.getContextPath() %>/pages/login.jsp">Déjà un compte ? Se connecter</a>
    </form>

    <div>
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
    </div>
</section>
<%@ include file="../includes/footer.jsp" %>
