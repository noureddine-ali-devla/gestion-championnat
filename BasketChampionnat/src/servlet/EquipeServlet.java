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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) { // Afficher la liste des équipes
            List<Equipe> equipes = service.getEquipes();
            request.setAttribute("equipes", equipes);
            request.getRequestDispatcher("/pages/equipes.jsp").forward(request, response);
        } else if ("supprimer".equals(action)) { // Supprimer une équipe
            int id = Integer.parseInt(request.getParameter("id"));
            service.supprimerEquipe(id);
            response.sendRedirect(request.getContextPath() + "/equipes");
        } else if ("details".equals(action)) { // Détails d'une équipe
            int id = Integer.parseInt(request.getParameter("id"));
            Equipe e = service.getEquipeById(id);
            request.setAttribute("equipe", e);
            request.getRequestDispatcher("/pages/equipe-details.jsp").forward(request, response);
        } else { // Action non reconnue
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action invalide");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ajouter une nouvelle équipe
        String nom = request.getParameter("nom");
        String ville = request.getParameter("ville");
        String entraineur = request.getParameter("entraineur");

        // Assurez-vous que le constructeur de Equipe prend 3 paramètres (nom, ville, entraineur)
        Equipe e = new Equipe(nom, ville, entraineur, ""); // email vide ou par défaut

        service.ajouterEquipe(e);

        response.sendRedirect(request.getContextPath() + "/equipes");
    }
}



