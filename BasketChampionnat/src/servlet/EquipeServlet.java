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
        } else if ("supprimer".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.supprimerEquipe(id);
            response.sendRedirect("equipes");
        } else if ("details".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Equipe e = service.getEquipeById(id);
            request.setAttribute("equipe", e);
            request.getRequestDispatcher("pages/equipe/detailsEquipe.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String ville = request.getParameter("ville");
        String entraineur = request.getParameter("entraineur");
        Equipe e = new Equipe(nom, ville, entraineur, null);
        service.ajouterEquipe(e);
        response.sendRedirect("equipes");
    }
}




