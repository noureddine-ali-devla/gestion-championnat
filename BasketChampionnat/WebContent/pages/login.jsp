<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
</head>
<body>
<div class="login-container">
    <h2>Connexion</h2>
    <form action="../auth" method="post">
        <label>Nom d'utilisateur</label>
        <input type="text" name="username" required>

        <label>Mot de passe</label>
        <input type="password" name="password" required>

        <button type="submit">Se connecter</button>

        <div class="error">
            ${error != null ? error : ""}
        </div>
    </form>
</div>
</body>
</html>
