<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<section class="login-container">
    <h2>Créer un Compte</h2>

    <form action="auth" method="post">
        <input type="hidden" name="action" value="register">

        <label for="username">Nom d’utilisateur</label>
        <input type="text" id="username" name="username" placeholder="Choisissez un nom d’utilisateur" required>

        <label for="email">Adresse e-mail</label>
        <input type="email" id="email" name="email" placeholder="Entrez votre adresse e-mail" required>

        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" placeholder="Créez un mot de passe" required>

        <label for="confirmPassword">Confirmez le mot de passe</label>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirmez votre mot de passe" required>

        <button type="submit">S’inscrire</button>
    </form>

    <a href="login.jsp" class="btn-link">Déjà un compte ? Se connecter</a>

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

<%@ include file="../includes/footer.jsp" %>

