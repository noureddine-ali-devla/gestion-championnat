<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Joueur" %>
<%@ page import="dao.JoueurDAO" %>

<%@ include file="../includes/header.jsp" %>

<%
    // Vérifie la session (ne pas redéclarer HttpSession)
    String username = (String) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }

    JoueurDAO joueurDAO = new JoueurDAO();
    List<Joueur> joueurs = joueurDAO.getAllJoueurs();
%>

<section class="content">
    <h2>Liste des Joueurs</h2>

    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Poste</th>
                <th>Équipe</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (joueurs != null && !joueurs.isEmpty()) {
                for (Joueur j : joueurs) {
        %>
                    <tr>
                        <td><%= j.getId() %></td>
                        <td><%= j.getNom() %></td>
                        <td><%= j.getPoste() %></td>
                        <td><%= (j.getEquipe() != null) ? j.getEquipe().getNom() : "Aucune" %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr><td colspan="4">Aucun joueur trouvé.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</section>

<%@ include file="../includes/footer.jsp" %>


