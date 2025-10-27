<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<main>
    <h2>Connexion</h2>
    <form action="AuthServlet" method="post">
        <label for="username">Nom d'utilisateur:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Mot de passe:</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Se connecter</button>
    </form>
    <p>Pas de compte ? <a href="register.jsp">Inscrivez-vous</a></p>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
</main>
<%@ include file="includes/footer.jsp" %>



