package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.ChampionnatService;
import model.Joueur;
import model.Equipe;
import java.io.IOException;
import java.util.List;

@WebServlet("/joueurs")
public class JoueurServlet extends HttpServlet {
    private final ChampionnatService service = new ChampionnatService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            List<Joueur> joueurs = service.getJoueurs();
            List<Equipe> equipes = service.getEquipes();
            request.setAttribute("joueurs", joueurs);
            request.setAttribute("equipes", equipes);
            request.getRequestDispatcher("pages/joueurs.jsp").forward(request, response);
        } else if (action.equals("supprimer")) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.supprimerJoueur(id);
            response.sendRedirect("joueurs");
        } else if (action.equals("details")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Joueur j = service.getJoueurById(id);
            request.setAttribute("joueur", j);
            request.getRequestDispatcher("pages/joueur-details.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String position = request.getParameter("position");
        int numero = Integer.parseInt(request.getParameter("numero"));
        int idEquipe = Integer.parseInt(request.getParameter("idEquipe"));
        Equipe equipe = service.getEquipeById(idEquipe);
        Joueur j = new Joueur(nom, prenom, position, numero, 0, equipe);
        service.ajouterJoueur(j);
        response.sendRedirect("joueurs");
    }
}



