<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Championnat de Basketball</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/style.css">
</head>
<body>
<header>
    <div style="display: flex; align-items: center; justify-content: center; gap: 15px;">
        <img src="<%= request.getContextPath() %>/assets/img/logo.png" alt="Logo" style="height: 50px; border-radius: 6px;">
        <h1>Championnat de Basketball</h1>
    </div>
</header>

<nav>
    <a href="<%= request.getContextPath() %>/index.jsp">Accueil</a>
    <a href="<%= request.getContextPath() %>/equipes">Équipes</a>
    <a href="<%= request.getContextPath() %>/joueurs">Joueurs</a>
    <a href="<%= request.getContextPath() %>/matchs">Matchs</a>
    <a href="<%= request.getContextPath() %>/classement">Classement</a>
    <a href="<%= request.getContextPath() %>/dashboard.jsp">Tableau de Bord</a>
    <%
        model.User user = (model.User) session.getAttribute("user");
        if (user == null) {
    %>
        <a href="<%= request.getContextPath() %>/login.jsp">Connexion</a>
        <a href="<%= request.getContextPath() %>/register.jsp">Inscription</a>
    <%
        } else {
    %>
        <span style="margin-left:auto; margin-right:20px; font-weight:600;">Bienvenue, <%= user.getUsername() %></span>
        <a href="<%= request.getContextPath() %>/logout">Déconnexion</a>
    <%
        }
    %>
</nav>

<main>


