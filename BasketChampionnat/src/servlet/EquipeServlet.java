package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.ChampionnatService;
import model.Equipe;
import java.io.IOException;
import java.util.List;

@WebServlet("/equipes")
public class EquipeServlet extends HttpServlet {
    private ChampionnatService service = new ChampionnatService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            List<Equipe> equipes = service.getEquipes();
            request.setAttribute("equipes", equipes);
            request.getRequestDispatcher("pages/equipes.jsp").forward(request, response);
        } else if (action.equals("supprimer")) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.getEquipes().removeIf(e -> e.getId() == id);
            response.sendRedirect("equipes");
        } else if (action.equals("details")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Equipe e = service.getEquipeById(id);
            request.setAttribute("equipe", e);
            request.getRequestDispatcher("pages/equipe-details.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String ville = request.getParameter("ville");
        String entraineur = request.getParameter("entraineur");
        int id = service.getEquipes().size() + 1;
        Equipe e = new Equipe(id, nom, ville, entraineur);
        service.ajouterEquipe(e);
        response.sendRedirect("equipes");
    }
}
