<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<section class="login-container">
    <h2>Connexion à l’Espace Administrateur</h2>

    <form action="auth" method="post">
        <label for="username">Nom d’utilisateur</label>
        <input type="text" id="username" name="username" placeholder="Entrez votre nom d’utilisateur" required>

        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" placeholder="Entrez votre mot de passe" required>

        <button type="submit">Se connecter</button>
    </form>

    <a href="register.jsp" class="btn-link">Créer un compte</a>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
    <div class="alert alert-error"><%= error %></div>
    <%
        }
    %>
</section>

<%@ include file="../includes/footer.jsp" %>
