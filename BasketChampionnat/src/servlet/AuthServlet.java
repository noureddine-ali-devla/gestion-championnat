package servlet;

import dao.UtilisateurDAO;
import model.Utilisateur;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AuthServlet extends HttpServlet {
    private UtilisateurDAO utilisateurDAO = new UtilisateurDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Utilisateur user = utilisateurDAO.authentifier(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("utilisateur", user);
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "Nom d'utilisateur ou mot de passe incorrect");
            request.getRequestDispatcher("pages/login.jsp").forward(request, response);
        }
    }
}
