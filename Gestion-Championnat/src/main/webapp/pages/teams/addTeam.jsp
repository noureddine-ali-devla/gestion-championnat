<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">

<html>
<head><title>Ajouter Équipe</title></head>
<body>
<h2>Ajouter une Équipe</h2>
<form action="teams" method="post">
    <input type="hidden" name="action" value="create"/>
    <label>Nom:</label>
    <input type="text" name="name" required/>
    <button type="submit">Ajouter</button>
</form>
<a href="teams?action=list">Retour</a>
</body>
</html>

