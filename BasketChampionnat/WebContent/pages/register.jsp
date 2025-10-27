<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<main>
    <h2>Inscription</h2>
    <form action="RegisterServlet" method="post">
        <label for="username">Nom d'utilisateur:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Mot de passe:</label>
        <input type="password" id="password" name="password" required>
        <label for="role">Rôle:</label>
        <select id="role" name="role">
            <option value="USER">Utilisateur</option>
            <option value="ADMIN">Administrateur</option>
        </select>
        <button type="submit">S'inscrire</button>
    </form>
    <p>Déjà inscrit ? <a href="login.jsp">Connectez-vous</a></p>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
</main>
<%@ include file="includes/footer.jsp" %>



