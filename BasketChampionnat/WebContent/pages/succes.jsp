<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/pages/includes/header.jsp" %>

<section class="message-container">
    <div class="alert alert-success">
        <h2>Opération réussie</h2>
        <p>
            <%
                String message = (String) request.getAttribute("message");
                if (message != null && !message.isEmpty()) {
            %>
                <%= message %>
            <%
                } else {
            %>
                L’action a été effectuée avec succès.
            <%
                }
            %>
        </p>
        <a href="<%= request.getContextPath() %>/" class="btn">Retour à l'accueil</a>
    </div>
</section>

<%@ include file="../includes/footer.jsp" %>
