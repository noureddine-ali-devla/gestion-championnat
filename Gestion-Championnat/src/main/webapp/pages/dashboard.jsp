<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord - Gestion Championnat Basket</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("${pageContext.request.contextPath}/pages/login.jsp");
        return;
    }
%>

<div class="container">
    <header class="dashboard-header">
        <div class="header-content">
            <div class="welcome-section">
                <h2>Bienvenue, <%= user.getUsername() %></h2>
            </div>
            <nav class="navigation">
                <a href="${pageContext.request.contextPath}/teams?action=list">Équipes</a>
                <a href="${pageContext.request.contextPath}/players?action=list">Joueurs</a>
                <a href="${pageContext.request.contextPath}/matches?action=list">Matchs</a>
                <a href="${pageContext.request.contextPath}/pages/logout.jsp" class="btn btn-secondary">Déconnexion</a>
            </nav>
        </div>
    </header>

    <div class="content-card">
        <p>Tableau de bord principal - Gestion de championnat de basketball</p>
        <p>Utilisez la navigation ci-dessus pour accéder aux différentes sections de gestion.</p>
    </div>
</div>

<style>
    .dashboard-header {
        background: white;
        border-radius: var(--border-radius);
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: var(--shadow-lg);
    }

    .header-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 2rem;
    }

    .welcome-section h2 {
        margin-bottom: 0;
        background: none;
        -webkit-text-fill-color: var(--text-primary);
    }

    .welcome-section h2::after {
        display: none;
    }

    .navigation {
        display: flex;
        gap: 1rem;
        align-items: center;
        flex-wrap: wrap;
    }

    .navigation a {
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-hover) 100%);
        color: white;
        padding: 0.75rem 1.5rem;
        border: none;
        border-radius: var(--border-radius);
        font-weight: 600;
        font-size: 0.875rem;
        cursor: pointer;
        transition: var(--transition);
        position: relative;
        overflow: hidden;
        box-shadow: var(--shadow-md);
    }

    .navigation a::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
        transition: left 0.5s;
    }

    .navigation a:hover::before {
        left: 100%;
    }

    .navigation a:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-lg);
        background: linear-gradient(135deg, var(--primary-hover) 0%, #1e40af 100%);
    }

    .navigation a:active {
        transform: translateY(0);
        box-shadow: var(--shadow-sm);
    }

    .navigation .btn-secondary {
        background: linear-gradient(135deg, var(--secondary-color) 0%, #475569 100%);
    }

    .navigation .btn-secondary:hover {
        background: linear-gradient(135deg, #475569 0%, var(--secondary-color) 100%);
    }

    .content-card {
        background: white;
        border-radius: var(--border-radius);
        padding: 2rem;
        box-shadow: var(--shadow-lg);
        margin-bottom: 2rem;
    }

    .content-card p {
        color: var(--text-secondary);
        margin-bottom: 1rem;
        font-size: 1.1rem;
        line-height: 1.6;
    }

    .content-card p:last-child {
        margin-bottom: 0;
    }

    @media (max-width: 768px) {
        .header-content {
            flex-direction: column;
            text-align: center;
            gap: 1rem;
        }

        .navigation {
            justify-content: center;
        }

        .navigation a {
            padding: 0.625rem 1.25rem;
            font-size: 0.8125rem;
        }

        .content-card {
            padding: 1.5rem;
        }
    }

    @media (max-width: 480px) {
        .dashboard-header {
            padding: 1.5rem;
        }

        .navigation {
            flex-direction: column;
            width: 100%;
        }

        .navigation a {
            width: 100%;
            margin: 0.25rem 0;
        }

        .content-card {
            padding: 1rem;
        }
    }
</style>
</body>
</html>

