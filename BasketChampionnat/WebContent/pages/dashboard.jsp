<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dao.UserDAO" %>
<%
    HttpSession session = request.getSession();
    String username = (String) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Dashboard - BasketChampionnat</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style.css">
</head>
<body>
<header>
    <h1>Tableau de Bord</h1>
    <p>Bienvenue, <%= username %></p>
    <a href="<%= request.getContextPath() %>/logout">Déconnexion</a>
</header>

<main>
    <h2>Administration</h2>
    <ul>
        <li><a href="<%= request.getContextPath() %>/pages/equipes.jsp">Gérer les équipes</a></li>
        <li><a href="<%= request.getContextPath() %>/pages/joueurs.jsp">Gérer les joueurs</a></li>
        <li><a href="<%= request.getContextPath() %>/pages/matchs.jsp">Gérer les matchs</a></li>
        <li><a href="<%= request.getContextPath() %>/pages/classement.jsp">Voir le classement</a></li>
    </ul>
</main>
</body>
</html>

