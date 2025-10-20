<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Championnat de Basketball</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body>
<header>
    <div style="display: flex; align-items: center; justify-content: center; gap: 15px;">
        <img src="assets/img/logo.png" alt="Logo" style="height: 50px; border-radius: 6px;">
        <h1>Championnat de Basketball</h1>
    </div>
</header>

<nav>
    <a href="index.jsp">Accueil</a>
    <a href="equipes">Équipes</a>
    <a href="joueurs">Joueurs</a>
    <a href="matchs">Matchs</a>
    <a href="classement">Classement</a>
    <a href="dashboard.jsp">Tableau de Bord</a>
    <%
        model.User user = (model.User) session.getAttribute("user");
        if (user == null) {
    %>
        <a href="login.jsp">Connexion</a>
        <a href="register.jsp">Inscription</a>
    <%
        } else {
    %>
        <span style="margin-left:auto; margin-right:20px; font-weight:600;">Bienvenue, <%= user.getUsername() %></span>
        <a href="logout">Déconnexion</a>
    <%
        }
    %>
</nav>

<main>

