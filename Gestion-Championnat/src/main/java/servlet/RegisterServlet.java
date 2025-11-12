package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import model.User;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("pages/register.jsp?error=empty");
            return;
        }

        // Vérifier si l'utilisateur existe déjà
        User existingUser = userDAO.findByUsername(username);
        if (existingUser != null) {
            response.sendRedirect("pages/register.jsp?error=exists");
            return;
        }


        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password); // mot de passe en clair
        newUser.setRole("USER"); // <-- FIX: set default role
        userDAO.save(newUser);

        response.sendRedirect("pages/login.jsp?success=true");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("pages/register.jsp");
    }
}
