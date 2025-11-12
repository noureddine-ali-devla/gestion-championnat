<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Gestion Championnat Basket</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <h2>Connexion</h2>
                <p>Connectez-vous à votre compte</p>
            </div>

            <form action="${pageContext.request.contextPath}/login" method="post" class="auth-form">
                <div class="form-group">
                    <label for="username" class="form-label">Nom d'utilisateur:</label>
                    <input type="text" id="username" name="username" class="form-input" required>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Mot de passe:</label>
                    <input type="password" id="password" name="password" class="form-input" required>
                </div>

                <button type="submit" class="btn btn-primary btn-full">Se connecter</button>
            </form>

            <div class="auth-footer">
                <p>Pas encore inscrit ? <a href="${pageContext.request.contextPath}/pages/register.jsp" class="btn btn-secondary btn-full">S'inscrire</a></p>
            </div>
        </div>
    </div>
</div>

<style>
    .auth-container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }

    .auth-card {
        background: white;
        border-radius: var(--border-radius);
        padding: 3rem;
        box-shadow: var(--shadow-lg);
        width: 100%;
        max-width: 400px;
        border: 1px solid var(--border-color);
    }

    .auth-header {
        text-align: center;
        margin-bottom: 2rem;
    }

    .auth-header h2 {
        margin-bottom: 0.5rem;
        background: none;
        -webkit-text-fill-color: var(--text-primary);
    }

    .auth-header h2::after {
        display: none;
    }

    .auth-header p {
        color: var(--text-secondary);
        margin: 0;
    }

    .auth-form {
        margin-bottom: 1.5rem;
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .form-label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 600;
        color: var(--text-primary);
    }

    .form-input {
        width: 100%;
        padding: 0.75rem 1rem;
        border: 2px solid var(--border-color);
        border-radius: var(--border-radius);
        font-size: 1rem;
        transition: var(--transition);
        background: white;
    }

    .form-input:focus {
        outline: none;
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
    }

    .btn-full {
        width: 100%;
        margin-top: 0.5rem;
    }

    .auth-footer {
        text-align: center;
        padding-top: 1.5rem;
        border-top: 1px solid var(--border-color);
    }

    .auth-footer p {
        color: var(--text-secondary);
        margin: 0;
    }

    .auth-footer a {
        text-decoration: none;
        margin-top: 0.5rem;
    }

    @media (max-width: 480px) {
        .auth-card {
            padding: 2rem 1.5rem;
        }

        .auth-container {
            padding: 15px;
        }
    }
</style>
</body>
</html>
