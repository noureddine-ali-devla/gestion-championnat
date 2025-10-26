package servlet;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String hardUser = "admin";
        String hardPass = "admin123";

        if (hardUser.equals(username) && hardPass.equals(password)) {
            HttpSession session = request.getSession(true);
            User user = new User();
            user.setUsername(hardUser);
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/pages/dashboard.jsp");
            return;
        }

        request.setAttribute("error", "Nom d’utilisateur ou mot de passe incorrect.");
        request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
    }
}

