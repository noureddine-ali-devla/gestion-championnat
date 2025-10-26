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
    <a href="<%= request.getContextPath() %>/pages/equipes.jsp">Équipes</a>
    <a href="<%= request.getContextPath() %>/pages/joueurs.jsp">Joueurs</a>
    <a href="<%= request.getContextPath() %>/pages/matchs.jsp">Matchs</a>
    <a href="<%= request.getContextPath() %>/pages/classement.jsp">Classement</a>
    <a href="<%= request.getContextPath() %>/dashboard.jsp">Tableau de Bord</a>

    <%
        Object user = session.getAttribute("user");
        if (user == null) {
    %>
        <a href="<%= request.getContextPath() %>/pages/login.jsp">Connexion</a>
        <a href="<%= request.getContextPath() %>/pages/register.jsp">Inscription</a>
    <%
        } else {
    %>
        <span style="margin-left:auto; margin-right:20px; font-weight:600;">Bienvenue, <%= user.toString() %></span>
        <a href="<%= request.getContextPath() %>/logout">Déconnexion</a>
    <%
        }
    %>
</nav>

<main>


