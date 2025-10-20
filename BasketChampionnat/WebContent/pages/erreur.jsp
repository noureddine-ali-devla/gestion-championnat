<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<section class="message-container">
    <div class="alert alert-error">
        <h2>Une erreur est survenue</h2>
        <p>
            <%
                String message = (String) request.getAttribute("message");
                if (message != null && !message.isEmpty()) {
            %>
                <%= message %>
            <%
                } else {
            %>
                Une erreur inattendue s’est produite. Veuillez réessayer plus tard.
            <%
                }
            %>
        </p>
        <a href="<%= request.getContextPath() %>/" class="btn">Retour à l'accueil</a>
    </div>
</section>

<%@ include file="../includes/footer.jsp" %>
