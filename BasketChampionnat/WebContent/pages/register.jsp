<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<form action="register" method="post">
    <label>Username:</label>
    <input type="text" name="username" required>
    <label>Password:</label>
    <input type="password" name="password" required>
    <label>Role:</label>
    <select name="role">
        <option value="USER">User</option>
        <option value="ADMIN">Admin</option>
    </select>
    <button type="submit">Register</button>
</form>
<c:if test="${not empty message}">
    <div class="message">${message}</div>
</c:if>
</body>
</html>


